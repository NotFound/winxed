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
.namespace [ 'PredefBase' ]

.sub 'PredefBase' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5
.param string __ARG_6
.param string __ARG_7

.annotate 'line', 955
# Body
# {
.annotate 'line', 962
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 963
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 964
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 966
setattribute self, 'body', __ARG_2
__label_1: # endif
.annotate 'line', 967
box $P1, __ARG_3
setattribute self, 'typeresult', $P1
.annotate 'line', 968
# int n: $I1
null $I1
.annotate 'line', 969
if_null __ARG_4, __label_2
# {
.annotate 'line', 970
box $P1, __ARG_4
setattribute self, 'type0', $P1
.annotate 'line', 971
set $S1, __ARG_4
set $S2, '*'
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
.annotate 'line', 973
set $I1, -1
goto __label_3 # break
__label_6: # case
.annotate 'line', 976
set $I1, -2
.annotate 'line', 977
if_null __ARG_5, __label_7
.annotate 'line', 978
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
.annotate 'line', 981
set $I1, 1
.annotate 'line', 982
if_null __ARG_5, __label_8
# {
.annotate 'line', 983
box $P1, __ARG_5
setattribute self, 'type1', $P1
.annotate 'line', 984
inc $I1
# }
__label_8: # endif
.annotate 'line', 986
if_null __ARG_6, __label_9
# {
.annotate 'line', 987
box $P1, __ARG_6
setattribute self, 'type2', $P1
.annotate 'line', 988
inc $I1
# }
__label_9: # endif
.annotate 'line', 990
if_null __ARG_7, __label_10
# {
.annotate 'line', 991
box $P1, __ARG_7
setattribute self, 'type3', $P1
.annotate 'line', 992
inc $I1
# }
__label_10: # endif
__label_3: # switch end
# }
__label_2: # endif
.annotate 'line', 996
box $P1, $I1
setattribute self, 'nparams', $P1
# }
.annotate 'line', 997

.end # PredefBase


.sub 'name' :method

.annotate 'line', 998
# Body
# {
.annotate 'line', 1000
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1001
.return($S1)
# }
.annotate 'line', 1002

.end # name


.sub 'result' :method

.annotate 'line', 1003
# Body
# {
.annotate 'line', 1005
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 1006

.end # result


.sub 'params' :method

.annotate 'line', 1007
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 1008
# Body
# {
.annotate 'line', 1010
# string type: $S1
null $S1
.annotate 'line', 1011
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
.annotate 'line', 1012
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 1013
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 1014
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_5: # case
.annotate 'line', 1015
getattribute $P4, self, 'type3'
set $S1, $P4
goto __label_0 # break
__label_1: # default
.annotate 'line', 1017
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 1019
.return($S1)
# }
.annotate 'line', 1020

.end # paramtype


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1021
# Body
# {
.annotate 'line', 1023
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1024
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1025
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1026
$P2 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P2
__label_1: # endif
.annotate 'line', 1027
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1028
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1029

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefBase' ]
.annotate 'line', 946
addattribute $P0, 'name'
.annotate 'line', 947
addattribute $P0, 'body'
.annotate 'line', 948
addattribute $P0, 'typeresult'
.annotate 'line', 949
addattribute $P0, 'type0'
.annotate 'line', 950
addattribute $P0, 'type1'
.annotate 'line', 951
addattribute $P0, 'type2'
.annotate 'line', 952
addattribute $P0, 'type3'
.annotate 'line', 953
addattribute $P0, 'nparams'
.end
.namespace [ 'PredefFunction' ]

.sub 'PredefFunction' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 1034
# Body
# {
.annotate 'line', 1041
self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1042

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1032
get_class $P1, [ 'PredefBase' ]
addparent $P0, $P1
.end
.namespace [ 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
.param string __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional
.param string __ARG_8 :optional

.annotate 'line', 1048
# Body
# {
.annotate 'line', 1055
self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1056
setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1057

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1045
get_class $P1, [ 'PredefBase' ]
addparent $P0, $P1
.annotate 'line', 1047
addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1063
# Body
# {
.annotate 'line', 1065
box $P1, __ARG_1
setattribute self, 'type', $P1
# }
.annotate 'line', 1066

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1067
# Body
# {
.annotate 'line', 1069
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1070
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1071
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1072
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1073
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1074
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1075
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1077
# string arg: $S3
$P2 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 1078
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1080
ne $S3, 'null', __label_7
.annotate 'line', 1081
__ARG_1.'emitnull'(__ARG_3)
goto __label_8
__label_7: # else
.annotate 'line', 1083
__ARG_1.'emitset'(__ARG_3, $S3)
__label_8: # endif
# }
__label_4: # endif
# }
.annotate 'line', 1085

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1062
addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1088
# Body
# {
.annotate 'line', 1090
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1091
# int n: $I1
# predefined elements
elements $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1092
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1093
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1094
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_2: # for iteration
.annotate 'line', 1093
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1095
$P1 = __ARG_4[$I1]
__ARG_1.'emitsay'($P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1098
__ARG_1.'emitsay'("''")
__label_1: # endif
# }
.annotate 'line', 1099

.end # Predef_say


.sub 'Predef_cry'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1101
# Body
# {
.annotate 'line', 1103
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1104
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1105
# int n: $I1
# predefined elements
elements $I1, __ARG_4
# for loop
.annotate 'line', 1106
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1107
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1106
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1108
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1109

.end # Predef_cry


.sub 'Predef_print'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1111
# Body
# {
.annotate 'line', 1113
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1114
# int n: $I1
# predefined elements
elements $I1, __ARG_4
# for loop
.annotate 'line', 1115
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1116
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
.annotate 'line', 1115
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1117

.end # Predef_print


.sub 'Predef_invoke'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1121
# Body
# {
.annotate 'line', 1123
# var arg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1124
isa $I2, $P1, 'CallExpr'
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 1125
'SyntaxError'("invoke argument must be callable", __ARG_2)
__label_0: # endif
.annotate 'line', 1126
concat $S1, "(", __ARG_3
concat $S1, $S1, " :call_sig)"
$P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1127

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
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
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1134

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1136
# Body
# {
.annotate 'line', 1138
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1139
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1140
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1141

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1143
# Body
# {
.annotate 'line', 1145
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1146
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1147
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1148

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1150
# Body
# {
.annotate 'line', 1152
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1153
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1154
# var argn: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1155
# int n: $I1
getattribute $P3, $P2, 'numval'
set $I1, $P3
.annotate 'line', 1156
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1157

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1159
# Body
# {
.annotate 'line', 1161
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1163
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1164
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1166
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1167
new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 1168

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1170
# Body
# {
.annotate 'line', 1172
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1173
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1174
# string str: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1175
# int pos: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1177
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1178
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1179

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1181
# Body
# {
.annotate 'line', 1183
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1184
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1185
# var arglen: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1186
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1187
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1188
# int len: $I2
getattribute $P5, $P3, 'numval'
set $I2, $P5
.annotate 'line', 1190
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1191
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
set $P5, $P6
.return($P5)
# }
.annotate 'line', 1192

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1194
# Body
# {
.annotate 'line', 1196
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1197
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1198
# string strfrom: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1199
# string strsearch: $S2
$P3 = $P2.'get_value'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 1200
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1201

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1203
# Body
# {
.annotate 'line', 1205
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1206
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1207
# var argpos: $P3
$P4 = __ARG_3[2]
getattribute $P3, $P4, 'arg'
.annotate 'line', 1208
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1209
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1210
# int pos: $I1
getattribute $P4, $P3, 'numval'
set $I1, $P4
.annotate 'line', 1211
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1212

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1214
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
.annotate 'line', 1225
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1226
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1227
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1228
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1230
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1231
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1232
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('I')
set $P18, $P19
$P17.'PredefFunction'('int', $P18, 'I', '!')
set $P16, $P17
.annotate 'line', 1230
push $P1, $P16
.annotate 'line', 1235
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1236
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('N')
set $P22, $P23
$P21.'PredefFunction'('float', $P22, 'N', '!')
set $P20, $P21
.annotate 'line', 1230
push $P1, $P20
.annotate 'line', 1239
new $P25, [ 'PredefFunction' ]
.annotate 'line', 1240
new $P27, [ 'Predef_typecast' ]
$P27.'Predef_typecast'('S')
set $P26, $P27
$P25.'PredefFunction'('string', $P26, 'S', '!')
set $P24, $P25
.annotate 'line', 1230
push $P1, $P24
.annotate 'line', 1243
new $P29, [ 'PredefFunction' ]
$P29.'PredefFunction'('die', 'die {arg0}', 'v', 'S')
set $P28, $P29
.annotate 'line', 1230
push $P1, $P28
.annotate 'line', 1247
new $P31, [ 'PredefFunction' ]
$P31.'PredefFunction'('exit', 'exit {arg0}', 'v', 'I')
set $P30, $P31
.annotate 'line', 1230
push $P1, $P30
.annotate 'line', 1251
new $P33, [ 'PredefFunction' ]
$P33.'PredefFunction'('time', 'time {res}', 'I')
set $P32, $P33
.annotate 'line', 1230
push $P1, $P32
.annotate 'line', 1255
new $P35, [ 'PredefFunction' ]
$P35.'PredefFunction'('floattime', 'time {res}', 'N')
set $P34, $P35
.annotate 'line', 1230
push $P1, $P34
.annotate 'line', 1259
new $P37, [ 'PredefFunction' ]
$P37.'PredefFunction'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
set $P36, $P37
.annotate 'line', 1230
push $P1, $P36
.annotate 'line', 1263
new $P39, [ 'PredefFunction' ]
$P39.'PredefFunction'('getstdin', 'getstdin {res}', 'P')
set $P38, $P39
.annotate 'line', 1230
push $P1, $P38
.annotate 'line', 1267
new $P41, [ 'PredefFunction' ]
$P41.'PredefFunction'('getstdout', 'getstdout {res}', 'P')
set $P40, $P41
.annotate 'line', 1230
push $P1, $P40
.annotate 'line', 1271
new $P43, [ 'PredefFunction' ]
$P43.'PredefFunction'('getstderr', 'getstderr {res}', 'P')
set $P42, $P43
.annotate 'line', 1230
push $P1, $P42
.annotate 'line', 1275
new $P45, [ 'PredefFunction' ]
$P45.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
set $P44, $P45
.annotate 'line', 1230
push $P1, $P44
.annotate 'line', 1280
new $P47, [ 'PredefFunction' ]
$P47.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
set $P46, $P47
.annotate 'line', 1230
push $P1, $P46
.annotate 'line', 1285
new $P49, [ 'PredefFunction' ]
$P49.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
set $P48, $P49
.annotate 'line', 1230
push $P1, $P48
.annotate 'line', 1290
new $P51, [ 'PredefFunction' ]
$P51.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
set $P50, $P51
.annotate 'line', 1230
push $P1, $P50
.annotate 'line', 1296
new $P53, [ 'PredefFunction' ]
$P53.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
set $P52, $P53
.annotate 'line', 1230
push $P1, $P52
.annotate 'line', 1303
new $P55, [ 'PredefFunction' ]
$P55.'PredefFunction'('elements', 'elements {res}, {arg0}', 'I', 'P')
set $P54, $P55
.annotate 'line', 1230
push $P1, $P54
.annotate 'line', 1307
new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1308
$P57.'PredefFunctionEval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
set $P56, $P57
.annotate 'line', 1230
push $P1, $P56
.annotate 'line', 1312
new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1313
$P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
set $P58, $P59
.annotate 'line', 1230
push $P1, $P58
.annotate 'line', 1317
new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1318
$P61.'PredefFunctionEval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
set $P60, $P61
.annotate 'line', 1230
push $P1, $P60
.annotate 'line', 1324
new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1325
$P63.'PredefFunctionEval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
set $P62, $P63
.annotate 'line', 1230
push $P1, $P62
.annotate 'line', 1329
new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1330
$P65.'PredefFunctionEval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
set $P64, $P65
.annotate 'line', 1230
push $P1, $P64
.annotate 'line', 1334
new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1335
$P67.'PredefFunctionEval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
set $P66, $P67
.annotate 'line', 1230
push $P1, $P66
.annotate 'line', 1339
new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1340
$P69.'PredefFunctionEval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
set $P68, $P69
.annotate 'line', 1230
push $P1, $P68
.annotate 'line', 1344
new $P71, [ 'PredefFunction' ]
$P71.'PredefFunction'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
set $P70, $P71
.annotate 'line', 1230
push $P1, $P70
.annotate 'line', 1348
new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1349
$P73.'PredefFunctionEval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
set $P72, $P73
.annotate 'line', 1230
push $P1, $P72
.annotate 'line', 1353
new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1354
$P75.'PredefFunctionEval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
set $P74, $P75
.annotate 'line', 1230
push $P1, $P74
.annotate 'line', 1358
new $P77, [ 'PredefFunction' ]
$P77.'PredefFunction'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
set $P76, $P77
.annotate 'line', 1230
push $P1, $P76
.annotate 'line', 1362
new $P79, [ 'PredefFunction' ]
$P79.'PredefFunction'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
set $P78, $P79
.annotate 'line', 1230
push $P1, $P78
.annotate 'line', 1366
new $P81, [ 'PredefFunction' ]
$P81.'PredefFunction'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
set $P80, $P81
.annotate 'line', 1230
push $P1, $P80
.annotate 'line', 1370
new $P83, [ 'PredefFunction' ]
$P83.'PredefFunction'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
set $P82, $P83
.annotate 'line', 1230
push $P1, $P82
.annotate 'line', 1374
new $P85, [ 'PredefFunction' ]
$P85.'PredefFunction'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
set $P84, $P85
.annotate 'line', 1230
push $P1, $P84
.annotate 'line', 1378
new $P87, [ 'PredefFunction' ]
$P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
set $P86, $P87
.annotate 'line', 1230
push $P1, $P86
.annotate 'line', 1383
new $P89, [ 'PredefFunction' ]
$P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
set $P88, $P89
.annotate 'line', 1230
push $P1, $P88
.annotate 'line', 1388
new $P91, [ 'PredefFunction' ]
$P91.'PredefFunction'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
set $P90, $P91
.annotate 'line', 1230
push $P1, $P90
.annotate 'line', 1392
new $P93, [ 'PredefFunction' ]
$P93.'PredefFunction'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
set $P92, $P93
.annotate 'line', 1230
push $P1, $P92
.annotate 'line', 1396
new $P95, [ 'PredefFunction' ]
$P95.'PredefFunction'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
set $P94, $P95
.annotate 'line', 1230
push $P1, $P94
.annotate 'line', 1400
new $P97, [ 'PredefFunction' ]
$P97.'PredefFunction'('exp', 'exp {res}, {arg0}', 'N', 'N')
set $P96, $P97
.annotate 'line', 1230
push $P1, $P96
.annotate 'line', 1404
new $P99, [ 'PredefFunction' ]
$P99.'PredefFunction'('ln', 'ln {res}, {arg0}', 'N', 'N')
set $P98, $P99
.annotate 'line', 1230
push $P1, $P98
.annotate 'line', 1408
new $P101, [ 'PredefFunction' ]
$P101.'PredefFunction'('sin', 'sin {res}, {arg0}', 'N', 'N')
set $P100, $P101
.annotate 'line', 1230
push $P1, $P100
.annotate 'line', 1412
new $P103, [ 'PredefFunction' ]
$P103.'PredefFunction'('cos', 'cos {res}, {arg0}', 'N', 'N')
set $P102, $P103
.annotate 'line', 1230
push $P1, $P102
.annotate 'line', 1416
new $P105, [ 'PredefFunction' ]
$P105.'PredefFunction'('tan', 'tan {res}, {arg0}', 'N', 'N')
set $P104, $P105
.annotate 'line', 1230
push $P1, $P104
.annotate 'line', 1420
new $P107, [ 'PredefFunction' ]
$P107.'PredefFunction'('asin', 'asin {res}, {arg0}', 'N', 'N')
set $P106, $P107
.annotate 'line', 1230
push $P1, $P106
.annotate 'line', 1424
new $P109, [ 'PredefFunction' ]
$P109.'PredefFunction'('acos', 'acos {res}, {arg0}', 'N', 'N')
set $P108, $P109
.annotate 'line', 1230
push $P1, $P108
.annotate 'line', 1428
new $P111, [ 'PredefFunction' ]
$P111.'PredefFunction'('atan', 'atan {res}, {arg0}', 'N', 'N')
set $P110, $P111
.annotate 'line', 1230
push $P1, $P110
.annotate 'line', 1432
new $P113, [ 'PredefFunction' ]
$P113.'PredefFunction'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
set $P112, $P113
.annotate 'line', 1230
push $P1, $P112
.annotate 'line', 1436
new $P115, [ 'PredefFunction' ]
$P115.'PredefFunction'('getinterp', 'getinterp {res}', 'P')
set $P114, $P115
.annotate 'line', 1230
push $P1, $P114
.annotate 'line', 1440
new $P117, [ 'PredefFunction' ]
$P117.'PredefFunction'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
set $P116, $P117
.annotate 'line', 1230
push $P1, $P116
.annotate 'line', 1444
new $P119, [ 'PredefFunction' ]
$P119.'PredefFunction'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
set $P118, $P119
.annotate 'line', 1230
push $P1, $P118
.annotate 'line', 1448
new $P121, [ 'PredefFunction' ]
$P121.'PredefFunction'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
set $P120, $P121
.annotate 'line', 1230
push $P1, $P120
.annotate 'line', 1452
new $P123, [ 'PredefFunction' ]
$P123.'PredefFunction'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
set $P122, $P123
.annotate 'line', 1230
push $P1, $P122
.annotate 'line', 1456
new $P125, [ 'PredefFunction' ]
$P125.'PredefFunction'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
set $P124, $P125
.annotate 'line', 1230
push $P1, $P124
.annotate 'line', 1460
new $P127, [ 'PredefFunction' ]
$P127.'PredefFunction'('clone', 'clone {res}, {arg0}', 'P', 'P')
set $P126, $P127
.annotate 'line', 1230
push $P1, $P126
.annotate 'line', 1464
new $P129, [ 'PredefFunction' ]
$P129.'PredefFunction'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
set $P128, $P129
.annotate 'line', 1230
push $P1, $P128
.annotate 'line', 1468
new $P131, [ 'PredefFunction' ]
$P131.'PredefFunction'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
set $P130, $P131
.annotate 'line', 1230
push $P1, $P130
.annotate 'line', 1472
new $P133, [ 'PredefFunction' ]
$P133.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
set $P132, $P133
.annotate 'line', 1230
push $P1, $P132
.annotate 'line', 1477
new $P135, [ 'PredefFunction' ]
$P135.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
set $P134, $P135
.annotate 'line', 1230
push $P1, $P134
.annotate 'line', 1482
new $P137, [ 'PredefFunction' ]
$P137.'PredefFunction'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
set $P136, $P137
.annotate 'line', 1230
push $P1, $P136
.annotate 'line', 1486
new $P139, [ 'PredefFunction' ]
$P139.'PredefFunction'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
set $P138, $P139
.annotate 'line', 1230
push $P1, $P138
.annotate 'line', 1490
new $P141, [ 'PredefFunction' ]
$P141.'PredefFunction'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
set $P140, $P141
.annotate 'line', 1230
push $P1, $P140
.annotate 'line', 1494
new $P143, [ 'PredefFunction' ]
$P143.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
set $P142, $P143
.annotate 'line', 1230
push $P1, $P142
.annotate 'line', 1498
new $P145, [ 'PredefFunction' ]
$P145.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
set $P144, $P145
.annotate 'line', 1230
push $P1, $P144
.annotate 'line', 1502
new $P147, [ 'PredefFunction' ]
.annotate 'line', 1503
$P147.'PredefFunction'('print', $P11, 'v', '*')
set $P146, $P147
.annotate 'line', 1230
push $P1, $P146
.annotate 'line', 1506
new $P149, [ 'PredefFunction' ]
.annotate 'line', 1507
$P149.'PredefFunction'('say', $P12, 'v', '*')
set $P148, $P149
.annotate 'line', 1230
push $P1, $P148
.annotate 'line', 1510
new $P151, [ 'PredefFunction' ]
.annotate 'line', 1511
$P151.'PredefFunction'('cry', $P13, 'v', '*')
set $P150, $P151
.annotate 'line', 1230
push $P1, $P150
.annotate 'line', 1514
new $P153, [ 'PredefFunction' ]
.annotate 'line', 1515
$P153.'PredefFunction'('invoke', $P14, 'P', '!')
set $P152, $P153
.annotate 'line', 1230
push $P1, $P152
__label_1: # Infinite loop
.annotate 'line', 1520
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1521

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1526
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1527
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1528
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1529
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1530
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1531
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1533
.return($P2)
# }
.annotate 'line', 1534

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1540
# Body
# {
.annotate 'line', 1542
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1543
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1544
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1543
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1545

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1547
# Body
# {
.annotate 'line', 1549
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1550
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1551
$P3 = $P2.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 1552
# predefined push
push $P1, $P2
__label_2: # while
.annotate 'line', 1553
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 1554
$P2 = __ARG_1.'get'()
.annotate 'line', 1555
# predefined push
push $P1, $P2
# }
goto __label_2
__label_1: # endwhile
# }
__label_0: # endif
.annotate 'line', 1558
__ARG_1.'unget'($P2)
.annotate 'line', 1559
.return($P1)
# }
.annotate 'line', 1560

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
# string list: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1565
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 1566
$P4 = $P2.'getidentifier'()
# predefined push
push $P1, $P4
goto __label_0
__label_1: # endfor
.annotate 'line', 1567
.return($P1)
# }
.annotate 'line', 1568

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1579
# Body
# {
.annotate 'line', 1581
setattribute self, 'start', __ARG_1
.annotate 'line', 1582
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1583

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1584
# Body
# {
.annotate 'line', 1586
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1587

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1588
# Body
# {
.annotate 'line', 1590
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1591

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1592
# Body
# {
.annotate 'line', 1594
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1595

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1596
# Body
# {
.annotate 'line', 1598
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1599

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1600
# Body
# {
.annotate 'line', 1602
getattribute $P1, self, 'owner'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1603

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1604
# Body
# {
.annotate 'line', 1606
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1607

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1608
# Body
# {
.annotate 'line', 1610
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1611

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1576
addattribute $P0, 'start'
.annotate 'line', 1577
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1624
# Body
# {
.annotate 'line', 1626
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1627

.end # init


.sub 'numargs' :method

.annotate 'line', 1629
# Body
# {
.annotate 'line', 1631
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1632

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1633
# Body
# {
.annotate 'line', 1635
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1636
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1637

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1639
# Body
# {
.annotate 'line', 1641
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1642
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1643
# {
.annotate 'line', 1644
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1645
# predefined push
push $P1, $P3
# }
__label_2: # continue
.annotate 'line', 1646
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1647
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1648

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1650
# Body
# {
.annotate 'line', 1652
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1653
if_null $P1, __label_0
.annotate 'line', 1654
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1655

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1656
# Body
# {
.annotate 'line', 1658
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1659
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1660
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1661
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1662
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1663
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1664
# predefined push
push $P2, $S1
# }
__label_0: # for iteration
.annotate 'line', 1661
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1666
.return($P2)
# }
.annotate 'line', 1667

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1668
# Body
# {
.annotate 'line', 1670
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1671
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1672

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1622
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1684
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1685
# Body
# {
.annotate 'line', 1687
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1688
.return($I1)
# }
.annotate 'line', 1689

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1690
# Body
# {
.annotate 'line', 1692
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1693
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1694
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1696
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1697

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1698
# Body
# {
.annotate 'line', 1700
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 1701
if_null __ARG_2, __label_0
.annotate 'line', 1702
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1703

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1707

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1681
addattribute $P0, 'name'
.annotate 'line', 1682
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1714
# Body
# {
.annotate 'line', 1716
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1717
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1718
# {
.annotate 'line', 1719
$P2 = __ARG_1.'get'()
.annotate 'line', 1720
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1721
$P2 = __ARG_1.'get'()
.annotate 'line', 1722
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1723
$P4 = $P2.'isop'('(')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 1724
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1725
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1727
new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
set $P4, $P5
# predefined push
push $P1, $P4
# }
__label_2: # continue
.annotate 'line', 1728
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1729
'RequireOp'(']', $P2)
.annotate 'line', 1730
setattribute self, 'list', $P1
# }
.annotate 'line', 1731

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1732
# Body
# {
.annotate 'line', 1734
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1735
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1736

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1737
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1738
# Body
# {
.annotate 'line', 1740
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1741
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1742
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1743
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1744
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1745
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1742
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1748
.return($P3)
# }
.annotate 'line', 1749

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1712
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1756
# Body
# {
.annotate 'line', 1758
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1759
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
.annotate 'line', 1760

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1762
# Body
# {
.annotate 'line', 1764
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1765
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1767
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1768
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1770

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1772
# Body
# {
.annotate 'line', 1774
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1775
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1776
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1777
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1778
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1780
__ARG_2.'unget'($P1)
.annotate 'line', 1781
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1783

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1785
# Body
# {
.annotate 'line', 1787
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1788
$P3 = $P1.'isop'(';')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 1789
new $P4, [ 'EmptyStatement' ]
.return($P4)
__label_0: # endif
.annotate 'line', 1790
$P3 = $P1.'isop'('{')
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 1791
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_1: # endif
.annotate 'line', 1792
$P3 = $P1.'isop'('${')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 1793
new $P5, [ 'PiropStatement' ]
$P5.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_2: # endif
.annotate 'line', 1795
$P3 = $P1.'checkkeyword'()
set $S1, $P3
set $S2, 'using'
if $S1 == $S2 goto __label_5
set $S2, 'const'
if $S1 == $S2 goto __label_6
set $S2, 'volatile'
if $S1 == $S2 goto __label_7
set $S2, 'var'
if $S1 == $S2 goto __label_8
set $S2, 'string'
if $S1 == $S2 goto __label_9
set $S2, 'int'
if $S1 == $S2 goto __label_10
set $S2, 'float'
if $S1 == $S2 goto __label_11
set $S2, 'return'
if $S1 == $S2 goto __label_12
set $S2, 'yield'
if $S1 == $S2 goto __label_13
set $S2, 'goto'
if $S1 == $S2 goto __label_14
set $S2, 'if'
if $S1 == $S2 goto __label_15
set $S2, 'while'
if $S1 == $S2 goto __label_16
set $S2, 'do'
if $S1 == $S2 goto __label_17
set $S2, 'continue'
if $S1 == $S2 goto __label_18
set $S2, 'break'
if $S1 == $S2 goto __label_19
set $S2, 'switch'
if $S1 == $S2 goto __label_20
set $S2, 'for'
if $S1 == $S2 goto __label_21
set $S2, 'throw'
if $S1 == $S2 goto __label_22
set $S2, 'try'
if $S1 == $S2 goto __label_23
goto __label_4
# switch
__label_5: # case
.annotate 'line', 1797
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_6: # case
.annotate 'line', 1799
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_3 # break
__label_7: # case
.annotate 'line', 1802
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_3 # break
__label_8: # case
.annotate 'line', 1805
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1807
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1809
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1811
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1813
new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_13: # case
.annotate 'line', 1815
new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P6, $P7
.return($P6)
__label_14: # case
.annotate 'line', 1817
new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_15: # case
.annotate 'line', 1819
new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_16: # case
.annotate 'line', 1821
new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_17: # case
.annotate 'line', 1823
new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_18: # case
.annotate 'line', 1825
new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_19: # case
.annotate 'line', 1827
new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_20: # case
.annotate 'line', 1829
new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_21: # case
.annotate 'line', 1831
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1833
new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_23: # case
.annotate 'line', 1835
new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_4: # default
.annotate 'line', 1837
$P26 = $P1.'isidentifier'()
if_null $P26, __label_24
unless $P26 goto __label_24
# {
.annotate 'line', 1838
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1839
$P3 = $P2.'isop'(':')
if_null $P3, __label_25
unless $P3 goto __label_25
.annotate 'line', 1840
new $P5, [ 'LabelStatement' ]
$P5.'LabelStatement'($P1, __ARG_2)
set $P4, $P5
.return($P4)
__label_25: # endif
.annotate 'line', 1841
__ARG_1.'unget'($P2)
# }
__label_24: # endif
.annotate 'line', 1843
__ARG_1.'unget'($P1)
.annotate 'line', 1844
new $P4, [ 'ExprStatement' ]
$P4.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P3, $P4
.return($P3)
__label_3: # switch end
.annotate 'line', 1846
'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1847

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1855
# Body
# {
.annotate 'line', 1857
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1858

.end # Statement


.sub 'isempty' :method

.annotate 'line', 1859
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1860
# Body
# {
.annotate 'line', 1862
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1863

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1864
# Body
# {
.annotate 'line', 1866
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1867

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1868
# Body
# {
.annotate 'line', 1870
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1871

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1872
# Body
# {
.annotate 'line', 1874
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1875

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1876
# Body
# {
.annotate 'line', 1878
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1879

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1880
# Body
# {
.annotate 'line', 1882
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1883

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1884
# Body
# {
.annotate 'line', 1886
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1887

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1888
# Body
# {
.annotate 'line', 1890
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1891

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1892
# Body
# {
.annotate 'line', 1894
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1895

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1896
# Body
# {
.annotate 'line', 1898
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1899

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1901
# Body
# {
.annotate 'line', 1906
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1907

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1908
# Body
# {
.annotate 'line', 1910
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1911

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1912
# Body
# {
.annotate 'line', 1914
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1915

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1916
# Body
# {
.annotate 'line', 1918
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1920
.return(self)
# }
.annotate 'line', 1921

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1853
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1926
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1927
# Body
# {
.annotate 'line', 1929
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1930

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1931
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1932
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1924
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1942
# Body
# {
.annotate 'line', 1944
# var statements: $P1
getattribute $P1, self, 'statements'
.annotate 'line', 1945
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 1946
# int empty: $I2
set $I2, 1
# for loop
.annotate 'line', 1947
# int i: $I3
null $I3
__label_2: # for condition
ge $I3, $I1, __label_1
# {
.annotate 'line', 1948
# var st: $P2
$P3 = $P1[$I3]
$P2 = $P3.'optimize'()
.annotate 'line', 1949
set $I4, $I2
unless $I4 goto __label_4
$P3 = $P2.'isempty'()
isfalse $I4, $P3
__label_4:
unless $I4 goto __label_3
.annotate 'line', 1950
null $I2
__label_3: # endif
.annotate 'line', 1951
$P1[$I3] = $P2
# }
__label_0: # for iteration
.annotate 'line', 1947
inc $I3
goto __label_2
__label_1: # for end
.annotate 'line', 1953
unless $I2 goto __label_5
.annotate 'line', 1954
new $P3, [ 'EmptyStatement' ]
.return($P3)
goto __label_6
__label_5: # else
.annotate 'line', 1956
.return(self)
__label_6: # endif
# }
.annotate 'line', 1957

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1940
addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1962
# Body
# {
.annotate 'line', 1964
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
push $P1, __ARG_1
push $P1, __ARG_2
.annotate 'line', 1965
setattribute self, 'statements', $P1
# }
.annotate 'line', 1966

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1967
# Body
# {
.return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1968
# Body
# {
.annotate 'line', 1970
getattribute $P1, self, 'statements'
# predefined push
push $P1, __ARG_1
.annotate 'line', 1971
.return(self)
# }
.annotate 'line', 1972

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1973
# Body
# {
.annotate 'line', 1975
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1976
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1977

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1960
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1980
# Body
# {
.annotate 'line', 1982
unless_null __ARG_1, __label_0
.annotate 'line', 1983
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1984
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1985
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1987
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1988

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1999
# Body
# {
.annotate 'line', 2001
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2002
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 2003
# int dotted: $I1
null $I1
.annotate 'line', 2004
$P4 = $P1.'isop'('.')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 2005
set $I1, 1
.annotate 'line', 2006
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 2008
# string opname: $S1
$P4 = $P1.'getidentifier'()
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 2009
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S4, $S3, $S1
box $P4, $S4
setattribute self, 'opname', $P4
.annotate 'line', 2010
$P1 = __ARG_2.'get'()
.annotate 'line', 2011
$P4 = $P1.'isop'('}')
isfalse $I2, $P4
unless $I2 goto __label_4
# {
.annotate 'line', 2012
__ARG_2.'unget'($P1)
.annotate 'line', 2013
# var args: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_5: # do
.annotate 'line', 2014
# {
.annotate 'line', 2015
# var arg: $P3
null $P3
.annotate 'line', 2016
$P1 = __ARG_2.'get'()
.annotate 'line', 2017
$P4 = $P1.'isop'(':')
if_null $P4, __label_8
unless $P4 goto __label_8
# {
.annotate 'line', 2018
$P1 = __ARG_2.'get'()
.annotate 'line', 2019
# string label: $S2
$P4 = $P1.'getidentifier'()
null $S2
if_null $P4, __label_10
set $S2, $P4
__label_10:
.annotate 'line', 2020
new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
set $P3, $P4
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 2023
__ARG_2.'unget'($P1)
.annotate 'line', 2024
$P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
__label_9: # endif
.annotate 'line', 2026
# predefined push
push $P2, $P3
# }
__label_7: # continue
.annotate 'line', 2027
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_6
if $P4 goto __label_5
__label_6: # enddo
.annotate 'line', 2028
'RequireOp'('}', $P1)
.annotate 'line', 2029
setattribute self, 'args', $P2
# }
__label_4: # endif
.annotate 'line', 2031
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2032

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 2033
# Body
# {
.annotate 'line', 2035
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2036
if_null $P1, __label_0
.annotate 'line', 2037
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 2038
.return(self)
# }
.annotate 'line', 2039

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2040
# Body
# {
.annotate 'line', 2042
# string opname: $S1
getattribute $P4, self, 'opname'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2043
self.'annotate'(__ARG_1)
.annotate 'line', 2044
concat $S3, 'pirop ', $S1
__ARG_1.'comment'($S3)
.annotate 'line', 2045
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2046
unless_null $P1, __label_1
.annotate 'line', 2047
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 2049
__ARG_1.'print'($S1, ' ')
.annotate 'line', 2050
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2051
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 2052
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 2053
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 2054
# string reg: $S2
$P4 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_6
set $S2, $P4
__label_6:
.annotate 'line', 2055
# predefined push
push $P2, $S2
# }
__label_3: # for iteration
.annotate 'line', 2052
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 2057
# predefined join
join $S3, ', ', $P2
__ARG_1.'say'($S3)
# }
__label_2: # endif
# }
.annotate 'line', 2059

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1994
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1996
addattribute $P0, 'opname'
.annotate 'line', 1997
addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2069
# Body
# {
.annotate 'line', 2071
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2072
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2073
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2074
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2075
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2076
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
.annotate 'line', 2077
.return(self)
# }
.annotate 'line', 2078

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2079
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2080
# Body
# {
.annotate 'line', 2082
self.'annotate'(__ARG_1)
.annotate 'line', 2083
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2084

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2066
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2068
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2094
# Body
# {
.annotate 'line', 2096
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2097
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2098
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2099
box $P1, $S1
setattribute self, 'symbol', $P1
# }
.annotate 'line', 2100

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2101
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2102
# Body
# {
.annotate 'line', 2104
self.'annotate'(__ARG_1)
.annotate 'line', 2105
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2106
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2107

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2091
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2093
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2119
# Body
# {
.annotate 'line', 2121
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2122
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2123
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2124
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2125
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2126
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
# }
.annotate 'line', 2127

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2128
# Body
# {
.annotate 'line', 2130
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2131
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2132
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2134
# var symbol: $P3
$P3 = self.'findsymbol'($P1)
.annotate 'line', 2135
if_null $P3, __label_0
# {
.annotate 'line', 2136
isa $I1, $P3, 'FunctionStatement'
unless $I1 goto __label_1
# {
.annotate 'line', 2137
# string subid: $S2
$P4 = $P3.'makesubid'()
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2138
box $P4, $S2
setattribute self, 'subid', $P4
# }
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2141
.return(self)
# }
.annotate 'line', 2142

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2143
# Body
# {
.annotate 'line', 2145
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2146
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2147
# var vdata: $P2
$P2 = self.'getvar'($S1)
.annotate 'line', 2148
getattribute $P3, self, 'subid'
if_null $P3, __label_0
# {
.annotate 'line', 2149
# string subid: $S2
getattribute $P4, self, 'subid'
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2150
$P3 = $P2.'getreg'()
__ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 2153
self.'annotate'(__ARG_1)
.annotate 'line', 2154
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2155
$P1.'pop'()
.annotate 'line', 2156
# predefined elements
elements $I1, $P1
null $I2
if $I1 == $I2 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 2158
__ARG_1.'say'("'", $S1, "'")
goto __label_3 # break
__label_4: # default
.annotate 'line', 2161
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_3: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2164

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2114
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2116
addattribute $P0, 'path'
.annotate 'line', 2117
addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2174
# Body
# {
.annotate 'line', 2176
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2177
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2178
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2179

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2180
# Body
# {
.annotate 'line', 2182
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2183
.return(self)
# }
.annotate 'line', 2184

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2185
# Body
# {
.annotate 'line', 2187
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2188

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2171
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2173
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2205
# Body
# {
.annotate 'line', 2207
setattribute self, 'type', __ARG_1
.annotate 'line', 2208
setattribute self, 'reg', __ARG_2
.annotate 'line', 2209
setattribute self, 'scope', __ARG_3
.annotate 'line', 2210
box $P1, __ARG_4
setattribute self, 'flags', $P1
.annotate 'line', 2211
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2212

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2213
# Body
# {
.annotate 'line', 2215
box $P1, __ARG_1
setattribute self, 'id', $P1
# }
.annotate 'line', 2216

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2217
# Body
# {
.annotate 'line', 2219
box $P1, __ARG_1
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2220

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2221
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2222
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2223
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2224
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2225
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2226
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2227
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'getflags' :method

.annotate 'line', 2228
# Body
# {
getattribute $P1, self, 'flags'
.return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 2197
addattribute $P0, 'type'
.annotate 'line', 2198
addattribute $P0, 'reg'
.annotate 'line', 2199
addattribute $P0, 'scope'
.annotate 'line', 2200
addattribute $P0, 'flags'
.annotate 'line', 2201
addattribute $P0, 'value'
.annotate 'line', 2202
addattribute $P0, 'id'
.annotate 'line', 2203
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2234
# Body
# {
.annotate 'line', 2236
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2237

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2238
# Body
# {
.annotate 'line', 2240
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2241

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2233
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2248
# Body
# {
.annotate 'line', 2250
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2251

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2252
# Body
# {
.annotate 'line', 2254
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2255
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2256
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2257
if_null $P2, __label_1
.annotate 'line', 2258
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2259
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2260
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2261
$P1[$S1] = $P3
.annotate 'line', 2262
.return($P3)
# }
.annotate 'line', 2263

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2264
# Body
# {
.annotate 'line', 2266
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2267
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2268
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2269
if_null $P2, __label_1
.annotate 'line', 2270
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2271
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2272

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2273
# Body
# {
.annotate 'line', 2275
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2276
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2277
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2278
if_null $P2, __label_1
.annotate 'line', 2279
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2280
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2281
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2282
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2283
$P1[$S1] = $P3
# }
.annotate 'line', 2284

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2285
# Body
# {
.annotate 'line', 2287
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2288
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2289
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2290
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2291
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2292
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2293
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2294
.return($P2)
# }
.annotate 'line', 2295

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2296
# Body
# {
.annotate 'line', 2298
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2299
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2300
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2301
.return($P2)
# }
.annotate 'line', 2302

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2303
# Body
# {
.annotate 'line', 2305
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2306
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2307
.return($S1)
# }
.annotate 'line', 2308

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2309
# Body
# {
.annotate 'line', 2311
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2313
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2314
.return('__WLEX_self')
# }
.annotate 'line', 2315

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2247
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2324
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2334
# Body
# {
.annotate 'line', 2336
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2337

.end # Expr


.sub 'issimple' :method

.annotate 'line', 2338
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2339
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2340
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2341
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2342
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2343
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2344
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2345
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2346
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2347
# Body
# {
.annotate 'line', 2349
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2350

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2351
# Body
# {
.annotate 'line', 2354
.return(self)
# }
.annotate 'line', 2355

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2356
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2357
# Body
# {
.annotate 'line', 2359
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2360
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2361
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2362
.return($S2)
# }
.annotate 'line', 2363

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2364
# Body
# {
.annotate 'line', 2366
# string reg: $S1
null $S1
.annotate 'line', 2367
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2368
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2370
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2371
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2373
.return($S1)
# }
.annotate 'line', 2374

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2378

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2332
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2383
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2381
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2391
# Body
# {
.annotate 'line', 2393
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2394
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2395
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2396
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2397
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2398

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2399
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2400
# Body
# {
.annotate 'line', 2402
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
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
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2408
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2409
self.'annotate'(__ARG_1)
.annotate 'line', 2410
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2411
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2412
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2413

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2388
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2390
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2426
# Body
# {
.annotate 'line', 2428
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2429
.return(self)
# }
.annotate 'line', 2430

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2431
# Body
# {
.annotate 'line', 2433
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2434

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2435
# Body
# {
.annotate 'line', 2437
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2438
.return(self)
# }
.annotate 'line', 2439

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2440
# Body
# {
.annotate 'line', 2442
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2443
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2444
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2446
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2447
ne $I1, 0, __label_4
.annotate 'line', 2448
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2450
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2453
.return(0)
# }
.annotate 'line', 2454

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2455
# Body
# {
.annotate 'line', 2457
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2459
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2460
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2461
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2463
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2464
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2465
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
.annotate 'line', 2468
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2471
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2474
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2477

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2478
# Body
# {
.annotate 'line', 2480
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2482
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2483
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2484
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2486
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2487
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2488
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
.annotate 'line', 2491
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2494
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2497
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2500

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2425
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2507
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2508
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2505
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2516
# Body
# {
.annotate 'line', 2518
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2519
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2520

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2521
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2522
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2523
# Body
# {
.annotate 'line', 2525
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2526
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2527
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2528
# int need_unicode: $I2
null $I2
.annotate 'line', 2529
box $P2, $S1
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2530
le $I3, 127, __label_3
# {
.annotate 'line', 2531
set $I2, 1
goto __label_2 # break
.annotate 'line', 2532
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2535
unless $I2 goto __label_4
# {
.annotate 'line', 2536
unless $I1 goto __label_5
# {
.annotate 'line', 2537
null $I1
.annotate 'line', 2538
# string saux: $S2
set $S2, $S1
.annotate 'line', 2539
set $S1, ''
.annotate 'line', 2540
box $P2, $S2
iter $P4, $P2
set $P4, 0
__label_6: # for iteration
unless $P4 goto __label_7
shift $S3, $P4
# {
.annotate 'line', 2541
ne $S3, '\', __label_8
.annotate 'line', 2542
set $S3, '\\'
__label_8: # endif
.annotate 'line', 2543
concat $S1, $S1, $S3
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2546
# string result: $S4
set $S4, ''
.annotate 'line', 2547
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2548
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2549
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2550
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2551
le $I6, 127, __label_12
# {
.annotate 'line', 2552
# string h: $S6
box $P5, $I6
$P2 = $P5.'get_as_base'(16)
null $S6
if_null $P2, __label_14
set $S6, $P2
__label_14:
.annotate 'line', 2553
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
# }
goto __label_13
__label_12: # else
.annotate 'line', 2556
concat $S4, $S4, $S5
__label_13: # endif
# }
__label_9: # for iteration
.annotate 'line', 2548
inc $I5
goto __label_11
__label_10: # for end
.annotate 'line', 2558
set $S1, $S4
# }
__label_4: # endif
.annotate 'line', 2560
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
.annotate 'line', 2561
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
.annotate 'line', 2562
unless $I2 goto __label_17
.annotate 'line', 2563
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2564
.return($S1)
# }
.annotate 'line', 2565

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2566
# Body
# {
.annotate 'line', 2568
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2569
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2570
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2571
# var s: $P2
box $P2, $S1
.annotate 'line', 2572
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2574
.return($S1)
# }
.annotate 'line', 2575

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2576
# Body
# {
.annotate 'line', 2578
set $S1, __ARG_2
eq $S1, '', __label_0
.annotate 'line', 2579
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2580

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2581
# Body
# {
.annotate 'line', 2583
.tailcall self.'getPirString'()
# }
.annotate 'line', 2584

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2513
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2515
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2593
# Body
# {
.annotate 'line', 2596
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2597
setattribute self, 'pos', __ARG_2
.annotate 'line', 2598
# int n: $I1
null $I1
.annotate 'line', 2599
unless __ARG_4 goto __label_0
.annotate 'line', 2600
set $I1, __ARG_3
goto __label_1
__label_0: # else
# {
.annotate 'line', 2602
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2603
set $I1, $S1
# }
__label_1: # endif
.annotate 'line', 2605
box $P1, $I1
setattribute self, 'numval', $P1
# }
.annotate 'line', 2606

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2607
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2608
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2609
# Body
# {
.annotate 'line', 2611
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2612
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2613
.return($I1)
# }
.annotate 'line', 2614

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2615
# Body
# {
.annotate 'line', 2617
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2618
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2619
ne $I1, 0, __label_1
.annotate 'line', 2620
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2622
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2624

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2625
# Body
# {
.annotate 'line', 2627
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2628

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2589
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2591
addattribute $P0, 'pos'
.annotate 'line', 2592
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2636
# Body
# {
.annotate 'line', 2638
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2639
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2640

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2641
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2642
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2643
# Body
# {
.annotate 'line', 2645
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2646
# var n: $P1
new $P1, [ 'Float' ]
.annotate 'line', 2647
assign $P1, $S1
.annotate 'line', 2648
.return($P1)
# }
.annotate 'line', 2649

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2650
# Body
# {
.annotate 'line', 2652
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2653
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2654
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2656

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2657
# Body
# {
.annotate 'line', 2661
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2662
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
.annotate 'line', 2663
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2664
.return($S1)
# }
.annotate 'line', 2665

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2633
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2635
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2673
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2674
# Body
# {
.annotate 'line', 2676
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2677
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2678

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2679
# Body
# {
.annotate 'line', 2681
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2682

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2683
# Body
# {
.annotate 'line', 2685
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2686
if_null $P1, __label_0
.annotate 'line', 2687
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2689
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
.annotate 'line', 2692
.return('P')
__label_3: # default
.annotate 'line', 2694
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2697

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2698
# Body
# {
.annotate 'line', 2700
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2701
.return($S1)
# }
.annotate 'line', 2702

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2703
# Body
# {
.annotate 'line', 2705
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2706
unless_null $P1, __label_0
.annotate 'line', 2707
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2708
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2709
# string s: $S1
null $S1
.annotate 'line', 2710
unless_null $P2, __label_1
# {
.annotate 'line', 2711
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2712
set $S3, $S2
set $S4, 'self'
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 2714
set $S1, 'self'
goto __label_4 # break
__label_7: # case
.annotate 'line', 2716
set $S1, 'null'
goto __label_4 # break
__label_5: # default
.annotate 'line', 2718
set $S1, ''
__label_4: # switch end
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2722
$P3 = $P2.'getid'()
if_null $P3, __label_8
.annotate 'line', 2723
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2725
$P4 = $P2.'getreg'()
set $S1, $P4
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2727
.return($S1)
# }
.annotate 'line', 2728

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2729
# Body
# {
.annotate 'line', 2731
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2732
set $S2, $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2733
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2734
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2736
.return($P1)
# }
.annotate 'line', 2737

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2738
# Body
# {
.annotate 'line', 2740
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2741
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2742
if_null $P2, __label_0
# {
.annotate 'line', 2743
$I2 = $P2.'isconst'()
unless $I2 goto __label_2
$P3 = $P2.'getid'()
isnull $I2, $P3
__label_2:
unless $I2 goto __label_1
.annotate 'line', 2744
.tailcall $P2.'getvalue'()
__label_1: # endif
.annotate 'line', 2745
# int flags: $I1
$P3 = $P2.'getflags'()
set $I1, $P3
.annotate 'line', 2746
band $I2, $I1, 1
unless $I2 goto __label_3
# {
.annotate 'line', 2747
band $I3, $I1, 2
unless $I3 goto __label_4
.annotate 'line', 2748
new $P4, [ 'LexicalVolatileExpr' ]
$P4.'LexicalVolatileExpr'(self, $P2)
set $P3, $P4
.return($P3)
__label_4: # endif
# }
__label_3: # endif
# }
__label_0: # endif
.annotate 'line', 2751
.return(self)
# }
.annotate 'line', 2752

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2753
# Body
# {
.annotate 'line', 2755
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2756
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2757
# int flags: $I1
unless_null $P1, __label_2
null $I1
goto __label_1
__label_2:
$I1 = $P1.'getflags'()
__label_1:
.annotate 'line', 2758
band $I2, $I1, 1
unless $I2 goto __label_3
# {
.annotate 'line', 2759
band $I3, $I1, 2
unless $I3 goto __label_4
# {
.annotate 'line', 2760
# string lexname: $S2
$P2 = $P1.'getlex'()
null $S2
if_null $P2, __label_5
set $S2, $P2
__label_5:
.annotate 'line', 2761
isnull $I2, $S2
not $I2
unless $I2 goto __label_7
isne $I2, $S2, ''
__label_7:
unless $I2 goto __label_6
.annotate 'line', 2762
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_6: # endif
# }
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 2765
.return($S1)
# }
.annotate 'line', 2766

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2767
# Body
# {
.annotate 'line', 2769
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2770
self.'annotate'(__ARG_1)
.annotate 'line', 2771
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2772
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2774

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2775
# Body
# {
.annotate 'line', 2777
self.'annotate'(__ARG_1)
.annotate 'line', 2778
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2779
.return($S1)
# }
.annotate 'line', 2780

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2781
# Body
# {
.annotate 'line', 2783
self.'annotate'(__ARG_1)
.annotate 'line', 2784
$P1 = self.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# predefined die
.annotate 'line', 2785
die "NO"
__label_0: # endif
.annotate 'line', 2786
# string typeleft: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2787
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 2788
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
# {
.annotate 'line', 2789
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_7
set $S6, 'P'
if $S5 == $S6 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2792
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2795
getattribute $P2, self, 'start'
'SyntaxError'("Can't assign null to that type", $P2)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2798
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2799
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2801
# string typeright: $S3
$P1 = __ARG_2.'checkresult'()
null $S3
if_null $P1, __label_11
set $S3, $P1
__label_11:
.annotate 'line', 2802
ne $S3, 'v', __label_12
.annotate 'line', 2803
getattribute $P1, self, 'start'
'SyntaxError'("Can't assign from void expression", $P1)
__label_12: # endif
.annotate 'line', 2804
ne $S1, $S3, __label_13
# {
.annotate 'line', 2805
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2808
# string rreg: $S4
$P1 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_15
set $S4, $P1
__label_15:
.annotate 'line', 2809
self.'annotate'(__ARG_1)
.annotate 'line', 2810
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2811
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2813
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2816
.return($S2)
# }
.annotate 'line', 2817

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2670
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2672
addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2825
# Body
# {
.annotate 'line', 2827
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'Expr'($P1, $P2)
.annotate 'line', 2828
setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2829

.end # LexicalVolatileExpr


.sub 'checkresult' :method

.annotate 'line', 2830
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2831
# Body
# {
.annotate 'line', 2833
# var desc: $P1
getattribute $P1, self, 'desc'
.annotate 'line', 2834
# string lexname: $S1
$P2 = $P1.'getlex'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2835
# string reg: $S2
getattribute $P3, self, 'owner'
$P2 = $P3.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 2836
__ARG_1.'say'("find_lex ", $S2, ", '", $S1, "'")
.annotate 'line', 2837
.return($S2)
# }
.annotate 'line', 2838

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2839
# Body
# {
.annotate 'line', 2841
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2842
self.'annotate'(__ARG_1)
.annotate 'line', 2843
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2844
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2846

.end # emit


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2847
# Body
# {
.annotate 'line', 2849
# string lreg: $S1
getattribute $P3, self, 'owner'
$P2 = $P3.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2850
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 2851
__ARG_1.'emitnull'($S1)
goto __label_2
__label_1: # else
.annotate 'line', 2852
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_3
.annotate 'line', 2853
__ARG_2.'emit'(__ARG_1, $S1)
goto __label_4
__label_3: # else
# {
.annotate 'line', 2855
# string typeright: $S2
$P3 = __ARG_2.'checkresult'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 2856
ne 'P', $S2, __label_6
# {
.annotate 'line', 2857
__ARG_2.'emit'(__ARG_1, $S1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 2860
# string rreg: $S3
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_8
set $S3, $P2
__label_8:
.annotate 'line', 2861
self.'annotate'(__ARG_1)
.annotate 'line', 2862
__ARG_1.'emitbox'($S1, $S3)
# }
__label_7: # endif
# }
__label_4: # endif
__label_2: # endif
.annotate 'line', 2866
# var desc: $P1
getattribute $P1, self, 'desc'
.annotate 'line', 2867
# string lexname: $S4
$P2 = $P1.'getlex'()
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 2868
__ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2869

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2822
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2824
addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2879

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2874
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2888
# Body
# {
.annotate 'line', 2890
self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2891
$P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
setattribute self, 'clspec', $P2
# }
.annotate 'line', 2892

.end # OpClassExpr


.sub 'checkresult' :method

.annotate 'line', 2893
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2894
# Body
# {
.annotate 'line', 2896
# var clspec: $P1
getattribute $P1, self, 'clspec'
.annotate 'line', 2899
set $S1, __ARG_2
ne $S1, '', __label_0
.annotate 'line', 2900
getattribute $P2, self, 'owner'
__ARG_2 = $P2.'tempreg'('P')
__label_0: # endif
.annotate 'line', 2901
__ARG_1.'print'('get_class ', __ARG_2, ', ')
.annotate 'line', 2902
getattribute $P2, self, 'owner'
$P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2903
__ARG_1.'say'()
# }
.annotate 'line', 2904

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2884
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2886
addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2912
# Body
# {
.annotate 'line', 2914
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2915
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2916

.end # OpUnaryExpr


.sub 'optimizearg' :method

.annotate 'line', 2917
# Body
# {
.annotate 'line', 2919
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2920

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2921
# Body
# {
.annotate 'line', 2923
self.'optimizearg'()
.annotate 'line', 2924
.return(self)
# }
.annotate 'line', 2925

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2909
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2911
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2934
# Body
# {
.annotate 'line', 2936
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2937
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2938
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2939

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2940
# Body
# {
.annotate 'line', 2942
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2943
.return(self)
# }
.annotate 'line', 2944

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2945
# Body
# {
.annotate 'line', 2947
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2948

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2949
# Body
# {
.annotate 'line', 2951
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2952
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2953

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2954
# Body
# {
.annotate 'line', 2956
self.'optimizearg'()
.annotate 'line', 2957
.return(self)
# }
.annotate 'line', 2958

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2959
# Body
# {
.annotate 'line', 2961
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2962
.return($S1)
# }
.annotate 'line', 2963

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2964
# Body
# {
.annotate 'line', 2966
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2967
.return($S1)
# }
.annotate 'line', 2968

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2930
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2932
addattribute $P0, 'lexpr'
.annotate 'line', 2933
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2975
# Body
# {
.annotate 'line', 2977
.return('I')
# }
.annotate 'line', 2978

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2979
# Body
# {
.annotate 'line', 2981
self.'optimizearg'()
.annotate 'line', 2982
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2983
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2984
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2985
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2986
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2987
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
$P5 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P3, $P4, $P5)
# }
__label_0: # endif
.annotate 'line', 2989
.return(self)
# }
.annotate 'line', 2990

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2973
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method

.annotate 'line', 2997
# Body
# {
.annotate 'line', 2999
.return('I')
# }
.annotate 'line', 3000

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3001
# Body
# {
.annotate 'line', 3003
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3004
.return(self)
# }
.annotate 'line', 3005

.end # set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 2995
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3011
# Body
# {
.annotate 'line', 3013
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3014
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_2
$P2 = $P1.'checkresult'()
set $S1, $P2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 3015
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 3016
self.'annotate'(__ARG_1)
.annotate 'line', 3017
__ARG_1.'print'('delete ')
.annotate 'line', 3018
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3019
__ARG_1.'say'()
.annotate 'line', 3020
set $S1, __ARG_2
eq $S1, '', __label_3
.annotate 'line', 3021
__ARG_1.'emitset'(__ARG_2, '1')
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3024
getattribute $P2, self, 'start'
'SyntaxError'("delete with invalid operator", $P2)
__label_1: # endif
# }
.annotate 'line', 3025

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3009
get_class $P1, [ 'OpDelExBase' ]
addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3030
# Body
# {
.annotate 'line', 3032
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3033
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
.annotate 'line', 3034
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_5
$P2 = $P1.'checkresult'()
set $S2, $P2
isne $I1, $S2, 'S'
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3035
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 3036
self.'annotate'(__ARG_1)
.annotate 'line', 3037
__ARG_1.'print'('exists ', $S1, ', ')
.annotate 'line', 3038
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3039
__ARG_1.'say'()
# }
goto __label_4
__label_3: # else
.annotate 'line', 3042
getattribute $P2, self, 'start'
'SyntaxError'("exists with invalid operator", $P2)
__label_4: # endif
# }
.annotate 'line', 3043

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3044
# Body
# {
.annotate 'line', 3046
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3047
# string reg: $S1
$P2 = self.'tempreg'('I')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3048
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_3
$P2 = $P1.'checkresult'()
set $S2, $P2
isne $I1, $S2, 'S'
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 3049
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 3050
self.'annotate'(__ARG_1)
.annotate 'line', 3051
__ARG_1.'print'('exists ', $S1, ', ')
.annotate 'line', 3052
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 3053
__ARG_1.'say'()
.annotate 'line', 3054
.return($S1)
# }
goto __label_2
__label_1: # else
.annotate 'line', 3057
getattribute $P2, self, 'start'
'SyntaxError'("exists with invalid operator", $P2)
__label_2: # endif
# }
.annotate 'line', 3058

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3028
get_class $P1, [ 'OpDelExBase' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3065
# Body
# {
.annotate 'line', 3067
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3068

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3069
# Body
# {
.annotate 'line', 3071
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3072
.return(self)
# }
.annotate 'line', 3073

.end # set


.sub 'optimize' :method

.annotate 'line', 3074
# Body
# {
.annotate 'line', 3076
self.'optimizearg'()
.annotate 'line', 3077
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3078
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3079
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3080
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 3083
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isfloatliteral'()
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 3084
# var numval: $P2
getattribute $P5, self, 'subexpr'
getattribute $P2, $P5, 'numval'
.annotate 'line', 3085
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 3086
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P3, $P5, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 3089
.return(self)
# }
.annotate 'line', 3090

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3091
# Body
# {
.annotate 'line', 3093
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3094
self.'annotate'(__ARG_1)
.annotate 'line', 3095
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 3096

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3063
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3103
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 3104
# Body
# {
.annotate 'line', 3106
.return('I')
# }
.annotate 'line', 3107

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3108
# Body
# {
.annotate 'line', 3110
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3111
.return(self)
# }
.annotate 'line', 3112

.end # set


.sub 'optimize' :method

.annotate 'line', 3113
# Body
# {
.annotate 'line', 3115
self.'optimizearg'()
.annotate 'line', 3116
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 3117
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 3118
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 3119
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 3120
getattribute $P3, self, 'owner'
getattribute $P4, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P4, $I2)
# }
__label_0: # endif
.annotate 'line', 3122
$P3 = $P1.'isnegable'()
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 3123
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 3124
.return(self)
# }
.annotate 'line', 3125

.end # optimize


.sub 'negated' :method

.annotate 'line', 3126
# Body
# {
.annotate 'line', 3128
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 3129

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3130
# Body
# {
.annotate 'line', 3132
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3133
self.'annotate'(__ARG_1)
.annotate 'line', 3134
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3135
set $S3, $S2
set $S4, 'I'
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 3137
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 3140
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 3143
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 3145

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3101
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3152
# Body
# {
.annotate 'line', 3154
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3155

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3156
# Body
# {
.annotate 'line', 3158
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3159
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3160
.return(self)
# }
.annotate 'line', 3161

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3162
# Body
# {
.annotate 'line', 3164
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3165
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3166
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3167

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3168
# Body
# {
.annotate 'line', 3170
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3171
self.'annotate'(__ARG_1)
.annotate 'line', 3172
__ARG_1.'emitinc'($S1)
.annotate 'line', 3173
.return($S1)
# }
.annotate 'line', 3174

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3150
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3181
# Body
# {
.annotate 'line', 3183
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3184
.return(self)
# }
.annotate 'line', 3185

.end # set


.sub 'checkresult' :method

.annotate 'line', 3186
# Body
# {
.annotate 'line', 3188
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3189

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3190
# Body
# {
.annotate 'line', 3192
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3193
self.'annotate'(__ARG_1)
.annotate 'line', 3194
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3195
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3196
__ARG_1.'emitinc'($S1)
.annotate 'line', 3197
.return($S1)
# }
.annotate 'line', 3198

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3179
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3205
# Body
# {
.annotate 'line', 3207
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3208

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3212
.return(self)
# }
.annotate 'line', 3213

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3214
# Body
# {
.annotate 'line', 3216
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3217
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3218
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3219

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3220
# Body
# {
.annotate 'line', 3222
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3223
self.'annotate'(__ARG_1)
.annotate 'line', 3224
__ARG_1.'emitdec'($S1)
.annotate 'line', 3225
.return($S1)
# }
.annotate 'line', 3226

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3203
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3236
.return(self)
# }
.annotate 'line', 3237

.end # set


.sub 'checkresult' :method

.annotate 'line', 3238
# Body
# {
.annotate 'line', 3240
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3241

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3242
# Body
# {
.annotate 'line', 3244
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3245
self.'annotate'(__ARG_1)
.annotate 'line', 3246
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3247
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3248
__ARG_1.'emitdec'($S1)
.annotate 'line', 3249
.return($S1)
# }
.annotate 'line', 3250

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3231
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3259
# Body
# {
.annotate 'line', 3261
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3262
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3263
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3264
.return(self)
# }
.annotate 'line', 3265

.end # set


.sub 'checkresult' :method

.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
getattribute $P1, self, 'lexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3269

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 3273
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 3274
.return(self)
# }
.annotate 'line', 3275

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3276
# Body
# {
.annotate 'line', 3278
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3279

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3280
# Body
# {
.annotate 'line', 3282
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3283
set $S2, __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 3284
self.'annotate'(__ARG_1)
.annotate 'line', 3285
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3287

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3255
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3257
addattribute $P0, 'lexpr'
.annotate 'line', 3258
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3294
# Body
# {
.annotate 'line', 3296
self.'annotate'(__ARG_1)
.annotate 'line', 3297
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3298
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3299

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3292
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3306
# Body
# {
.annotate 'line', 3308
self.'annotate'(__ARG_1)
.annotate 'line', 3309
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3310
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3311
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3312

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3313
# Body
# {
.annotate 'line', 3315
self.'annotate'(__ARG_1)
.annotate 'line', 3316
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3317
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3318
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3319
.return($S1)
# }
.annotate 'line', 3320

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3304
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3327
# Body
# {
.annotate 'line', 3329
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3330
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3331
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3332
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3333
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3334
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
isa $I1, $P2, 'ConcatString'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 3335
$P2.'emit_concat_to'(__ARG_1, $S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3337
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_6
set $S4, $P3
__label_6:
.annotate 'line', 3338
# string aux: $S5
null $S5
.annotate 'line', 3339
self.'annotate'(__ARG_1)
.annotate 'line', 3340
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
.annotate 'line', 3342
eq $S2, 'S', __label_12
# {
.annotate 'line', 3343
$P3 = self.'tempreg'('S')
set $S5, $P3
.annotate 'line', 3344
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3345
set $S4, $S5
# }
__label_12: # endif
.annotate 'line', 3347
__ARG_1.'emitconcat1'($S3, $S4)
goto __label_7 # break
__label_10: # case
__label_11: # case
.annotate 'line', 3351
eq $S1, $S2, __label_13
# {
.annotate 'line', 3352
$P3 = self.'tempreg'($S1)
set $S5, $P3
.annotate 'line', 3353
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3354
set $S4, $S5
# }
__label_13: # endif
.annotate 'line', 3356
__ARG_1.'emitaddto'($S3, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 3359
__ARG_1.'emitaddto'($S3, $S4)
__label_7: # switch end
# }
__label_4: # endif
.annotate 'line', 3362
.return($S3)
# }
.annotate 'line', 3363

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3325
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3370
# Body
# {
.annotate 'line', 3372
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3373
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3374
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3375
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3376
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3377
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3378
# string aux: $S5
null $S5
.annotate 'line', 3379
self.'annotate'(__ARG_1)
.annotate 'line', 3380
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
.annotate 'line', 3382
getattribute $P3, self, 'start'
'InternalError'('-= to string must not happen', $P3)
__label_7: # case
__label_8: # case
.annotate 'line', 3385
eq $S1, $S2, __label_9
# {
.annotate 'line', 3386
$P4 = self.'tempreg'($S1)
set $S5, $P4
.annotate 'line', 3387
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3388
set $S4, $S5
# }
__label_9: # endif
.annotate 'line', 3390
__ARG_1.'emitsubto'($S3, $S4)
goto __label_4 # break
__label_5: # default
.annotate 'line', 3393
__ARG_1.'emitsubto'($S3, $S4)
__label_4: # switch end
.annotate 'line', 3395
.return($S3)
# }
.annotate 'line', 3396

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3368
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3403
# Body
# {
.annotate 'line', 3405
# string ltype: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3406
# string rtype: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3407
# string lreg: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3408
# string rreg: $S4
null $S4
.annotate 'line', 3409
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 3411
ne $S2, 'I', __label_6
.annotate 'line', 3412
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
goto __label_7
__label_6: # else
# {
.annotate 'line', 3414
$P3 = self.'tempreg'('I')
set $S4, $P3
.annotate 'line', 3415
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S4)
# }
__label_7: # endif
.annotate 'line', 3417
self.'annotate'(__ARG_1)
.annotate 'line', 3418
__ARG_1.'say'('repeat ', $S3, ', ', $S3, ', ', $S4)
goto __label_3 # break
__label_4: # default
.annotate 'line', 3421
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
.annotate 'line', 3422
self.'annotate'(__ARG_1)
.annotate 'line', 3423
__ARG_1.'say'('mul ', $S3, ', ', $S4)
__label_3: # switch end
.annotate 'line', 3425
.return($S3)
# }
.annotate 'line', 3426

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3401
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3433
# Body
# {
.annotate 'line', 3435
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3436
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3437
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3438
self.'annotate'(__ARG_1)
.annotate 'line', 3439
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3440
.return($S2)
# }
.annotate 'line', 3441

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3431
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3448
# Body
# {
.annotate 'line', 3450
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3451
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3452
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3453
self.'annotate'(__ARG_1)
.annotate 'line', 3454
__ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3455
.return($S2)
# }
.annotate 'line', 3456

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3446
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3463
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3464
# Body
# {
.annotate 'line', 3466
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3467
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3468
# string regl: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3469
# string regr: $S4
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_3
set $S4, $P1
__label_3:
.annotate 'line', 3470
self.'annotate'(__ARG_1)
.annotate 'line', 3471
# string aux: $S5
null $S5
.annotate 'line', 3472
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3474
ne $S1, 'I', __label_7
# {
.annotate 'line', 3475
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3476
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3477
set $S3, $S5
# }
__label_7: # endif
.annotate 'line', 3479
ne $S2, 'I', __label_8
# {
.annotate 'line', 3480
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3481
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3482
set $S4, $S5
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3485
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3486
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3487
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3488
set $S3, $S5
# }
goto __label_10
__label_9: # else
.annotate 'line', 3490
iseq $I1, $S2, 'P'
unless $I1 goto __label_14
iseq $I1, $S1, 'I'
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3491
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3492
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3493
set $S4, $S5
# }
goto __label_13
__label_12: # else
.annotate 'line', 3495
iseq $I1, $S2, 'S'
unless $I1 goto __label_17
iseq $I1, $S1, 'P'
__label_17:
unless $I1 goto __label_15
# {
.annotate 'line', 3496
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3497
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3498
set $S3, $S5
# }
goto __label_16
__label_15: # else
.annotate 'line', 3500
iseq $I1, $S2, 'P'
unless $I1 goto __label_19
iseq $I1, $S1, 'S'
__label_19:
unless $I1 goto __label_18
# {
.annotate 'line', 3501
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3502
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3503
set $S4, $S5
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 3506
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
.annotate 'line', 3508
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3511
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3514
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3515
# }
.annotate 'line', 3517

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3518
# Body
# {
.annotate 'line', 3520
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3521

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3522
# Body
# {
.annotate 'line', 3524
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3525

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3529

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3461
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3542
# Body
# {
.annotate 'line', 3544
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'Expr'($P1, $P2)
.annotate 'line', 3545
setattribute self, 'expr', __ARG_2
.annotate 'line', 3546
box $P1, __ARG_3
setattribute self, 'checknull', $P1
# }
.annotate 'line', 3547

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3548
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3549
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3550
# Body
# {
.annotate 'line', 3552
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
.annotate 'line', 3553
box $P1, $I1
setattribute self, 'checknull', $P1
.annotate 'line', 3554
.return(self)
# }
.annotate 'line', 3555

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3556
# Body
# {
.annotate 'line', 3558
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3559
self.'annotate'(__ARG_1)
.annotate 'line', 3560
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3561
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3562
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3563

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3564
# Body
# {
.annotate 'line', 3566
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3567
self.'annotate'(__ARG_1)
.annotate 'line', 3568
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
.annotate 'line', 3569

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3537
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3539
addattribute $P0, 'expr'
.annotate 'line', 3540
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3576
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3577
# Body
# {
.annotate 'line', 3579
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3580

.end # negated


.sub 'optimize' :method

.annotate 'line', 3581
# Body
# {
.annotate 'line', 3583
self.'optimizearg'()
.annotate 'line', 3584
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3585
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3586
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3587
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3588
unless $I1 goto __label_0
# {
.annotate 'line', 3589
unless $I2 goto __label_1
.annotate 'line', 3590
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3592
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3594
unless $I2 goto __label_3
.annotate 'line', 3595
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3596
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3597
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3598
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3599
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3600
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3601
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3602
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
iseq $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3605
.return(self)
# }
.annotate 'line', 3606

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3607
# Body
# {
.annotate 'line', 3609
__ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3610

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3611
# Body
# {
.annotate 'line', 3613
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3614

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3615
# Body
# {
.annotate 'line', 3617
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3618

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3619
# Body
# {
.annotate 'line', 3621
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3622

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3574
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3629
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3633

.end # negated


.sub 'optimize' :method

.annotate 'line', 3634
# Body
# {
.annotate 'line', 3636
self.'optimizearg'()
.annotate 'line', 3637
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3638
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3639
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3640
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3641
unless $I1 goto __label_0
# {
.annotate 'line', 3642
unless $I2 goto __label_1
.annotate 'line', 3643
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3645
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3647
unless $I2 goto __label_3
.annotate 'line', 3648
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3649
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3650
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3651
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3652
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3653
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3654
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3655
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
isne $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3658
.return(self)
# }
.annotate 'line', 3659

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3660
# Body
# {
.annotate 'line', 3662
__ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3663

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3664
# Body
# {
.annotate 'line', 3666
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3667

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3668
# Body
# {
.annotate 'line', 3670
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3671

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3672
# Body
# {
.annotate 'line', 3674
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3675

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3627
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

.annotate 'line', 3683
# Body
# {
.annotate 'line', 3685
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3686
box $P1, __ARG_1
setattribute self, 'positive', $P1
# }
.annotate 'line', 3687

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3688
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3689
# Body
# {
.annotate 'line', 3691
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3692
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
.annotate 'line', 3693

.end # negated


.sub 'emitop' :method
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
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3698
__ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3699

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3700
# Body
# {
.annotate 'line', 3702
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3703

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3704
# Body
# {
.annotate 'line', 3706
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3707
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3708
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3709

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3710
# Body
# {
.annotate 'line', 3712
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3713
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3714
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3715

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3680
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3682
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3722
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3723
# Body
# {
.annotate 'line', 3725
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3726

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3727
# Body
# {
.annotate 'line', 3729
__ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3730

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3731
# Body
# {
.annotate 'line', 3733
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3734

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3735
# Body
# {
.annotate 'line', 3737
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3738

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3720
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3745
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3746
# Body
# {
.annotate 'line', 3748
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3749

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3750
# Body
# {
.annotate 'line', 3752
__ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3753

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3754
# Body
# {
.annotate 'line', 3756
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3757

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3758
# Body
# {
.annotate 'line', 3760
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3761

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3743
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3768
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3769
# Body
# {
.annotate 'line', 3771
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3772

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3773
# Body
# {
.annotate 'line', 3775
__ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3776

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3777
# Body
# {
.annotate 'line', 3779
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3780

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3781
# Body
# {
.annotate 'line', 3783
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3784

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3766
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3791
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3792
# Body
# {
.annotate 'line', 3794
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3795

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3796
# Body
# {
.annotate 'line', 3798
__ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3799

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3800
# Body
# {
.annotate 'line', 3802
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3803

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3804
# Body
# {
.annotate 'line', 3806
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3807

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3789
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3814
# Body
# {
.annotate 'line', 3816
.return('I')
# }
.annotate 'line', 3817

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3812
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3824
# Body
# {
.annotate 'line', 3826
self.'optimizearg'()
.annotate 'line', 3827
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3828
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3829
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3830
eq $I1, 0, __label_1
.annotate 'line', 3831
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3833
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3835
.return(self)
# }
.annotate 'line', 3836

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3837
# Body
# {
.annotate 'line', 3839
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
.annotate 'line', 3840
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3841
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3842
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 3843
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3846
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_8
set $S4, $P1
__label_8:
.annotate 'line', 3847
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3848
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3849
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3850
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3852

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3822
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3859
# Body
# {
.annotate 'line', 3861
self.'optimizearg'()
.annotate 'line', 3862
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3863
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3864
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3865
ne $I1, 0, __label_1
.annotate 'line', 3866
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3868
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3870
.return(self)
# }
.annotate 'line', 3871

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3872
# Body
# {
.annotate 'line', 3874
# string res: $S1
null $S1
.annotate 'line', 3875
if_null __ARG_2, __label_0
.annotate 'line', 3876
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3878
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3879
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3880
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3881
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_6
set $S3, $P1
__label_6:
.annotate 'line', 3882
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3885
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_7
set $S4, $P1
__label_7:
.annotate 'line', 3886
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3887
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3888
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3889
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3891

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3857
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3896
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3904
# Body
# {
.annotate 'line', 3906
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
.annotate 'line', 3907
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3908
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3909
self.'annotate'(__ARG_1)
.annotate 'line', 3910
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3911

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3912
# Body
# {
.annotate 'line', 3914
band $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3915

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3902
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3922
# Body
# {
.annotate 'line', 3924
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
.annotate 'line', 3925
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3926
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3927
self.'annotate'(__ARG_1)
.annotate 'line', 3928
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3929

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3930
# Body
# {
.annotate 'line', 3932
bor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3933

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3920
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3940
# Body
# {
.annotate 'line', 3942
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
.annotate 'line', 3943
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3944
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3945
self.'annotate'(__ARG_1)
.annotate 'line', 3946
__ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3947

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3948
# Body
# {
.annotate 'line', 3950
bxor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3951

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3938
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3959
# Body
# {
.annotate 'line', 3961
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3962
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3963
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3964
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3965
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3967
getattribute $P3, self, 'values'
# predefined push
push $P3, __ARG_4
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3969
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_4
# {
.annotate 'line', 3970
getattribute $P2, __ARG_4, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3971
getattribute $P1, self, 'values'
$P1.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3974
root_new $P2, ['parrot';'ResizablePMCArray']
push $P2, __ARG_3
push $P2, __ARG_4
setattribute self, 'values', $P2
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3975

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3976
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3977
# Body
# {
.annotate 'line', 3979
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3980
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3981
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3982
# int i: $I2
null $I2
# for loop
.annotate 'line', 3983
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3984
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3983
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3985
.return($P2)
# }
.annotate 'line', 3986

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3987
# Body
# {
.annotate 'line', 3989
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3990
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3991
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3992
self.'annotate'(__ARG_1)
.annotate 'line', 3993
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3994
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3995
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3994
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3996
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3997

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3998
# Body
# {
.annotate 'line', 4000
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4001
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 4002
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4003
self.'annotate'(__ARG_1)
.annotate 'line', 4004
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4005
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 4006
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_1: # for iteration
.annotate 'line', 4005
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4007
.return($S1)
# }
.annotate 'line', 4008

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4009
# Body
# {
.annotate 'line', 4011
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4012
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 4013
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4014
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 4015
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 4014
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4016

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4017
# Body
# {
.annotate 'line', 4019
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4020
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 4021
self.'annotate'(__ARG_1)
.annotate 'line', 4022
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4023
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 4024
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 4023
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4025

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3956
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3958
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 4032
# Body
# {
.annotate 'line', 4034
self.'optimizearg'()
.annotate 'line', 4035
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4036
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4037
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 4038
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 4039
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 4040
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 4041
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 4042
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 4043
# var t: $P5
null $P5
.annotate 'line', 4044
# string es: $S3
getattribute $P10, $P3, 'str'
null $S3
if_null $P10, __label_6
set $S3, $P10
__label_6:
.annotate 'line', 4045
# string rs: $S4
getattribute $P10, $P4, 'str'
null $S4
if_null $P10, __label_7
set $S4, $P10
__label_7:
.annotate 'line', 4046
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 4047
new $P10, [ 'TokenSingleQuoted' ]
getattribute $P11, $P3, 'file'
getattribute $P12, $P3, 'line'
concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
set $P5, $P10
goto __label_9
__label_8: # else
.annotate 'line', 4049
new $P13, [ 'TokenQuoted' ]
getattribute $P14, $P3, 'file'
getattribute $P15, $P3, 'line'
concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
set $P5, $P13
__label_9: # endif
.annotate 'line', 4050
new $P11, [ 'StringLiteral' ]
getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
set $P10, $P11
.return($P10)
# }
__label_4: # endif
.annotate 'line', 4052
iseq $I3, $S1, 'I'
unless $I3 goto __label_12
iseq $I3, $S2, 'I'
__label_12:
unless $I3 goto __label_11
# {
.annotate 'line', 4053
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 4054
# int ln: $I1
set $P10, $P6
set $I1, $P10
.annotate 'line', 4055
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 4056
# int rn: $I2
set $P10, $P7
set $I2, $P10
.annotate 'line', 4057
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $I3, $I1, $I2
.tailcall 'integerValue'($P10, $P11, $I3)
# }
__label_11: # endif
# {
.annotate 'line', 4060
$P10 = 'floatresult'($S1, $S2)
if_null $P10, __label_13
unless $P10 goto __label_13
# {
.annotate 'line', 4061
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 4062
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 4063
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 4064
# float rf: $N2
# predefined string
set $S5, $P9
set $N2, $S5
.annotate 'line', 4065
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 4069
iseq $I3, $S1, 'S'
unless $I3 goto __label_15
iseq $I3, $S2, 'S'
__label_15:
unless $I3 goto __label_14
# {
.annotate 'line', 4070
new $P11, [ 'ConcatString' ]
getattribute $P12, self, 'owner'
getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
set $P10, $P11
.return($P10)
# }
__label_14: # endif
.annotate 'line', 4072
.return(self)
# }
.annotate 'line', 4073

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4074
# Body
# {
.annotate 'line', 4076
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4077
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4078
ne $S1, $S2, __label_2
.annotate 'line', 4079
.return($S1)
__label_2: # endif
.annotate 'line', 4080
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4081
.return('S')
__label_3: # endif
.annotate 'line', 4082
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4083
.return('S')
__label_5: # endif
.annotate 'line', 4084
$P1 = 'floatresult'($S1, $S2)
if_null $P1, __label_7
unless $P1 goto __label_7
.annotate 'line', 4085
.return('N')
__label_7: # endif
.annotate 'line', 4086
.return('I')
# }
.annotate 'line', 4087

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4088
# Body
# {
.annotate 'line', 4090
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4091
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4092
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4093
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4094
# string rtype: $S3
$P3 = $P2.'checkresult'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4096
# string rleft: $S4
$P3 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 4097
# string rright: $S5
$P3 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_4
set $S5, $P3
__label_4:
.annotate 'line', 4098
ne $S1, 'S', __label_5
# {
.annotate 'line', 4099
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 4100
# string aux: $S6
$P3 = self.'tempreg'('S')
null $S6
if_null $P3, __label_9
set $S6, $P3
__label_9:
.annotate 'line', 4101
eq $S2, 'S', __label_10
# {
.annotate 'line', 4102
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4103
set $S4, $S6
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 4106
__ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4107
set $S5, $S6
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 4110
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4113
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 4114
# string l: $S7
null $S7
.annotate 'line', 4115
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 4117
$P3 = self.'tempreg'('I')
set $S7, $P3
.annotate 'line', 4118
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 4120
# string r: $S8
null $S8
.annotate 'line', 4121
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 4123
$P3 = self.'tempreg'('I')
set $S8, $P3
.annotate 'line', 4124
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 4126
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 4129
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 4131

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4030
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 4138
# Body
# {
.annotate 'line', 4140
self.'optimizearg'()
.annotate 'line', 4141
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4142
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4143
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4144
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4145
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4146
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4147
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4148
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4149
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4150
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4151
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
sub $I3, $I1, $I2
.tailcall 'integerValue'($P5, $P6, $I3)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4154
.return(self)
# }
.annotate 'line', 4155

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4156
# Body
# {
.annotate 'line', 4158
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4159
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4160
ne $S1, $S2, __label_2
.annotate 'line', 4161
.return($S1)
__label_2: # endif
.annotate 'line', 4162
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4163
.return('N')
__label_3: # endif
.annotate 'line', 4164
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4165
.return('N')
__label_5: # endif
.annotate 'line', 4166
.return('I')
# }
.annotate 'line', 4167

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4168
# Body
# {
.annotate 'line', 4170
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4171
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4172
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 4173

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4136
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 4180
# Body
# {
.annotate 'line', 4182
self.'optimizearg'()
.annotate 'line', 4183
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4184
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4185
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4186
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4187
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 4188
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4189
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4190
# int ln: $I1
set $P7, $P3
set $I1, $P7
.annotate 'line', 4191
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4192
# int rn: $I2
set $P7, $P4
set $I2, $P7
.annotate 'line', 4193
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $I3, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I3)
# }
__label_4: # endif
# {
.annotate 'line', 4196
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4197
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 4198
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 4199
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 4200
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 4201
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P7, $P8, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4205
.return(self)
# }
.annotate 'line', 4206

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4207
# Body
# {
.annotate 'line', 4209
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4210
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4211
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4212
ne $S1, $S2, __label_2
.annotate 'line', 4213
.return($S1)
__label_2: # endif
.annotate 'line', 4214
ne $S1, 'S', __label_3
.annotate 'line', 4215
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 4217
.return('N')
__label_4: # endif
# }
.annotate 'line', 4218

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4219
# Body
# {
.annotate 'line', 4221
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4222
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4223
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4224
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4225
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 4226
ne $S1, 'S', __label_2
# {
.annotate 'line', 4227
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4228
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4229
# string rval: $S5
null $S5
.annotate 'line', 4230
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 4232
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 4235
$P3 = self.'tempreg'('I')
set $S5, $P3
.annotate 'line', 4236
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 4238
self.'annotate'(__ARG_1)
.annotate 'line', 4239
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4240
.return()
# }
__label_2: # endif
.annotate 'line', 4242
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
.annotate 'line', 4243
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4244
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4245
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4246
.return()
# }
__label_6: # endif
.annotate 'line', 4251
ne $S1, 'N', __label_10
# {
.annotate 'line', 4252
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4253
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4254
# string rval: $S6
null $S6
.annotate 'line', 4255
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 4257
$P3 = self.'tempreg'('N')
set $S6, $P3
.annotate 'line', 4258
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4259
set $S6, $S4
goto __label_11 # break
__label_14: # case
.annotate 'line', 4262
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 4265
$P4 = self.'tempreg'('N')
set $S6, $P4
.annotate 'line', 4266
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 4268
set $S7, __ARG_2
eq $S7, '', __label_15
# {
.annotate 'line', 4269
self.'annotate'(__ARG_1)
.annotate 'line', 4270
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
__label_15: # endif
.annotate 'line', 4272
.return()
# }
__label_10: # endif
.annotate 'line', 4275
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 4276
$P3 = $P1.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_18
$I3 = $P1.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 4277
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S3, $P4
.annotate 'line', 4278
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4281
$P3 = $P1.'getIntegerValue'()
set $I1, $P3
.annotate 'line', 4282
set $S3, $I1
# }
__label_17: # endif
.annotate 'line', 4284
$P3 = $P2.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_21
$I3 = $P2.'isidentifier'()
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 4285
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S4, $P4
.annotate 'line', 4286
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 4289
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
.annotate 'line', 4291
$P4 = self.'checkresult'()
$P3 = self.'tempreg'($P4)
set $S4, $P3
.annotate 'line', 4292
$P2.'emit'(__ARG_1, $S4)
goto __label_22 # break
__label_25: # case
.annotate 'line', 4295
$P5 = $P2.'emit_get'(__ARG_1)
set $S4, $P5
goto __label_22 # break
__label_26: # case
__label_23: # default
.annotate 'line', 4299
$P6 = $P2.'getIntegerValue'()
set $I2, $P6
.annotate 'line', 4300
set $S4, $I2
goto __label_22 # break
__label_22: # switch end
.annotate 'line', 4301
# }
__label_20: # endif
.annotate 'line', 4304
self.'annotate'(__ARG_1)
.annotate 'line', 4305
set $S7, __ARG_2
ne $S7, '', __label_27
.annotate 'line', 4306
$P3 = self.'checkresult'()
__ARG_2 = self.'tempreg'($P3)
__label_27: # endif
.annotate 'line', 4307
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4308

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4178
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4315
# Body
# {
.annotate 'line', 4317
self.'optimizearg'()
.annotate 'line', 4318
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4319
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4320
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4321
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4322
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4323
# var lval: $P3
null $P3
.annotate 'line', 4324
# var rval: $P4
null $P4
.annotate 'line', 4325
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4326
getattribute $P3, $P1, 'numval'
.annotate 'line', 4327
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4328
getattribute $P4, $P2, 'numval'
.annotate 'line', 4329
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4330
eq $I2, 0, __label_6
.annotate 'line', 4331
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
.annotate 'line', 4334
$P5 = 'floatresult'($S1, $S2)
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4335
getattribute $P3, $P1, 'numval'
.annotate 'line', 4336
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4337
getattribute $P4, $P2, 'numval'
.annotate 'line', 4338
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
.annotate 'line', 4339
set $N3, 0
eq $N2, $N3, __label_8
.annotate 'line', 4340
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
.annotate 'line', 4344
.return(self)
# }
.annotate 'line', 4345

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4346
# Body
# {
.annotate 'line', 4348
.return('N')
# }
.annotate 'line', 4349

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4350
# Body
# {
.annotate 'line', 4352
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4353
# var aux: $P2
null $P2
.annotate 'line', 4354
# var lreg: $P3
$P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4355
$P6 = $P1.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_0
# {
.annotate 'line', 4356
$P2 = self.'tempreg'('N')
.annotate 'line', 4357
__ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4358
set $P3, $P2
# }
__label_0: # endif
.annotate 'line', 4360
# var rexpr: $P4
getattribute $P4, self, 'rexpr'
.annotate 'line', 4361
# var rreg: $P5
$P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4362
$P6 = $P4.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_1
# {
.annotate 'line', 4363
$P2 = self.'tempreg'('N')
.annotate 'line', 4364
__ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4365
set $P5, $P2
# }
__label_1: # endif
.annotate 'line', 4367
self.'annotate'(__ARG_1)
.annotate 'line', 4368
__ARG_1.'say'('div ', __ARG_2, ', ', $P3, ', ', $P5)
# }
.annotate 'line', 4369

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4313
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4376
# Body
# {
.annotate 'line', 4378
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4379
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4380
self.'annotate'(__ARG_1)
.annotate 'line', 4381
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4382

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4383
# Body
# {
.annotate 'line', 4385
mod $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4386

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4374
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4393
# Body
# {
.annotate 'line', 4395
.return('I')
# }
.annotate 'line', 4396

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4397
# Body
# {
.annotate 'line', 4399
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4400
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4401
self.'annotate'(__ARG_1)
.annotate 'line', 4406
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4407

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4391
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4414
# Body
# {
.annotate 'line', 4416
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
.annotate 'line', 4417
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4418
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4419
self.'annotate'(__ARG_1)
.annotate 'line', 4420
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4421

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4422
# Body
# {
.annotate 'line', 4424
shl $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4425

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4412
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4432
# Body
# {
.annotate 'line', 4434
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
.annotate 'line', 4435
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4436
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4437
self.'annotate'(__ARG_1)
.annotate 'line', 4438
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4439

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4440
# Body
# {
.annotate 'line', 4442
shr $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4443

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4430
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4452
# Body
# {
.annotate 'line', 4454
setattribute self, 'arg', __ARG_1
.annotate 'line', 4455
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4456

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4457
# Body
# {
.annotate 'line', 4459
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4460
.return(self)
# }
.annotate 'line', 4461

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4462
# Body
# {
.annotate 'line', 4464
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4465

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4450
addattribute $P0, 'arg'
.annotate 'line', 4451
addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 4475
# Body
# {
.annotate 'line', 4477
setattribute self, 'owner', __ARG_1
.annotate 'line', 4478
setattribute self, 'start', __ARG_2
.annotate 'line', 4479
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4480
# var t: $P2
$P2 = __ARG_3.'get'()
.annotate 'line', 4481
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4482
__ARG_3.'unget'($P2)
__label_1: # do
.annotate 'line', 4483
# {
.annotate 'line', 4484
# var modifier: $P3
null $P3
.annotate 'line', 4485
# var expr: $P4
$P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4486
$P2 = __ARG_3.'get'()
.annotate 'line', 4487
$P5 = $P2.'isop'(':')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4488
$P2 = __ARG_3.'get'()
.annotate 'line', 4489
$P5 = $P2.'isop'('[')
if_null $P5, __label_5
unless $P5 goto __label_5
# {
.annotate 'line', 4490
new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_3, __ARG_1)
set $P3, $P6
.annotate 'line', 4491
$P2 = __ARG_3.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4494
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4497
new $P6, [ 'Argument' ]
$P6.'Argument'($P4, $P3)
set $P5, $P6
# predefined push
push $P1, $P5
# }
__label_3: # continue
.annotate 'line', 4498
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4499
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_7
.annotate 'line', 4500
'SyntaxError'("Unfinished argument list", $P2)
__label_7: # endif
.annotate 'line', 4501
# predefined elements
elements $I1, $P1
le $I1, 0, __label_8
.annotate 'line', 4502
setattribute self, 'args', $P1
__label_8: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4504

.end # ArgumentList


.sub 'numargs' :method

.annotate 'line', 4505
# Body
# {
.annotate 'line', 4507
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4508
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.return($I1)
# }
.annotate 'line', 4509

.end # numargs


.sub 'getrawargs' :method

.annotate 'line', 4510
# Body
# {
.annotate 'line', 4512
getattribute $P1, self, 'args'
.return($P1)
# }
.annotate 'line', 4513

.end # getrawargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 4514
# Body
# {
.annotate 'line', 4516
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4517
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 4518

.end # getarg


.sub 'getfreearg' :method
.param int __ARG_1

.annotate 'line', 4519
# Body
# {
.annotate 'line', 4521
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4522
$P2 = $P1[__ARG_1]
getattribute $P3, $P2, 'arg'
.return($P3)
# }
.annotate 'line', 4523

.end # getfreearg


.sub 'optimize' :method

.annotate 'line', 4524
# Body
# {
.annotate 'line', 4526
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4527
if_null $P1, __label_0
.annotate 'line', 4528
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 4529
.return(self)
# }
.annotate 'line', 4530

.end # optimize


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 4531
# Body
# {
.annotate 'line', 4533
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4534
unless_null $P1, __label_0
# {
.annotate 'line', 4535
# string regs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4536
# string pnull: $S1
set $S1, ''
.annotate 'line', 4537
set $P1, $P2
.annotate 'line', 4538
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4539
# int nargs: $I1
# predefined elements
elements $I1, $P3
# for loop
.annotate 'line', 4540
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4541
# var a: $P4
$P5 = $P3[$I2]
getattribute $P4, $P5, 'arg'
.annotate 'line', 4542
# string reg: $S2
null $S2
.annotate 'line', 4543
$P5 = $P4.'isnull'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4545
ne $S1, '', __label_6
# {
.annotate 'line', 4546
getattribute $P7, self, 'owner'
$P6 = $P7.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4547
__ARG_1.'emitnull'($S1)
.annotate 'line', 4548
set $S2, $S1
# }
__label_6: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 4552
$P5 = $P4.'emit_get'(__ARG_1)
set $S2, $P5
__label_5: # endif
.annotate 'line', 4553
# predefined push
push $P1, $S2
# }
__label_1: # for iteration
.annotate 'line', 4540
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4555
setattribute self, 'argregs', $P1
# }
__label_0: # endif
.annotate 'line', 4557
.return($P1)
# }
.annotate 'line', 4558

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 4559
# Body
# {
.annotate 'line', 4561
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4562
# var argreg: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4564
# string sep: $S1
set $S1, ''
.annotate 'line', 4565
# int n: $I1
$P6 = self.'numargs'()
set $I1, $P6
# for loop
.annotate 'line', 4566
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4567
# string a: $S2
$S2 = $P2[$I2]
.annotate 'line', 4568
__ARG_1.'print'($S1, $S2)
.annotate 'line', 4569
# int isflat: $I3
null $I3
# int isnamed: $I4
null $I4
.annotate 'line', 4570
# string setname: $S3
set $S3, ''
.annotate 'line', 4571
# var modifiers: $P3
$P6 = $P1[$I2]
getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4572
if_null $P3, __label_3
# {
.annotate 'line', 4573
$P6 = $P3.'getlist'()
iter $P7, $P6
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4574
# string name: $S4
$P8 = $P4.'getname'()
null $S4
if_null $P8, __label_6
set $S4, $P8
__label_6:
.annotate 'line', 4575
ne $S4, 'flat', __label_7
.annotate 'line', 4576
set $I3, 1
__label_7: # endif
.annotate 'line', 4577
ne $S4, 'named', __label_8
# {
.annotate 'line', 4578
set $I4, 1
.annotate 'line', 4579
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
.annotate 'line', 4583
# var argmod: $P5
$P5 = $P4.'getarg'(0)
.annotate 'line', 4584
$P8 = $P5.'isstringliteral'()
isfalse $I7, $P8
unless $I7 goto __label_13
.annotate 'line', 4585
getattribute $P9, self, 'start'
'SyntaxError'('Invalid modifier', $P9)
__label_13: # endif
.annotate 'line', 4586
$P10 = $P5.'getPirString'()
set $S3, $P10
goto __label_9 # break
__label_10: # default
.annotate 'line', 4589
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
.annotate 'line', 4594
and $I5, $I3, $I4
unless $I5 goto __label_14
.annotate 'line', 4595
__ARG_1.'print'(' :flat :named')
goto __label_15
__label_14: # else
.annotate 'line', 4596
unless $I3 goto __label_16
.annotate 'line', 4597
__ARG_1.'print'(' :flat')
goto __label_17
__label_16: # else
.annotate 'line', 4598
unless $I4 goto __label_18
# {
.annotate 'line', 4599
__ARG_1.'print'(' :named')
.annotate 'line', 4600
eq $S3, '', __label_19
.annotate 'line', 4601
__ARG_1.'print'("(", $S3, ")")
__label_19: # endif
# }
__label_18: # endif
__label_17: # endif
__label_15: # endif
.annotate 'line', 4603
set $S1, ', '
# }
__label_0: # for iteration
.annotate 'line', 4566
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4605

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4470
addattribute $P0, 'owner'
.annotate 'line', 4471
addattribute $P0, 'start'
.annotate 'line', 4472
addattribute $P0, 'args'
.annotate 'line', 4473
addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4608
# Body
# {
.annotate 'line', 4610
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4611
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4612
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4613
.return(1)
# }
.annotate 'line', 4614

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4623
# Body
# {
.annotate 'line', 4625
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4626
setattribute self, 'predef', __ARG_3
.annotate 'line', 4627
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4628

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4629
# Body
# {
.annotate 'line', 4631
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4632

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4633
# Body
# {
.annotate 'line', 4635
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4636
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4637
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4638
# var arg: $P4
null $P4
.annotate 'line', 4639
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
.annotate 'line', 4640
# string pnull: $S1
set $S1, ''
.annotate 'line', 4641
set $I4, $I1
set $I5, -1
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4643
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4644
# string reg: $S2
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4646
ne $S2, 'null', __label_7
# {
.annotate 'line', 4647
ne $S1, '', __label_8
# {
.annotate 'line', 4648
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4649
__ARG_1.'emitnull'($S1)
# }
__label_8: # endif
.annotate 'line', 4651
set $S2, $S1
# }
__label_7: # endif
.annotate 'line', 4653
# predefined push
push $P3, $S2
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4657
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4658
iter $P9, $P2
set $P9, 0
__label_9: # for iteration
unless $P9 goto __label_10
shift $P4, $P9
.annotate 'line', 4659
getattribute $P8, $P4, 'arg'
# predefined push
push $P5, $P8
goto __label_9
__label_10: # endfor
.annotate 'line', 4660
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4661
.return()
__label_1: # default
.annotate 'line', 4663
# int n: $I2
getattribute $P12, self, 'args'
set $I2, $P12
# for loop
.annotate 'line', 4664
# int i: $I3
null $I3
__label_13: # for condition
ge $I3, $I2, __label_12
# {
.annotate 'line', 4665
$P13 = $P2[$I3]
getattribute $P4, $P13, 'arg'
.annotate 'line', 4666
# string argtype: $S3
$P6 = $P4.'checkresult'()
null $S3
if_null $P6, __label_14
set $S3, $P6
__label_14:
.annotate 'line', 4667
# string paramtype: $S4
$P6 = $P1.'paramtype'($I3)
null $S4
if_null $P6, __label_15
set $S4, $P6
__label_15:
.annotate 'line', 4668
# string argr: $S5
null $S5
.annotate 'line', 4669
$P6 = $P4.'isnull'()
if_null $P6, __label_16
unless $P6 goto __label_16
# {
.annotate 'line', 4670
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
.annotate 'line', 4674
$P8 = self.'tempreg'($S4)
set $S5, $P8
.annotate 'line', 4675
__ARG_1.'emitnull'($S5)
__label_19: # default
.annotate 'line', 4677
ne $S1, '', __label_23
# {
.annotate 'line', 4678
$P10 = self.'tempreg'('P')
set $S1, $P10
.annotate 'line', 4679
__ARG_1.'emitnull'($S1)
# }
__label_23: # endif
.annotate 'line', 4681
set $S5, $S1
__label_18: # switch end
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4685
iseq $I4, $S3, $S4
if $I4 goto __label_26
iseq $I4, $S4, '?'
__label_26:
unless $I4 goto __label_24
.annotate 'line', 4686
$P6 = $P4.'emit_get'(__ARG_1)
set $S5, $P6
goto __label_25
__label_24: # else
# {
.annotate 'line', 4688
# string aux: $S6
null $S6
.annotate 'line', 4689
$P6 = self.'tempreg'($S4)
set $S5, $P6
.annotate 'line', 4690
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
.annotate 'line', 4692
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
.annotate 'line', 4696
$P6 = $P4.'emit_get'(__ARG_1)
set $S6, $P6
.annotate 'line', 4697
__ARG_1.'emitbox'($S5, $S6)
goto __label_33 # break
__label_34: # default
.annotate 'line', 4700
$P4.'emit'(__ARG_1, $S5)
__label_33: # switch end
goto __label_27 # break
__label_30: # case
__label_31: # case
__label_32: # case
.annotate 'line', 4706
$P8 = $P4.'emit_get'(__ARG_1)
set $S6, $P8
.annotate 'line', 4707
__ARG_1.'emitset'($S5, $S6)
goto __label_27 # break
__label_28: # default
.annotate 'line', 4710
$P4.'emit'(__ARG_1, $S5)
__label_27: # switch end
# }
__label_25: # endif
# }
__label_17: # endif
.annotate 'line', 4714
# predefined push
push $P3, $S5
# }
__label_11: # for iteration
.annotate 'line', 4664
inc $I3
goto __label_13
__label_12: # for end
__label_0: # switch end
.annotate 'line', 4717
getattribute $P6, self, 'predef'
getattribute $P8, self, 'start'
$P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4718

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4618
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4620
addattribute $P0, 'predef'
.annotate 'line', 4621
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4728
# Body
# {
.annotate 'line', 4730
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4731
setattribute self, 'funref', __ARG_4
.annotate 'line', 4732
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4733
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 4734
__ARG_1.'unget'($P1)
.annotate 'line', 4735
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
set $P3, $P4
setattribute self, 'args', $P3
# }
__label_0: # endif
# }
.annotate 'line', 4737

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4738
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4739
# Body
# {
.annotate 'line', 4741
# var funref: $P1
getattribute $P6, self, 'funref'
$P1 = $P6.'optimize'()
.annotate 'line', 4742
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4743
# int nargs: $I1
null $I1
.annotate 'line', 4744
if_null $P2, __label_0
# {
.annotate 'line', 4745
$P2 = $P2.'optimize'()
.annotate 'line', 4746
$P6 = $P2.'numargs'()
set $I1, $P6
# }
__label_0: # endif
.annotate 'line', 4749
isa $I2, $P1, 'MemberExpr'
unless $I2 goto __label_1
.annotate 'line', 4750
new $P7, [ 'CallMemberExpr' ]
$P7.'CallMemberExpr'(self, $P1, $P2)
set $P6, $P7
.return($P6)
__label_1: # endif
.annotate 'line', 4751
isa $I2, $P1, 'MemberRefExpr'
unless $I2 goto __label_2
.annotate 'line', 4752
new $P7, [ 'CallMemberRefExpr' ]
$P7.'CallMemberRefExpr'(self, $P1, $P2)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4755
$P6 = $P1.'isidentifier'()
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 4756
# string call: $S1
$P7 = $P1.'getName'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 4757
# var predef: $P3
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4758
if_null $P3, __label_5
# {
.annotate 'line', 4759
self.'use_predef'($S1)
.annotate 'line', 4760
# var rawargs: $P4
ne $I1, 0, __label_7
root_new $P6, ['parrot';'ResizablePMCArray']
set $P4, $P6
goto __label_6
__label_7:
$P4 = $P2.'getrawargs'()
__label_6:
.annotate 'line', 4763
isa $I2, $P3, 'PredefFunctionEval'
unless $I2 goto __label_8
# {
.annotate 'line', 4764
$P6 = 'arglist_hascompilevalue'($P4)
if_null $P6, __label_9
unless $P6 goto __label_9
# {
.annotate 'line', 4765
# var evalfun: $P5
getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4766
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
.tailcall $P5($P6, $P7, $P4)
# }
__label_9: # endif
# }
__label_8: # endif
.annotate 'line', 4770
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
.annotate 'line', 4774
setattribute self, 'funref', $P1
.annotate 'line', 4775
setattribute self, 'args', $P2
.annotate 'line', 4776
.return(self)
# }
.annotate 'line', 4777

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4778
# Body
# {
.annotate 'line', 4780
.return(1)
# }
.annotate 'line', 4781

.end # cantailcall


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4782
# Body
# {
.annotate 'line', 4784
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4785
# string call: $S1
null $S1
.annotate 'line', 4786
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4787
$P3 = $P1.'checkIdentifier'()
set $S1, $P3
.annotate 'line', 4788
ne $S1, '', __label_2
.annotate 'line', 4789
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
.annotate 'line', 4792
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 4793
.return($S1)
# }
.annotate 'line', 4794

.end # emitcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4795
# Body
# {
.annotate 'line', 4797
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4798
# string call: $S1
$P3 = self.'emitcall'(__ARG_1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4799
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4800
if_null $P2, __label_1
.annotate 'line', 4801
$P2.'getargvalues'(__ARG_1)
__label_1: # endif
.annotate 'line', 4803
self.'annotate'(__ARG_1)
.annotate 'line', 4805
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_3
set $S2, __ARG_2
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4806
set $S3, __ARG_2
ne $S3, '.tailcall', __label_4
.annotate 'line', 4807
__ARG_1.'print'('.tailcall ')
goto __label_5
__label_4: # else
.annotate 'line', 4809
__ARG_1.'print'(__ARG_2, ' = ')
__label_5: # endif
# }
__label_2: # endif
.annotate 'line', 4812
__ARG_1.'print'($S1)
.annotate 'line', 4813
__ARG_1.'print'('(')
.annotate 'line', 4814
if_null $P2, __label_6
.annotate 'line', 4815
$P2.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 4816
__ARG_1.'say'(')')
# }
.annotate 'line', 4817

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4723
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4725
addattribute $P0, 'funref'
.annotate 'line', 4726
addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4827
# Body
# {
.annotate 'line', 4829
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'Expr'($P1, $P2)
.annotate 'line', 4830
setattribute self, 'funref', __ARG_2
.annotate 'line', 4831
setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4832

.end # CallMemberExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4833
# Body
# {
.annotate 'line', 4835
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4836
root_new $P2, ['parrot';'ResizablePMCArray']
$P4 = $P1.'emit_left_get'(__ARG_1)
push $P2, $P4
box $P3, ".'"
push $P2, $P3
.annotate 'line', 4837
$P5 = $P1.'get_member'()
.annotate 'line', 4836
push $P2, $P5
box $P3, "'"
push $P2, $P3
# predefined join
join $S1, "", $P2
.return($S1)
# }
.annotate 'line', 4838

.end # emitcall

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 4825
get_class $P1, [ 'CallExpr' ]
addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4846
# Body
# {
.annotate 'line', 4848
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'Expr'($P1, $P2)
.annotate 'line', 4849
setattribute self, 'funref', __ARG_2
.annotate 'line', 4850
setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4851

.end # CallMemberRefExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4852
# Body
# {
.annotate 'line', 4854
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4855
# var right: $P2
getattribute $P2, $P1, 'right'
.annotate 'line', 4856
# var type: $P3
$P3 = $P2.'checkresult'()
.annotate 'line', 4857
set $S3, $P3
isne $I1, $S3, 'P'
unless $I1 goto __label_1
set $S4, $P3
isne $I1, $S4, 'S'
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4858
getattribute $P4, $P1, 'start'
'SyntaxError'("Invalid expression type in '.*'", $P4)
__label_0: # endif
.annotate 'line', 4861
# string lreg: $S1
$P4 = $P1.'emit_left_get'(__ARG_1)
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4862
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_3
set $S2, $P4
__label_3:
.annotate 'line', 4863
concat $S3, $S1, '.'
concat $S3, $S3, $S2
.return($S3)
# }
.annotate 'line', 4864

.end # emitcall

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 4844
get_class $P1, [ 'CallExpr' ]
addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4872
# Body
# {
.annotate 'line', 4874
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4875
setattribute self, 'left', __ARG_3
# }
.annotate 'line', 4876

.end # MemberExprBase


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4877
# Body
# {
.annotate 'line', 4879
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4880
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4881
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4882
eq $S1, 'P', __label_2
# {
.annotate 'line', 4883
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4884
$P2 = self.'tempreg'('P')
set $S2, $P2
.annotate 'line', 4885
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4887
.return($S2)
# }
.annotate 'line', 4888

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 4869
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4871
addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4895
# Body
# {
.annotate 'line', 4897
self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4898
setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4899

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4900
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4901
# Body
# {
.annotate 'line', 4903
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4904
.return(self)
# }
.annotate 'line', 4905

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4906
# Body
# {
.annotate 'line', 4908
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4909

.end # get_member


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4910
# Body
# {
.annotate 'line', 4912
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4913
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4914
# string result: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4915
self.'annotate'(__ARG_1)
.annotate 'line', 4916
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4917
.return($S3)
# }
.annotate 'line', 4918

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4919
# Body
# {
.annotate 'line', 4921
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4922
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4923
self.'annotate'(__ARG_1)
.annotate 'line', 4924
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4925

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4926
# Body
# {
.annotate 'line', 4928
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4929

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4930
# Body
# {
.annotate 'line', 4932
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4933
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4934
# string value: $S3
null $S3
.annotate 'line', 4935
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4937
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4938
$P1 = self.'tempreg'('P')
set __ARG_3, $P1
.annotate 'line', 4939
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
.annotate 'line', 4941
set $S3, __ARG_3
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4944
$P1 = self.'tempreg'('P')
set $S3, $P1
.annotate 'line', 4945
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4947
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4948

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4949
# Body
# {
.annotate 'line', 4951
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4952
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4953
# string value: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4954
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
.annotate 'line', 4955
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4957
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_5
set $S4, $P2
__label_5:
.annotate 'line', 4958
$P1 = __ARG_2.'checkresult'()
set $S5, $P1
eq $S5, 'P', __label_6
.annotate 'line', 4959
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
.annotate 'line', 4961
set $S3, $S4
__label_7: # endif
# }
__label_4: # endif
.annotate 'line', 4963
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4964
.return($S3)
# }
.annotate 'line', 4965

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4891
get_class $P1, [ 'MemberExprBase' ]
addparent $P0, $P1
.annotate 'line', 4893
addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4973
# Body
# {
.annotate 'line', 4975
self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4976
setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4977

.end # MemberRefExpr


.sub 'checkresult' :method

.annotate 'line', 4978
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4979
# Body
# {
.annotate 'line', 4981
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4982
getattribute $P3, self, 'right'
$P2 = $P3.'optimize'()
setattribute self, 'right', $P2
.annotate 'line', 4983
.return(self)
# }
.annotate 'line', 4984

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4985
# Body
# {
.annotate 'line', 4988
getattribute $P1, self, 'start'
.annotate 'line', 4987
'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 4989

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 4970
get_class $P1, [ 'MemberExprBase' ]
addparent $P0, $P1
.annotate 'line', 4972
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5000
# Body
# {
.annotate 'line', 5002
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5003
setattribute self, 'left', __ARG_4
.annotate 'line', 5004
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5005

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 5006
# Body
# {
.annotate 'line', 5008
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 5009
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 5011
.return('P')
__label_1: # endif
# }
.annotate 'line', 5012

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5013
# Body
# {
.annotate 'line', 5015
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 5016
setattribute self, 'left', $P1
.annotate 'line', 5017
self.'optimizeargs'()
.annotate 'line', 5021
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P4 = self.'numargs'()
set $I3, $P4
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 5022
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 5023
$P4 = $P2.'isintegerliteral'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 5024
# int ival: $I1
$P5 = $P2.'getIntegerValue'()
set $I1, $P5
.annotate 'line', 5025
# string sval: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 5026
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, self, 'start'
getattribute $P5, $P4, 'file'
getattribute $P6, self, 'start'
getattribute $P7, $P6, 'line'
.annotate 'line', 5027
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5028
new $P5, [ 'StringLiteral' ]
getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
set $P4, $P5
.return($P4)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5031
.return(self)
# }
.annotate 'line', 5032

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 5033
# Body
# {
.annotate 'line', 5035
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 5036
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 5037
isnull $I1, $P1
not $I1
if $I1 goto __label_1
isnull $I1, $P2
not $I1
__label_1:
unless $I1 goto __label_0
.annotate 'line', 5038
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_args', $P3)
__label_0: # endif
.annotate 'line', 5039
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 5040
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_3
__label_2: # else
.annotate 'line', 5042
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_3: # endif
.annotate 'line', 5043
setattribute self, 'regleft', $P1
.annotate 'line', 5044
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5045
setattribute self, 'argregs', $P2
# }
.annotate 'line', 5046

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 5047
# Body
# {
.annotate 'line', 5049
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 5050
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 5051
isnull $I1, $P1
if $I1 goto __label_1
isnull $I1, $P2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 5052
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
__label_0: # endif
.annotate 'line', 5053
getattribute $P3, self, 'regleft'
__ARG_1.'print'($P3, '[')
.annotate 'line', 5054
getattribute $P3, self, 'argregs'
# predefined join
join $S1, '; ', $P3
__ARG_1.'print'($S1)
.annotate 'line', 5055
__ARG_1.'print'(']')
# }
.annotate 'line', 5056

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5057
# Body
# {
.annotate 'line', 5059
self.'emit_prep'(__ARG_1)
.annotate 'line', 5060
# string type: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 5061
ne $S1, 'S', __label_1
# {
.annotate 'line', 5062
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 5063
# int nargs: $I1
getattribute $P2, self, 'argregs'
# predefined elements
elements $I1, $P2
.annotate 'line', 5064
eq $I1, 1, __label_3
.annotate 'line', 5065
getattribute $P2, self, 'start'
'SyntaxError'('Bad string index', $P2)
__label_3: # endif
.annotate 'line', 5066
set $S2, __ARG_2
ne $S2, '', __label_4
.annotate 'line', 5067
__ARG_2 = self.'tempreg'('S')
__label_4: # endif
.annotate 'line', 5068
getattribute $P2, self, 'regleft'
$P3 = $P1[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 5071
self.'annotate'(__ARG_1)
.annotate 'line', 5072
__ARG_1.'print'(__ARG_2, ' = ')
.annotate 'line', 5073
self.'emit_aux'(__ARG_1)
.annotate 'line', 5074
__ARG_1.'say'('')
# }
__label_2: # endif
# }
.annotate 'line', 5076

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 5077
# Body
# {
.annotate 'line', 5079
self.'emit_prep'(__ARG_1)
.annotate 'line', 5080
self.'annotate'(__ARG_1)
.annotate 'line', 5081
self.'emit_aux'(__ARG_1)
.annotate 'line', 5082
__ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5083

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5084
# Body
# {
.annotate 'line', 5086
self.'emit_prep'(__ARG_1)
.annotate 'line', 5087
# string rreg: $S1
null $S1
.annotate 'line', 5088
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 5089
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5090
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5093
$P1 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P1
__label_1: # endif
.annotate 'line', 5094
self.'annotate'(__ARG_1)
.annotate 'line', 5095
self.'emit_aux'(__ARG_1)
.annotate 'line', 5096
__ARG_1.'say'(' = ', $S1)
.annotate 'line', 5097
.return($S1)
# }
.annotate 'line', 5098

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4994
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4996
addattribute $P0, 'left'
.annotate 'line', 4997
addattribute $P0, 'regleft'
.annotate 'line', 4998
addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5107
# Body
# {
.annotate 'line', 5109
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5110
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 5111
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5112
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 5113
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 5114
# {
.annotate 'line', 5115
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5116
getattribute $P3, self, 'values'
# predefined push
push $P3, $P2
# }
__label_3: # continue
.annotate 'line', 5117
$P1 = __ARG_1.'get'()
$P3 = $P1.'isop'(',')
if_null $P3, __label_2
if $P3 goto __label_1
__label_2: # enddo
.annotate 'line', 5118
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_4
.annotate 'line', 5119
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 5121

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 5122
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5123
# Body
# {
.annotate 'line', 5125
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5126
.return(self)
# }
.annotate 'line', 5127

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5128
# Body
# {
.annotate 'line', 5130
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 5131
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 5132
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5138
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 5140

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5141
# Body
# {
.annotate 'line', 5143
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5144
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5145
.return($S1)
# }
.annotate 'line', 5146

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 5147
# Body
# {
.annotate 'line', 5149
self.'annotate'(__ARG_1)
.annotate 'line', 5150
# string itemreg: $S1
null $S1
.annotate 'line', 5151
# string it_p: $S2
null $S2
.annotate 'line', 5152
eq __ARG_2, '', __label_0
# {
.annotate 'line', 5153
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5154
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 5156
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 5157
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
.annotate 'line', 5158
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
.annotate 'line', 5160
# string aux: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 5161
eq __ARG_2, '', __label_10
# {
.annotate 'line', 5162
__ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5163
set $S1, $S2
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 5167
$P2 = $P1.'isnull'()
if_null $P2, __label_11
unless $P2 goto __label_11
# {
.annotate 'line', 5168
eq __ARG_2, '', __label_13
# {
.annotate 'line', 5169
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 5170
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 5174
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_12: # endif
__label_4: # switch end
.annotate 'line', 5176
eq __ARG_2, '', __label_14
# {
.annotate 'line', 5177
self.'annotate'(__ARG_1)
.annotate 'line', 5178
__ARG_1.'say'('push ', __ARG_2, ", ", $S1)
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 5181

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5103
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5105
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5191
# Body
# {
.annotate 'line', 5193
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5194
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5195
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5196
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5197
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_0
# {
.annotate 'line', 5198
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 5199
# {
.annotate 'line', 5200
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5201
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5202
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5203
# predefined push
push $P2, $P4
.annotate 'line', 5204
# predefined push
push $P3, $P5
# }
__label_3: # continue
.annotate 'line', 5206
$P1 = __ARG_1.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 5207
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 5208
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 5210
setattribute self, 'keys', $P2
.annotate 'line', 5211
setattribute self, 'values', $P3
# }
.annotate 'line', 5212

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 5213
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5214
# Body
# {
.annotate 'line', 5216
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 5217
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5218
.return(self)
# }
.annotate 'line', 5219

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5220
# Body
# {
.annotate 'line', 5222
self.'annotate'(__ARG_1)
.annotate 'line', 5227
set $S6, __ARG_2
eq $S6, '', __label_0
.annotate 'line', 5228
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 5230
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 5231
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5232
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 5233
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 5234
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 5235
# string item: $S1
null $S1
.annotate 'line', 5236
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5237
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 5238
$P5 = self.'tempreg'('P')
set $S1, $P5
.annotate 'line', 5239
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 5242
$P5 = $P3.'emit_get'(__ARG_1)
set $S1, $P5
__label_5: # endif
.annotate 'line', 5244
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5245
# string itemreg: $S3
null $S3
.annotate 'line', 5246
$P5 = $P4.'isnull'()
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 5247
set $S6, __ARG_2
eq $S6, '', __label_9
# {
.annotate 'line', 5248
$P6 = self.'tempreg'('P')
set $S3, $P6
.annotate 'line', 5249
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 5252
$P5 = $P4.'isidentifier'()
if_null $P5, __label_10
unless $P5 goto __label_10
# {
.annotate 'line', 5253
# string s: $S4
$P6 = $P4.'checkIdentifier'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 5254
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
.annotate 'line', 5255
set $S3, $S4
goto __label_14
__label_13: # else
# {
.annotate 'line', 5257
# string id: $S5
$P5 = $P4.'getName'()
null $S5
if_null $P5, __label_16
set $S5, $P5
__label_16:
.annotate 'line', 5258
getattribute $P6, self, 'owner'
$P5 = $P6.'getvar'($S5)
unless_null $P5, __label_17
# {
.annotate 'line', 5259
$P7 = self.'tempreg'('P')
set $S3, $P7
.annotate 'line', 5260
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 5263
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 5267
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_11: # endif
__label_8: # endif
.annotate 'line', 5268
set $S6, __ARG_2
eq $S6, '', __label_19
.annotate 'line', 5269
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 5233
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 5271

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5272
# Body
# {
.annotate 'line', 5274
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5275
self.'emit'(__ARG_1, $S1)
.annotate 'line', 5276
.return($S1)
# }
.annotate 'line', 5277

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5186
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5188
addattribute $P0, 'keys'
.annotate 'line', 5189
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 5286
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 5287
# Body
# {
.annotate 'line', 5291
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 5292
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5293
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 5294
__ARG_1.'unget'($P2)
.annotate 'line', 5295
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 5296
# {
.annotate 'line', 5297
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5298
# predefined push
push $P3, $P4
# }
__label_3: # continue
.annotate 'line', 5299
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 5300
setattribute self, 'initializer', $P3
.annotate 'line', 5301
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 5303

.end # parseinitializer


.sub 'optimize' :method

.annotate 'line', 5304
# Body
# {
.annotate 'line', 5306
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5307
if_null $P1, __label_0
.annotate 'line', 5308
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 5309
.return(self)
# }
.annotate 'line', 5310

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5282
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5284
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5319
# Body
# {
.annotate 'line', 5321
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5323
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 5324
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 5325
setattribute self, 'value', __ARG_4
.annotate 'line', 5326
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5328
$P2 = $P1.'isop'('(')
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 5329
self.'parseinitializer'(__ARG_1)
goto __label_3
__label_2: # else
.annotate 'line', 5331
__ARG_1.'unget'($P1)
__label_3: # endif
# }
.annotate 'line', 5332

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 5333
# Body
# {
.annotate 'line', 5335
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5336
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5339
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 5340
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 5341
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3.'isconst'()
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 5342
$P5 = $P3.'getid'()
unless_null $P5, __label_4
# {
.annotate 'line', 5343
$P1 = $P3.'getvalue'()
.annotate 'line', 5344
isa $I2, $P1, 'StringLiteral'
not $I1, $I2
unless $I1 goto __label_6
.annotate 'line', 5345
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 5346
getattribute $P6, $P1, 'strval'
setattribute self, 'value', $P6
# }
goto __label_5
__label_4: # else
.annotate 'line', 5349
'SyntaxError'('*Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5353
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 5354
if_null $P4, __label_7
.annotate 'line', 5355
getattribute $P5, self, 'initializer'
'optimize_array'($P5)
__label_7: # endif
.annotate 'line', 5356
.return(self)
# }
.annotate 'line', 5357

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 5358
# Body
# {
.annotate 'line', 5360
self.'annotate'(__ARG_1)
.annotate 'line', 5362
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5363
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
.annotate 'line', 5366
# int type: $I2
getattribute $P9, self, 'value'
$P8 = $P9.'isstring'()
if_null $P8, __label_3
unless $P8 goto __label_3
null $I2
goto __label_2
__label_3:
.annotate 'line', 5367
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
.annotate 'line', 5369
# string reginit: $S1
set $S1, ''
.annotate 'line', 5370
# string regnew: $S2
set $P8, __ARG_2
null $S2
if_null $P8, __label_6
set $S2, $P8
__label_6:
.annotate 'line', 5371
# string constructor: $S3
null $S3
.annotate 'line', 5372
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
.annotate 'line', 5376
ne $I2, 1, __label_11
# {
.annotate 'line', 5377
not $I5, __ARG_3
unless $I5 goto __label_13
.annotate 'line', 5378
$P8 = self.'tempreg'('P')
set $S2, $P8
__label_13: # endif
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 5381
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5382
$P8 = $P2.'emit_get'(__ARG_1)
set $S1, $P8
.annotate 'line', 5383
concat $S0, ', ', $S1
set $S1, $S0
# }
__label_12: # endif
goto __label_7 # break
__label_8: # default
.annotate 'line', 5387
eq $I2, 1, __label_14
.annotate 'line', 5388
getattribute $P8, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P8)
__label_14: # endif
.annotate 'line', 5389
not $I3, __ARG_3
unless $I3 goto __label_15
.annotate 'line', 5390
$P9 = self.'tempreg'('P')
set $S2, $P9
__label_15: # endif
__label_7: # switch end
.annotate 'line', 5393
set $I3, $I2
null $I4
if $I3 == $I4 goto __label_18
set $I4, 1
if $I3 == $I4 goto __label_19
goto __label_17
# switch
__label_18: # case
.annotate 'line', 5396
# string name: $S4
getattribute $P9, self, 'value'
$P8 = $P9.'rawstring'()
null $S4
if_null $P8, __label_20
set $S4, $P8
__label_20:
.annotate 'line', 5397
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 5398
isnull $I5, $P3
unless $I5 goto __label_22
$I5 = self.'dowarnings'()
__label_22:
unless $I5 goto __label_21
.annotate 'line', 5399
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
getattribute $P10, self, 'value'
'Warn'($S6, $P10)
__label_21: # endif
.annotate 'line', 5403
getattribute $P11, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5404
le $I1, 1, __label_23
# {
.annotate 'line', 5405
getattribute $P12, self, 'value'
__ARG_1.'say'($S2, ".'", $P12, "'()")
# }
__label_23: # endif
goto __label_16 # break
__label_19: # case
.annotate 'line', 5409
# var id: $P4
getattribute $P8, self, 'owner'
getattribute $P9, self, 'value'
$P4 = $P8.'getvar'($P9)
.annotate 'line', 5410
unless_null $P4, __label_24
# {
.annotate 'line', 5412
# var cl: $P5
getattribute $P10, self, 'owner'
getattribute $P11, self, 'value'
$P5 = $P10.'checkclass'($P11)
.annotate 'line', 5413
if_null $P5, __label_26
# {
.annotate 'line', 5414
$P8 = $P5.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P8, $S1)
# }
goto __label_27
__label_26: # else
# {
.annotate 'line', 5417
$P8 = self.'dowarnings'()
if_null $P8, __label_28
unless $P8 goto __label_28
.annotate 'line', 5418
'Warn'('Checking: new unknown type')
__label_28: # endif
.annotate 'line', 5419
getattribute $P8, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P8, "']", $S1)
# }
__label_27: # endif
.annotate 'line', 5421
getattribute $P8, self, 'value'
set $S3, $P8
# }
goto __label_25
__label_24: # else
# {
.annotate 'line', 5425
$P8 = $P4.'getreg'()
__ARG_1.'say'('new ', $S2, ", ", $P8, "", $S1)
# }
__label_25: # endif
goto __label_16 # break
__label_17: # default
.annotate 'line', 5429
'InternalError'('Unexpected type in new')
__label_16: # switch end
.annotate 'line', 5431
isgt $I3, $I1, 1
if $I3 goto __label_30
isgt $I3, $I1, 0
unless $I3 goto __label_31
iseq $I3, $I2, 1
__label_31:
__label_30:
unless $I3 goto __label_29
# {
.annotate 'line', 5432
# string argregs: $P6
root_new $P6, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5433
iter $P13, $P1
set $P13, 0
__label_32: # for iteration
unless $P13 goto __label_33
shift $P7, $P13
# {
.annotate 'line', 5434
# string reg: $S5
$P8 = $P7.'emit_get'(__ARG_1)
null $S5
if_null $P8, __label_34
set $S5, $P8
__label_34:
.annotate 'line', 5435
# predefined push
push $P6, $S5
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 5437
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5438
# predefined join
join $S6, ", ", $P6
__ARG_1.'print'($S6)
.annotate 'line', 5439
__ARG_1.'say'(")")
.annotate 'line', 5440
not $I3, __ARG_3
unless $I3 goto __label_35
.annotate 'line', 5441
__ARG_1.'emitset'(__ARG_2, $S2)
__label_35: # endif
# }
__label_29: # endif
# }
.annotate 'line', 5443

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5444
# Body
# {
.annotate 'line', 5446
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5447

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5315
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5317
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5456
# Body
# {
.annotate 'line', 5458
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5459
setattribute self, 'owner', __ARG_2
.annotate 'line', 5460
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5461
setattribute self, 'nskey', $P1
.annotate 'line', 5462
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5463
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5464
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5466
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5467

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5468
# Body
# {
.annotate 'line', 5470
# string reginit: $S1
null $S1
.annotate 'line', 5471
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5472
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5473
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
.annotate 'line', 5477
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5478
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 5481
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 5483
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 5484
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5485
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 5486
__ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5487
null $P4
$P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5488
if_null $S1, __label_7
.annotate 'line', 5489
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 5490
__ARG_1.'say'()
# }
.annotate 'line', 5491

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5452
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5454
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5500
# Body
# {
.annotate 'line', 5502
self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5503
setattribute self, 'owner', __ARG_2
.annotate 'line', 5504
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5505
setattribute self, 'nskey', $P1
.annotate 'line', 5506
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5507
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5508
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5510
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5511

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5512
# Body
# {
.annotate 'line', 5514
# string reginit: $S1
null $S1
.annotate 'line', 5515
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5517
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5518
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 5519
le $I1, 0, __label_3
.annotate 'line', 5520
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 5521
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 5522
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 5523
getattribute $P5, self, 'owner'
$P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5524
__ARG_1.'say'()
.annotate 'line', 5526
le $I1, 0, __label_4
# {
.annotate 'line', 5527
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5528
iter $P6, $P1
set $P6, 0
__label_5: # for iteration
unless $P6 goto __label_6
shift $P4, $P6
# {
.annotate 'line', 5529
# string reg: $S3
$P5 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 5530
# predefined push
push $P3, $S3
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 5532
# string constructor: $S4
$P5 = $P2.'last'()
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
.annotate 'line', 5533
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5534
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 5535
__ARG_1.'say'(")")
.annotate 'line', 5536
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 5538

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5496
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5498
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5543
# Body
# {
.annotate 'line', 5545
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5547
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5549
new $P5, [ 'CallExpr' ]
.annotate 'line', 5550
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5549
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5552
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5554
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5556
$P3 = $P1.'isidentifier'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 5559
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5560
__ARG_1.'unget'($P2)
.annotate 'line', 5561
$P3 = $P2.'isop'('.')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 5563
new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P4, $P5
.return($P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5567
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
.annotate 'line', 5572
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5574

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5583
# Body
# {
.annotate 'line', 5585
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5586
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5587
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5588

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5589
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5590
# Body
# {
.annotate 'line', 5592
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5593
# string checkedval: $S1
null $S1
.annotate 'line', 5594
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5595
$P3 = $P1.'getidentifier'()
set $S1, $P3
.annotate 'line', 5596
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
# }
goto __label_1
__label_0: # else
.annotate 'line', 5599
set $S1, $P1
__label_1: # endif
.annotate 'line', 5600
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5601
self.'annotate'(__ARG_1)
.annotate 'line', 5602
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5603

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5578
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5580
addattribute $P0, 'lexpr'
.annotate 'line', 5581
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5618
# Body
# {
.annotate 'line', 5620
self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5621
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5622
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5623
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5624
.return(self)
# }
.annotate 'line', 5625

.end # set


.sub 'optimize' :method

.annotate 'line', 5626
# Body
# {
.annotate 'line', 5628
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5629
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
.annotate 'line', 5631
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5633
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5635
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5636
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5637
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5639

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5640
# Body
# {
.annotate 'line', 5642
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5643

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5644
# Body
# {
.annotate 'line', 5646
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5647
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5648
getattribute $P1, self, 'condition'
$P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5649
getattribute $P1, self, 'etrue'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5650
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5651
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5652
getattribute $P1, self, 'efalse'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5653
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5654

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5608
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5614
addattribute $P0, 'condition'
.annotate 'line', 5615
addattribute $P0, 'etrue'
.annotate 'line', 5616
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

.annotate 'line', 5696
# Body
# {
.annotate 'line', 5698
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
.annotate 'line', 5699
.return(1)
__label_3: # case
.annotate 'line', 5700
.return(2)
__label_4: # case
.annotate 'line', 5701
.return(3)
__label_1: # default
.annotate 'line', 5702
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5704

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5706
# Body
# {
.annotate 'line', 5708
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
.annotate 'line', 5709
.return(8)
__label_3: # case
.annotate 'line', 5710
.return(11)
__label_4: # case
.annotate 'line', 5711
.return(9)
__label_5: # case
.annotate 'line', 5712
.return(10)
__label_1: # default
.annotate 'line', 5714
$P2 = __ARG_1.'iskeyword'('delete')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(31)
goto __label_7
__label_6: # else
.annotate 'line', 5715
$P3 = __ARG_1.'iskeyword'('exists')
if_null $P3, __label_8
unless $P3 goto __label_8
.return(32)
goto __label_9
__label_8: # else
.annotate 'line', 5716
.return(0)
__label_9: # endif
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5718

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5720
# Body
# {
.annotate 'line', 5722
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
.annotate 'line', 5723
.return(19)
__label_3: # case
.annotate 'line', 5724
.return(20)
__label_4: # case
.annotate 'line', 5725
.return(21)
__label_5: # case
.annotate 'line', 5726
.return(22)
__label_1: # default
.annotate 'line', 5727
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5729

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5731
# Body
# {
.annotate 'line', 5733
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5734
.return(28)
__label_3: # case
.annotate 'line', 5735
.return(29)
__label_1: # default
.annotate 'line', 5736
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5738

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5740
# Body
# {
.annotate 'line', 5742
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
.annotate 'line', 5743
.return(14)
__label_3: # case
.annotate 'line', 5744
.return(16)
__label_4: # case
.annotate 'line', 5745
.return(15)
__label_5: # case
.annotate 'line', 5746
.return(17)
__label_1: # default
.annotate 'line', 5748
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5749
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5751

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5753
# Body
# {
.annotate 'line', 5755
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
.annotate 'line', 5756
.return(12)
__label_3: # case
.annotate 'line', 5757
.return(13)
__label_4: # case
.annotate 'line', 5758
.return(25)
__label_5: # case
.annotate 'line', 5759
.return(26)
__label_1: # default
.annotate 'line', 5760
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5762

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5764
# Body
# {
.annotate 'line', 5766
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
.annotate 'line', 5767
.return(4)
__label_3: # case
.annotate 'line', 5768
.return(5)
__label_4: # case
.annotate 'line', 5769
.return(6)
__label_5: # case
.annotate 'line', 5770
.return(18)
__label_6: # case
.annotate 'line', 5771
.return(23)
__label_7: # case
.annotate 'line', 5772
.return(24)
__label_8: # case
.annotate 'line', 5773
.return(30)
__label_1: # default
.annotate 'line', 5774
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5776

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5778
# Body
# {
.annotate 'line', 5780
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5782
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5783
# var expr: $P2
null $P2
.annotate 'line', 5784
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5785
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5786
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5787
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5789
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5790
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5791
$P4 = $P1.'isop'('{')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 5792
new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 5793
$P4 = $P1.'isstring'()
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5794
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_3: # endif
.annotate 'line', 5795
$P4 = $P1.'isint'()
if_null $P4, __label_4
unless $P4 goto __label_4
.annotate 'line', 5796
new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_4: # endif
.annotate 'line', 5797
$P4 = $P1.'isfloat'()
if_null $P4, __label_5
unless $P4 goto __label_5
.annotate 'line', 5798
new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_5: # endif
.annotate 'line', 5799
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
.annotate 'line', 5801
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_9: # case
.annotate 'line', 5803
new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_10: # case
.annotate 'line', 5805
new $P8, [ 'OpClassExpr' ]
$P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
set $P7, $P8
.return($P7)
__label_7: # default
__label_6: # switch end
.annotate 'line', 5807
$P4 = $P1.'isidentifier'()
if_null $P4, __label_11
unless $P4 goto __label_11
.annotate 'line', 5808
new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_11: # endif
.annotate 'line', 5809
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5810

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5812
# Body
# {
.annotate 'line', 5814
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5815
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 5817
# var subexp: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5818
# var t: $P2
null $P2
.annotate 'line', 5819
# var start: $P3
null $P3
.annotate 'line', 5820
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5821
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5822
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
.annotate 'line', 5824
new $P8, [ 'CallExpr' ]
$P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_5: # case
.annotate 'line', 5827
new $P9, [ 'IndexExpr' ]
$P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P9
goto __label_2 # break
__label_6: # case
.annotate 'line', 5830
set $P3, $P2
.annotate 'line', 5831
$P2 = __ARG_1.'get'()
.annotate 'line', 5832
$P10 = $P2.'isop'('*')
if_null $P10, __label_7
unless $P10 goto __label_7
# {
.annotate 'line', 5833
# var right: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5834
new $P7, [ 'MemberRefExpr' ]
$P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
set $P1, $P7
# }
goto __label_8
__label_7: # else
.annotate 'line', 5837
new $P7, [ 'MemberExpr' ]
$P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
set $P1, $P7
__label_8: # endif
goto __label_2 # break
__label_3: # default
.annotate 'line', 5840
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5843
__ARG_1.'unget'($P2)
.annotate 'line', 5844
.return($P1)
# }
.annotate 'line', 5845

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5847
# Body
# {
.annotate 'line', 5849
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5851
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5852
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5853
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5854
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5855
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5856
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5859
__ARG_1.'unget'($P2)
.annotate 'line', 5860
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5862

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5864
# Body
# {
.annotate 'line', 5866
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5867
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5868
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5870
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5871
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5872
# var subexpr: $P2
null $P2
.annotate 'line', 5873
eq $I1, 0, __label_0
# {
.annotate 'line', 5874
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5875
# var oper: $P3
null $P3
.annotate 'line', 5876
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
.annotate 'line', 5878
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5881
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5884
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5887
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5890
new $P3, [ 'OpDeleteExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5893
new $P3, [ 'OpExistsExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5896
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5898
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5901
__ARG_1.'unget'($P1)
.annotate 'line', 5902
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5904
.return($P2)
# }
.annotate 'line', 5905

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5907
# Body
# {
.annotate 'line', 5909
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5910
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5912
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5913
# var t: $P2
null $P2
.annotate 'line', 5914
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5915
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5916
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5917
# var aux: $P4
null $P4
.annotate 'line', 5918
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
.annotate 'line', 5920
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5923
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5926
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5929
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5932
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5934
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5935
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5937
__ARG_1.'unget'($P2)
.annotate 'line', 5938
.return($P1)
# }
.annotate 'line', 5939

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5941
# Body
# {
.annotate 'line', 5943
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5945
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5946
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5947
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5948
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5949
# var expr: $P4
null $P4
.annotate 'line', 5950
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5951
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5953
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
.annotate 'line', 5954
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5956
__ARG_1.'unget'($P2)
.annotate 'line', 5957
.return($P1)
# }
.annotate 'line', 5958

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5960
# Body
# {
.annotate 'line', 5962
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5964
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5965
# var rexpr: $P2
null $P2
.annotate 'line', 5966
# var t: $P3
null $P3
.annotate 'line', 5967
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5968
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5969
set $I2, $I1
set $I3, 28
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5971
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5972
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5975
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5976
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5979
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5982
__ARG_1.'unget'($P3)
.annotate 'line', 5983
.return($P1)
# }
.annotate 'line', 5984

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5986
# Body
# {
.annotate 'line', 5988
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5989
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5991
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5992
# var rexpr: $P2
null $P2
.annotate 'line', 5993
# var t: $P3
null $P3
.annotate 'line', 5994
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5995
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5996
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
.annotate 'line', 5998
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5999
new $P7, [ 'OpLessExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 6002
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6003
new $P8, [ 'OpGreaterExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 6006
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6007
new $P9, [ 'OpLessEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_7: # case
.annotate 'line', 6010
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6011
new $P10, [ 'OpGreaterEqualExpr' ]
$P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_8: # case
.annotate 'line', 6014
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 6017
'InternalError'('Invalid code in parseExpr_9', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6020
__ARG_1.'unget'($P3)
.annotate 'line', 6021
.return($P1)
# }
.annotate 'line', 6022

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6024
# Body
# {
.annotate 'line', 6026
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6027
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6029
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6030
# var rexpr: $P2
null $P2
.annotate 'line', 6031
# var t: $P3
null $P3
.annotate 'line', 6032
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 6033
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 6034
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
.annotate 'line', 6036
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6037
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 6040
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6041
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 6044
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6045
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 6048
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6049
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_3: # default
.annotate 'line', 6052
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6055
__ARG_1.'unget'($P3)
.annotate 'line', 6056
.return($P1)
# }
.annotate 'line', 6057

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6059
# Body
# {
.annotate 'line', 6061
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6063
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6064
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6065
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6066
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6067
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6069
__ARG_1.'unget'($P2)
.annotate 'line', 6070
.return($P1)
# }
.annotate 'line', 6071

.end # parseExpr_10


.sub 'parseExpr_11'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6073
# Body
# {
.annotate 'line', 6075
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6077
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6078
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6079
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('^')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6080
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6081
new $P5, [ 'OpBinXorExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6083
__ARG_1.'unget'($P2)
.annotate 'line', 6084
.return($P1)
# }
.annotate 'line', 6085

.end # parseExpr_11


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6087
# Body
# {
.annotate 'line', 6089
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6091
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6092
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6093
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6094
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6095
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6097
__ARG_1.'unget'($P2)
.annotate 'line', 6098
.return($P1)
# }
.annotate 'line', 6099

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6101
# Body
# {
.annotate 'line', 6103
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6105
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6106
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6107
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6108
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6109
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6111
__ARG_1.'unget'($P2)
.annotate 'line', 6112
.return($P1)
# }
.annotate 'line', 6113

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6115
# Body
# {
.annotate 'line', 6117
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6119
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6120
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 6121
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 6122
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6123
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6125
__ARG_1.'unget'($P2)
.annotate 'line', 6126
.return($P1)
# }
.annotate 'line', 6127

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6129
# Body
# {
.annotate 'line', 6131
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6132
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6134
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6135
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6136
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 6137
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6138
'ExpectOp'(':', __ARG_1)
.annotate 'line', 6139
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6140
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6143
__ARG_1.'unget'($P2)
.annotate 'line', 6144
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6146

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6148
# Body
# {
.annotate 'line', 6150
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6151
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6152
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6154
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6155
# var t: $P2
null $P2
.annotate 'line', 6156
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 6157
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 6158
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6159
# var expr: $P4
null $P4
.annotate 'line', 6160
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
.annotate 'line', 6162
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 6165
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 6168
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 6171
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 6174
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 6177
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_10: # case
.annotate 'line', 6180
new $P4, [ 'OpModToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 6183
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 6185
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6186
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6188
__ARG_1.'unget'($P2)
.annotate 'line', 6189
.return($P1)
# }
.annotate 'line', 6190

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6192
# Body
# {
.annotate 'line', 6194
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6196
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6197

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 6210
# Body
# {
.annotate 'line', 6212
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 6213
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 6214
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6215
box $P1, $S1
setattribute self, 'brlabel', $P1
.annotate 'line', 6216
.return($S1)
# }
.annotate 'line', 6217

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6218
# Body
# {
.annotate 'line', 6220
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 6221
unless_null $P1, __label_0
.annotate 'line', 6222
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 6223
.return($P1)
# }
.annotate 'line', 6224

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 6208
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 6231
# Body
# {
.annotate 'line', 6233
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 6234
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 6235
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6236
box $P1, $S1
setattribute self, 'cntlabel', $P1
.annotate 'line', 6237
.return($S1)
# }
.annotate 'line', 6238

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6239
# Body
# {
.annotate 'line', 6241
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 6242
unless_null $P1, __label_0
.annotate 'line', 6243
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 6244
.return($P1)
# }
.annotate 'line', 6245

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 6227
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 6229
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6259
# Body
# {
.annotate 'line', 6261
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6262
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6263
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6264
__ARG_2.'unget'($P1)
.annotate 'line', 6265
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
set $P3, $P4
setattribute self, 'values', $P3
# }
__label_0: # endif
# }
.annotate 'line', 6267

.end # parse


.sub 'optimize' :method

.annotate 'line', 6268
# Body
# {
.annotate 'line', 6270
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6271
if_null $P1, __label_0
.annotate 'line', 6272
$P1 = $P1.'optimize'()
__label_0: # endif
.annotate 'line', 6273
.return(self)
# }
.annotate 'line', 6274

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6275
# Body
# {
.annotate 'line', 6278
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6279
# int n: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined int
$P3 = $P1.'numargs'()
set $I1, $P3
__label_0:
.annotate 'line', 6282
iseq $I2, $I1, 1
unless $I2 goto __label_3
isa $I2, self, 'ReturnStatement'
__label_3:
unless $I2 goto __label_2
# {
.annotate 'line', 6283
# var func: $P2
$P2 = $P1.'getfreearg'(0)
.annotate 'line', 6284
$P3 = $P2.'cantailcall'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 6285
self.'annotate'(__ARG_1)
.annotate 'line', 6286
.tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
__label_4: # endif
# }
__label_2: # endif
.annotate 'line', 6290
le $I1, 0, __label_5
.annotate 'line', 6291
$P1.'getargvalues'(__ARG_1)
__label_5: # endif
.annotate 'line', 6293
self.'annotate'(__ARG_1)
.annotate 'line', 6294
self.'emitret'(__ARG_1)
.annotate 'line', 6295
le $I1, 0, __label_6
.annotate 'line', 6296
$P1.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 6297
__ARG_1.'say'(')')
# }
.annotate 'line', 6298

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6255
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6257
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6303
# Body
# {
.annotate 'line', 6305
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6306

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6307
# Body
# {
.annotate 'line', 6309
__ARG_1.'print'('.return(')
# }
.annotate 'line', 6310

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6301
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6315
# Body
# {
.annotate 'line', 6317
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6318

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6319
# Body
# {
.annotate 'line', 6321
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 6322

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6313
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6333
# Body
# {
.annotate 'line', 6335
self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6336
setattribute self, 'name', __ARG_1
.annotate 'line', 6337
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6338
box $P1, $S1
setattribute self, 'value', $P1
# }
.annotate 'line', 6339

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 6340
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6341
# Body
# {
.annotate 'line', 6343
self.'annotate'(__ARG_1)
.annotate 'line', 6344
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6345
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 6346
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6347

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6329
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6331
addattribute $P0, 'name'
.annotate 'line', 6332
addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6359
# Body
# {
.annotate 'line', 6361
setattribute self, 'owner', __ARG_1
.annotate 'line', 6362
box $P1, __ARG_2
setattribute self, 'label', $P1
# }
.annotate 'line', 6363

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 6364
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 6365
# Body
# {
.annotate 'line', 6367
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6368
# string value: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6369
.return($S2)
# }
.annotate 'line', 6370

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6356
addattribute $P0, 'owner'
.annotate 'line', 6357
addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6381
# Body
# {
.annotate 'line', 6383
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6384
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6385
'RequireIdentifier'($P1)
.annotate 'line', 6386
setattribute self, 'label', $P1
.annotate 'line', 6387
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6388

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 6389
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6390
# Body
# {
.annotate 'line', 6392
self.'annotate'(__ARG_1)
.annotate 'line', 6393
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6394
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6395
concat $S3, 'goto ', $S1
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6396

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6377
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6379
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 6405
# Body
# {
.annotate 'line', 6407
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 6408

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6409
# Body
# {
.annotate 'line', 6411
'ExpectOp'('(', __ARG_1)
.annotate 'line', 6412
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 6413
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6414

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6403
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

.annotate 'line', 6425
# Body
# {
.annotate 'line', 6427
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6428
self.'parsecondition'(__ARG_2)
.annotate 'line', 6429
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 6430
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6431
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6432
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 6434
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 6435
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6437

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6438
# Body
# {
.annotate 'line', 6440
self.'optimize_condition'()
.annotate 'line', 6441
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 6442
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 6443
getattribute $P3, self, 'falsebranch'
$P2 = $P3.'optimize'()
setattribute self, 'falsebranch', $P2
.annotate 'line', 6444
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6446
getattribute $P1, self, 'truebranch'
.return($P1)
__label_3: # case
.annotate 'line', 6448
getattribute $P2, self, 'falsebranch'
.return($P2)
__label_1: # default
__label_0: # switch end
.annotate 'line', 6450
.return(self)
# }
.annotate 'line', 6451

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6452
# Body
# {
.annotate 'line', 6454
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 6455
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 6456
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 6457
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 6458
# string elselabel: $S1
set $S1, ''
.annotate 'line', 6459
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 6460
$P3 = self.'genlabel'()
set $S1, $P3
__label_0: # endif
.annotate 'line', 6461
# string endlabel: $S2
$P3 = self.'genlabel'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6462
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 6463
self.'annotate'(__ARG_1)
.annotate 'line', 6464
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6465
$P1.'emit'(__ARG_1)
.annotate 'line', 6467
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 6468
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6469
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6470
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 6472
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6473

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6421
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 6423
addattribute $P0, 'truebranch'
.annotate 'line', 6424
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6483
# Body
# {
.annotate 'line', 6485
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 6486

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6487
# Body
# {
.annotate 'line', 6489
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6490
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6492
self.'annotate'(__ARG_1)
.annotate 'line', 6493
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6494
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6495
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6496
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6497

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6480
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 6482
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6506
# Body
# {
.annotate 'line', 6508
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6509
self.'parsecondition'(__ARG_2)
.annotate 'line', 6510
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6511

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6512
# Body
# {
.annotate 'line', 6514
self.'optimize_condition'()
.annotate 'line', 6515
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6516
.return(self)
# }
.annotate 'line', 6517

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6518
# Body
# {
.annotate 'line', 6520
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6522
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 6525
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 6528
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 6529
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 6531
self.'annotate'(__ARG_1)
.annotate 'line', 6532
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6533
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6534
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 6535
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6536
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 6538

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6504
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

.annotate 'line', 6547
# Body
# {
.annotate 'line', 6549
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6550
self.'parsebody'(__ARG_2)
.annotate 'line', 6551
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6552
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6553

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6554
# Body
# {
.annotate 'line', 6556
self.'optimize_condition'()
.annotate 'line', 6557
# var body: $P1
getattribute $P2, self, 'body'
$P1 = $P2.'optimize'()
.annotate 'line', 6558
$I1 = $P1.'isempty'()
unless $I1 goto __label_1
$P2 = self.'getvalue'()
set $I2, $P2
iseq $I1, $I2, 2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 6559
new $P3, [ 'EmptyStatement' ]
.return($P3)
__label_0: # endif
.annotate 'line', 6560
setattribute self, 'body', $P1
.annotate 'line', 6561
.return(self)
# }
.annotate 'line', 6562

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6563
# Body
# {
.annotate 'line', 6565
# var body: $P1
getattribute $P1, self, 'body'
.annotate 'line', 6566
# int condvalue: $I1
$P2 = self.'getvalue'()
set $I1, $P2
.annotate 'line', 6567
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6569
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 6572
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 6573
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 6574
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 6576
self.'annotate'(__ARG_1)
.annotate 'line', 6577
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6579
$P1.'emit'(__ARG_1)
.annotate 'line', 6580
__ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6581
eq $I1, 2, __label_6
.annotate 'line', 6582
self.'emit_if'(__ARG_1, $S1, $S2)
__label_6: # endif
.annotate 'line', 6583
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 6585

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6545
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

.annotate 'line', 6594
# Body
# {
.annotate 'line', 6596
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6597
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6598

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6599
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6600
# Body
# {
.annotate 'line', 6602
self.'annotate'(__ARG_1)
.annotate 'line', 6603
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6604
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6605

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6592
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6614
# Body
# {
.annotate 'line', 6616
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6617
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6618

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6619
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6620
# Body
# {
.annotate 'line', 6622
self.'annotate'(__ARG_1)
.annotate 'line', 6623
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6624
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6625

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6612
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6639
# Body
# {
.annotate 'line', 6641
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6642
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6643
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6644
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6645
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6646
$P1 = __ARG_2.'get'()
.annotate 'line', 6647
$P3 = $P1.'isop'(')')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6648
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6649
$P1 = __ARG_2.'get'()
.annotate 'line', 6650
$P3 = $P1.'isop'('{')
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 6651
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6652
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P4
.annotate 'line', 6653
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P4
.annotate 'line', 6654
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P4
__label_4: # while
.annotate 'line', 6655
$P1 = __ARG_2.'get'()
$I1 = $P1.'iskeyword'('case')
if $I1 goto __label_5
$I1 = $P1.'iskeyword'('default')
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 6656
$P3 = $P1.'iskeyword'('case')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 6657
getattribute $P4, self, 'case_value'
$P5 = 'parseExpr'(__ARG_2, self)
# predefined push
push $P4, $P5
.annotate 'line', 6658
$P1 = __ARG_2.'get'()
.annotate 'line', 6659
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_8
.annotate 'line', 6660
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6661
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6662
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
.annotate 'line', 6663
__ARG_2.'unget'($P1)
.annotate 'line', 6664
$P3 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P2, $P3
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6666
getattribute $P3, self, 'case_st'
# predefined push
push $P3, $P2
.annotate 'line', 6667
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6670
$P1 = __ARG_2.'get'()
.annotate 'line', 6671
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_13
.annotate 'line', 6672
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6673
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
.annotate 'line', 6674
__ARG_2.'unget'($P1)
.annotate 'line', 6675
getattribute $P3, self, 'default_st'
$P4 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P3, $P4
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6677
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6680

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6681
# Body
# {
.annotate 'line', 6683
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6684
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6685
getattribute $P2, self, 'case_st'
iter $P5, $P2
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6686
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6687
getattribute $P2, self, 'default_st'
'optimize_array'($P2)
.annotate 'line', 6688
.return(self)
# }
.annotate 'line', 6689

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6690
# Body
# {
.annotate 'line', 6693
# string type: $S1
set $S1, ''
.annotate 'line', 6694
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6695
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6696
ne $S2, 'N', __label_3
.annotate 'line', 6697
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6698
ne $S1, '', __label_4
.annotate 'line', 6699
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6700
eq $S1, $S2, __label_6
.annotate 'line', 6701
set $S1, 'P'
__label_6: # endif
__label_5: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6704
# string reg: $S3
$P8 = self.'tempreg'($S1)
null $S3
if_null $P8, __label_7
set $S3, $P8
__label_7:
.annotate 'line', 6705
getattribute $P10, self, 'condition'
$P8 = $P10.'checkresult'()
set $S9, $P8
ne $S9, $S1, __label_8
.annotate 'line', 6706
getattribute $P11, self, 'condition'
$P11.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6708
# string regcond: $S4
getattribute $P13, self, 'condition'
$P12 = $P13.'emit_get'(__ARG_1)
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
.annotate 'line', 6709
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6713
self.'genbreaklabel'()
.annotate 'line', 6714
# string defaultlabel: $S5
$P8 = self.'genlabel'()
null $S5
if_null $P8, __label_11
set $S5, $P8
__label_11:
.annotate 'line', 6715
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6716
# string regval: $S6
$P8 = self.'tempreg'($S1)
null $S6
if_null $P8, __label_12
set $S6, $P8
__label_12:
.annotate 'line', 6717
getattribute $P8, self, 'case_value'
iter $P14, $P8
set $P14, 0
__label_13: # for iteration
unless $P14 goto __label_14
shift $P3, $P14
# {
.annotate 'line', 6718
# string label: $S7
$P10 = self.'genlabel'()
null $S7
if_null $P10, __label_15
set $S7, $P10
__label_15:
.annotate 'line', 6719
# predefined push
push $P2, $S7
.annotate 'line', 6720
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6721
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6723
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6726
__ARG_1.'comment'('switch')
.annotate 'line', 6727
self.'annotate'(__ARG_1)
.annotate 'line', 6728
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6729
# int n: $I1
set $P8, $P4
set $I1, $P8
# for loop
.annotate 'line', 6730
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6731
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6732
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6733
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6734
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $P6, $P15
.annotate 'line', 6735
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6730
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6738
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6739
getattribute $P8, self, 'default_st'
iter $P16, $P8
set $P16, 0
__label_21: # for iteration
unless $P16 goto __label_22
shift $P7, $P16
.annotate 'line', 6740
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6742
getattribute $P10, self, 'start'
$P8 = self.'getbreaklabel'($P10)
__ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6743

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6632
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6634
addattribute $P0, 'condition'
.annotate 'line', 6635
addattribute $P0, 'case_value'
.annotate 'line', 6636
addattribute $P0, 'case_st'
.annotate 'line', 6637
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6755
# Body
# {
.annotate 'line', 6757
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6758
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6759
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6760
__ARG_2.'unget'($P1)
.annotate 'line', 6761
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6763
$P1 = __ARG_2.'get'()
.annotate 'line', 6764
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 6765
__ARG_2.'unget'($P1)
.annotate 'line', 6766
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6767
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6769
$P1 = __ARG_2.'get'()
.annotate 'line', 6770
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_2
# {
.annotate 'line', 6771
__ARG_2.'unget'($P1)
.annotate 'line', 6772
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P3
.annotate 'line', 6773
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6775
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6776

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6777
# Body
# {
.annotate 'line', 6779
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6780
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6781
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6782
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6783
getattribute $P1, self, 'iteration'
if_null $P1, __label_2
.annotate 'line', 6784
getattribute $P4, self, 'iteration'
$P3 = $P4.'optimize'()
setattribute self, 'iteration', $P3
__label_2: # endif
.annotate 'line', 6785
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6786
.return(self)
# }
.annotate 'line', 6787

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6788
# Body
# {
.annotate 'line', 6790
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6791
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6792
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6793
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6794
.return()
# }
__label_0: # endif
.annotate 'line', 6796
__ARG_1.'comment'('for loop')
.annotate 'line', 6797
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6798
# string breaklabel: $S2
$P1 = self.'genbreaklabel'()
null $S2
if_null $P1, __label_4
set $S2, $P1
__label_4:
.annotate 'line', 6799
# string condlabel: $S3
$P1 = self.'genlabel'()
null $S3
if_null $P1, __label_5
set $S3, $P1
__label_5:
.annotate 'line', 6800
getattribute $P1, self, 'initializer'
if_null $P1, __label_6
.annotate 'line', 6801
getattribute $P2, self, 'initializer'
$P2.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6803
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6804
getattribute $P1, self, 'condexpr'
if_null $P1, __label_7
.annotate 'line', 6805
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6807
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6808
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6809
getattribute $P1, self, 'iteration'
if_null $P1, __label_8
.annotate 'line', 6810
# string unused: $S4
getattribute $P3, self, 'iteration'
$P2 = $P3.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
__label_8: # endif
.annotate 'line', 6811
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6813
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6814

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6750
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6752
addattribute $P0, 'initializer'
.annotate 'line', 6753
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6827
# Body
# {
.annotate 'line', 6829
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6830
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6831
eq __ARG_5, '', __label_1
# {
.annotate 'line', 6832
# string deftype: $S2
$P1 = 'typetoregcheck'(__ARG_5)
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 6833
self.'createvar'($S1, $S2)
.annotate 'line', 6834
box $P1, $S2
setattribute self, 'deftype', $P1
# }
__label_1: # endif
.annotate 'line', 6836
setattribute self, 'varname', __ARG_4
.annotate 'line', 6837
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P2
.annotate 'line', 6838
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6839
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6840

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6841
# Body
# {
.annotate 'line', 6843
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6844
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6845
.return(self)
# }
.annotate 'line', 6846

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6847
# Body
# {
.annotate 'line', 6849
self.'annotate'(__ARG_1)
.annotate 'line', 6850
# string regcont: $S1
null $S1
.annotate 'line', 6851
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6852
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6853
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6854
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6857
getattribute $P3, self, 'container'
$P2 = $P3.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 6858
# var itvar: $P1
getattribute $P2, self, 'varname'
$P1 = self.'getvar'($P2)
.annotate 'line', 6859
# string iterator: $S3
$P2 = self.'createreg'('P')
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6860
# string continuelabel: $S4
$P2 = self.'gencontinuelabel'()
null $S4
if_null $P2, __label_4
set $S4, $P2
__label_4:
.annotate 'line', 6861
# string breaklabel: $S5
$P2 = self.'genbreaklabel'()
null $S5
if_null $P2, __label_5
set $S5, $P2
__label_5:
.annotate 'line', 6862
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6863
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6864
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6865
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6866
$P2 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P2, ', ', $S3)
.annotate 'line', 6867
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 6868
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6869
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6870

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6821
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6823
addattribute $P0, 'deftype'
.annotate 'line', 6824
addattribute $P0, 'varname'
.annotate 'line', 6825
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6875
# Body
# {
.annotate 'line', 6877
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6878
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6879
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6880
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6881
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6883
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6884
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6885
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6886
__ARG_2.'unget'($P3)
.annotate 'line', 6887
__ARG_2.'unget'($P2)
.annotate 'line', 6888
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6890
new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 6891

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6901
# Body
# {
.annotate 'line', 6903
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6904
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6905

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6906
# Body
# {
.annotate 'line', 6908
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6909
.return(self)
# }
.annotate 'line', 6910

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6911
# Body
# {
.annotate 'line', 6913
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6914
self.'annotate'(__ARG_1)
.annotate 'line', 6915
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6916

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6897
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6899
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6930
# Body
# {
.annotate 'line', 6932
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6933
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6934
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6935
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6938
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6940
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6941
$P1 = __ARG_2.'get'()
.annotate 'line', 6942
$P2 = $P1.'iskeyword'('catch')
isfalse $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6943
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6944
$P1 = __ARG_2.'get'()
.annotate 'line', 6945
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_3
.annotate 'line', 6946
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6947
$P1 = __ARG_2.'get'()
.annotate 'line', 6948
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_4
# {
.annotate 'line', 6949
# string exname: $S1
$P3 = $P1.'getidentifier'()
null $S1
if_null $P3, __label_5
set $S1, $P3
__label_5:
.annotate 'line', 6950
setattribute self, 'exname', $P1
.annotate 'line', 6951
self.'createvar'($S1, 'P')
.annotate 'line', 6952
$P1 = __ARG_2.'get'()
.annotate 'line', 6953
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_6
.annotate 'line', 6954
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6956
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P3
# }
.annotate 'line', 6957

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6958
# Body
# {
.annotate 'line', 6960
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6961
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6962
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6963
getattribute $P3, self, 'scatch'
$P2 = $P3.'optimize'()
setattribute self, 'scatch', $P2
.annotate 'line', 6964
.return(self)
# }
.annotate 'line', 6965

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6966
# Body
# {
.annotate 'line', 6968
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6969
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6970
# string labelpasthandler: $S3
$P7 = self.'genlabel'()
null $S3
if_null $P7, __label_2
set $S3, $P7
__label_2:
.annotate 'line', 6971
# string exreg: $S4
null $S4
.annotate 'line', 6972
getattribute $P7, self, 'exname'
if_null $P7, __label_3
# {
.annotate 'line', 6973
# var exname: $P1
getattribute $P8, self, 'exname'
$P1 = self.'getvar'($P8)
.annotate 'line', 6974
$P7 = $P1.'getreg'()
set $S4, $P7
# }
goto __label_4
__label_3: # else
.annotate 'line', 6977
$P7 = self.'tempreg'('P')
set $S4, $P7
__label_4: # endif
.annotate 'line', 6979
self.'annotate'(__ARG_1)
.annotate 'line', 6980
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6982
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6983
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6985
getattribute $P7, self, 'modifiers'
if_null $P7, __label_5
# {
.annotate 'line', 6986
# var modiflist: $P2
getattribute $P8, self, 'modifiers'
$P2 = $P8.'getlist'()
.annotate 'line', 6987
iter $P9, $P2
set $P9, 0
__label_6: # for iteration
unless $P9 goto __label_7
shift $P3, $P9
# {
.annotate 'line', 6988
# string modifname: $S5
$P7 = $P3.'getname'()
null $S5
if_null $P7, __label_8
set $S5, $P7
__label_8:
.annotate 'line', 6989
# int nargs: $I1
$P7 = $P3.'numargs'()
set $I1, $P7
.annotate 'line', 6990
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
.annotate 'line', 6993
eq $I1, 1, __label_15
.annotate 'line', 6994
getattribute $P7, self, 'start'
'SyntaxError'('Wrong modifier args', $P7)
__label_15: # endif
.annotate 'line', 6995
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6996
# string argreg: $S6
$P8 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P8, __label_16
set $S6, $P8
__label_16:
.annotate 'line', 6997
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 7001
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 7002
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 7003
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 7004
$P7 = $P6.'emit_get'(__ARG_1)
# predefined push
push $P5, $P7
# }
__label_17: # for iteration
.annotate 'line', 7002
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 7006
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 7007
# string sep: $S7
set $S7, ''
.annotate 'line', 7008
iter $P10, $P5
set $P10, 0
__label_20: # for iteration
unless $P10 goto __label_21
shift $S8, $P10
# {
.annotate 'line', 7009
__ARG_1.'print'($S7, $S8)
.annotate 'line', 7010
set $S7, ', '
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 7012
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 7015
getattribute $P7, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P7)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 7020
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 7021
__ARG_1.'comment'('try: begin')
.annotate 'line', 7022
getattribute $P7, self, 'stry'
$P7.'emit'(__ARG_1)
.annotate 'line', 7023
__ARG_1.'comment'('try: end')
.annotate 'line', 7024
__ARG_1.'say'('pop_eh')
.annotate 'line', 7026
self.'annotate'(__ARG_1)
.annotate 'line', 7027
__ARG_1.'emitgoto'($S3)
.annotate 'line', 7029
__ARG_1.'comment'('catch')
.annotate 'line', 7030
__ARG_1.'emitlabel'($S2)
.annotate 'line', 7031
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 7032
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 7033
__ARG_1.'say'('pop_eh')
.annotate 'line', 7034
getattribute $P7, self, 'scatch'
$P7.'emit'(__ARG_1)
.annotate 'line', 7036
__ARG_1.'comment'('catch end')
.annotate 'line', 7037
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7038

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6923
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6925
addattribute $P0, 'stry'
.annotate 'line', 6926
addattribute $P0, 'modifiers'
.annotate 'line', 6927
addattribute $P0, 'exname'
.annotate 'line', 6928
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7049
# Body
# {
.annotate 'line', 7051
self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7052
setattribute self, 'name', __ARG_3
.annotate 'line', 7053
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7054
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 7055

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7045
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7047
addattribute $P0, 'name'
.annotate 'line', 7048
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7072
# Body
# {
.annotate 'line', 7074
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7075
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7076
'RequireIdentifier'($P1)
.annotate 'line', 7077
setattribute self, 'name', $P1
.annotate 'line', 7078
# var vdata: $P2
null $P2
.annotate 'line', 7079
# string reg: $S1
null $S1
.annotate 'line', 7081
$P1 = __ARG_2.'get'()
.annotate 'line', 7082
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 7084
box $P5, 1
setattribute self, 'typearray', $P5
.annotate 'line', 7085
getattribute $P4, self, 'name'
$P2 = self.'createvar'($P4, 'P')
.annotate 'line', 7086
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 7087
$P1 = __ARG_2.'get'()
.annotate 'line', 7088
$P4 = $P1.'isop'(']')
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 7090
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 7093
__ARG_2.'unget'($P1)
.annotate 'line', 7094
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P5
.annotate 'line', 7095
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7096
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 7101
box $P4, 0
setattribute self, 'typearray', $P4
.annotate 'line', 7102
getattribute $P4, self, 'name'
getattribute $P5, self, 't_reg'
$P2 = self.'createvar'($P4, $P5)
.annotate 'line', 7103
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 7104
$P4 = $P1.'isop'('=')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 7106
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P6
.annotate 'line', 7107
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 7111
box $P4, $S1
setattribute self, 'reg', $P4
.annotate 'line', 7112
$P4 = $P1.'isop'('=')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 7113
$P1 = __ARG_2.'get'()
.annotate 'line', 7114
$P4 = $P1.'isop'('[')
isfalse $I1, $P4
unless $I1 goto __label_6
.annotate 'line', 7115
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 7116
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P5
.annotate 'line', 7117
$P1 = __ARG_2.'get'()
.annotate 'line', 7118
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_7
# {
.annotate 'line', 7119
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 7120
# {
.annotate 'line', 7121
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 7122
getattribute $P4, self, 'init'
# predefined push
push $P4, $P3
# }
__label_10: # continue
.annotate 'line', 7123
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_9
if $P4 goto __label_8
__label_9: # enddo
.annotate 'line', 7124
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_11
.annotate 'line', 7125
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 7127
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 7129
__ARG_2.'unget'($P1)
# }
.annotate 'line', 7130

.end # parse


.sub 'optimize' :method

.annotate 'line', 7131
# Body
# {
.annotate 'line', 7133
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7134
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 7135
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 7136
if_null $P1, __label_1
# {
.annotate 'line', 7137
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 7138
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 7140
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 7142
.return(self)
# }
.annotate 'line', 7143

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7144
# Body
# {
.annotate 'line', 7146
self.'annotate'(__ARG_1)
.annotate 'line', 7147
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 7148
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 7149
# string reg: $S3
getattribute $P4, self, 'reg'
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 7150
# string t_reg: $S4
getattribute $P4, self, 't_reg'
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 7151
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7152
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
__ARG_1.'comment'($S10)
.annotate 'line', 7154
getattribute $P4, self, 'typearray'
set $I3, $P4
ne $I3, 0, __label_4
# {
.annotate 'line', 7155
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 7156
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 7158
# string itype: $S5
$P5 = $P1.'checkresult'()
null $S5
if_null $P5, __label_9
set $S5, $P5
__label_9:
.annotate 'line', 7159
ne $S5, $S4, __label_10
# {
.annotate 'line', 7160
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7161
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 7163
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 7166
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_15
# {
.annotate 'line', 7168
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 7171
# string ireg: $S6
null $S6
.annotate 'line', 7172
ne $S5, '', __label_17
.annotate 'line', 7173
$P4 = $P1.'emit_get'(__ARG_1)
set $S6, $P4
goto __label_18
__label_17: # else
# {
.annotate 'line', 7175
$P5 = self.'tempreg'($S5)
set $S6, $P5
.annotate 'line', 7176
$P1.'emit'(__ARG_1, $S6)
# }
__label_18: # endif
.annotate 'line', 7178
iseq $I3, $S4, 'S'
unless $I3 goto __label_21
iseq $I3, $S5, 'P'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 7179
# string auxlabel: $S7
$P4 = self.'genlabel'()
null $S7
if_null $P4, __label_22
set $S7, $P4
__label_22:
.annotate 'line', 7180
__ARG_1.'emitnull'($S3)
.annotate 'line', 7181
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 7182
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 7183
__ARG_1.'emitlabel'($S7)
# }
goto __label_20
__label_19: # else
.annotate 'line', 7186
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
.annotate 'line', 7192
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 7193
if_null $P2, __label_23
# {
.annotate 'line', 7195
# string regsize: $S8
$P4 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P4, __label_25
set $S8, $P4
__label_25:
.annotate 'line', 7196
getattribute $P4, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P4, "Array'], ", $S8)
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 7200
getattribute $P4, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P4, "Array']")
# }
__label_24: # endif
.annotate 'line', 7202
if_null $P1, __label_26
# {
.annotate 'line', 7203
# string itemreg: $S9
$P4 = self.'tempreg'($S4)
null $S9
if_null $P4, __label_27
set $S9, $P4
__label_27:
.annotate 'line', 7204
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 7205
unless_null $P2, __label_28
# {
.annotate 'line', 7206
le $I1, 0, __label_29
# {
.annotate 'line', 7208
__ARG_1.'emitset'($S3, $I1)
# }
__label_29: # endif
# }
__label_28: # endif
.annotate 'line', 7211
# int i: $I2
null $I2
.annotate 'line', 7212
iter $P6, $P1
set $P6, 0
__label_30: # for iteration
unless $P6 goto __label_31
shift $P3, $P6
# {
.annotate 'line', 7213
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 7214
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 7215
inc $I2
# }
goto __label_30
__label_31: # endfor
# }
__label_26: # endif
# }
__label_5: # endif
# }
.annotate 'line', 7219

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7220
# Body
# {
.annotate 'line', 7222
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 7223

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 7062
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7064
addattribute $P0, 'name'
.annotate 'line', 7065
addattribute $P0, 't_reg'
.annotate 'line', 7066
addattribute $P0, 't_name'
.annotate 'line', 7067
addattribute $P0, 't_array'
.annotate 'line', 7068
addattribute $P0, 'reg'
.annotate 'line', 7069
addattribute $P0, 'typearray'
.annotate 'line', 7070
addattribute $P0, 'size'
.annotate 'line', 7071
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7226
# Body
# {
.annotate 'line', 7228
# var next: $P1
null $P1
.annotate 'line', 7229
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 7230
# {
.annotate 'line', 7231
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7232
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 7233
$P1 = __ARG_3.'get'()
# }
__label_2: # continue
.annotate 'line', 7234
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 7235
'RequireOp'(';', $P1)
.annotate 'line', 7236
.return($P2)
# }
.annotate 'line', 7237

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7249
# Body
# {
.annotate 'line', 7252
self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7253
box $P1, __ARG_3
setattribute self, 'type', $P1
.annotate 'line', 7254
setattribute self, 'name', __ARG_4
.annotate 'line', 7255
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7256

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 7257
# Body
# {
.annotate 'line', 7259
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 7260
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 7261
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7262
$P1 = $P1.'optimize'()
.annotate 'line', 7263
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7265
getattribute $P4, self, 'start'
.annotate 'line', 7264
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 7267
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7268
setattribute self, 'value', $P1
.annotate 'line', 7269
.return(self)
# }
.annotate 'line', 7270

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 7271
# Body
# {
.annotate 'line', 7273
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7274

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7275
# Body
# {
.annotate 'line', 7277
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7278
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
__ARG_1.'comment'($S2)
# }
.annotate 'line', 7279

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7243
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7245
addattribute $P0, 'type'
.annotate 'line', 7246
addattribute $P0, 'name'
.annotate 'line', 7247
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7282
# Body
# {
.annotate 'line', 7284
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7285
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 7286
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7287
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 7289
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 7290
# {
.annotate 'line', 7291
$P1 = __ARG_2.'get'()
.annotate 'line', 7292
# var name: $P3
set $P3, $P1
.annotate 'line', 7293
'ExpectOp'('=', __ARG_2)
.annotate 'line', 7294
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7296
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 7295
$P2 = 'addtomulti'($P2, $P5)
# }
__label_6: # continue
.annotate 'line', 7297
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_5
if $P5 goto __label_4
__label_5: # enddo
.annotate 'line', 7298
.return($P2)
# }
.annotate 'line', 7299

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 7308
# Body
# {
.annotate 'line', 7310
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7311
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7312
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 7313
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 7314
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 7316
'RequireOp'(';', $P1)
# }
.annotate 'line', 7317

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 7318
# Body
# {
.annotate 'line', 7320
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 7321
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 7322
.return(self)
# }
.annotate 'line', 7323

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 7324
# Body
# {
.annotate 'line', 7326
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7327

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7328
# Body
# {
.annotate 'line', 7330
self.'annotate'(__ARG_1)
.annotate 'line', 7331
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7332
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 7333
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7334
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
__ARG_1.'comment'($S5)
.annotate 'line', 7335
if_null $P1, __label_2
.annotate 'line', 7336
$P2 = $P1.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
.annotate 'line', 7337
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 7338
if_null $P1, __label_4
# {
.annotate 'line', 7339
# string type: $S3
$P2 = $P1.'checkresult'()
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 7340
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
.annotate 'line', 7342
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 7343
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 7345
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 7350
# string value: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_18
set $S4, $P2
__label_18:
.annotate 'line', 7351
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 7354
getattribute $P3, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P3)
__label_8: # default
.annotate 'line', 7356
getattribute $P4, self, 'name'
'SyntaxError'("Invalid var initializer", $P4)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 7360
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 7361

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7305
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 7307
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7366
# Body
# {
.annotate 'line', 7368
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7369
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7370

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7371
# Body
# {
.annotate 'line', 7373
self.'annotate'(__ARG_1)
.annotate 'line', 7374
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7375
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7376
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
__ARG_1.'comment'($S3)
.annotate 'line', 7377
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7378

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7364
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7385
# Body
# {
.annotate 'line', 7387
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7388
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 7389
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7390
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7391

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 7392
# Body
# {
.annotate 'line', 7394
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 7395
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7396

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7397
# Body
# {
.annotate 'line', 7399
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7400
self.'annotate'(__ARG_1)
.annotate 'line', 7401
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7402
# string reg: $S3
getattribute $P1, self, 'reg'
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 7403
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
__ARG_1.'comment'($S4)
.annotate 'line', 7404
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7405

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7381
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 7383
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7408
# Body
# {
.annotate 'line', 7410
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7411
'RequireIdentifier'($P1)
.annotate 'line', 7412
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7413
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7414
$P2 = __ARG_2.'get'()
.annotate 'line', 7415
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 7416
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 7418
__ARG_2.'unget'($P2)
.annotate 'line', 7419
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
.annotate 'line', 7423
__ARG_2.'unget'($P2)
.annotate 'line', 7424
new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P3, $P4
.return($P3)
# }
__label_1: # endif
# }
.annotate 'line', 7426

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7428
# Body
# {
.annotate 'line', 7430
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7431
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7432
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 7433
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7434

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7442
# Body
# {
.annotate 'line', 7444
box $P1, 'S'
setattribute self, 't_reg', $P1
.annotate 'line', 7445
box $P1, 'string'
setattribute self, 't_name', $P1
.annotate 'line', 7446
box $P1, 'String'
setattribute self, 't_array', $P1
.annotate 'line', 7447
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7448

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7449
# Body
# {
.annotate 'line', 7451
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7452

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7440
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7455
# Body
# {
.annotate 'line', 7457
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7458

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7460
# Body
# {
.annotate 'line', 7462
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 7463
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7464

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7472
# Body
# {
.annotate 'line', 7474
box $P1, 'I'
setattribute self, 't_reg', $P1
.annotate 'line', 7475
box $P1, 'int'
setattribute self, 't_name', $P1
.annotate 'line', 7476
box $P1, 'Integer'
setattribute self, 't_array', $P1
.annotate 'line', 7477
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7478

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7479
# Body
# {
.annotate 'line', 7481
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7482

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7470
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7485
# Body
# {
.annotate 'line', 7487
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7488

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7490
# Body
# {
.annotate 'line', 7492
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 7493
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7494

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7502
# Body
# {
.annotate 'line', 7504
box $P1, 'N'
setattribute self, 't_reg', $P1
.annotate 'line', 7506
box $P1, 'float'
setattribute self, 't_name', $P1
.annotate 'line', 7507
box $P1, 'Float'
setattribute self, 't_array', $P1
.annotate 'line', 7508
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7509

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7510
# Body
# {
.annotate 'line', 7512
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7513

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7500
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7516
# Body
# {
.annotate 'line', 7518
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7519

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7521
# Body
# {
.annotate 'line', 7523
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 7524
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7525

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7536
# Body
# {
.annotate 'line', 7538
self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7539
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 7540
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 7541
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7542
$P1 = __ARG_2.'get'()
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 7543
__ARG_2.'unget'($P1)
.annotate 'line', 7544
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7545
unless_null $P2, __label_2
.annotate 'line', 7546
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 7547
getattribute $P3, self, 'statements'
# predefined push
push $P3, $P2
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7549
setattribute self, 'end', $P1
# }
.annotate 'line', 7550

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7551
# Body
# {
.annotate 'line', 7553
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7554
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7555
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7556
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7557
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 7558
.return($S2)
# }
.annotate 'line', 7559

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7560
# Body
# {
.annotate 'line', 7562
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7563
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7564
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7565
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7566
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 7567
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 7568
$P1[$S1] = $S3
.annotate 'line', 7569
.return($S3)
# }
.annotate 'line', 7570

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7571
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7572
# Body
# {
.annotate 'line', 7574
__ARG_1.'comment'('{')
.annotate 'line', 7575
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 7576
$P1.'emit'(__ARG_1)
.annotate 'line', 7577
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 7579
__ARG_1.'comment'('}')
# }
.annotate 'line', 7580

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7531
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 7533
addattribute $P0, 'end'
.annotate 'line', 7534
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7593
# Body
# {
.annotate 'line', 7596
box $P3, 1
setattribute self, 'nreg', $P3
.annotate 'line', 7597
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7598
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7599
setattribute self, 'tempreg', $P1
.annotate 'line', 7600
setattribute self, 'freereg', $P2
# }
.annotate 'line', 7601

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7602
# Body
# {
.annotate 'line', 7604
box $P1, __ARG_1
setattribute self, 'type', $P1
.annotate 'line', 7605
.return(self)
# }
.annotate 'line', 7606

.end # settype


.sub 'createreg' :method

.annotate 'line', 7607
# Body
# {
.annotate 'line', 7609
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7610
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7611
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
.annotate 'line', 7612
assign $P1, $I1
.annotate 'line', 7613
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 7614
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7615
.return($S1)
# }
.annotate 'line', 7616

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7617
# Body
# {
.annotate 'line', 7619
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7620
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7621
# string reg: $S1
null $S1
.annotate 'line', 7622
# predefined elements
elements $I1, $P1
le $I1, 0, __label_0
.annotate 'line', 7623
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
.annotate 'line', 7625
$P4 = self.'createreg'()
set $S1, $P4
__label_1: # endif
.annotate 'line', 7626
# predefined push
push $P2, $S1
.annotate 'line', 7627
.return($S1)
# }
.annotate 'line', 7628

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7629
# Body
# {
.annotate 'line', 7631
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7632
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7633
# int n: $I1
# predefined elements
elements $I1, $P2
# for loop
.annotate 'line', 7634
# int i: $I2
sub $I2, $I1, 1
__label_2: # for condition
lt $I2, 0, __label_1
# {
.annotate 'line', 7635
# string s: $S1
$S1 = $P2[$I2]
.annotate 'line', 7636
# predefined push
push $P1, $S1
# }
__label_0: # for iteration
.annotate 'line', 7634
dec $I2
goto __label_2
__label_1: # for end
.annotate 'line', 7638
assign $P2, 0
# }
.annotate 'line', 7639

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7589
addattribute $P0, 'type'
.annotate 'line', 7590
addattribute $P0, 'nreg'
.annotate 'line', 7591
addattribute $P0, 'tempreg'
.annotate 'line', 7592
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7663
# Body
# {
.annotate 'line', 7665
self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7666
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
.annotate 'line', 7667
box $P1, 0
setattribute self, 'nlabel', $P1
.annotate 'line', 7668
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 7669
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 7670
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('S')
setattribute self, 'regstS', $P2
.annotate 'line', 7671
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('P')
setattribute self, 'regstP', $P2
# }
.annotate 'line', 7672

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7674
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7675
# Body
# {
.annotate 'line', 7678
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7679
unless_null $P1, __label_0
# {
.annotate 'line', 7680
$P1 = self.'generatesubid'()
.annotate 'line', 7681
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7683
.return($P1)
# }
.annotate 'line', 7684

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7686
# Body
# {
.annotate 'line', 7688
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7689
.return($I1)
# }
.annotate 'line', 7690

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7691
# Body
# {
.annotate 'line', 7693
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7694
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7695
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7696
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7697
# {
.annotate 'line', 7698
$P2 = __ARG_1.'get'()
.annotate 'line', 7699
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7700
eq $S1, '', __label_5
.annotate 'line', 7701
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
.annotate 'line', 7703
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7704
# string argname: $S2
# predefined string
$P5 = self.'getparamnum'()
set $S4, $P5
concat $S2, '__ARG_', $S4
.annotate 'line', 7705
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7707
# string varname: $S3
set $P5, $P2
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 7708
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7709
$P3['name'] = $S3
.annotate 'line', 7710
$P2 = __ARG_1.'get'()
.annotate 'line', 7711
$P5 = $P2.'isop'('[')
if_null $P5, __label_8
unless $P5 goto __label_8
# {
.annotate 'line', 7712
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7713
$P3['modifiers'] = $P4
.annotate 'line', 7714
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7716
# predefined push
push $P1, $P3
# }
__label_3: # continue
.annotate 'line', 7717
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 7718
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_9
.annotate 'line', 7719
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7721

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7723
# Body
# {
.annotate 'line', 7725
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7726
unless_null $P1, __label_0
.annotate 'line', 7727
root_new $P3, ['parrot';'ResizablePMCArray']
push $P3, __ARG_1
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7729
# predefined push
push $P1, __ARG_1
__label_1: # endif
# }
.annotate 'line', 7730

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7732
# Body
# {
.annotate 'line', 7734
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7735
.return(self)
# }
.annotate 'line', 7736

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7738
# Body
# {
.annotate 'line', 7740
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7741
unless_null $P1, __label_0
# {
.annotate 'line', 7742
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7743
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7745
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7746

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7747
# Body
# {
.annotate 'line', 7749
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7750
unless_null $P1, __label_0
# {
.annotate 'line', 7751
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7752
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7754
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7755

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7756
# Body
# {
.annotate 'line', 7760
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7761
# string lexname: $S1
null $S1
.annotate 'line', 7762
if_null $P1, __label_0
.annotate 'line', 7763
set $S1, $P1
goto __label_1
__label_0: # else
# {
.annotate 'line', 7765
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7766
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7767
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7768
self.'setlex'($S1, $S2)
.annotate 'line', 7769
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7771
.return($S1)
# }
.annotate 'line', 7772

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7774
# Body
# {
.annotate 'line', 7776
# var store: $P1
null $P1
.annotate 'line', 7777
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
.annotate 'line', 7779
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7781
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7783
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7785
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7787
concat $S4, 'Invalid type in createreg: ', __ARG_1
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7789
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7790
.return($S1)
# }
.annotate 'line', 7791

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7792
# Body
# {
.annotate 'line', 7794
# var store: $P1
null $P1
.annotate 'line', 7795
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
.annotate 'line', 7797
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7799
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7801
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7803
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7805
concat $S4, "Invalid type '", __ARG_1
concat $S4, $S4, "' in tempreg"
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7807
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7808
.return($S1)
# }
.annotate 'line', 7809

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7810
# Body
# {
.annotate 'line', 7812
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
.annotate 'line', 7813
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7814

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7815
# Body
# {
.annotate 'line', 7817
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7818
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7819
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
.annotate 'line', 7820
assign $P1, $I1
.annotate 'line', 7821
.return($S1)
# }
.annotate 'line', 7822

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7823
# Body
# {
.annotate 'line', 7825
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7826

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7827
# Body
# {
.annotate 'line', 7829
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7830

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7832
# Body
# {
.annotate 'line', 7834
# string name: $S1
getattribute $P20, self, 'name'
null $S1
if_null $P20, __label_0
set $S1, $P20
__label_0:
.annotate 'line', 7835
__ARG_1.'say'()
.annotate 'line', 7836
__ARG_1.'print'(".sub ")
.annotate 'line', 7837
$P20 = self.'isanonymous'()
if_null $P20, __label_1
unless $P20 goto __label_1
.annotate 'line', 7838
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7840
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7841
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7842
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7843
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7844
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7845
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7846
if_null $P2, __label_5
.annotate 'line', 7847
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7851
$P20 = self.'ismethod'()
if_null $P20, __label_6
unless $P20 goto __label_6
.annotate 'line', 7852
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7853
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7854
if_null $P3, __label_7
# {
.annotate 'line', 7855
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7856
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7857
# int nargmods: $I1
$P20 = $P5.'numargs'()
set $I1, $P20
.annotate 'line', 7858
$P20 = $P5.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 7859
le $I1, 0, __label_11
# {
.annotate 'line', 7860
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7861
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7862
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7863
$P20 = $P6.'isstringliteral'()
isfalse $I5, $P20
unless $I5 goto __label_15
.annotate 'line', 7864
getattribute $P21, $P6, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_15: # endif
.annotate 'line', 7865
$P20 = $P6.'getPirString'()
__ARG_1.'print'($P20)
# }
__label_12: # for iteration
.annotate 'line', 7861
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7867
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
.annotate 'line', 7872
ne $S1, 'main', __label_16
.annotate 'line', 7873
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7875
__ARG_1.'say'()
.annotate 'line', 7877
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7878
# var param: $P8
null $P8
.annotate 'line', 7879
# string paramname: $S2
null $S2
.annotate 'line', 7880
# var a: $P9
null $P9
.annotate 'line', 7882
iter $P23, $P7
set $P23, 0
__label_17: # for iteration
unless $P23 goto __label_18
shift $P8, $P23
# {
.annotate 'line', 7883
$S2 = $P8['name']
.annotate 'line', 7884
$P9 = self.'getvar'($S2)
.annotate 'line', 7885
# string ptype: $S3
$P21 = $P9.'gettype'()
$P20 = 'typetopirname'($P21)
null $S3
if_null $P20, __label_19
set $S3, $P20
__label_19:
.annotate 'line', 7886
$P20 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7887
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7888
if_null $P10, __label_20
# {
.annotate 'line', 7889
# var named: $P11
null $P11
.annotate 'line', 7890
# var slurpy: $P12
null $P12
.annotate 'line', 7891
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7892
iter $P24, $P13
set $P24, 0
__label_21: # for iteration
unless $P24 goto __label_22
shift $P14, $P24
# {
.annotate 'line', 7893
# string modname: $S4
$P20 = $P14.'getname'()
null $S4
if_null $P20, __label_23
set $S4, $P20
__label_23:
.annotate 'line', 7894
set $S8, $S4
set $S9, 'named'
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
.annotate 'line', 7896
set $P11, $P14
goto __label_24 # break
__label_27: # case
.annotate 'line', 7899
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 7902
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7905
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7910
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7913
if_null $P11, __label_31
# {
.annotate 'line', 7914
# string setname: $S5
null $S5
.annotate 'line', 7915
# int nargs: $I3
$P20 = $P11.'numargs'()
set $I3, $P20
.annotate 'line', 7916
set $I5, $I3
null $I6
if $I5 == $I6 goto __label_35
set $I6, 1
if $I5 == $I6 goto __label_36
goto __label_34
# switch
__label_35: # case
.annotate 'line', 7918
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7921
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7922
$P20 = $P15.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_37
.annotate 'line', 7923
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_37: # endif
.annotate 'line', 7924
$P25 = $P15.'getPirString'()
set $S5, $P25
goto __label_33 # break
__label_34: # default
.annotate 'line', 7927
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_33: # switch end
.annotate 'line', 7929
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7931
if_null $P12, __label_38
# {
.annotate 'line', 7932
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7936
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7938
__ARG_1.'say'()
.annotate 'line', 7939
getattribute $P20, self, 'start'
__ARG_1.'annotate'($P20)
.annotate 'line', 7942
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7943
if_null $P16, __label_39
# {
.annotate 'line', 7945
iter $P27, $P16
set $P27, 0
__label_40: # for iteration
unless $P27 goto __label_41
shift $S6, $P27
.annotate 'line', 7946
$P20 = $P16[$S6]
__ARG_1.'say'(".lex '", $P20, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7949
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7950
if_null $P16, __label_42
# {
.annotate 'line', 7952
iter $P28, $P16
set $P28, 0
__label_43: # for iteration
unless $P28 goto __label_44
shift $S7, $P28
.annotate 'line', 7953
$P20 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P20, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7956
# var body: $P17
getattribute $P17, self, 'body'
.annotate 'line', 7957
$P20 = $P17.'isempty'()
if_null $P20, __label_45
unless $P20 goto __label_45
.annotate 'line', 7958
__ARG_1.'comment'('Empty body')
goto __label_46
__label_45: # else
# {
.annotate 'line', 7960
__ARG_1.'comment'('Body')
.annotate 'line', 7961
$P17.'emit'(__ARG_1)
.annotate 'line', 7962
$P20 = $P17.'getend'()
__ARG_1.'annotate'($P20)
# }
__label_46: # endif
.annotate 'line', 7964
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7967
# var localfun: $P18
getattribute $P18, self, 'localfun'
.annotate 'line', 7968
if_null $P18, __label_47
# {
# for loop
.annotate 'line', 7969
# int ifn: $I4
null $I4
__label_50: # for condition
# predefined elements
elements $I5, $P18
ge $I4, $I5, __label_49
# {
.annotate 'line', 7970
# var fn: $P19
$P19 = $P18[$I4]
.annotate 'line', 7971
$P19.'emit'(__ARG_1)
# }
__label_48: # for iteration
.annotate 'line', 7969
inc $I4
goto __label_50
__label_49: # for end
# }
__label_47: # endif
# }
.annotate 'line', 7974

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7646
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7648
addattribute $P0, 'name'
.annotate 'line', 7649
addattribute $P0, 'subid'
.annotate 'line', 7650
addattribute $P0, 'modifiers'
.annotate 'line', 7651
addattribute $P0, 'params'
.annotate 'line', 7652
addattribute $P0, 'body'
.annotate 'line', 7653
addattribute $P0, 'regstI'
.annotate 'line', 7654
addattribute $P0, 'regstN'
.annotate 'line', 7655
addattribute $P0, 'regstS'
.annotate 'line', 7656
addattribute $P0, 'regstP'
.annotate 'line', 7657
addattribute $P0, 'nlabel'
.annotate 'line', 7658
addattribute $P0, 'localfun'
.annotate 'line', 7659
addattribute $P0, 'lexicals'
.annotate 'line', 7660
addattribute $P0, 'usedlexicals'
.annotate 'line', 7661
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7986
# Body
# {
.annotate 'line', 7988
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7989
box $P1, 0
setattribute self, 'paramnum', $P1
.annotate 'line', 7990
box $P1, 0
setattribute self, 'lexnum', $P1
.annotate 'line', 7991
self.'parse'(__ARG_2)
# }
.annotate 'line', 7992

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7994
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7995
# Body
# {
.annotate 'line', 7998
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7999
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 8000
assign $P1, $I1
.annotate 'line', 8001
.return($I1)
# }
.annotate 'line', 8002

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 8003
# Body
# {
.annotate 'line', 8006
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 8007
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 8008
assign $P1, $I1
.annotate 'line', 8009
.return($I1)
# }
.annotate 'line', 8010

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 8011
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8013
# Body
# {
.annotate 'line', 8015
# var name: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 8016
setattribute self, 'name', $P1
.annotate 'line', 8017
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 8018
$P5 = $P2.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 8019
# var modifiers: $P3
new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 8020
setattribute self, 'modifiers', $P3
.annotate 'line', 8021
$P2 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 8023
'RequireOp'('(', $P2)
.annotate 'line', 8024
self.'parse_parameters'(__ARG_1)
.annotate 'line', 8026
# var fullname: $P4
getattribute $P6, self, 'owner'
$P5 = $P6.'getpath'()
# predefined clone
clone $P4, $P5
.annotate 'line', 8027
$P5 = $P1.'getidentifier'()
# predefined push
push $P4, $P5
.annotate 'line', 8029
new $P6, [ 'StringLiteral' ]
.annotate 'line', 8030
new $P8, [ 'TokenQuoted' ]
getattribute $P9, $P1, 'file'
getattribute $P10, $P1, 'line'
# predefined join
join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
set $P7, $P8
$P6.'StringLiteral'(self, $P7)
set $P5, $P6
.annotate 'line', 8028
self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 8033
$P2 = __ARG_1.'get'()
.annotate 'line', 8034
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 8035
'ExpectedOp'('{', $P2)
__label_1: # endif
.annotate 'line', 8036
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 8037
.return(self)
# }
.annotate 'line', 8038

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7981
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7983
addattribute $P0, 'paramnum'
.annotate 'line', 7984
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8047
# Body
# {
.annotate 'line', 8049
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8050
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 8051
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 8052
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 8053
setattribute self, 'name', $P1
.annotate 'line', 8054
self.'parse_parameters'(__ARG_2)
.annotate 'line', 8055
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 8056
'RequireOp'('{', $P2)
.annotate 'line', 8057
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
set $P4, $P5
setattribute self, 'body', $P4
.annotate 'line', 8058
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8059

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 8060
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 8061
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 8062
# Body
# {
.annotate 'line', 8064
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 8065

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 8066
# Body
# {
.annotate 'line', 8069
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8070

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 8071
# Body
# {
.annotate 'line', 8074
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8075

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 8076
# Body
# {
.annotate 'line', 8078
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8079
unless_null $P1, __label_0
# {
.annotate 'line', 8082
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8083
unless_null $P1, __label_1
# {
.annotate 'line', 8085
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8086
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 8087
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 8088
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 8089
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8090
# string reg: $S2
$P6 = $P1.'getreg'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 8091
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 8095
$P6 = $P1.'gettype'()
set $S5, $P6
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P7 = $P1.'isconst'()
isfalse $I2, $P7
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 8096
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 8097
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 8098
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 8099
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 8100
$P6 = $P4.'same_scope_as'($P5)
if_null $P6, __label_10
unless $P6 goto __label_10
# {
.annotate 'line', 8101
# string lexname: $S3
$P7 = $P3.'makelexical'($P1)
null $S3
if_null $P7, __label_11
set $S3, $P7
__label_11:
.annotate 'line', 8102
# int flags: $I1
$I2 = $P1.'getflags'()
bor $I1, $I2, 2
.annotate 'line', 8103
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8104
box $P6, $S3
setattribute $P1, 'lexname', $P6
.annotate 'line', 8105
# string reg: $S4
$P6 = $P1.'getreg'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 8106
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
.annotate 'line', 8111
isnull $I2, $P1
not $I2
unless $I2 goto __label_14
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_14:
unless $I2 goto __label_13
.annotate 'line', 8112
'InternalError'('Incorrect data for variable in LocalFunction')
__label_13: # endif
.annotate 'line', 8113
.return($P1)
# }
.annotate 'line', 8114

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8045
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8123
# Body
# {
.annotate 'line', 8125
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8126

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 8127
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8121
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

.annotate 'line', 8142
# Body
# {
.annotate 'line', 8144
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8145

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 8146
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 8148
# Body
# {
.annotate 'line', 8150
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 8151

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8140
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8157
# Body
# {
.annotate 'line', 8159
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8160
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8161

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 8162
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8164
# Body
# {
.annotate 'line', 8166
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 8167
__ARG_1.'print'($S1)
# }
.annotate 'line', 8168

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8154
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8156
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8175
# Body
# {
.annotate 'line', 8177
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8178
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8179
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 8180
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 8181
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 8182
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
.annotate 'line', 8183
$P2 = __ARG_1.'get'()
.annotate 'line', 8184
$P3 = $P2.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 8185
$P4 = $P2.'checkop'()
set $S1, $P4
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 8187
box $P5, 1
setattribute self, 'hll', $P5
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 8191
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 8193
# {
.annotate 'line', 8194
$P2 = __ARG_1.'get'()
.annotate 'line', 8195
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_9
.annotate 'line', 8196
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 8197
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
# }
__label_8: # continue
.annotate 'line', 8198
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'(',')
if_null $P3, __label_7
if $P3 goto __label_6
__label_7: # enddo
.annotate 'line', 8199
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 8201
setattribute self, 'key', $P1
# }
.annotate 'line', 8202

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 8203
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 8204
# Body
# {
# predefined int
.annotate 'line', 8206
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 8207

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8209
# Body
# {
.annotate 'line', 8211
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 8212

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8171
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8173
addattribute $P0, 'key'
.annotate 'line', 8174
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8218
# Body
# {
.annotate 'line', 8220
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8221
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
push $P1, $P3
.annotate 'line', 8222
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 8223
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 8224
$P2 = __ARG_1.'get'()
.annotate 'line', 8225
# predefined string
set $S1, $P2
# predefined push
push $P1, $S1
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 8227
__ARG_1.'unget'($P2)
.annotate 'line', 8228
setattribute self, 'key', $P1
# }
.annotate 'line', 8229

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 8230
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 8232
# Body
# {
.annotate 'line', 8234
# var key: $P1
getattribute $P1, self, 'key'
.annotate 'line', 8235
$P2 = $P1[-1]
.return($P2)
# }
.annotate 'line', 8236

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8238
# Body
# {
.annotate 'line', 8240
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8241
unless_null $P1, __label_0
# {
.annotate 'line', 8242
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8243
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 8244
getattribute $P3, self, 'key'
$P2 = 'getparrotkey'($P3)
__ARG_1.'print'($P2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 8246
$P2 = $P1.'getclasskey'()
__ARG_1.'print'($P2)
__label_1: # endif
# }
.annotate 'line', 8247

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8215
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8217
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8250
# Body
# {
.annotate 'line', 8252
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 8253
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 8254
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 8255
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 8256
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 8257
$P2 = $P1.'isidentifier'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8258
new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_2: # endif
.annotate 'line', 8259
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8260

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8276
# Body
# {
.annotate 'line', 8278
self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8279
setattribute self, 'parent', __ARG_3
.annotate 'line', 8280
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8281
setattribute self, 'functions', $P1
.annotate 'line', 8282
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8283
setattribute self, 'members', $P2
.annotate 'line', 8284
root_new $P13, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P13
.annotate 'line', 8285
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8286
setattribute self, 'constants', $P3
.annotate 'line', 8288
# var name: $P4
$P4 = __ARG_2.'get'()
.annotate 'line', 8289
setattribute self, 'name', $P4
.annotate 'line', 8290
# var classns: $P5
$P12 = __ARG_3.'getpath'()
# predefined clone
clone $P5, $P12
.annotate 'line', 8291
getattribute $P12, self, 'name'
# predefined push
push $P5, $P12
.annotate 'line', 8292
setattribute self, 'classns', $P5
.annotate 'line', 8294
# var t: $P6
$P6 = __ARG_2.'get'()
.annotate 'line', 8295
$P12 = $P6.'isop'(':')
if_null $P12, __label_0
unless $P12 goto __label_0
# {
.annotate 'line', 8296
# var bases: $P7
getattribute $P7, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 8297
# {
.annotate 'line', 8298
# var base: $P8
$P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8299
# predefined push
push $P7, $P8
.annotate 'line', 8300
$P6 = __ARG_2.'get'()
.annotate 'line', 8301
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
.annotate 'line', 8304
'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8305
$P6 = __ARG_2.'get'()
__label_6: # for condition
$P12 = $P6.'isop'('}')
isfalse $I1, $P12
unless $I1 goto __label_5
# {
.annotate 'line', 8306
$P13 = $P6.'checkkeyword'()
set $S1, $P13
set $S2, 'function'
if $S1 == $S2 goto __label_9
set $S2, 'var'
if $S1 == $S2 goto __label_10
set $S2, 'const'
if $S1 == $S2 goto __label_11
goto __label_8
# switch
__label_9: # case
.annotate 'line', 8308
# var f: $P9
new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8309
# predefined push
push $P1, $P9
goto __label_7 # break
__label_10: # case
.annotate 'line', 8312
# var name: $P10
$P10 = __ARG_2.'get'()
.annotate 'line', 8313
$P14 = $P10.'isidentifier'()
isfalse $I2, $P14
unless $I2 goto __label_12
.annotate 'line', 8314
'Expected'("member identifier", $P10)
__label_12: # endif
.annotate 'line', 8315
# predefined push
push $P2, $P10
.annotate 'line', 8316
$P6 = __ARG_2.'get'()
.annotate 'line', 8317
$P15 = $P6.'isop'(';')
isfalse $I3, $P15
unless $I3 goto __label_13
.annotate 'line', 8318
'Expected'("';' in member declaration", $P6)
__label_13: # endif
goto __label_7 # break
__label_11: # case
.annotate 'line', 8321
# var cst: $P11
$P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8322
# predefined push
push $P3, $P11
goto __label_7 # break
__label_8: # default
.annotate 'line', 8325
'SyntaxError'("Unexpected item in class", $P6)
__label_7: # switch end
# }
__label_4: # for iteration
.annotate 'line', 8305
$P6 = __ARG_2.'get'()
goto __label_6
__label_5: # for end
# }
.annotate 'line', 8328

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 8329
# Body
# {
.annotate 'line', 8331
getattribute $P1, self, 'classns'
.return($P1)
# }
.annotate 'line', 8332

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 8333
# Body
# {
.annotate 'line', 8335
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8336

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8337
# Body
# {
.annotate 'line', 8339
getattribute $P1, self, 'parent'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8340

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8341
# Body
# {
.annotate 'line', 8343
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8344

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8345
# Body
# {
.annotate 'line', 8347
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8348

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8349
# Body
# {
.annotate 'line', 8351
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8352

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 8353
# Body
# {
.annotate 'line', 8355
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 8356
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 8357
.return(self)
# }
.annotate 'line', 8358

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 8359
# Body
# {
.annotate 'line', 8361
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8362

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8363
# Body
# {
.annotate 'line', 8365
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 8366
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 8367
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 8368
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 8370
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8372
$P5 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P5)
.annotate 'line', 8373
# int n: $I1
set $I1, 1
.annotate 'line', 8374
getattribute $P5, self, 'bases'
iter $P7, $P5
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8375
$P3.'annotate'(__ARG_1)
.annotate 'line', 8376
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 8377
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 8378
getattribute $P5, self, 'parent'
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8379
__ARG_1.'say'()
.annotate 'line', 8380
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 8382
getattribute $P5, self, 'members'
iter $P8, $P5
set $P8, 0
__label_4: # for iteration
unless $P8 goto __label_5
shift $P4, $P8
# {
.annotate 'line', 8383
__ARG_1.'annotate'($P4)
.annotate 'line', 8384
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 8387
__ARG_1.'say'('.end')
# }
.annotate 'line', 8388

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8266
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
get_class $P2, [ 'VarContainer' ]
addparent $P0, $P2
.annotate 'line', 8268
addattribute $P0, 'parent'
.annotate 'line', 8269
addattribute $P0, 'name'
.annotate 'line', 8270
addattribute $P0, 'bases'
.annotate 'line', 8271
addattribute $P0, 'constants'
.annotate 'line', 8272
addattribute $P0, 'functions'
.annotate 'line', 8273
addattribute $P0, 'members'
.annotate 'line', 8274
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8395
# Body
# {
.annotate 'line', 8397
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8398
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 8399
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 8400
'ExpectOp'(';', __ARG_2)
.annotate 'line', 8401
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 8402
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8407
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 8408
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 8409
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 8410
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 8411
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 8412
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_4
push_eh $P9
# try: begin
# {
.annotate 'line', 8413
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 8414
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 8412
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
.annotate 'line', 8419
$P9 = $P5.'is_closed'()
if_null $P9, __label_6
unless $P9 goto __label_6
.annotate 'line', 8420
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 8425
load_bytecode 'PGE.pbc'
.annotate 'line', 8426
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8427
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8429
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
.annotate 'line', 8430
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8431
$P8 = $P7($S4)
.annotate 'line', 8432
# predefined elements
elements $I2, $P8
le $I2, 0, __label_11
# {
.annotate 'line', 8433
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 8434
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 8435
# int ivalue: $I1
null $I1
.annotate 'line', 8436
# predefined substr
substr $S7, $S6, 0, 2
iseq $I2, $S7, '0x'
if $I2 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I2, $S8, '0X'
__label_14:
unless $I2 goto __label_12
.annotate 'line', 8437
# predefined substr
substr $S9, $S6, 2
box $P11, $S9
$P9 = $P11.'to_int'(16)
set $I1, $P9
goto __label_13
__label_12: # else
.annotate 'line', 8439
set $I1, $S6
__label_13: # endif
.annotate 'line', 8442
new $P12, [ 'TokenInteger' ]
getattribute $P13, __ARG_1, 'file'
getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
set $P11, $P12
.annotate 'line', 8441
$P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8440
__ARG_3.'createconst'($S5, 'I', $P9, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 8429
$P9 = $P5.'readline'()
set $S4, $P9
goto __label_9
__label_8: # for end
.annotate 'line', 8446
$P5.'close'()
# }
.annotate 'line', 8447

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8460
# Body
# {
.annotate 'line', 8462
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 8463
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 8464
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P2
.annotate 'line', 8465
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P2
# }
.annotate 'line', 8466

.end # init


.sub 'getpath' :method

.annotate 'line', 8467
# Body
# {
.annotate 'line', 8469
getattribute $P1, self, 'nspath'
.return($P1)
# }
.annotate 'line', 8470

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8471
# Body
# {
.annotate 'line', 8473
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 8474
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 8475
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 8476
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 8477
.return($P4)
# }
.annotate 'line', 8478

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8479
# Body
# {
.annotate 'line', 8483
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
.annotate 'line', 8485
.return($P5)
__label_3: # case
.annotate 'line', 8488
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 8493
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 8494
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 8495
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 8496
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 8497
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 8498
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8499
if_null $P4, __label_8
.annotate 'line', 8500
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 8504
.return($P5)
# }
.annotate 'line', 8505

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8506
# Body
# {
.annotate 'line', 8510
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
.annotate 'line', 8512
.return($P7)
__label_3: # case
.annotate 'line', 8514
# string name: $S1
$S1 = __ARG_1[0]
.annotate 'line', 8516
# var sym: $P1
$P1 = self.'checkclass_base'($S1)
.annotate 'line', 8517
if_null $P1, __label_4
.annotate 'line', 8518
.return($P1)
__label_4: # endif
.annotate 'line', 8519
getattribute $P8, self, 'functions'
iter $P9, $P8
set $P9, 0
__label_5: # for iteration
unless $P9 goto __label_6
shift $P2, $P9
.annotate 'line', 8520
getattribute $P10, $P2, 'name'
set $S3, $P10
ne $S3, $S1, __label_7
.annotate 'line', 8521
.return($P2)
__label_7: # endif
goto __label_5
__label_6: # endfor
null $P11
.annotate 'line', 8522
.return($P11)
__label_1: # default
.annotate 'line', 8527
# var namespaces: $P3
getattribute $P3, self, 'namespaces'
.annotate 'line', 8528
# var childkey: $P4
# predefined clone
clone $P4, __ARG_1
.annotate 'line', 8529
# string basename: $S2
$P12 = $P4.'shift'()
null $S2
if_null $P12, __label_8
set $S2, $P12
__label_8:
.annotate 'line', 8530
iter $P13, $P3
set $P13, 0
__label_9: # for iteration
unless $P13 goto __label_10
shift $P5, $P13
# {
.annotate 'line', 8531
getattribute $P14, $P5, 'name'
set $S4, $P14
ne $S4, $S2, __label_11
# {
.annotate 'line', 8532
# var found: $P6
$P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8533
if_null $P6, __label_12
.annotate 'line', 8534
.return($P6)
__label_12: # endif
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
__label_0: # switch end
null $P7
.annotate 'line', 8538
.return($P7)
# }
.annotate 'line', 8539

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8540
# Body
# {
.annotate 'line', 8542
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8543
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8544
$P1 = __ARG_2.'get'()
.annotate 'line', 8546
# var modifier: $P2
null $P2
.annotate 'line', 8547
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 8548
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 8549
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 8552
'RequireOp'('{', $P1)
.annotate 'line', 8553
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8554
getattribute $P4, self, 'namespaces'
# predefined push
push $P4, $P3
.annotate 'line', 8555
getattribute $P4, self, 'items'
# predefined push
push $P4, $P3
.annotate 'line', 8556
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 8557

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8558
# Body
# {
.annotate 'line', 8560
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 8561
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 8562
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 8563
# var t: $P4
null $P4
# for loop
.annotate 'line', 8564
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 8566
$P9 = $P4.'checkkeyword'()
set $S2, $P9
set $S3, 'namespace'
if $S2 == $S3 goto __label_6
set $S3, 'const'
if $S2 == $S3 goto __label_7
set $S3, 'function'
if $S2 == $S3 goto __label_8
set $S3, 'class'
if $S2 == $S3 goto __label_9
set $S3, 'using'
if $S2 == $S3 goto __label_10
set $S3, '$include_const'
if $S2 == $S3 goto __label_11
set $S3, '$load'
if $S2 == $S3 goto __label_12
set $S3, '$loadlib'
if $S2 == $S3 goto __label_13
goto __label_5
# switch
__label_6: # case
.annotate 'line', 8568
self.'parsenamespace'($P4, __ARG_1)
goto __label_4 # break
__label_7: # case
.annotate 'line', 8571
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8572
# predefined push
push $P1, $P5
goto __label_4 # break
__label_8: # case
.annotate 'line', 8575
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8576
# predefined push
push $P2, $P6
.annotate 'line', 8577
# predefined push
push $P1, $P6
goto __label_4 # break
__label_9: # case
.annotate 'line', 8580
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8581
# predefined push
push $P3, $P7
.annotate 'line', 8582
# predefined push
push $P1, $P7
goto __label_4 # break
__label_10: # case
.annotate 'line', 8585
$P4 = __ARG_1.'get'()
.annotate 'line', 8586
$P10 = $P4.'iskeyword'('extern')
isfalse $I2, $P10
unless $I2 goto __label_14
.annotate 'line', 8587
'SyntaxError'('Unsupported at namespace level', $P4)
__label_14: # endif
.annotate 'line', 8588
$P4 = __ARG_1.'get'()
.annotate 'line', 8589
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_15
.annotate 'line', 8590
'Expected'('string literal', $P4)
__label_15: # endif
.annotate 'line', 8591
# string reqlib: $S1
set $P12, $P4
null $S1
if_null $P12, __label_16
set $S1, $P12
__label_16:
.annotate 'line', 8592
self.'addlib'($S1)
.annotate 'line', 8593
'ExpectOp'(';', __ARG_1)
goto __label_4 # break
__label_11: # case
.annotate 'line', 8596
'include_parrot'($P4, __ARG_1, self)
goto __label_4 # break
__label_12: # case
.annotate 'line', 8599
$P4 = __ARG_1.'get'()
.annotate 'line', 8600
$P13 = $P4.'isstring'()
isfalse $I4, $P13
unless $I4 goto __label_17
.annotate 'line', 8601
'Expected'('string literal', $P4)
__label_17: # endif
.annotate 'line', 8602
'ExpectOp'(';', __ARG_1)
.annotate 'line', 8603
new $P16, [ 'StringLiteral' ]
$P16.'StringLiteral'(self, $P4)
set $P15, $P16
$P14 = $P15.'getPirString'()
self.'addload'($P14)
goto __label_4 # break
__label_13: # case
.annotate 'line', 8606
$P4 = __ARG_1.'get'()
.annotate 'line', 8607
$P17 = $P4.'isstring'()
isfalse $I5, $P17
unless $I5 goto __label_18
.annotate 'line', 8608
'Expected'('string literal', $P4)
__label_18: # endif
.annotate 'line', 8609
'ExpectOp'(';', __ARG_1)
.annotate 'line', 8610
new $P20, [ 'StringLiteral' ]
$P20.'StringLiteral'(self, $P4)
set $P19, $P20
$P18 = $P19.'getPirString'()
self.'addlib'($P18)
goto __label_4 # break
__label_5: # default
.annotate 'line', 8613
'SyntaxError'("Unexpected token", $P4)
__label_4: # switch end
# }
__label_0: # for iteration
.annotate 'line', 8564
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
.annotate 'line', 8616
if_null $P4, __label_19
unless $P4 goto __label_19
.annotate 'line', 8617
self.'close_ns'($P4)
goto __label_20
__label_19: # else
.annotate 'line', 8619
self.'unclosed_ns'()
__label_20: # endif
# }
.annotate 'line', 8620

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8621
# Body
# {
.annotate 'line', 8623
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 8624

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8625
# Body
# {
.annotate 'line', 8627
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 8628
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 8630
# int activate: $I1
set $I1, 1
.annotate 'line', 8631
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 8632
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 8633
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
.annotate 'line', 8634
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 8636
unless $I1 goto __label_6
# {
.annotate 'line', 8637
__ARG_1.'say'($S1)
.annotate 'line', 8638
null $I1
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 8640
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 8642

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8451
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 8453
addattribute $P0, 'nspath'
.annotate 'line', 8454
addattribute $P0, 'namespaces'
.annotate 'line', 8455
addattribute $P0, 'classes'
.annotate 'line', 8456
addattribute $P0, 'functions'
.annotate 'line', 8457
addattribute $P0, 'items'
.annotate 'line', 8458
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8657
# Body
# {
.annotate 'line', 8660
# var nspath: $P1
$P2 = __ARG_1.'getpath'()
# predefined clone
clone $P1, $P2
.annotate 'line', 8661
# predefined push
push $P1, __ARG_3
.annotate 'line', 8662
setattribute self, 'nspath', $P1
.annotate 'line', 8664
setattribute self, 'parent', __ARG_1
.annotate 'line', 8665
setattribute self, 'start', __ARG_2
.annotate 'line', 8666
setattribute self, 'owner', __ARG_1
.annotate 'line', 8667
box $P2, __ARG_3
setattribute self, 'name', $P2
.annotate 'line', 8668
setattribute self, 'modifier', __ARG_4
.annotate 'line', 8669
if_null __ARG_4, __label_0
# {
.annotate 'line', 8670
$P2 = __ARG_4.'pick'('HLL')
if_null $P2, __label_1
.annotate 'line', 8671
getattribute $P4, self, 'name'
setattribute self, 'hll', $P4
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8673

.end # NamespaceStatement


.sub 'dowarnings' :method

.annotate 'line', 8674
# Body
# {
.annotate 'line', 8676
getattribute $P1, self, 'parent'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8677

.end # dowarnings


.sub 'generatesubid' :method

.annotate 'line', 8678
# Body
# {
.annotate 'line', 8680
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8681

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8682
# Body
# {
.annotate 'line', 8684
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8685

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8686
# Body
# {
.annotate 'line', 8688
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8689

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8690
# Body
# {
.annotate 'line', 8692
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8693

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8694
# Body
# {
.annotate 'line', 8696
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8697
unless_null $P1, __label_0
.annotate 'line', 8698
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8700
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8701

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8702
# Body
# {
.annotate 'line', 8706
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8707
unless_null $P1, __label_0
.annotate 'line', 8708
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8709
.return($P1)
# }
.annotate 'line', 8710

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8711
# Body
# {
.annotate 'line', 8713
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8714

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8715
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8719
# Body
# {
.annotate 'line', 8721
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8722
if_null $P1, __label_0
# {
.annotate 'line', 8723
$P1 = $P1.'optimize'()
.annotate 'line', 8724
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8726
self.'optimize_base'()
.annotate 'line', 8727
.return(self)
# }
.annotate 'line', 8728

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8729
# Body
# {
.annotate 'line', 8731
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8732
if_null $P1, __label_0
.annotate 'line', 8733
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8735
self.'emit_base'(__ARG_1)
.annotate 'line', 8737
if_null $P1, __label_1
.annotate 'line', 8738
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8739

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8649
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8651
addattribute $P0, 'parent'
.annotate 'line', 8652
addattribute $P0, 'start'
.annotate 'line', 8653
addattribute $P0, 'name'
.annotate 'line', 8654
addattribute $P0, 'modifier'
.annotate 'line', 8655
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8754
# Body
# {
.annotate 'line', 8756
# string nspath: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8757
setattribute self, 'nspath', $P1
.annotate 'line', 8758
setattribute self, 'unit', __ARG_1
.annotate 'line', 8759
root_new $P3, ['parrot';'Hash']
setattribute self, 'predefs_used', $P3
.annotate 'line', 8760
box $P2, 0
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8761

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8762
# Body
# {
.annotate 'line', 8764
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8765
$P1[__ARG_1] = 1
# }
.annotate 'line', 8766

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8767
# Body
# {
.annotate 'line', 8769
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8770
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8771

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8773
# Body
# {
.annotate 'line', 8775
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8776
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8777
inc $I1
.annotate 'line', 8778
assign $P1, $I1
.annotate 'line', 8779
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8780
.return($S1)
# }
.annotate 'line', 8781

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8783
# Body
# {
.annotate 'line', 8785
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8786
unless_null $P1, __label_0
# {
.annotate 'line', 8787
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8788
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8790
$P1[__ARG_1] = 1
# }
.annotate 'line', 8791

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8792
# Body
# {
.annotate 'line', 8794
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8795
unless_null $P1, __label_0
# {
.annotate 'line', 8796
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8797
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8799
$P1[__ARG_1] = 1
# }
.annotate 'line', 8800

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8801
# Body
# {
.annotate 'line', 8803
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8804

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8805
# Body
# {
.annotate 'line', 8808
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8809

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8810
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8814
# Body
# {
.annotate 'line', 8816
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8817

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8818
# Body
# {
.annotate 'line', 8820
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8821

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8822
# Body
# {
.annotate 'line', 8824
self.'optimize_base'()
.annotate 'line', 8825
.return(self)
# }
.annotate 'line', 8826

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8827
# Body
# {
.annotate 'line', 8829
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8832
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8833
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8836
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
.annotate 'line', 8839
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8840
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8841
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8842
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8845
# int somelib: $I1
null $I1
.annotate 'line', 8846
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8847
if_null $P3, __label_4
# {
.annotate 'line', 8848
set $I1, 1
.annotate 'line', 8849
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8850
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8853
# int someload: $I2
null $I2
.annotate 'line', 8854
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8855
if_null $P4, __label_7
# {
.annotate 'line', 8856
set $I2, 1
.annotate 'line', 8857
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8858
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8859
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8860
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
.annotate 'line', 8862
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8863
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8865
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8866

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8746
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8748
addattribute $P0, 'unit'
.annotate 'line', 8749
addattribute $P0, 'predefs_used'
.annotate 'line', 8750
addattribute $P0, 'libs'
.annotate 'line', 8751
addattribute $P0, 'loads'
.annotate 'line', 8752
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8880
# Body
# {
.annotate 'line', 8882
box $P3, 1
setattribute self, 'warnings', $P3
.annotate 'line', 8883
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8886
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8890
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8889
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8888
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8894
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8893
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8892
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8900
new $P4, [ 'StringLiteral' ]
.annotate 'line', 8901
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
.annotate 'line', 8899
$P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8904
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8905

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8906
# Body
# {
.annotate 'line', 8908
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8909

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8910
# Body
# {
# predefined int
.annotate 'line', 8912
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8913

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8914
# Body
# {
.annotate 'line', 8916
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8917

.end # parse


.sub 'optimize' :method

.annotate 'line', 8918
# Body
# {
.annotate 'line', 8920
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8921

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8922
# Body
# {
.annotate 'line', 8924
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8925
__ARG_1.'say'('')
.annotate 'line', 8927
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8929
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8930

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8877
addattribute $P0, 'rootns'
.annotate 'line', 8878
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8937
# Body
# {
.annotate 'line', 8939
set $S2, __ARG_2
ne $S2, 'parse', __label_0
.annotate 'line', 8940
.return(__ARG_1)
__label_0: # endif
.annotate 'line', 8941
# var handleout: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8942
$P1.'open'('__eval__', 'w')
.annotate 'line', 8943
# var emit: $P2
new $P2, [ 'Emit' ]
.annotate 'line', 8944
if_null __ARG_3, __label_1
unless __ARG_3 goto __label_1
.annotate 'line', 8945
$P2.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8946
$P2.'initialize'($P1)
.annotate 'line', 8947
__ARG_1.'emit'($P2)
.annotate 'line', 8948
$P2.'close'()
.annotate 'line', 8949
$P1.'close'()
.annotate 'line', 8950
# string pircode: $S1
$P5 = $P1.'read'(0)
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 8951
# var object: $P3
null $P3
.annotate 'line', 8952
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
.annotate 'line', 8954
new $P3, [ 'String' ]
.annotate 'line', 8955
assign $P3, $S1
goto __label_3 # break
__label_6: # case
__label_7: # case
.annotate 'line', 8959
# var pircomp: $P4
# predefined compreg
compreg $P4, 'PIR'
.annotate 'line', 8960
$P3 = $P4($S1)
goto __label_3 # break
__label_4: # default
.annotate 'line', 8961
# predefined die
.annotate 'line', 8963
die 'Invalid target'
__label_3: # switch end
.annotate 'line', 8965
.return($P3)
# }
.annotate 'line', 8966

.end # __private_compile_tail


.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8967
# Body
# {
.annotate 'line', 8972
unless_null __ARG_2, __label_0
.annotate 'line', 8973
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8974
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8975
$P1.'open'('__eval__', 'w')
.annotate 'line', 8976
$P1.'puts'(__ARG_1)
.annotate 'line', 8977
$P1.'close'()
.annotate 'line', 8978
$P1.'open'('__eval__', 'r')
.annotate 'line', 8979
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8980
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8981
unless __ARG_4 goto __label_1
.annotate 'line', 8982
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8983
$P3.'parse'($P2)
.annotate 'line', 8984
$P1.'close'()
.annotate 'line', 8985
$P3.'optimize'()
.annotate 'line', 8986
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8987

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8988
# Body
# {
.annotate 'line', 8992
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8993
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8994
$P1.'encoding'('utf8')
.annotate 'line', 8995
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8996
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8997
unless __ARG_4 goto __label_0
.annotate 'line', 8998
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8999
$P3.'parse'($P2)
.annotate 'line', 9000
$P1.'close'()
.annotate 'line', 9001
$P3.'optimize'()
.annotate 'line', 9002
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 9003
unless __ARG_3 goto __label_1
.annotate 'line', 9004
$P4.'disable_annotations'()
__label_1: # endif
.annotate 'line', 9005
$P4.'initialize'(__ARG_2)
.annotate 'line', 9006
$P3.'emit'($P4)
.annotate 'line', 9007
$P4.'close'()
# }
.annotate 'line', 9008

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 9009
# Body
# {
.annotate 'line', 9014
unless_null __ARG_2, __label_0
.annotate 'line', 9015
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 9016
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 9017
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 9018
$P1.'encoding'('utf8')
.annotate 'line', 9019
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9020
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9021
unless __ARG_4 goto __label_1
.annotate 'line', 9022
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 9023
$P3.'parse'($P2)
.annotate 'line', 9024
$P1.'close'()
.annotate 'line', 9025
$P3.'optimize'()
.annotate 'line', 9026
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9027

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

.annotate 'line', 9032
# Body
# {
.annotate 'line', 9034
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9035
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 9036
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 9037
$P1.'parse'(__ARG_1)
.annotate 'line', 9039
$P1.'optimize'()
.annotate 'line', 9041
# var handle: $P2
null $P2
.annotate 'line', 9042
ne __ARG_2, '-', __label_1
.annotate 'line', 9043
# predefined getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 9045
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 9046
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 9047
unless __ARG_4 goto __label_3
.annotate 'line', 9048
$P3.'disable_annotations'()
__label_3: # endif
.annotate 'line', 9049
$P3.'initialize'($P2)
.annotate 'line', 9050
$P1.'emit'($P3)
.annotate 'line', 9051
$P3.'close'()
.annotate 'line', 9052
$P2.'close'()
# }
.annotate 'line', 9053

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 9059
# Body
# {
.annotate 'line', 9061
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9062
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 9063

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 9070
# Body
# {
.annotate 'line', 9072
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9073
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9074
$P1.'notOptStop'(1)
.annotate 'line', 9075
$P1.'push_string'('o=s')
.annotate 'line', 9076
$P1.'push_string'('e=s')
.annotate 'line', 9077
$P1.'push_string'('noan')
.annotate 'line', 9078
$P1.'push_string'('nowarn')
.annotate 'line', 9079
$P1.'notOptStop'(1)
.annotate 'line', 9080
__ARG_1.'shift'()
.annotate 'line', 9081
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9082
setattribute self, 'getopts', $P1
.annotate 'line', 9083
setattribute self, 'opts', $P2
# }
.annotate 'line', 9084

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 9085
# Body
# {
.annotate 'line', 9087
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 9088
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 9089
isnull $I1, $P2
not $I1
.return($I1)
# }
.annotate 'line', 9090

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 9091
# Body
# {
.annotate 'line', 9093
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 9094
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 9095
if_null $P2, __label_1
# predefined string
set $S1, $P2
goto __label_0
__label_1:
set $S1, __ARG_2
__label_0:
.return($S1)
# }
.annotate 'line', 9096

.end # getstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 9067
addattribute $P0, 'getopts'
.annotate 'line', 9068
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 9099
# Body
# {
.annotate 'line', 9101
# var options: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 9102
# string outputfile: $S1
$P4 = $P1.'getstring'('o', '')
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 9103
# string expr: $S2
$P4 = $P1.'getstring'('e')
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 9104
# int noan: $I1
$P4 = $P1.'getbool'('noan')
set $I1, $P4
.annotate 'line', 9105
# int warn: $I2
$P4 = $P1.'getbool'('nowarn')
isfalse $I2, $P4
.annotate 'line', 9107
# int argc: $I3
set $P4, __ARG_1
set $I3, $P4
.annotate 'line', 9108
# string filename: $S3
null $S3
.annotate 'line', 9109
# var file: $P2
null $P2
.annotate 'line', 9110
unless_null $S2, __label_2
# {
.annotate 'line', 9111
ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 9112
root_new $P4, ['parrot';'Exception']
$P4['message'] = 'No file'
throw $P4
__label_4: # endif
.annotate 'line', 9114
$S3 = __ARG_1[0]
.annotate 'line', 9115
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'($S3)
.annotate 'line', 9116
$P2.'encoding'('utf8')
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 9119
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 9120
new $P2, [ 'StringHandle' ]
.annotate 'line', 9121
$P2.'open'('__eval__', 'w')
.annotate 'line', 9122
$P2.'puts'($S2)
.annotate 'line', 9123
$P2.'close'()
.annotate 'line', 9124
$P2.'open'('__eval__')
.annotate 'line', 9125
set $S3, '__eval__'
# }
__label_3: # endif
.annotate 'line', 9128
# var t: $P3
new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9130
'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 9132
$P2.'close'()
# }
.annotate 'line', 9133

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 9135
# Body
# {
.annotate 'line', 9137
# int i: $I1
set $I1, 1
.annotate 'line', 9138
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 9139
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 9140
# string subname: $S1
null $S1
.annotate 'line', 9141
if_null $P2, __label_2
# {
.annotate 'line', 9142
set $S1, $P2
.annotate 'line', 9143
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 9144
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
.annotate 'line', 9146
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 9147
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 9148
eq $S3, '', __label_6
# {
.annotate 'line', 9149
# int line: $I2
$I2 = $P3['line']
.annotate 'line', 9150
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
.annotate 'line', 9153

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 9155
# Body
# {
.annotate 'line', 9157
# int retval: $I1
null $I1
.annotate 'line', 9158
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 9164
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 9158
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 9167
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 9168
# int type: $I2
$I2 = $P1['type']
.annotate 'line', 9169
set $I3, $I2
set $I4, 556
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 9172
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 9173
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 9176
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 9177
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
.annotate 'line', 9178
set $I1, 2
__label_2: # switch end
# }
# catch end
__label_1:
.annotate 'line', 9181
# predefined exit
exit $I1
# }
.annotate 'line', 9182

.end # main

# End generated code
