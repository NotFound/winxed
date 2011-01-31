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
unless __ARG_3 goto __label_0
.annotate 'line', 61
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
unless __ARG_3 goto __label_0
.annotate 'line', 70
# {
.annotate 'line', 71
# string desc: $S1
$P2 = __ARG_2.'show'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S0, __ARG_1, ' near '
concat $S0, $S0, $S1
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
$P3 = __ARG_2.'viewable'()
null $S3
if_null $P3, __label_2
set $S3, $P3
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
concat $S1, "Expected ", __ARG_1
.annotate 'line', 99
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 100

.end # Expected


.sub 'ExpectedOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 102
# Body
# {
concat $S1, "Expected '", __ARG_1
concat $S1, $S1, "'"
.annotate 'line', 104
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 105

.end # ExpectedOp


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 107
# Body
# {
.annotate 'line', 109
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 110
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 111

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 113
# Body
# {
.annotate 'line', 115
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 116
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 117

.end # RequireKeyword


.sub 'RequireIdentifier'
.param pmc __ARG_1

.annotate 'line', 119
# Body
# {
.annotate 'line', 121
$P1 = __ARG_1.'isidentifier'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 122
'Expected'('identifier', __ARG_1)
__label_0: # endif
# }
.annotate 'line', 123

.end # RequireIdentifier


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 125
# Body
# {
.annotate 'line', 127
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 128
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 129

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 131
# Body
# {
.annotate 'line', 133
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 134
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 135

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 145
# Body
# {
box $P1, __ARG_1
.annotate 'line', 147
setattribute self, 'file', $P1
box $P1, __ARG_2
.annotate 'line', 148
setattribute self, 'line', $P1
# }
.annotate 'line', 149

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 150
# Body
# {
.annotate 'line', 152
.return(1)
# }
.annotate 'line', 153

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 154
# Body
# {
.annotate 'line', 156
.return(1)
# }
.annotate 'line', 157

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 159
# Body
# {
.return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 160
# Body
# {
.return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 161
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 162
# Body
# {
.return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 163
# Body
# {
.return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 164
# Body
# {
.return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 166
# Body
# {
.annotate 'line', 168
'InternalError'('Not a literal string', self)
# }
.annotate 'line', 169

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 170
# Body
# {
.annotate 'line', 172
'Expected'('identifier', self)
# }
.annotate 'line', 173

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 174
# Body
# {
.return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 175
# Body
# {
.return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 176
# Body
# {
.return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 177
# Body
# {
.return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 178
# Body
# {
.return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 179
# Body
# {
.annotate 'line', 181
# string r: $S1
$P1 = self.'viewable'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 182
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
.annotate 'line', 183

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 143
addattribute $P0, 'file'
.annotate 'line', 144
addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 188
# Body
# {
.annotate 'line', 190
self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 191

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 192
# Body
# {
.annotate 'line', 194
.return(0)
# }
.annotate 'line', 195

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 196
# Body
# {
.annotate 'line', 198
.return(0)
# }
.annotate 'line', 199

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 200
# Body
# {
.return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 201
# Body
# {
.return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenEof' ]
.annotate 'line', 186
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 207
# Body
# {
.annotate 'line', 209
self.'Token'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 210
setattribute self, 'str', $P1
# }
.annotate 'line', 211

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 212
# Body
# {
getattribute $P1, self, 'str'
.return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 213
# Body
# {
.annotate 'line', 215
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 216

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 204
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.annotate 'line', 206
addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 221
# Body
# {
.annotate 'line', 223
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 224

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 225
# Body
# {
.return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenComment' ]
.annotate 'line', 219
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 230
# Body
# {
.annotate 'line', 232
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 233

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 234
# Body
# {
.annotate 'line', 236
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 237

.end # isop


.sub 'checkop' :method

.annotate 'line', 238
# Body
# {
# predefined string
.annotate 'line', 240
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 241

.end # checkop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenOp' ]
.annotate 'line', 228
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 246
# Body
# {
.annotate 'line', 248
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 249

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 250
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 251
# Body
# {
.annotate 'line', 253
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 254

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 255
# Body
# {
# predefined string
.annotate 'line', 257
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 258

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 259
# Body
# {
.annotate 'line', 261
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 262

.end # iskeyword

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 244
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 267
# Body
# {
.return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 268
# Body
# {
.annotate 'line', 270
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 271

.end # rawstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenString' ]
.annotate 'line', 265
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 276
# Body
# {
.annotate 'line', 278
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 279

.end # TokenQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 280
# Body
# {
# predefined string
.annotate 'line', 282
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 283

.end # get_string


.sub 'viewable' :method

.annotate 'line', 284
# Body
# {
# predefined string
.annotate 'line', 286
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 287

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 274
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 292
# Body
# {
.annotate 'line', 294
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 295

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 296
# Body
# {
# predefined string
.annotate 'line', 298
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 299

.end # get_string


.sub 'viewable' :method

.annotate 'line', 300
# Body
# {
# predefined string
.annotate 'line', 302
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 303

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 290
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 308
# Body
# {
.annotate 'line', 310
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 311

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 312
# Body
# {
.return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 306
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 317
# Body
# {
.annotate 'line', 319
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 320

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 321
# Body
# {
.return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 315
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 329
# Body
# {
.annotate 'line', 331
# string s: $S1
set $S1, ''
.annotate 'line', 332
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 333
eq $S2, '"', __label_1
# {
.annotate 'line', 334
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 335
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 337
ne $S2, '\', __label_5
# {
.annotate 'line', 338
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 339
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 340
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
concat $S1, $S1, $S2
concat $S1, $S1, $S3
.annotate 'line', 341
# }
goto __label_6
__label_5: # else
concat $S1, $S1, $S2
__label_6: # endif
.annotate 'line', 345
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 347
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenQuoted'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 348

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 350
# Body
# {
.annotate 'line', 352
# string s: $S1
set $S1, ''
.annotate 'line', 353
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 354
eq $S2, "'", __label_1
# {
.annotate 'line', 355
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 356
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
concat $S1, $S1, $S2
.annotate 'line', 358
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 360
new $P3, [ 'TokenSingleQuoted' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 361

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 363
# Body
# {
.annotate 'line', 365
# string mark: $S1
set $S1, ''
.annotate 'line', 366
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 367
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 370
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
.annotate 'line', 379
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 381
ne $S2, '', __label_8
.annotate 'line', 382
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 385
# string content: $S3
set $S3, ''
.annotate 'line', 386
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 387
# {
set $S4, ''
.annotate 'line', 389
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_13: # while
.annotate 'line', 390
isne $I1, $S2, "\n"
unless $I1 goto __label_14
isne $I1, $S2, ''
__label_14:
unless $I1 goto __label_12
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 391
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
.annotate 'line', 400
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 402
ne $S2, '', __label_19
.annotate 'line', 403
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 404
eq $S4, $S1, __label_20
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
__label_20: # endif
.annotate 'line', 405
# }
.annotate 'line', 406
ne $S4, $S1, __label_9
__label_10: # enddo
.annotate 'line', 407
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_1, 'filename'
$P4.'TokenQuoted'($P5, __ARG_3, $S3)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 408

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 410
# Body
# {
.annotate 'line', 412
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 413
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 414
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
concat $S1, $S1, $S2
.annotate 'line', 416
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 418
__ARG_1.'ungetchar'($S2)
.annotate 'line', 419
new $P3, [ 'TokenIdentifier' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenIdentifier'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 420

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 422
# Body
# {
.annotate 'line', 424
# string s: $S1
null $S1
.annotate 'line', 425
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 426
# {
concat $S1, $S1, $S2
.annotate 'line', 428
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
.annotate 'line', 429
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 430
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 431
# int hexval: $I1
null $I1
# int h: $I2
null $I2
.annotate 'line', 432
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_7: # while
.annotate 'line', 433
$P2 = 'hexdigit'($S2)
set $I2, $P2
lt $I2, 0, __label_6
# {
mul $I3, $I1, 16
add $I1, $I3, $I2
concat $S1, $S1, $S2
.annotate 'line', 436
$P3 = __ARG_1.'getchar'()
set $S2, $P3
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 438
__ARG_1.'ungetchar'($S2)
set $S1, $I1
.annotate 'line', 440
new $P4, [ 'TokenInteger' ]
getattribute $P5, __ARG_1, 'filename'
$P4.'TokenInteger'($P5, __ARG_3, $S1)
set $P3, $P4
.return($P3)
# }
__label_3: # endif
.annotate 'line', 442
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 443
# {
concat $S1, $S1, $S2
.annotate 'line', 445
$P4 = __ARG_1.'getchar'()
set $S2, $P4
# }
.annotate 'line', 446
$P5 = 'isdigit'($S2)
if_null $P5, __label_11
if $P5 goto __label_10
__label_11: # enddo
.annotate 'line', 447
iseq $I4, $S2, 'e'
if $I4 goto __label_14
iseq $I4, $S2, 'E'
__label_14:
unless $I4 goto __label_13
# {
concat $S1, $S1, 'E'
.annotate 'line', 449
$P6 = __ARG_1.'getchar'()
set $S2, $P6
iseq $I4, $S2, '+'
if $I4 goto __label_16
iseq $I4, $S2, '-'
__label_16:
unless $I4 goto __label_15
# {
concat $S1, $S1, $S2
.annotate 'line', 451
$P6 = __ARG_1.'getchar'()
set $S2, $P6
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 453
$P7 = 'isdigit'($S2)
if_null $P7, __label_17
unless $P7 goto __label_17
# {
concat $S1, $S1, $S2
.annotate 'line', 455
$P7 = __ARG_1.'getchar'()
set $S2, $P7
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 458
__ARG_1.'ungetchar'($S2)
.annotate 'line', 459
new $P9, [ 'TokenFloat' ]
getattribute $P10, __ARG_1, 'filename'
$P9.'TokenFloat'($P10, __ARG_3, $S1)
set $P8, $P9
.return($P8)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 462
iseq $I5, $S2, 'e'
if $I5 goto __label_21
iseq $I5, $S2, 'E'
__label_21:
unless $I5 goto __label_19
# {
concat $S1, $S1, 'E'
.annotate 'line', 464
$P8 = __ARG_1.'getchar'()
set $S2, $P8
iseq $I5, $S2, '+'
if $I5 goto __label_23
iseq $I5, $S2, '-'
__label_23:
unless $I5 goto __label_22
# {
concat $S1, $S1, $S2
.annotate 'line', 466
$P9 = __ARG_1.'getchar'()
set $S2, $P9
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 468
$P10 = 'isdigit'($S2)
if_null $P10, __label_24
unless $P10 goto __label_24
# {
concat $S1, $S1, $S2
.annotate 'line', 470
$P11 = __ARG_1.'getchar'()
set $S2, $P11
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 472
__ARG_1.'ungetchar'($S2)
.annotate 'line', 473
new $P12, [ 'TokenFloat' ]
getattribute $P13, __ARG_1, 'filename'
$P12.'TokenFloat'($P13, __ARG_3, $S1)
set $P11, $P12
.return($P11)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 476
__ARG_1.'ungetchar'($S2)
.annotate 'line', 477
new $P13, [ 'TokenInteger' ]
getattribute $P14, __ARG_1, 'filename'
$P13.'TokenInteger'($P14, __ARG_3, $S1)
set $P12, $P13
.return($P12)
# }
__label_20: # endif
# }
__label_9: # endif
# }
.annotate 'line', 480

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 482
# Body
# {
.annotate 'line', 484
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 485
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 486
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
concat $S1, $S1, $S2
.annotate 'line', 488
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 490
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 491

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 493
# Body
# {
.annotate 'line', 495
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 496
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 497
# {
__label_5: # while
.annotate 'line', 498
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
concat $S1, $S1, $S2
.annotate 'line', 499
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 500
ne $S2, '', __label_7
.annotate 'line', 501
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
concat $S1, $S1, $S2
.annotate 'line', 503
$P2 = __ARG_1.'getchar'()
set $S2, $P2
.annotate 'line', 504
ne $S2, '', __label_8
.annotate 'line', 505
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
.annotate 'line', 506
ne $S2, '/', __label_1
__label_2: # enddo
concat $S1, $S1, '/'
.annotate 'line', 508
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 509

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 511
# Body
# {
.annotate 'line', 513
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 514
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 515

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 529
# Body
# {
.annotate 'line', 531
.const 'Sub' $P2 = 'getop'
.annotate 'line', 533
setattribute self, 'h', __ARG_1
box $P3, ''
.annotate 'line', 534
setattribute self, 'pending', $P3
.annotate 'line', 535
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P5
box $P4, __ARG_2
.annotate 'line', 536
setattribute self, 'filename', $P4
box $P5, 1
.annotate 'line', 537
setattribute self, 'line', $P5
.annotate 'line', 538
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 539
root_new $P6, ['parrot';'Hash']
get_hll_global $P7, 'getident'
$P6[''] = $P7
$P6['{'] = $P2
$P1['$'] = $P6
get_hll_global $P8, 'getquoted'
$P1['"'] = $P8
get_hll_global $P9, 'getsinglequoted'
$P1["'"] = $P9
.annotate 'line', 542
root_new $P10, ['parrot';'Hash']
.annotate 'line', 543
root_new $P11, ['parrot';'Hash']
$P11[''] = $P2
$P11['='] = $P2
$P10['='] = $P11
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 546
root_new $P12, ['parrot';'Hash']
$P12['+'] = $P2
$P12['='] = $P2
$P1['+'] = $P12
.annotate 'line', 547
root_new $P13, ['parrot';'Hash']
$P13['-'] = $P2
$P13['='] = $P2
$P1['-'] = $P13
.annotate 'line', 548
root_new $P14, ['parrot';'Hash']
$P14['='] = $P2
$P1['*'] = $P14
.annotate 'line', 549
root_new $P15, ['parrot';'Hash']
$P15['|'] = $P2
$P1['|'] = $P15
.annotate 'line', 550
root_new $P16, ['parrot';'Hash']
$P16['&'] = $P2
$P1['&'] = $P16
.annotate 'line', 551
root_new $P17, ['parrot';'Hash']
.annotate 'line', 552
root_new $P18, ['parrot';'Hash']
$P18[''] = $P2
get_hll_global $P19, 'getheredoc'
$P18[':'] = $P19
$P17['<'] = $P18
$P17['='] = $P2
$P1['<'] = $P17
.annotate 'line', 555
root_new $P20, ['parrot';'Hash']
$P20['>'] = $P2
$P20['='] = $P2
$P1['>'] = $P20
.annotate 'line', 556
root_new $P21, ['parrot';'Hash']
.annotate 'line', 557
root_new $P22, ['parrot';'Hash']
$P22[''] = $P2
$P22['='] = $P2
$P21['='] = $P22
$P1['!'] = $P21
.annotate 'line', 559
root_new $P23, ['parrot';'Hash']
$P23['%'] = $P2
$P1['%'] = $P23
.annotate 'line', 560
root_new $P24, ['parrot';'Hash']
$P24['='] = $P2
get_hll_global $P25, 'getlinecomment'
$P24['/'] = $P25
get_hll_global $P26, 'getcomment'
$P24['*'] = $P26
$P1['/'] = $P24
get_hll_global $P27, 'getlinecomment'
$P1['#'] = $P27
.annotate 'line', 563
setattribute self, 'select', $P1
# }
.annotate 'line', 564

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 565
# Body
# {
.annotate 'line', 567
# var pending: $P1
getattribute $P1, self, 'pending'
.annotate 'line', 568
# string c: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 569
eq $S1, '', __label_1
assign $P1, ''
goto __label_2
__label_1: # else
.annotate 'line', 570
# {
.annotate 'line', 572
# var h: $P2
getattribute $P2, self, 'h'
.annotate 'line', 573
$P3 = $P2.'read'(1)
set $S1, $P3
.annotate 'line', 574
ne $S1, "\n", __label_3
# {
.annotate 'line', 575
# int l: $I1
getattribute $P4, self, 'line'
set $I1, $P4
inc $I1
box $P4, $I1
.annotate 'line', 577
setattribute self, 'line', $P4
# }
__label_3: # endif
# }
__label_2: # endif
.annotate 'line', 580
.return($S1)
# }
.annotate 'line', 581

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 582
# Body
# {
.annotate 'line', 584
getattribute $P1, self, 'pending'
assign $P1, __ARG_1
# }
.annotate 'line', 585

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 586
# Body
# {
.annotate 'line', 588
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 589
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 590
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 591
.const 'Sub' $P7 = 'getop'
.annotate 'line', 592
.const 'Sub' $P8 = 'getident'
.annotate 'line', 593
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 595
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 596
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 597
.return($P1)
# }
__label_0: # endif
.annotate 'line', 599
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 600
$P11 = $P4($S1)
if_null $P11, __label_2
unless $P11 goto __label_2
.annotate 'line', 601
$P12 = self.'getchar'()
set $S1, $P12
goto __label_3
__label_2: # endwhile
.annotate 'line', 602
# int line: $I1
getattribute $P12, self, 'line'
set $I1, $P12
.annotate 'line', 603
ne $S1, '', __label_4
.annotate 'line', 604
new $P14, [ 'TokenEof' ]
getattribute $P15, self, 'filename'
$P14.'TokenEof'($P15)
set $P13, $P14
.return($P13)
__label_4: # endif
.annotate 'line', 605
$P13 = $P5($S1)
if_null $P13, __label_5
unless $P13 goto __label_5
.annotate 'line', 606
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 607
$P14 = $P6($S1)
if_null $P14, __label_6
unless $P14 goto __label_6
.annotate 'line', 608
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 610
# string op: $S2
set $S2, $S1
.annotate 'line', 611
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 612
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 614
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 615
$P15 = self.'getchar'()
set $S1, $P15
set $P2, $P3
.annotate 'line', 617
$P3 = $P2[$S1]
.annotate 'line', 618
unless_null $P3, __label_10
# {
.annotate 'line', 619
self.'ungetchar'($S1)
.annotate 'line', 620
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
concat $S2, $S2, $S1
__label_11: # endif
.annotate 'line', 623
# }
goto __label_8
__label_7: # endwhile
if_null $P3, __label_12
unless $P3 goto __label_12
.annotate 'line', 626
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 627
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 628

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 629
# Body
# {
.annotate 'line', 631
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 632
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 633
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 634
.return($P1)
# }
.annotate 'line', 635

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 636
# Body
# {
.annotate 'line', 638
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }
.annotate 'line', 639

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 523
addattribute $P0, 'h'
.annotate 'line', 524
addattribute $P0, 'pending'
.annotate 'line', 525
addattribute $P0, 'select'
.annotate 'line', 526
addattribute $P0, 'stacked'
.annotate 'line', 527
addattribute $P0, 'filename'
.annotate 'line', 528
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

.annotate 'line', 658
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 660
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
.annotate 'line', 661
.return('I')
__label_3: # case
.annotate 'line', 662
.return('N')
__label_4: # case
.annotate 'line', 663
.return('S')
__label_5: # case
.annotate 'line', 664
.return('P')
__label_1: # default
.annotate 'line', 665
.return('')
__label_0: # switch end
# }
.annotate 'line', 667

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 669
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 671
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
.annotate 'line', 672
.return('int')
__label_3: # case
.annotate 'line', 673
.return('num')
__label_4: # case
.annotate 'line', 674
.return('string')
__label_5: # case
.annotate 'line', 675
.return('pmc')
__label_1: # default
.annotate 'line', 676
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 678

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 692
# Body
# {
.annotate 'line', 694
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 695
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 696
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 697
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 698
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 699

.end # initialize


.sub 'close' :method

.annotate 'line', 700
# Body
# {
null $P1
.annotate 'line', 702
setattribute self, 'handle', $P1
# }
.annotate 'line', 703

.end # close


.sub 'updateannot' :method

.annotate 'line', 704
# Body
# {
.annotate 'line', 706
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 707
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 708
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 709
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 710
getattribute $P3, self, 'handle'
$P3.'print'("\n")
.annotate 'line', 711
getattribute $P4, self, 'pendingf'
assign $P4, 0
# }
__label_0: # endif
.annotate 'line', 713
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 714
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 715
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 716
getattribute $P6, self, 'handle'
$P6.'print'("\n")
.annotate 'line', 717
getattribute $P7, self, 'pendingl'
assign $P7, 0
# }
__label_1: # endif
# }
.annotate 'line', 719

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 720
# Body
# {
.annotate 'line', 722
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 723
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 724

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 725
# Body
# {
.annotate 'line', 727
self.'updateannot'()
.annotate 'line', 728
self.'vprint'(__ARG_1)
# }
.annotate 'line', 729

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 730
# Body
# {
.annotate 'line', 732
self.'updateannot'()
.annotate 'line', 733
self.'vprint'(__ARG_1)
.annotate 'line', 734
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 735

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 736
# Body
# {
.annotate 'line', 738
# var file: $P1
getattribute $P1, self, 'file'
.annotate 'line', 739
# var line: $P2
getattribute $P2, self, 'line'
.annotate 'line', 740
# string tfile: $S1
getattribute $P3, __ARG_1, 'file'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 741
# int tline: $I1
getattribute $P3, __ARG_1, 'line'
set $I1, $P3
set $S2, $P1
.annotate 'line', 742
eq $S2, $S1, __label_1
# {
assign $P1, $S1
.annotate 'line', 744
getattribute $P4, self, 'pendingf'
assign $P4, 1
assign $P2, 0
.annotate 'line', 745
# }
__label_1: # endif
set $I2, $P2
.annotate 'line', 747
eq $I2, $I1, __label_2
# {
assign $P2, $I1
.annotate 'line', 749
getattribute $P4, self, 'pendingl'
assign $P4, 1
# }
__label_2: # endif
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
$P1.'print'(' # ')
.annotate 'line', 764
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 766
$P1.'print'("\n")
# }
.annotate 'line', 767

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 768
# Body
# {
.annotate 'line', 770
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 771
$P1.'print'('goto ')
.annotate 'line', 772
$P1.'print'(__ARG_1)
.annotate 'line', 773
if_null __ARG_2, __label_0
# {
.annotate 'line', 774
$P1.'print'(' # ')
.annotate 'line', 775
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 777
$P1.'print'("\n")
# }
.annotate 'line', 778

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 779
# Body
# {
.annotate 'line', 781
# string ins: $S1
concat $S1, 'if ', __ARG_1
concat $S1, $S1, ' goto '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 782
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 783

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 784
# Body
# {
.annotate 'line', 786
# string ins: $S1
concat $S1, 'unless ', __ARG_1
concat $S1, $S1, ' goto '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 787
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 788

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 789
# Body
# {
.annotate 'line', 791
# string ins: $S1
concat $S1, 'if_null ', __ARG_1
concat $S1, $S1, ', '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 792
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 793

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 794
# Body
# {
.annotate 'line', 796
# string ins: $S1
concat $S1, "null ", __ARG_1
concat $S1, $S1, "\n"
.annotate 'line', 797
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 798

.end # emitnull


.sub 'emitinc' :method
.param string __ARG_1

.annotate 'line', 799
# Body
# {
.annotate 'line', 801
getattribute $P1, self, 'handle'
concat $S1, 'inc ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 802

.end # emitinc


.sub 'emitdec' :method
.param string __ARG_1

.annotate 'line', 803
# Body
# {
.annotate 'line', 805
getattribute $P1, self, 'handle'
concat $S1, 'dec ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 806

.end # emitdec


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 807
# Body
# {
.annotate 'line', 809
# string ins: $S1
concat $S1, "set ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 810
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 811

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 812
# Body
# {
.annotate 'line', 814
# string ins: $S1
concat $S1, "assign ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 815
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 816

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 817
# Body
# {
.annotate 'line', 819
# string ins: $S1
concat $S1, "box ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 820
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 821

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 822
# Body
# {
.annotate 'line', 824
# string ins: $S1
concat $S1, "unbox ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 825
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 826

.end # emitunbox


.sub 'emitbinop' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 827
# Body
# {
.annotate 'line', 829
# string ins: $S1
concat $S1, __ARG_1, " "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_4
concat $S1, $S1, "\n"
.annotate 'line', 830
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 831

.end # emitbinop


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 832
# Body
# {
.annotate 'line', 834
# string ins: $S1
concat $S1, "add ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 835
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 836

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 837
# Body
# {
.annotate 'line', 839
# string ins: $S1
concat $S1, "add ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
.annotate 'line', 840
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 841

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 842
# Body
# {
.annotate 'line', 844
# string ins: $S1
concat $S1, "mul ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
.annotate 'line', 845
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 846

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 847
# Body
# {
.annotate 'line', 849
# string ins: $S1
concat $S1, "concat ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
.annotate 'line', 850
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 851

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 852
# Body
# {
.annotate 'line', 854
# string ins: $S1
concat $S1, "concat ", __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
.annotate 'line', 855
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 856

.end # emitconcat


.sub 'emitprint' :method
.param string __ARG_1

.annotate 'line', 857
# Body
# {
.annotate 'line', 859
getattribute $P1, self, 'handle'
concat $S1, 'print ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 860

.end # emitprint


.sub 'emitsay' :method
.param string __ARG_1

.annotate 'line', 861
# Body
# {
.annotate 'line', 863
getattribute $P1, self, 'handle'
concat $S1, 'say ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 864

.end # emitsay

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 686
addattribute $P0, 'handle'
.annotate 'line', 687
addattribute $P0, 'file'
.annotate 'line', 688
addattribute $P0, 'line'
.annotate 'line', 689
addattribute $P0, 'pendingf'
.annotate 'line', 690
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 871
# Body
# {
.annotate 'line', 873
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 874

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 876
# Body
# {
.annotate 'line', 878
# var t: $P1
new $P1, [ 'TokenFloat' ]
getattribute $P2, __ARG_2, 'file'
getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 879
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 880

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 882
# Body
# {
.annotate 'line', 888
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 889
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 890
.return($I1)
# }
.annotate 'line', 891

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

.annotate 'line', 909
# Body
# {
.annotate 'line', 911
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 912
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 913
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 914
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 915
'InternalError'('non void predef without {res}')
__label_2: # endif
box $P1, __ARG_2
.annotate 'line', 916
setattribute self, 'body', $P1
box $P1, __ARG_1
.annotate 'line', 917
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 918

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 919
# Body
# {
.annotate 'line', 921
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 922
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 924
# int pos: $I1
null $I1
.annotate 'line', 925
ne $S2, 'v', __label_2
# {
.annotate 'line', 926
isnull $I4, __ARG_3
not $I4
unless $I4 goto __label_5
isne $I4, __ARG_3, ''
__label_5:
unless $I4 goto __label_4
.annotate 'line', 927
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 930
isnull $I4, __ARG_3
if $I4 goto __label_7
iseq $I4, __ARG_3, ''
__label_7:
unless $I4 goto __label_6
.annotate 'line', 931
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 932
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 933
# predefined substr
substr $S5, $S1, 0, $I1
add $I5, $I1, 5
# predefined substr
substr $S6, $S1, $I5
concat $S0, $S5, __ARG_3
concat $S0, $S0, $S6
set $S1, $S0
goto __label_9
__label_8: # endwhile
# }
__label_3: # endif
.annotate 'line', 936
# int n: $I2
set $P2, __ARG_4
set $I2, $P2
# for loop
.annotate 'line', 937
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 938
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 939
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 940
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 941
# predefined substr
substr $S7, $S1, 0, $I1
add $I5, $I1, 6
# predefined substr
substr $S8, $S1, $I5
concat $S0, $S7, $S4
concat $S0, $S0, $S8
set $S1, $S0
goto __label_14
__label_13: # endwhile
# }
__label_10: # for iteration
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 943
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 944
__ARG_1.'say'($S1)
# }
.annotate 'line', 945

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 907
addattribute $P0, 'body'
.annotate 'line', 908
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 959
# Body
# {
.annotate 'line', 961
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 962
.return($S1)
# }
.annotate 'line', 963

.end # name


.sub 'result' :method

.annotate 'line', 964
# Body
# {
.annotate 'line', 966
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 967

.end # result


.sub 'params' :method

.annotate 'line', 968
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 969
# Body
# {
.annotate 'line', 971
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 972
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 973
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 974
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 975
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 977
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 979
.return($S1)
# }
.annotate 'line', 980

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 981
# Body
# {
box $P1, __ARG_1
.annotate 'line', 987
setattribute self, 'name', $P1
.annotate 'line', 988
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 989
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 991
setattribute self, 'body', __ARG_2
__label_1: # endif
box $P2, __ARG_3
.annotate 'line', 992
setattribute self, 'typeresult', $P2
.annotate 'line', 993
# int n: $I1
null $I1
.annotate 'line', 994
if_null __ARG_4, __label_2
# {
box $P3, __ARG_4
.annotate 'line', 995
setattribute self, 'type0', $P3
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 996
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
set $I1, -1
goto __label_3 # break
__label_6: # case
set $I1, -2
.annotate 'line', 1002
if_null __ARG_5, __label_7
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
.annotate 'line', 1003
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
set $I1, 1
.annotate 'line', 1007
if_null __ARG_5, __label_8
# {
box $P4, __ARG_5
.annotate 'line', 1008
setattribute self, 'type1', $P4
inc $I1
.annotate 'line', 1009
# }
__label_8: # endif
.annotate 'line', 1011
if_null __ARG_6, __label_9
# {
box $P5, __ARG_6
.annotate 'line', 1012
setattribute self, 'type2', $P5
inc $I1
.annotate 'line', 1013
# }
__label_9: # endif
__label_3: # switch end
# }
__label_2: # endif
box $P5, $I1
.annotate 'line', 1017
setattribute self, 'nparams', $P5
.annotate 'line', 1018
.return(self)
# }
.annotate 'line', 1019

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 1020
# Body
# {
.annotate 'line', 1028
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1029
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1030
.return(self)
# }
.annotate 'line', 1031

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1032
# Body
# {
.annotate 'line', 1034
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1035
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1036
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1037
$P3 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P3
__label_1: # endif
.annotate 'line', 1038
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1039
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1040

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 950
addattribute $P0, 'name'
.annotate 'line', 951
addattribute $P0, 'body'
.annotate 'line', 952
addattribute $P0, 'evalfun'
.annotate 'line', 953
addattribute $P0, 'typeresult'
.annotate 'line', 954
addattribute $P0, 'type0'
.annotate 'line', 955
addattribute $P0, 'type1'
.annotate 'line', 956
addattribute $P0, 'type2'
.annotate 'line', 957
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1046
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1048
setattribute self, 'type', $P1
# }
.annotate 'line', 1049

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1050
# Body
# {
.annotate 'line', 1052
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1053
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1054
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1055
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1056
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1057
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1058
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1060
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 1061
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1062
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1064

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1045
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1069
# Body
# {
.annotate 'line', 1071
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1072
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1073
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1074
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1075
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_2: # for iteration
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1076
$P1 = __ARG_4[$I1]
__ARG_1.'emitsay'($P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1079
__ARG_1.'emitsay'("''")
__label_1: # endif
# }
.annotate 'line', 1080

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

.annotate 'line', 1085
# Body
# {
.annotate 'line', 1087
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1088
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1089
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1090
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1091
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1092
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1093

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

.annotate 'line', 1098
# Body
# {
.annotate 'line', 1100
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1101
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1102
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1103
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1102
# }
.annotate 'line', 1104

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1107
# Body
# {
.annotate 'line', 1109
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1110
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1111
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1112

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1114
# Body
# {
.annotate 'line', 1116
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1117
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1118
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1119

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1121
# Body
# {
.annotate 'line', 1123
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1124
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1125
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1126

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1128
# Body
# {
.annotate 'line', 1130
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1131
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1132
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1133
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1134
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1135

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1137
# Body
# {
.annotate 'line', 1139
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1141
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1142
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1144
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
$P2.'TokenQuoted'($P4, $P5, $S1)
.annotate 'line', 1145
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1146

.end # predefeval_chr


.sub 'predefeval_substr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1148
# Body
# {
.annotate 'line', 1150
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1151
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1152
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1153
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1155
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P6, __ARG_2, 'file'
getattribute $P7, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P6, $P7, $S2)
.annotate 'line', 1156
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_1, $P3)
set $P6, $P7
.return($P6)
# }
.annotate 'line', 1157

.end # predefeval_substr


.sub 'predefeval_substr_l'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1159
# Body
# {
.annotate 'line', 1161
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1162
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1163
# var arglen: $P3
$P6 = __ARG_3[2]
getattribute $P3, $P6, 'arg'
.annotate 'line', 1164
# string str: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_0
set $S1, $P6
__label_0:
.annotate 'line', 1165
# int pos: $I1
getattribute $P7, $P2, 'numval'
set $I1, $P7
.annotate 'line', 1166
# int len: $I2
getattribute $P7, $P3, 'numval'
set $I2, $P7
.annotate 'line', 1168
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P8, __ARG_2, 'file'
getattribute $P9, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P8, $P9, $S2)
.annotate 'line', 1169
new $P9, [ 'StringLiteral' ]
$P9.'StringLiteral'(__ARG_1, $P4)
set $P8, $P9
.return($P8)
# }
.annotate 'line', 1170

.end # predefeval_substr_l


.sub 'predefeval_indexof'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1172
# Body
# {
.annotate 'line', 1174
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1175
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1176
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1177
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1178
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1179

.end # predefeval_indexof


.sub 'predefeval_indexof_pos'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1181
# Body
# {
.annotate 'line', 1183
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1184
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1185
# var argpos: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1186
# string strfrom: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1187
# string strsearch: $S2
$P6 = $P2.'get_value'()
null $S2
if_null $P6, __label_1
set $S2, $P6
__label_1:
.annotate 'line', 1188
# int pos: $I1
getattribute $P6, $P3, 'numval'
set $I1, $P6
.annotate 'line', 1189
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1190

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1192
# Body
# {
.annotate 'line', 1194
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1195
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1196
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1197
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1198
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1199
get_hll_global $P7, 'predefeval_substr'
.annotate 'line', 1200
get_hll_global $P8, 'predefeval_substr_l'
.annotate 'line', 1201
get_hll_global $P9, 'predefeval_indexof'
.annotate 'line', 1202
get_hll_global $P10, 'predefeval_indexof_pos'
.annotate 'line', 1204
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1205
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1206
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1205
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1204
$P1.'push'($P12)
.annotate 'line', 1209
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1210
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1209
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1204
$P1.'push'($P16)
.annotate 'line', 1213
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1214
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1213
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1204
$P1.'push'($P20)
.annotate 'line', 1217
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1204
$P1.'push'($P24)
.annotate 'line', 1221
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1204
$P1.'push'($P26)
.annotate 'line', 1225
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1204
$P1.'push'($P28)
.annotate 'line', 1229
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1204
$P1.'push'($P30)
.annotate 'line', 1233
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1204
$P1.'push'($P32)
.annotate 'line', 1237
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P34)
.annotate 'line', 1242
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P36)
.annotate 'line', 1247
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P38)
.annotate 'line', 1252
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1204
$P1.'push'($P40)
.annotate 'line', 1258
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1204
$P1.'push'($P42)
.annotate 'line', 1265
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1204
$P1.'push'($P44)
.annotate 'line', 1269
new $P47, [ 'PredefFunction' ]
.annotate 'line', 1269
$P46 = $P47.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1204
$P1.'push'($P46)
.annotate 'line', 1274
new $P49, [ 'PredefFunction' ]
.annotate 'line', 1274
$P48 = $P49.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1204
$P1.'push'($P48)
.annotate 'line', 1279
new $P51, [ 'PredefFunction' ]
.annotate 'line', 1279
$P50 = $P51.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1204
$P1.'push'($P50)
.annotate 'line', 1286
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1286
$P52 = $P53.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1204
$P1.'push'($P52)
.annotate 'line', 1291
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1291
$P54 = $P55.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1204
$P1.'push'($P54)
.annotate 'line', 1296
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1296
$P56 = $P57.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1204
$P1.'push'($P56)
.annotate 'line', 1301
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1301
$P58 = $P59.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1204
$P1.'push'($P58)
.annotate 'line', 1306
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1306
$P60 = $P61.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P60)
.annotate 'line', 1311
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1311
$P62 = $P63.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1204
$P1.'push'($P62)
.annotate 'line', 1316
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1204
$P1.'push'($P64)
.annotate 'line', 1320
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P66)
.annotate 'line', 1324
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P68)
.annotate 'line', 1328
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P70)
.annotate 'line', 1332
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P72)
.annotate 'line', 1336
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P74)
.annotate 'line', 1341
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P76)
.annotate 'line', 1346
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P78)
.annotate 'line', 1350
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P80)
.annotate 'line', 1354
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P82)
.annotate 'line', 1358
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P84)
.annotate 'line', 1362
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P86)
.annotate 'line', 1366
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P88)
.annotate 'line', 1370
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P90)
.annotate 'line', 1374
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P92)
.annotate 'line', 1378
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P94)
.annotate 'line', 1382
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P96)
.annotate 'line', 1386
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1204
$P1.'push'($P98)
.annotate 'line', 1390
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1204
$P1.'push'($P100)
.annotate 'line', 1394
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P102)
.annotate 'line', 1398
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P104)
.annotate 'line', 1402
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P106)
.annotate 'line', 1406
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1204
$P1.'push'($P108)
.annotate 'line', 1410
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1204
$P1.'push'($P110)
.annotate 'line', 1414
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P112)
.annotate 'line', 1418
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1204
$P1.'push'($P114)
.annotate 'line', 1422
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P116)
.annotate 'line', 1427
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P118)
.annotate 'line', 1432
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1204
$P1.'push'($P120)
.annotate 'line', 1436
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1204
$P1.'push'($P122)
.annotate 'line', 1440
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1204
$P1.'push'($P124)
.annotate 'line', 1444
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1204
$P1.'push'($P126)
.annotate 'line', 1448
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1204
$P1.'push'($P128)
.annotate 'line', 1452
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1453
new $P132, [ 'Predef_print' ]
.annotate 'line', 1452
$P130 = $P131.'set'('print', $P132, 'v', '*')
.annotate 'line', 1204
$P1.'push'($P130)
.annotate 'line', 1456
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1457
new $P135, [ 'Predef_say' ]
.annotate 'line', 1456
$P133 = $P134.'set'('say', $P135, 'v', '*')
.annotate 'line', 1204
$P1.'push'($P133)
.annotate 'line', 1460
new $P137, [ 'PredefFunction' ]
.annotate 'line', 1461
new $P138, [ 'Predef_cry' ]
.annotate 'line', 1460
$P136 = $P137.'set'('cry', $P138, 'v', '*')
.annotate 'line', 1204
$P1.'push'($P136)
__label_1: # Infinite loop
.annotate 'line', 1466
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1467

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1469
# Body
# {
.annotate 'line', 1471
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1472
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1473
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1474
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1475
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1476
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1477
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1479
.return($P2)
# }
.annotate 'line', 1480

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1486
# Body
# {
.annotate 'line', 1488
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1489
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1490
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1489
# }
.annotate 'line', 1491

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1502
# Body
# {
.annotate 'line', 1504
setattribute self, 'start', __ARG_1
.annotate 'line', 1505
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1506

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1507
# Body
# {
.annotate 'line', 1509
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1510

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1511
# Body
# {
.annotate 'line', 1513
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1514

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1515
# Body
# {
.annotate 'line', 1517
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1518

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1519
# Body
# {
.annotate 'line', 1521
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1522

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1526

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1527
# Body
# {
.annotate 'line', 1529
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1530

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1499
addattribute $P0, 'start'
.annotate 'line', 1500
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1543
# Body
# {
.annotate 'line', 1545
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1546

.end # init


.sub 'numargs' :method

.annotate 'line', 1548
# Body
# {
.annotate 'line', 1550
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1551

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1552
# Body
# {
.annotate 'line', 1554
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1555
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1556

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1558
# Body
# {
.annotate 'line', 1560
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1561
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1562
# {
.annotate 'line', 1563
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1564
$P1.'push'($P3)
# }
.annotate 'line', 1565
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1566
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1567

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1569
# Body
# {
.annotate 'line', 1571
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1572
if_null $P1, __label_0
.annotate 'line', 1573
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1574

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1575
# Body
# {
.annotate 'line', 1577
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1578
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1579
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1580
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1581
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1582
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1583
$P2.'push'($S1)
# }
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1585
.return($P2)
# }
.annotate 'line', 1586

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1587
# Body
# {
.annotate 'line', 1589
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1590
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1591

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1541
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1603
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1604
# Body
# {
.annotate 'line', 1606
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1607
.return($I1)
# }
.annotate 'line', 1608

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1609
# Body
# {
.annotate 'line', 1611
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1612
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1613
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1615
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1616

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1617
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1619
setattribute self, 'name', $P1
.annotate 'line', 1620
if_null __ARG_2, __label_0
.annotate 'line', 1621
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1622

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1623
# Body
# {
.annotate 'line', 1625
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1626

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1600
addattribute $P0, 'name'
.annotate 'line', 1601
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1633
# Body
# {
.annotate 'line', 1635
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1636
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1637
# {
.annotate 'line', 1638
$P2 = __ARG_1.'get'()
.annotate 'line', 1639
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1640
$P2 = __ARG_1.'get'()
.annotate 'line', 1641
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1642
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1643
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1644
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1646
new $P6, [ 'Modifier' ]
$P6.'Modifier'($S1, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
.annotate 'line', 1647
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1648
'RequireOp'(']', $P2)
.annotate 'line', 1649
setattribute self, 'list', $P1
# }
.annotate 'line', 1650

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1651
# Body
# {
.annotate 'line', 1653
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1654
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1655

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1656
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1657
# Body
# {
.annotate 'line', 1659
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1660
# int n: $I1
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
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1663
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1664
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1667
.return($P3)
# }
.annotate 'line', 1668

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1631
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1675
# Body
# {
.annotate 'line', 1677
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1678
.return($S2)
# }
.annotate 'line', 1679

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1681
# Body
# {
.annotate 'line', 1683
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1684
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1686
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1687
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1689

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1691
# Body
# {
.annotate 'line', 1693
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1694
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1695
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1696
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1697
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1699
__ARG_2.'unget'($P1)
.annotate 'line', 1700
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1702

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1707
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1708
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1709
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1710
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1711
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1712
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1714
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1715
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1716
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
.annotate 'line', 1718
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1720
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1723
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1726
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1728
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1730
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1732
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1734
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_14: # case
.annotate 'line', 1736
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_15: # case
.annotate 'line', 1738
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_16: # case
.annotate 'line', 1740
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_17: # case
.annotate 'line', 1742
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_18: # case
.annotate 'line', 1744
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_19: # case
.annotate 'line', 1746
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_20: # case
.annotate 'line', 1748
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_21: # case
.annotate 'line', 1750
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_22: # case
.annotate 'line', 1752
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1754
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_24: # case
.annotate 'line', 1756
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1758
$P30 = $P1.'isidentifier'()
if_null $P30, __label_25
unless $P30 goto __label_25
# {
.annotate 'line', 1759
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1760
$P9 = $P3.'isop'(':')
if_null $P9, __label_26
unless $P9 goto __label_26
.annotate 'line', 1761
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_26: # endif
.annotate 'line', 1762
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1764
__ARG_1.'unget'($P1)
.annotate 'line', 1765
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1767
unless_null $P2, __label_27
.annotate 'line', 1768
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1769
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1770

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1778
# Body
# {
.annotate 'line', 1780
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1781

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1782
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1783
# Body
# {
.annotate 'line', 1785
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1786

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1787
# Body
# {
.annotate 'line', 1789
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1790

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1791
# Body
# {
.annotate 'line', 1793
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1794

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1795
# Body
# {
.annotate 'line', 1797
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1798

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1799
# Body
# {
.annotate 'line', 1801
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1802

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1803
# Body
# {
.annotate 'line', 1805
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1806

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1807
# Body
# {
.annotate 'line', 1809
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1810

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1811
# Body
# {
.annotate 'line', 1813
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1814

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1815
# Body
# {
.annotate 'line', 1817
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1818

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1819
# Body
# {
.annotate 'line', 1821
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1822

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1824
# Body
# {
.annotate 'line', 1829
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1830

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1831
# Body
# {
.annotate 'line', 1833
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1834

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1835
# Body
# {
.annotate 'line', 1837
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1838

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1839
# Body
# {
.annotate 'line', 1841
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1843
.return(self)
# }
.annotate 'line', 1844

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1776
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1849
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1850
# Body
# {
.annotate 'line', 1852
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1853

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1854
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1855
# Body
# {
# }
.annotate 'line', 1858

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1847
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1865
# Body
# {
.annotate 'line', 1867
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1868
$P1.'push'(__ARG_1)
.annotate 'line', 1869
$P1.'push'(__ARG_2)
.annotate 'line', 1870
setattribute self, 'statements', $P1
# }
.annotate 'line', 1871

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1872
# Body
# {
.annotate 'line', 1874
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1875
.return(self)
# }
.annotate 'line', 1876

.end # push


.sub 'optimize' :method

.annotate 'line', 1877
# Body
# {
.annotate 'line', 1879
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1880
.return(self)
# }
.annotate 'line', 1881

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1882
# Body
# {
.annotate 'line', 1884
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1885
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1886

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1863
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1889
# Body
# {
.annotate 'line', 1891
unless_null __ARG_1, __label_0
.annotate 'line', 1892
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1893
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1894
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1896
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1897

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1907
# Body
# {
.annotate 'line', 1909
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1910
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1911
# int dotted: $I1
null $I1
.annotate 'line', 1912
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1914
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1916
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
.annotate 'line', 1917
setattribute self, 'opname', $P3
.annotate 'line', 1918
$P1 = __ARG_2.'get'()
.annotate 'line', 1919
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1920
__ARG_2.'unget'($P1)
.annotate 'line', 1921
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1923
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1924

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1925
# Body
# {
.annotate 'line', 1927
self.'optimizeargs'()
.annotate 'line', 1928
.return(self)
# }
.annotate 'line', 1929

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1930
# Body
# {
.annotate 'line', 1932
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1933
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1934
__ARG_1.'comment'($S2)
.annotate 'line', 1935
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1936
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1938
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1939
self.'emitargs'(__ARG_1)
.annotate 'line', 1940
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1942

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1903
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1905
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1952
# Body
# {
.annotate 'line', 1954
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1955
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1956
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1957
# {
.annotate 'line', 1958
$P2 = __ARG_2.'get'()
.annotate 'line', 1959
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1960
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1961
'RequireOp'(';', $P2)
.annotate 'line', 1962
setattribute self, 'path', $P1
.annotate 'line', 1963
.return(self)
# }
.annotate 'line', 1964

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1965
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1966
# Body
# {
.annotate 'line', 1968
self.'annotate'(__ARG_1)
.annotate 'line', 1969
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1970

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1949
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1951
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1980
# Body
# {
.annotate 'line', 1982
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1983
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1984
'ExpectOp'(';', __ARG_2)
box $P1, $S1
.annotate 'line', 1985
setattribute self, 'symbol', $P1
# }
.annotate 'line', 1986

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1987
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1988
# Body
# {
.annotate 'line', 1990
self.'annotate'(__ARG_1)
.annotate 'line', 1991
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1992
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1993

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1977
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1979
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2003
# Body
# {
.annotate 'line', 2005
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2006
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 2007
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 2008
# {
.annotate 'line', 2009
$P2 = __ARG_2.'get'()
.annotate 'line', 2010
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 2011
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 2012
'RequireOp'(';', $P2)
.annotate 'line', 2013
setattribute self, 'path', $P1
# }
.annotate 'line', 2014

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2015
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2016
# Body
# {
.annotate 'line', 2018
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2019
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2020
self.'annotate'(__ARG_1)
.annotate 'line', 2022
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2023
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2025
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 2026
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2028
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 2031
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 2033

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2000
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2002
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2043
# Body
# {
.annotate 'line', 2045
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2046
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2047
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2048

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2049
# Body
# {
.annotate 'line', 2051
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2052
.return(self)
# }
.annotate 'line', 2053

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2054
# Body
# {
.annotate 'line', 2056
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2057

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2040
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2042
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2074
# Body
# {
.annotate 'line', 2076
setattribute self, 'type', __ARG_1
.annotate 'line', 2077
setattribute self, 'reg', __ARG_2
.annotate 'line', 2078
setattribute self, 'scope', __ARG_3
box $P2, __ARG_4
.annotate 'line', 2079
setattribute self, 'flags', $P2
.annotate 'line', 2080
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2081

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2082
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2084
setattribute self, 'id', $P1
# }
.annotate 'line', 2085

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2086
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2088
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2089

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2090
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2091
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2092
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2093
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2094
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2095
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2096
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2097
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
.annotate 'line', 2066
addattribute $P0, 'type'
.annotate 'line', 2067
addattribute $P0, 'reg'
.annotate 'line', 2068
addattribute $P0, 'scope'
.annotate 'line', 2069
addattribute $P0, 'flags'
.annotate 'line', 2070
addattribute $P0, 'value'
.annotate 'line', 2071
addattribute $P0, 'id'
.annotate 'line', 2072
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2103
# Body
# {
.annotate 'line', 2105
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2106

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2107
# Body
# {
.annotate 'line', 2109
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2110

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2102
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2117
# Body
# {
.annotate 'line', 2119
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2120

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2121
# Body
# {
.annotate 'line', 2123
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2124
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2125
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2126
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
.annotate 'line', 2127
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2128
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2129
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2130
$P1[$S1] = $P3
.annotate 'line', 2131
.return($P3)
# }
.annotate 'line', 2132

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2133
# Body
# {
.annotate 'line', 2135
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2136
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2137
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2138
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2139
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2140
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2141

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2142
# Body
# {
.annotate 'line', 2144
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2145
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2146
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2147
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2148
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2149
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2150
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2151
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2152
$P1[$S1] = $P3
# }
.annotate 'line', 2153

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2154
# Body
# {
.annotate 'line', 2156
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2157
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2158
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2159
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2160
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2161
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2162
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2163
.return($P2)
# }
.annotate 'line', 2164

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2165
# Body
# {
.annotate 'line', 2167
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2168
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2169
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2170
.return($P2)
# }
.annotate 'line', 2171

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2172
# Body
# {
.annotate 'line', 2174
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2175
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2176
.return($S1)
# }
.annotate 'line', 2177

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2182
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2183
.return('__WLEX_self')
# }
.annotate 'line', 2184

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2116
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2193
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2203
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2204
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2205
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2206
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2207
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2208
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2209
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2210
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2211
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2212
# Body
# {
.annotate 'line', 2214
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2215

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2216
# Body
# {
.annotate 'line', 2218
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2219

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2220
# Body
# {
.annotate 'line', 2223
.return(self)
# }
.annotate 'line', 2224

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2225
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2226
# Body
# {
.annotate 'line', 2228
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2229
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2230
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2231
.return($S2)
# }
.annotate 'line', 2232

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2233
# Body
# {
.annotate 'line', 2235
# string reg: $S1
null $S1
.annotate 'line', 2236
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2237
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2239
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2240
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2242
.return($S1)
# }
.annotate 'line', 2243

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2244
# Body
# {
.annotate 'line', 2246
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2247

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2201
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2252
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2250
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2260
# Body
# {
.annotate 'line', 2262
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2263
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2264
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2265
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2266
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2267

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2268
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2269
# Body
# {
.annotate 'line', 2271
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2272
.return(self)
# }
.annotate 'line', 2273

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2274
# Body
# {
.annotate 'line', 2276
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2277
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2278
self.'annotate'(__ARG_1)
.annotate 'line', 2279
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
set $S2, __ARG_2
.annotate 'line', 2280
eq $S2, '', __label_1
.annotate 'line', 2281
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2282

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2257
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2259
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2295
# Body
# {
.annotate 'line', 2297
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2298
.return(self)
# }
.annotate 'line', 2299

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2300
# Body
# {
.annotate 'line', 2302
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2303

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2304
# Body
# {
.annotate 'line', 2306
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2307
.return(self)
# }
.annotate 'line', 2308

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2309
# Body
# {
.annotate 'line', 2311
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2312
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2313
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2315
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2316
ne $I1, 0, __label_4
.annotate 'line', 2317
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2319
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2322
.return(0)
# }
.annotate 'line', 2323

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2324
# Body
# {
.annotate 'line', 2326
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2328
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2329
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2330
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2332
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2333
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2334
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
.annotate 'line', 2337
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2340
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2343
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2346

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2347
# Body
# {
.annotate 'line', 2349
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2351
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2352
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2353
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2355
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2356
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2357
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
.annotate 'line', 2360
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2363
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2366
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2369

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2294
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2376
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2377
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2374
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2385
# Body
# {
.annotate 'line', 2387
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2388
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2389

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2390
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2391
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2392
# Body
# {
.annotate 'line', 2394
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2395
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2396
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2397
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2398
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2399
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2401
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
unless $I2 goto __label_4
.annotate 'line', 2404
# {
unless $I1 goto __label_5
.annotate 'line', 2405
# {
null $I1
.annotate 'line', 2407
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2409
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2410
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2412
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2415
# string result: $S4
set $S4, ''
.annotate 'line', 2416
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2417
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2418
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2419
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2420
le $I6, 127, __label_12
# {
.annotate 'line', 2421
# string h: $S6
box $P6, $I6
$P4 = $P6.'get_as_base'(16)
null $S6
if_null $P4, __label_14
set $S6, $P4
__label_14:
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
.annotate 'line', 2422
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2425
# }
__label_9: # for iteration
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2427
# }
__label_4: # endif
.annotate 'line', 2429
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2433
.return($S1)
# }
.annotate 'line', 2434

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2435
# Body
# {
.annotate 'line', 2437
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2438
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2439
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2440
# var s: $P2
box $P2, $S1
.annotate 'line', 2441
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2443
.return($S1)
# }
.annotate 'line', 2444

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2445
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2447
eq $S1, '', __label_0
.annotate 'line', 2448
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2449

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2450
# Body
# {
.annotate 'line', 2452
.tailcall self.'getPirString'()
# }
.annotate 'line', 2453

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2382
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2384
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2465
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2466
setattribute self, 'pos', __ARG_2
.annotate 'line', 2467
# int n: $I1
null $I1
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2469
# {
.annotate 'line', 2471
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2472
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2474
setattribute self, 'numval', $P2
# }
.annotate 'line', 2475

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2476
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2477
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2478
# Body
# {
.annotate 'line', 2480
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2481
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2482
.return($I1)
# }
.annotate 'line', 2483

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2484
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2486
eq $S1, '', __label_0
# {
.annotate 'line', 2487
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2488
ne $I1, 0, __label_1
.annotate 'line', 2489
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2491
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2493

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2494
# Body
# {
.annotate 'line', 2496
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2497

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2458
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2460
addattribute $P0, 'pos'
.annotate 'line', 2461
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2505
# Body
# {
.annotate 'line', 2507
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2508
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2509

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2510
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2511
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2512
# Body
# {
.annotate 'line', 2514
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2515
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2517
.return($P1)
# }
.annotate 'line', 2518

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2519
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2521
eq $S1, '', __label_0
# {
.annotate 'line', 2522
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2523
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2525

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2526
# Body
# {
.annotate 'line', 2530
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2531
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2533
.return($S1)
# }
.annotate 'line', 2534

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2502
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2504
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2542
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2543
# Body
# {
.annotate 'line', 2545
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2546
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2547

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2548
# Body
# {
.annotate 'line', 2550
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2551

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2552
# Body
# {
.annotate 'line', 2554
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2555
if_null $P1, __label_0
.annotate 'line', 2556
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2558
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
.annotate 'line', 2561
.return('P')
__label_3: # default
.annotate 'line', 2563
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2566

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2567
# Body
# {
.annotate 'line', 2569
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2570
.return($S1)
# }
.annotate 'line', 2571

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2572
# Body
# {
.annotate 'line', 2574
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2575
unless_null $P1, __label_0
.annotate 'line', 2576
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2577
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2578
# string s: $S1
null $S1
.annotate 'line', 2579
unless_null $P2, __label_1
# {
.annotate 'line', 2580
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2581
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
.annotate 'line', 2587
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2591
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2592
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2594
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2596
.return($S1)
# }
.annotate 'line', 2597

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2598
# Body
# {
.annotate 'line', 2600
# var value: $P1
$P1 = self.'checkIdentifier'()
set $S2, $P1
.annotate 'line', 2601
ne $S2, '', __label_0
# {
.annotate 'line', 2602
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
.annotate 'line', 2603
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2605
.return($P1)
# }
.annotate 'line', 2606

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2607
# Body
# {
.annotate 'line', 2609
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2610
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2611
if_null $P2, __label_0
# {
.annotate 'line', 2612
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2613
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2615
.return(self)
# }
.annotate 'line', 2616

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2617
# Body
# {
.annotate 'line', 2619
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2620
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2621
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2622
# string lexname: $S2
$P3 = $P1.'getlex'()
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2623
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2624
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2626
.return($S1)
# }
.annotate 'line', 2627

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2628
# Body
# {
set $S2, __ARG_2
.annotate 'line', 2630
eq $S2, '', __label_0
# {
.annotate 'line', 2631
self.'annotate'(__ARG_1)
.annotate 'line', 2632
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2633
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2635

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2636
# Body
# {
.annotate 'line', 2638
self.'annotate'(__ARG_1)
.annotate 'line', 2639
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2640
.return($S1)
# }
.annotate 'line', 2641

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2642
# Body
# {
.annotate 'line', 2644
self.'annotate'(__ARG_1)
.annotate 'line', 2645
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2646
die "NO"
__label_0: # endif
.annotate 'line', 2647
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2648
# string lreg: $S2
$P3 = self.'getIdentifier'()
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 2649
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
# {
set $S6, $S1
set $S7, 'S'
.annotate 'line', 2650
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2653
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2656
getattribute $P4, self, 'start'
'SyntaxError'("Can't assign null to that type", $P4)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2659
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2660
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2662
# string typeright: $S3
$P4 = __ARG_2.'checkresult'()
null $S3
if_null $P4, __label_11
set $S3, $P4
__label_11:
.annotate 'line', 2663
ne $S3, 'v', __label_12
.annotate 'line', 2664
getattribute $P5, self, 'start'
'SyntaxError'("Can't assign from void expression", $P5)
__label_12: # endif
.annotate 'line', 2665
ne $S1, $S3, __label_13
# {
.annotate 'line', 2666
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2669
# string rreg: $S4
$P5 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_15
set $S4, $P5
__label_15:
.annotate 'line', 2670
self.'annotate'(__ARG_1)
.annotate 'line', 2671
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2672
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2674
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2677
# var desc: $P1
getattribute $P6, self, 'owner'
getattribute $P7, self, 'name'
$P1 = $P6.'getvar'($P7)
.annotate 'line', 2678
$P6 = $P1.'isvolatile'()
if_null $P6, __label_19
unless $P6 goto __label_19
# {
.annotate 'line', 2679
# string lexname: $S5
$P7 = $P1.'getlex'()
null $S5
if_null $P7, __label_20
set $S5, $P7
__label_20:
.annotate 'line', 2680
isnull $I2, $S5
not $I2
unless $I2 goto __label_22
isne $I2, $S5, ''
__label_22:
unless $I2 goto __label_21
.annotate 'line', 2681
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_21: # endif
# }
__label_19: # endif
.annotate 'line', 2683
.return($S2)
# }
.annotate 'line', 2684

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2539
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2541
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2691
# Body
# {
.annotate 'line', 2693
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2694

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2689
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2705
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2706

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2707
# Body
# {
.annotate 'line', 2709
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2710

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2711
# Body
# {
.annotate 'line', 2713
self.'optimizearg'()
.annotate 'line', 2714
.return(self)
# }
.annotate 'line', 2715

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2699
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2701
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2724
# Body
# {
.annotate 'line', 2726
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2727
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2728
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2729

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2730
# Body
# {
.annotate 'line', 2732
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2733
.return(self)
# }
.annotate 'line', 2734

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2735
# Body
# {
.annotate 'line', 2737
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2738

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2739
# Body
# {
.annotate 'line', 2741
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2742
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2743

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2744
# Body
# {
.annotate 'line', 2746
self.'optimizearg'()
.annotate 'line', 2747
.return(self)
# }
.annotate 'line', 2748

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2749
# Body
# {
.annotate 'line', 2751
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2752
.return($S1)
# }
.annotate 'line', 2753

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2754
# Body
# {
.annotate 'line', 2756
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2757
.return($S1)
# }
.annotate 'line', 2758

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2720
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2722
addattribute $P0, 'lexpr'
.annotate 'line', 2723
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2765
# Body
# {
.annotate 'line', 2767
.return('I')
# }
.annotate 'line', 2768

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2769
# Body
# {
.annotate 'line', 2771
self.'optimizearg'()
.annotate 'line', 2772
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2773
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2774
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2775
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2776
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2777
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
$P6 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P4, $P5, $P6)
# }
__label_0: # endif
.annotate 'line', 2779
.return(self)
# }
.annotate 'line', 2780

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2763
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2787
# Body
# {
.annotate 'line', 2789
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2790

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2791
# Body
# {
.annotate 'line', 2793
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2794
.return(self)
# }
.annotate 'line', 2795

.end # set


.sub 'optimize' :method

.annotate 'line', 2796
# Body
# {
.annotate 'line', 2798
self.'optimizearg'()
.annotate 'line', 2799
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2800
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2801
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2802
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2805
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2806
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2807
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2808
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2811
.return(self)
# }
.annotate 'line', 2812

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2813
# Body
# {
.annotate 'line', 2815
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2816
self.'annotate'(__ARG_1)
.annotate 'line', 2817
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2818

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2785
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2825
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2826
# Body
# {
.annotate 'line', 2828
.return('I')
# }
.annotate 'line', 2829

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2830
# Body
# {
.annotate 'line', 2832
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2833
.return(self)
# }
.annotate 'line', 2834

.end # set


.sub 'optimize' :method

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
self.'optimizearg'()
.annotate 'line', 2838
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2839
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2840
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2841
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2842
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2844
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2845
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2846
.return(self)
# }
.annotate 'line', 2847

.end # optimize


.sub 'negated' :method

.annotate 'line', 2848
# Body
# {
.annotate 'line', 2850
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2851

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2852
# Body
# {
.annotate 'line', 2854
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2855
self.'annotate'(__ARG_1)
.annotate 'line', 2856
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2857
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2859
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2862
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2865
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2867

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2823
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2874
# Body
# {
.annotate 'line', 2876
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2877

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2878
# Body
# {
.annotate 'line', 2880
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2881
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2882
.return(self)
# }
.annotate 'line', 2883

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2884
# Body
# {
.annotate 'line', 2886
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2887
eq $S2, '', __label_1
.annotate 'line', 2888
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2889

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2890
# Body
# {
.annotate 'line', 2892
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2893
self.'annotate'(__ARG_1)
.annotate 'line', 2894
__ARG_1.'emitinc'($S1)
.annotate 'line', 2895
.return($S1)
# }
.annotate 'line', 2896

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2872
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2903
# Body
# {
.annotate 'line', 2905
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2906
.return(self)
# }
.annotate 'line', 2907

.end # set


.sub 'checkresult' :method

.annotate 'line', 2908
# Body
# {
.annotate 'line', 2910
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2911

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2912
# Body
# {
.annotate 'line', 2914
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2915
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2916
eq $S2, '', __label_1
.annotate 'line', 2917
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2918
__ARG_1.'emitinc'($S1)
.annotate 'line', 2919
.return($S1)
# }
.annotate 'line', 2920

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2901
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2927
# Body
# {
.annotate 'line', 2929
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2930

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2931
# Body
# {
.annotate 'line', 2933
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2934
.return(self)
# }
.annotate 'line', 2935

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2936
# Body
# {
.annotate 'line', 2938
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2939
eq $S2, '', __label_1
.annotate 'line', 2940
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2941

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2942
# Body
# {
.annotate 'line', 2944
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2945
self.'annotate'(__ARG_1)
.annotate 'line', 2946
__ARG_1.'emitdec'($S1)
.annotate 'line', 2947
.return($S1)
# }
.annotate 'line', 2948

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2925
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2955
# Body
# {
.annotate 'line', 2957
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2958
.return(self)
# }
.annotate 'line', 2959

.end # set


.sub 'checkresult' :method

.annotate 'line', 2960
# Body
# {
.annotate 'line', 2962
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2963

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2964
# Body
# {
.annotate 'line', 2966
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2967
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2968
eq $S2, '', __label_1
.annotate 'line', 2969
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2970
__ARG_1.'emitdec'($S1)
.annotate 'line', 2971
.return($S1)
# }
.annotate 'line', 2972

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2953
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2981
# Body
# {
.annotate 'line', 2983
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2984
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2985
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2986
.return(self)
# }
.annotate 'line', 2987

.end # set


.sub 'checkresult' :method

.annotate 'line', 2988
# Body
# {
.annotate 'line', 2990
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2991
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2993
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2994

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2995
# Body
# {
.annotate 'line', 2997
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2998
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2999
.return(self)
# }
.annotate 'line', 3000

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3001
# Body
# {
.annotate 'line', 3003
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3004

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2977
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2979
addattribute $P0, 'lexpr'
.annotate 'line', 2980
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3011
# Body
# {
.annotate 'line', 3013
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3014
eq $S2, '', __label_1
# {
.annotate 'line', 3015
self.'annotate'(__ARG_1)
.annotate 'line', 3016
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3018

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3019
# Body
# {
.annotate 'line', 3021
self.'annotate'(__ARG_1)
.annotate 'line', 3022
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3023
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3024

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3009
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3031
# Body
# {
.annotate 'line', 3033
self.'annotate'(__ARG_1)
.annotate 'line', 3034
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3035
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3036
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3037

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3038
# Body
# {
.annotate 'line', 3040
self.'annotate'(__ARG_1)
.annotate 'line', 3041
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3042
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3043
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3044
.return($S1)
# }
.annotate 'line', 3045

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3029
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3052
# Body
# {
.annotate 'line', 3054
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3055
eq $S2, '', __label_1
.annotate 'line', 3056
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3057

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3061
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3062
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3063
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3064
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 3065
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3067
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 3068
self.'annotate'(__ARG_1)
.annotate 'line', 3069
ne $S1, 'S', __label_6
# {
.annotate 'line', 3070
$P4 = $P2.'checkresult'()
set $S5, $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 3071
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 3072
__ARG_1.'emitset'($S4, $S3)
set $S3, $S4
.annotate 'line', 3073
# }
__label_8: # endif
.annotate 'line', 3075
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 3078
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 3080
.return($S2)
# }
.annotate 'line', 3081

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3050
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3088
# Body
# {
.annotate 'line', 3090
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3091
eq $S2, '', __label_1
.annotate 'line', 3092
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3093

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3094
# Body
# {
.annotate 'line', 3096
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3097
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3098
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3099
self.'annotate'(__ARG_1)
.annotate 'line', 3100
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 3101
.return($S2)
# }
.annotate 'line', 3102

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3086
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3112
eq $S2, '', __label_1
.annotate 'line', 3113
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3114

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3115
# Body
# {
.annotate 'line', 3117
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3118
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3119
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3120
self.'annotate'(__ARG_1)
.annotate 'line', 3121
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 3122
.return($S2)
# }
.annotate 'line', 3123

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3107
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3130
# Body
# {
.annotate 'line', 3132
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3133
eq $S2, '', __label_1
.annotate 'line', 3134
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3135

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3139
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3140
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3141
self.'annotate'(__ARG_1)
.annotate 'line', 3142
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3143
.return($S2)
# }
.annotate 'line', 3144

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3128
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3151
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3152
# Body
# {
.annotate 'line', 3154
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3155
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3156
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3157
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3158
self.'annotate'(__ARG_1)
.annotate 'line', 3159
# string aux: $S5
null $S5
.annotate 'line', 3160
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3162
ne $S1, 'I', __label_7
# {
.annotate 'line', 3163
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3164
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3165
# }
__label_7: # endif
.annotate 'line', 3167
ne $S2, 'I', __label_8
# {
.annotate 'line', 3168
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3169
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3170
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3173
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3174
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3175
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3176
# }
goto __label_10
__label_9: # else
.annotate 'line', 3178
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3179
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3180
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3181
# }
goto __label_13
__label_12: # else
.annotate 'line', 3183
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 3184
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3185
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3186
# }
goto __label_16
__label_15: # else
.annotate 'line', 3188
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 3189
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3190
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3191
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 3194
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3196
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3199
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3202
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3203
# }
.annotate 'line', 3205

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3206
# Body
# {
.annotate 'line', 3208
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3209

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3210
# Body
# {
.annotate 'line', 3212
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3213

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3214
# Body
# {
.annotate 'line', 3216
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3217

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3149
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3230
# Body
# {
.annotate 'line', 3232
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3233
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3234
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3235

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3236
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3237
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3238
# Body
# {
.annotate 'line', 3240
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3241
setattribute self, 'checknull', $P1
.annotate 'line', 3242
.return(self)
# }
.annotate 'line', 3243

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3244
# Body
# {
.annotate 'line', 3246
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3247
self.'annotate'(__ARG_1)
.annotate 'line', 3248
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3249
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3250
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3251

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3252
# Body
# {
.annotate 'line', 3254
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3255
self.'annotate'(__ARG_1)
.annotate 'line', 3256
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
.annotate 'line', 3257

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3225
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3227
addattribute $P0, 'expr'
.annotate 'line', 3228
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3264
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3265
# Body
# {
.annotate 'line', 3267
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3268

.end # negated


.sub 'optimize' :method

.annotate 'line', 3269
# Body
# {
.annotate 'line', 3271
self.'optimizearg'()
.annotate 'line', 3272
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3273
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3274
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3275
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3276
# {
unless $I2 goto __label_1
.annotate 'line', 3278
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3280
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3283
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3284
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3285
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3286
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3287
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3288
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3289
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3290
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3293
.return(self)
# }
.annotate 'line', 3294

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3295
# Body
# {
.annotate 'line', 3297
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3298

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3299
# Body
# {
.annotate 'line', 3301
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3302

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3303
# Body
# {
.annotate 'line', 3305
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3306

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3307
# Body
# {
.annotate 'line', 3309
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3310

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3262
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3317
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3318
# Body
# {
.annotate 'line', 3320
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3321

.end # negated


.sub 'optimize' :method

.annotate 'line', 3322
# Body
# {
.annotate 'line', 3324
self.'optimizearg'()
.annotate 'line', 3325
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3326
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3327
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3328
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3329
# {
unless $I2 goto __label_1
.annotate 'line', 3331
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3333
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3336
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3337
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3338
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3339
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3340
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3341
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3342
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3343
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3346
.return(self)
# }
.annotate 'line', 3347

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3348
# Body
# {
.annotate 'line', 3350
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3351

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3352
# Body
# {
.annotate 'line', 3354
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3355

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3356
# Body
# {
.annotate 'line', 3358
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3359

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3360
# Body
# {
.annotate 'line', 3362
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3363

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3315
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

.annotate 'line', 3371
# Body
# {
.annotate 'line', 3373
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3374
setattribute self, 'positive', $P1
# }
.annotate 'line', 3375

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3376
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3377
# Body
# {
.annotate 'line', 3379
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3380
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
.annotate 'line', 3381

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3382
# Body
# {
.annotate 'line', 3384
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3385
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3386
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3387

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3388
# Body
# {
.annotate 'line', 3390
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3391

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3392
# Body
# {
.annotate 'line', 3394
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3395
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3396
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3397

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3398
# Body
# {
.annotate 'line', 3400
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3401
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3402
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3403

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3368
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3370
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3410
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3411
# Body
# {
.annotate 'line', 3413
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3414

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3415
# Body
# {
.annotate 'line', 3417
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3418

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3419
# Body
# {
.annotate 'line', 3421
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3422

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3423
# Body
# {
.annotate 'line', 3425
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3426

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3408
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3433
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3434
# Body
# {
.annotate 'line', 3436
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3437

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3438
# Body
# {
.annotate 'line', 3440
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3441

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3442
# Body
# {
.annotate 'line', 3444
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3445

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3446
# Body
# {
.annotate 'line', 3448
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3449

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3431
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3456
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3457
# Body
# {
.annotate 'line', 3459
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3460

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3461
# Body
# {
.annotate 'line', 3463
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3464

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3465
# Body
# {
.annotate 'line', 3467
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3468

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3469
# Body
# {
.annotate 'line', 3471
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3472

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3454
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3479
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3480
# Body
# {
.annotate 'line', 3482
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3483

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3484
# Body
# {
.annotate 'line', 3486
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3487

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3488
# Body
# {
.annotate 'line', 3490
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3491

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3492
# Body
# {
.annotate 'line', 3494
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3495

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3477
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3502
# Body
# {
.annotate 'line', 3504
.return('I')
# }
.annotate 'line', 3505

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3500
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3512
# Body
# {
.annotate 'line', 3514
self.'optimizearg'()
.annotate 'line', 3515
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3516
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3517
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3518
eq $I1, 0, __label_1
.annotate 'line', 3519
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3521
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3523
.return(self)
# }
.annotate 'line', 3524

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3525
# Body
# {
.annotate 'line', 3527
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
.annotate 'line', 3528
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3529
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3530
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3531
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3534
# string l: $S4
getattribute $P4, self, 'owner'
$P3 = $P4.'genlabel'()
null $S4
if_null $P3, __label_8
set $S4, $P3
__label_8:
.annotate 'line', 3535
getattribute $P4, self, 'lexpr'
$P4.'emit'(__ARG_1, $S1)
.annotate 'line', 3536
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3537
getattribute $P5, self, 'rexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3538
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3540

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3510
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3547
# Body
# {
.annotate 'line', 3549
self.'optimizearg'()
.annotate 'line', 3550
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3551
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3552
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3553
ne $I1, 0, __label_1
.annotate 'line', 3554
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3556
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3558
.return(self)
# }
.annotate 'line', 3559

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3560
# Body
# {
.annotate 'line', 3562
# string res: $S1
null $S1
.annotate 'line', 3563
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3566
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3567
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3568
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3569
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3570
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3573
# string l: $S4
getattribute $P4, self, 'owner'
$P3 = $P4.'genlabel'()
null $S4
if_null $P3, __label_7
set $S4, $P3
__label_7:
.annotate 'line', 3574
getattribute $P4, self, 'lexpr'
$P4.'emit'(__ARG_1, $S1)
.annotate 'line', 3575
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3576
getattribute $P5, self, 'rexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3577
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3579

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3545
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3584
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3592
# Body
# {
.annotate 'line', 3594
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
.annotate 'line', 3595
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3596
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3597
self.'annotate'(__ARG_1)
.annotate 'line', 3598
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3599

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3600
# Body
# {
band $I1, __ARG_1, __ARG_2
.annotate 'line', 3602
.return($I1)
# }
.annotate 'line', 3603

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3590
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3610
# Body
# {
.annotate 'line', 3612
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
.annotate 'line', 3613
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3614
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3615
self.'annotate'(__ARG_1)
.annotate 'line', 3616
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3617

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3618
# Body
# {
bor $I1, __ARG_1, __ARG_2
.annotate 'line', 3620
.return($I1)
# }
.annotate 'line', 3621

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3608
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3629
# Body
# {
.annotate 'line', 3631
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3632
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3633
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3634
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3635
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3637
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3639
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3640
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3641
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3644
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3645

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3646
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3647
# Body
# {
.annotate 'line', 3649
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3650
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3651
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3652
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3653
ge $I2, $I1, __label_1
.annotate 'line', 3654
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3655
.return($P2)
# }
.annotate 'line', 3656

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3657
# Body
# {
.annotate 'line', 3659
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3660
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3661
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3662
self.'annotate'(__ARG_1)
.annotate 'line', 3663
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3664
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3665
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3666
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3667

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3668
# Body
# {
.annotate 'line', 3670
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3671
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3672
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3673
self.'annotate'(__ARG_1)
.annotate 'line', 3674
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3675
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3676
$P3 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3677
.return($S1)
# }
.annotate 'line', 3678

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3679
# Body
# {
.annotate 'line', 3681
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3682
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3683
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3684
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3685
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3684
# }
.annotate 'line', 3686

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3687
# Body
# {
.annotate 'line', 3689
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3690
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3691
self.'annotate'(__ARG_1)
.annotate 'line', 3692
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3693
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3694
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3693
# }
.annotate 'line', 3695

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3626
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3628
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3702
# Body
# {
.annotate 'line', 3704
self.'optimizearg'()
.annotate 'line', 3705
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3706
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3707
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3708
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3709
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3710
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3711
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3712
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3713
# var t: $P5
null $P5
.annotate 'line', 3714
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3715
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3716
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3717
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3719
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3720
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3722
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3723
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3724
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3725
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3726
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3727
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3730
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3731
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3732
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3733
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3734
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3735
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3739
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3740
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3742
.return(self)
# }
.annotate 'line', 3743

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3744
# Body
# {
.annotate 'line', 3746
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3747
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3748
ne $S1, $S2, __label_2
.annotate 'line', 3749
.return($S1)
__label_2: # endif
.annotate 'line', 3750
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3751
.return('S')
__label_3: # endif
.annotate 'line', 3752
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3753
.return('S')
__label_5: # endif
.annotate 'line', 3754
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3755
.return('N')
__label_7: # endif
.annotate 'line', 3756
.return('I')
# }
.annotate 'line', 3757

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3758
# Body
# {
.annotate 'line', 3760
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3761
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3762
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3763
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3764
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3766
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3767
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3768
ne $S1, 'S', __label_5
# {
.annotate 'line', 3769
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3770
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3771
eq $S2, 'S', __label_10
# {
.annotate 'line', 3772
__ARG_1.'emitset'($S6, $S4)
set $S4, $S6
.annotate 'line', 3773
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3776
__ARG_1.'emitset'($S6, $S5)
set $S5, $S6
.annotate 'line', 3777
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3780
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3783
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3784
# string l: $S7
null $S7
.annotate 'line', 3785
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3787
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3788
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3790
# string r: $S8
null $S8
.annotate 'line', 3791
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3793
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3794
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3796
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3799
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3801

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3700
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3808
# Body
# {
.annotate 'line', 3810
self.'optimizearg'()
.annotate 'line', 3811
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3812
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3813
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3814
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3815
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3816
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3817
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3818
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3819
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3820
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3821
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3824
.return(self)
# }
.annotate 'line', 3825

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3826
# Body
# {
.annotate 'line', 3828
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3829
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3830
ne $S1, $S2, __label_2
.annotate 'line', 3831
.return($S1)
__label_2: # endif
.annotate 'line', 3832
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3833
.return('N')
__label_3: # endif
.annotate 'line', 3834
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3835
.return('N')
__label_5: # endif
.annotate 'line', 3836
.return('I')
# }
.annotate 'line', 3837

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3838
# Body
# {
.annotate 'line', 3840
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3841
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3842
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3843

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3806
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3850
# Body
# {
.annotate 'line', 3852
self.'optimizearg'()
.annotate 'line', 3853
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3854
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3855
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3856
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3857
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3858
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3859
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3860
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3861
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3862
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3863
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3866
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3867
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3868
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3869
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3870
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3871
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3875
.return(self)
# }
.annotate 'line', 3876

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3877
# Body
# {
.annotate 'line', 3879
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3880
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3881
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3882
ne $S1, $S2, __label_2
.annotate 'line', 3883
.return($S1)
__label_2: # endif
.annotate 'line', 3884
ne $S1, 'S', __label_3
.annotate 'line', 3885
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3887
.return('N')
__label_4: # endif
# }
.annotate 'line', 3888

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3889
# Body
# {
.annotate 'line', 3891
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3892
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3893
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3894
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3895
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3896
ne $S1, 'S', __label_2
# {
.annotate 'line', 3897
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3898
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3899
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3900
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3905
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3906
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3908
self.'annotate'(__ARG_1)
.annotate 'line', 3909
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3910
.return()
# }
__label_2: # endif
.annotate 'line', 3912
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
.annotate 'line', 3913
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3914
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3915
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3916
.return()
# }
__label_6: # endif
.annotate 'line', 3921
ne $S1, 'N', __label_10
# {
.annotate 'line', 3922
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3923
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3924
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3925
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3927
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3928
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3935
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3936
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3938
self.'annotate'(__ARG_1)
.annotate 'line', 3939
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3940
.return()
# }
__label_10: # endif
.annotate 'line', 3943
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3944
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3945
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3946
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3949
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3950
# }
__label_16: # endif
.annotate 'line', 3952
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3953
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3954
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3957
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3959
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3960
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3964
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3966
# }
__label_19: # endif
.annotate 'line', 3969
self.'annotate'(__ARG_1)
.annotate 'line', 3970
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3971

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3848
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3978
# Body
# {
.annotate 'line', 3980
self.'optimizearg'()
.annotate 'line', 3981
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3982
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3983
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3984
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3985
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3986
# var lval: $P3
null $P3
.annotate 'line', 3987
# var rval: $P4
null $P4
.annotate 'line', 3988
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3989
getattribute $P3, $P1, 'numval'
.annotate 'line', 3990
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3991
getattribute $P4, $P2, 'numval'
.annotate 'line', 3992
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3993
eq $I2, 0, __label_6
.annotate 'line', 3994
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
.annotate 'line', 3997
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3998
getattribute $P3, $P1, 'numval'
.annotate 'line', 3999
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4000
getattribute $P4, $P2, 'numval'
.annotate 'line', 4001
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 4002
eq $N2, $N3, __label_8
.annotate 'line', 4003
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
.annotate 'line', 4007
.return(self)
# }
.annotate 'line', 4008

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4009
# Body
# {
.annotate 'line', 4011
.return('N')
# }
.annotate 'line', 4012

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4013
# Body
# {
.annotate 'line', 4015
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4016
# var lreg: $P2
null $P2
.annotate 'line', 4017
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 4018
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 4020
$P2 = self.'tempreg'('N')
.annotate 'line', 4021
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 4023
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 4024
# var rreg: $P4
null $P4
.annotate 'line', 4025
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 4026
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4028
$P4 = self.'tempreg'('N')
.annotate 'line', 4029
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 4031
self.'annotate'(__ARG_1)
.annotate 'line', 4032
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 4033

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3976
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4040
# Body
# {
.annotate 'line', 4042
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4043
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4044
self.'annotate'(__ARG_1)
.annotate 'line', 4045
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4046

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4047
# Body
# {
mod $I1, __ARG_1, __ARG_2
.annotate 'line', 4049
.return($I1)
# }
.annotate 'line', 4050

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4038
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4057
# Body
# {
.annotate 'line', 4059
.return('I')
# }
.annotate 'line', 4060

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4061
# Body
# {
.annotate 'line', 4063
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4064
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4065
self.'annotate'(__ARG_1)
.annotate 'line', 4070
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4071

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4055
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4078
# Body
# {
.annotate 'line', 4080
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
.annotate 'line', 4081
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4082
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 4083
self.'annotate'(__ARG_1)
.annotate 'line', 4084
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4085

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4086
# Body
# {
shl $I1, __ARG_1, __ARG_2
.annotate 'line', 4088
.return($I1)
# }
.annotate 'line', 4089

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4076
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4096
# Body
# {
.annotate 'line', 4098
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
.annotate 'line', 4099
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4100
# string rreg: $S3
$P2 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 4101
self.'annotate'(__ARG_1)
.annotate 'line', 4102
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4103

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4104
# Body
# {
shr $I1, __ARG_1, __ARG_2
.annotate 'line', 4106
.return($I1)
# }
.annotate 'line', 4107

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4094
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4116
# Body
# {
.annotate 'line', 4118
setattribute self, 'arg', __ARG_1
.annotate 'line', 4119
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4120

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4121
# Body
# {
.annotate 'line', 4123
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4124
.return(self)
# }
.annotate 'line', 4125

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4126
# Body
# {
.annotate 'line', 4128
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4129

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4114
addattribute $P0, 'arg'
.annotate 'line', 4115
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4132
# Body
# {
.annotate 'line', 4134
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4135
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4136
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4137
.return(1)
# }
.annotate 'line', 4138

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4147
# Body
# {
.annotate 'line', 4149
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4150
setattribute self, 'predef', __ARG_3
.annotate 'line', 4151
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4152

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4153
# Body
# {
.annotate 'line', 4155
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4156

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4157
# Body
# {
.annotate 'line', 4159
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4160
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4161
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4162
# var arg: $P4
null $P4
.annotate 'line', 4163
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 4164
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4166
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4167
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4168
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4172
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4173
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4174
getattribute $P10, $P4, 'arg'
$P5.'push'($P10)
goto __label_7
__label_8: # endfor
.annotate 'line', 4175
getattribute $P11, self, 'predef'
getattribute $P12, self, 'start'
$P11.'expand'(__ARG_1, self, $P12, __ARG_2, $P5)
.annotate 'line', 4176
.return()
__label_1: # default
.annotate 'line', 4178
# int n: $I2
getattribute $P13, self, 'args'
set $I2, $P13
# for loop
.annotate 'line', 4179
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4180
$P14 = $P2[$I3]
getattribute $P4, $P14, 'arg'
.annotate 'line', 4181
# string argtype: $S2
$P10 = $P4.'checkresult'()
null $S2
if_null $P10, __label_12
set $S2, $P10
__label_12:
.annotate 'line', 4182
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 4183
# string argr: $S4
null $S4
.annotate 'line', 4184
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4185
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 4187
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 4188
ne $S3, 'P', __label_17
# {
.annotate 'line', 4189
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 4190
if $S6 == $S7 goto __label_20
set $S7, 'N'
if $S6 == $S7 goto __label_21
set $S7, 'S'
if $S6 == $S7 goto __label_22
goto __label_19
# switch
__label_20: # case
set $S5, 'Integer'
goto __label_18 # break
__label_21: # case
set $S5, 'Float'
goto __label_18 # break
__label_22: # case
set $S5, 'String'
goto __label_18 # break
__label_19: # default
__label_18: # switch end
.annotate 'line', 4195
eq $S5, '', __label_23
.annotate 'line', 4196
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4198
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4200
$P3.'push'($S4)
# }
__label_9: # for iteration
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4203
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4204

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4142
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4144
addattribute $P0, 'predef'
.annotate 'line', 4145
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4214
# Body
# {
.annotate 'line', 4216
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4217
setattribute self, 'funref', __ARG_4
.annotate 'line', 4218
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4219
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4220
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4221
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4222
# {
.annotate 'line', 4223
# var modifier: $P2
null $P2
.annotate 'line', 4224
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4225
$P1 = __ARG_1.'get'()
.annotate 'line', 4226
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4227
$P1 = __ARG_1.'get'()
.annotate 'line', 4228
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4229
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4230
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4233
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4236
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4237
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4238
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4239
'Expected'("')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4241

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4242
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4243
# Body
# {
.annotate 'line', 4245
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4246
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4247
'optimize_array'($P1)
.annotate 'line', 4250
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4251
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4252
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4253
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4254
if_null $P3, __label_2
# {
.annotate 'line', 4255
self.'use_predef'($S1)
.annotate 'line', 4258
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4259
if_null $P4, __label_3
# {
.annotate 'line', 4260
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4261
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4264
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
.annotate 'line', 4268
.return(self)
# }
.annotate 'line', 4269

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4270
# Body
# {
.annotate 'line', 4272
.return(1)
# }
.annotate 'line', 4273

.end # cantailcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4274
# Body
# {
.annotate 'line', 4276
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4277
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4278
# string call: $S1
null $S1
.annotate 'line', 4279
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4280
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4281
ne $S1, '', __label_2
# {
.annotate 'line', 4282
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4283
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
unless $I1 goto __label_5
.annotate 'line', 4287
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4289
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4290
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4291
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4292
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4293
# string reg: $S3
null $S3
.annotate 'line', 4294
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4295
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4296
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4299
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4300
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4302
self.'annotate'(__ARG_1)
.annotate 'line', 4304
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
set $S9, __ARG_2
.annotate 'line', 4305
ne $S9, '.tailcall', __label_12
.annotate 'line', 4306
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4308
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
unless $I1 goto __label_14
.annotate 'line', 4312
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4314
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4316
__ARG_1.'print'('(')
.annotate 'line', 4318
# string sep: $S4
set $S4, ''
.annotate 'line', 4319
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4320
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4321
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4322
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4323
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4324
# string setname: $S6
set $S6, ''
.annotate 'line', 4325
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4326
if_null $P6, __label_19
# {
.annotate 'line', 4327
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4328
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4329
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4331
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4333
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
.annotate 'line', 4337
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4338
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4339
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4340
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4343
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
and $I7, $I4, $I5
unless $I7 goto __label_30
.annotate 'line', 4349
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
unless $I4 goto __label_32
.annotate 'line', 4351
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
unless $I5 goto __label_34
.annotate 'line', 4352
# {
.annotate 'line', 4353
__ARG_1.'print'(' :named')
.annotate 'line', 4354
eq $S6, '', __label_35
.annotate 'line', 4355
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4357
# }
__label_16: # for iteration
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4359
__ARG_1.'say'(')')
# }
.annotate 'line', 4360

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4209
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4211
addattribute $P0, 'funref'
.annotate 'line', 4212
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4370
# Body
# {
.annotate 'line', 4372
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4373
setattribute self, 'left', __ARG_4
.annotate 'line', 4374
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4375

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4376
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4377
# Body
# {
.annotate 'line', 4379
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4380
.return(self)
# }
.annotate 'line', 4381

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4382
# Body
# {
.annotate 'line', 4384
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4385

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4386
# Body
# {
.annotate 'line', 4388
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4389
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4390
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4391
eq $S1, 'P', __label_2
# {
.annotate 'line', 4392
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4393
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4394
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4396
.return($S2)
# }
.annotate 'line', 4397

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4398
# Body
# {
.annotate 'line', 4400
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4401
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4402
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4403
self.'annotate'(__ARG_1)
.annotate 'line', 4404
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4405
.return($S3)
# }
.annotate 'line', 4406

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4407
# Body
# {
.annotate 'line', 4409
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4410
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4411
self.'annotate'(__ARG_1)
.annotate 'line', 4412
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4413

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4414
# Body
# {
.annotate 'line', 4416
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4417

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4418
# Body
# {
.annotate 'line', 4420
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4421
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4422
# string value: $S3
null $S3
.annotate 'line', 4423
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4425
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4426
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4427
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4429
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4432
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4433
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4435
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4436

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4437
# Body
# {
.annotate 'line', 4439
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4440
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4441
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4442
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4443
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4445
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4446
$P4 = __ARG_2.'checkresult'()
set $S5, $P4
eq $S5, 'P', __label_6
.annotate 'line', 4447
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4449
# }
__label_4: # endif
.annotate 'line', 4451
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4452
.return($S3)
# }
.annotate 'line', 4453

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4365
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4367
addattribute $P0, 'left'
.annotate 'line', 4368
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4462
# Body
# {
.annotate 'line', 4464
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4465
setattribute self, 'left', __ARG_4
.annotate 'line', 4466
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4467

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4468
# Body
# {
.annotate 'line', 4470
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4471
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4473
.return('P')
__label_1: # endif
# }
.annotate 'line', 4474

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4475
# Body
# {
.annotate 'line', 4477
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4478
setattribute self, 'left', $P1
.annotate 'line', 4479
self.'optimizeargs'()
.annotate 'line', 4483
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P5 = self.'numargs'()
set $I3, $P5
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4484
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4485
$P5 = $P2.'isintegerliteral'()
if_null $P5, __label_2
unless $P5 goto __label_2
# {
.annotate 'line', 4486
# int ival: $I1
$P6 = $P2.'getIntegerValue'()
set $I1, $P6
.annotate 'line', 4487
# string sval: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_3
set $S1, $P6
__label_3:
.annotate 'line', 4488
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P7, self, 'start'
getattribute $P8, $P7, 'file'
getattribute $P9, self, 'start'
getattribute $P10, $P9, 'line'
.annotate 'line', 4489
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P8, $P10, $S2)
.annotate 'line', 4490
new $P8, [ 'StringLiteral' ]
getattribute $P9, self, 'owner'
$P8.'StringLiteral'($P9, $P3)
set $P7, $P8
.return($P7)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4493
.return(self)
# }
.annotate 'line', 4494

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4495
# Body
# {
.annotate 'line', 4497
# var regleft: $P1
null $P1
.annotate 'line', 4498
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4499
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4501
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4502
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4503
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4504
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4505
ne $S1, 'S', __label_3
# {
.annotate 'line', 4506
eq $I1, 1, __label_5
.annotate 'line', 4507
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4508
$P6 = $P2[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4511
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
.annotate 'line', 4512
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4513
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4515

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4516
# Body
# {
.annotate 'line', 4518
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4519
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4520
self.'annotate'(__ARG_1)
.annotate 'line', 4521
__ARG_1.'print'($P1, '[')
.annotate 'line', 4522
# predefined join
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4523
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4524

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4525
# Body
# {
.annotate 'line', 4527
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4528
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4529
# string rreg: $S1
null $S1
.annotate 'line', 4530
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4531
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4532
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4535
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4536
self.'annotate'(__ARG_1)
.annotate 'line', 4537
__ARG_1.'print'($P1, '[')
.annotate 'line', 4538
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4539
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4540
.return($S1)
# }
.annotate 'line', 4541

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4458
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4460
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4550
# Body
# {
.annotate 'line', 4552
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4553
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4554
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4555
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4556
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4557
# {
.annotate 'line', 4558
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4559
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4560
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4561
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4562
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4564

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4565
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4566
# Body
# {
.annotate 'line', 4568
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4569
.return(self)
# }
.annotate 'line', 4570

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4571
# Body
# {
set $S2, __ARG_2
.annotate 'line', 4573
eq $S2, '', __label_0
# {
.annotate 'line', 4574
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4575
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4581
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4583

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4584
# Body
# {
.annotate 'line', 4586
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4587
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4588
.return($S1)
# }
.annotate 'line', 4589

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4590
# Body
# {
.annotate 'line', 4592
self.'annotate'(__ARG_1)
.annotate 'line', 4593
# string itemreg: $S1
null $S1
.annotate 'line', 4594
# string it_p: $S2
null $S2
.annotate 'line', 4595
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4596
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4597
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4599
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4600
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
set $S5, $S3
set $S6, 'I'
.annotate 'line', 4601
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
.annotate 'line', 4603
# string aux: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 4604
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4605
__ARG_1.'emitbox'($S2, $S4)
set $S1, $S2
.annotate 'line', 4606
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4610
$P5 = $P1.'isnull'()
if_null $P5, __label_11
unless $P5 goto __label_11
# {
.annotate 'line', 4611
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4612
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4613
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4617
$P5 = $P1.'emit_get'(__ARG_1)
set $S1, $P5
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4619
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4620
self.'annotate'(__ARG_1)
.annotate 'line', 4621
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4624

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4546
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4548
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4634
# Body
# {
.annotate 'line', 4636
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4637
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4638
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4639
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4640
$P7 = $P1.'isop'('}')
isfalse $I1, $P7
unless $I1 goto __label_0
# {
.annotate 'line', 4641
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4642
# {
.annotate 'line', 4643
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4644
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4645
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4646
$P2.'push'($P4)
.annotate 'line', 4647
$P3.'push'($P5)
# }
.annotate 'line', 4649
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'(',')
if_null $P7, __label_2
if $P7 goto __label_1
__label_2: # enddo
.annotate 'line', 4650
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_4
.annotate 'line', 4651
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4653
setattribute self, 'keys', $P2
.annotate 'line', 4654
setattribute self, 'values', $P3
# }
.annotate 'line', 4655

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4656
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4657
# Body
# {
.annotate 'line', 4659
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4660
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4661
.return(self)
# }
.annotate 'line', 4662

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4663
# Body
# {
.annotate 'line', 4665
self.'annotate'(__ARG_1)
set $S6, __ARG_2
.annotate 'line', 4670
eq $S6, '', __label_0
.annotate 'line', 4671
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4673
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4674
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4675
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4676
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4677
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4678
# string item: $S1
null $S1
.annotate 'line', 4679
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4680
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4681
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4682
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4685
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_5: # endif
.annotate 'line', 4687
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4688
# string itemreg: $S3
null $S3
.annotate 'line', 4689
$P7 = $P4.'isnull'()
if_null $P7, __label_7
unless $P7 goto __label_7
# {
set $S6, __ARG_2
.annotate 'line', 4690
eq $S6, '', __label_9
# {
.annotate 'line', 4691
$P8 = self.'tempreg'('P')
set $S3, $P8
.annotate 'line', 4692
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4695
$P8 = $P4.'isidentifier'()
if_null $P8, __label_10
unless $P8 goto __label_10
# {
.annotate 'line', 4696
# string s: $S4
$P9 = $P4.'checkIdentifier'()
null $S4
if_null $P9, __label_12
set $S4, $P9
__label_12:
.annotate 'line', 4697
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
set $S3, $S4
goto __label_14
__label_13: # else
.annotate 'line', 4698
# {
.annotate 'line', 4700
# string id: $S5
$P9 = $P4.'getName'()
null $S5
if_null $P9, __label_16
set $S5, $P9
__label_16:
.annotate 'line', 4701
getattribute $P11, self, 'owner'
$P10 = $P11.'getvar'($S5)
unless_null $P10, __label_17
# {
.annotate 'line', 4702
$P12 = self.'tempreg'('P')
set $S3, $P12
.annotate 'line', 4703
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4706
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4710
$P11 = $P4.'emit_get'(__ARG_1)
set $S3, $P11
__label_11: # endif
__label_8: # endif
set $S7, __ARG_2
.annotate 'line', 4711
eq $S7, '', __label_19
.annotate 'line', 4712
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4676
# }
.annotate 'line', 4714

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4715
# Body
# {
.annotate 'line', 4717
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4718
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4719
.return($S1)
# }
.annotate 'line', 4720

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4629
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4631
addattribute $P0, 'keys'
.annotate 'line', 4632
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4729
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4730
# Body
# {
.annotate 'line', 4734
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4735
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4736
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4737
__ARG_1.'unget'($P2)
.annotate 'line', 4738
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4739
# {
.annotate 'line', 4740
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4741
$P3.'push'($P4)
# }
.annotate 'line', 4742
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4743
setattribute self, 'initializer', $P3
.annotate 'line', 4744
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4746

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4725
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4727
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4755
# Body
# {
.annotate 'line', 4757
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4759
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4760
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4761
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4762
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4763
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4764
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4765
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4766
# {
.annotate 'line', 4767
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4768
'RequireIdentifier'($P3)
.annotate 'line', 4769
$P2.'push'($P3)
# }
.annotate 'line', 4770
$P1 = __ARG_1.'get'()
$P4 = $P1.'isop'('.')
if_null $P4, __label_7
if $P4 goto __label_6
__label_7: # enddo
.annotate 'line', 4771
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4774
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4777
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4779
$P7 = $P1.'isop'('(')
if_null $P7, __label_9
unless $P7 goto __label_9
.annotate 'line', 4780
self.'parseinitializer'(__ARG_1)
goto __label_10
__label_9: # else
.annotate 'line', 4782
__ARG_1.'unget'($P1)
__label_10: # endif
# }
.annotate 'line', 4783

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4784
# Body
# {
.annotate 'line', 4786
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4787
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4790
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4791
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4792
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4793
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4794
$P1 = $P3['value']
.annotate 'line', 4795
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4796
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4797
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4800
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4804
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4805
if_null $P4, __label_7
.annotate 'line', 4806
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4807
.return(self)
# }
.annotate 'line', 4808

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4809
# Body
# {
.annotate 'line', 4811
self.'annotate'(__ARG_1)
.annotate 'line', 4813
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4814
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
.annotate 'line', 4817
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4818
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4819
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
.annotate 'line', 4821
# string reginit: $S1
set $S1, ''
.annotate 'line', 4822
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4823
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4824
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4828
ne $I2, 1, __label_13
# {
.annotate 'line', 4829
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4830
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4833
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4834
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4835
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4839
isne $I4, $I2, 1
unless $I4 goto __label_17
isne $I4, $I2, 2
__label_17:
unless $I4 goto __label_16
.annotate 'line', 4840
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_16: # endif
.annotate 'line', 4841
not $I5, __ARG_3
unless $I5 goto __label_18
.annotate 'line', 4842
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_18: # endif
__label_9: # switch end
set $I6, $I2
null $I7
.annotate 'line', 4845
if $I6 == $I7 goto __label_21
set $I7, 2
if $I6 == $I7 goto __label_22
set $I7, 1
if $I6 == $I7 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 4848
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_24
set $S4, $P14
__label_24:
.annotate 'line', 4849
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4850
isnull $I8, $P3
unless $I8 goto __label_26
$I8 = self.'dowarnings'()
__label_26:
unless $I8 goto __label_25
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
.annotate 'line', 4851
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_25: # endif
.annotate 'line', 4855
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4856
le $I1, 1, __label_27
# {
.annotate 'line', 4857
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_27: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 4861
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4862
# predefined elements
elements $I7, $P4
sub $I6, $I7, 1
$S3 = $P4[$I6]
.annotate 'line', 4863
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 4866
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4867
unless_null $P5, __label_28
# {
.annotate 'line', 4869
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4870
if_null $P6, __label_30
# {
.annotate 'line', 4871
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_31
__label_30: # else
# {
.annotate 'line', 4874
$P19 = self.'dowarnings'()
if_null $P19, __label_32
unless $P19 goto __label_32
.annotate 'line', 4875
'Warn'('Checking: new unknown type')
__label_32: # endif
.annotate 'line', 4876
getattribute $P20, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P20, "']", $S1)
# }
__label_31: # endif
.annotate 'line', 4878
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 4882
$P21 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P21, "", $S1)
# }
__label_29: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 4886
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 4888
isgt $I8, $I1, 1
if $I8 goto __label_34
isgt $I8, $I1, 0
unless $I8 goto __label_35
iseq $I8, $I2, 1
__label_35:
__label_34:
unless $I8 goto __label_33
# {
.annotate 'line', 4889
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4890
iter $P22, $P1
set $P22, 0
__label_36: # for iteration
unless $P22 goto __label_37
shift $P8, $P22
# {
.annotate 'line', 4891
# string reg: $S5
$P21 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P21, __label_38
set $S5, $P21
__label_38:
.annotate 'line', 4892
$P7.'push'($S5)
# }
goto __label_36
__label_37: # endfor
.annotate 'line', 4894
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 4895
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4896
__ARG_1.'say'(")")
.annotate 'line', 4897
not $I9, __ARG_3
unless $I9 goto __label_39
.annotate 'line', 4898
__ARG_1.'emitset'(__ARG_2, $S2)
__label_39: # endif
# }
__label_33: # endif
# }
.annotate 'line', 4900

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4901
# Body
# {
.annotate 'line', 4903
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4904

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4751
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4753
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4916
setattribute self, 'owner', __ARG_2
.annotate 'line', 4917
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4918
setattribute self, 'nskey', $P1
.annotate 'line', 4919
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4920
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4921
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4923
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4924

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4925
# Body
# {
.annotate 'line', 4927
# string reginit: $S1
null $S1
.annotate 'line', 4928
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4929
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
.annotate 'line', 4930
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4934
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4935
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4938
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4940
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4941
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4942
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4943
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4944
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4945
if_null $S1, __label_7
.annotate 'line', 4946
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4947
__ARG_1.'say'()
# }
.annotate 'line', 4948

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4909
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4911
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4957
# Body
# {
.annotate 'line', 4959
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4960
setattribute self, 'owner', __ARG_2
.annotate 'line', 4961
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4962
setattribute self, 'nskey', $P1
.annotate 'line', 4963
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4964
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4965
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4967
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4968

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4969
# Body
# {
.annotate 'line', 4971
# string reginit: $S1
null $S1
.annotate 'line', 4972
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4974
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4975
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4976
le $I1, 0, __label_3
.annotate 'line', 4977
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4978
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4979
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4980
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4981
__ARG_1.'say'()
.annotate 'line', 4983
le $I1, 0, __label_4
# {
.annotate 'line', 4984
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4985
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4986
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4987
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4989
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4990
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 4991
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4992
__ARG_1.'say'(")")
.annotate 'line', 4993
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4995

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4953
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4955
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5000
# Body
# {
.annotate 'line', 5002
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5004
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5006
new $P5, [ 'CallExpr' ]
.annotate 'line', 5007
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5006
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5009
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5011
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5013
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 5016
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5017
__ARG_1.'unget'($P2)
.annotate 'line', 5018
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 5020
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5024
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
.annotate 'line', 5029
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5031

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5040
# Body
# {
.annotate 'line', 5042
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5043
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5044
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5045

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5046
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5047
# Body
# {
.annotate 'line', 5049
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5050
# string checkedval: $S1
null $S1
.annotate 'line', 5051
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5052
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 5053
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 5057
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5058
self.'annotate'(__ARG_1)
.annotate 'line', 5059
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5060

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5035
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5037
addattribute $P0, 'lexpr'
.annotate 'line', 5038
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5075
# Body
# {
.annotate 'line', 5077
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5078
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5079
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5080
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5081
.return(self)
# }
.annotate 'line', 5082

.end # set


.sub 'optimize' :method

.annotate 'line', 5083
# Body
# {
.annotate 'line', 5085
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5086
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
.annotate 'line', 5088
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5090
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5092
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5093
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5094
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5096

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5097
# Body
# {
.annotate 'line', 5099
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5100

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5101
# Body
# {
.annotate 'line', 5103
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5104
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5105
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5106
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5107
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5108
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5109
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5110
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5111

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5065
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5071
addattribute $P0, 'condition'
.annotate 'line', 5072
addattribute $P0, 'etrue'
.annotate 'line', 5073
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

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 5150
# Body
# {
.annotate 'line', 5152
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
.annotate 'line', 5153
.return(1)
__label_3: # case
.annotate 'line', 5154
.return(2)
__label_4: # case
.annotate 'line', 5155
.return(3)
__label_1: # default
.annotate 'line', 5156
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5158

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5160
# Body
# {
.annotate 'line', 5162
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
.annotate 'line', 5163
.return(8)
__label_3: # case
.annotate 'line', 5164
.return(11)
__label_4: # case
.annotate 'line', 5165
.return(9)
__label_5: # case
.annotate 'line', 5166
.return(10)
__label_1: # default
.annotate 'line', 5167
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5169

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5171
# Body
# {
.annotate 'line', 5173
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
.annotate 'line', 5174
.return(19)
__label_3: # case
.annotate 'line', 5175
.return(20)
__label_4: # case
.annotate 'line', 5176
.return(21)
__label_5: # case
.annotate 'line', 5177
.return(22)
__label_1: # default
.annotate 'line', 5178
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5180

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5182
# Body
# {
.annotate 'line', 5184
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5185
.return(28)
__label_3: # case
.annotate 'line', 5186
.return(29)
__label_1: # default
.annotate 'line', 5187
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5189

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5191
# Body
# {
.annotate 'line', 5193
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
.annotate 'line', 5194
.return(12)
__label_3: # case
.annotate 'line', 5195
.return(13)
__label_4: # case
.annotate 'line', 5196
.return(25)
__label_5: # case
.annotate 'line', 5197
.return(26)
__label_1: # default
.annotate 'line', 5199
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5200
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5202

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5204
# Body
# {
.annotate 'line', 5206
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
.annotate 'line', 5207
.return(14)
__label_3: # case
.annotate 'line', 5208
.return(16)
__label_4: # case
.annotate 'line', 5209
.return(15)
__label_5: # case
.annotate 'line', 5210
.return(17)
__label_1: # default
.annotate 'line', 5211
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5213

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5215
# Body
# {
.annotate 'line', 5217
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
.annotate 'line', 5218
.return(4)
__label_3: # case
.annotate 'line', 5219
.return(5)
__label_4: # case
.annotate 'line', 5220
.return(6)
__label_5: # case
.annotate 'line', 5221
.return(18)
__label_6: # case
.annotate 'line', 5222
.return(23)
__label_7: # case
.annotate 'line', 5223
.return(24)
__label_1: # default
.annotate 'line', 5224
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5226

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5232
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5233
# var expr: $P2
null $P2
.annotate 'line', 5234
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5235
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5236
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5237
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5239
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5240
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5241
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 5242
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 5243
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 5244
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5245
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 5246
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 5247
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 5248
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 5249
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 5250
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 5251
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 5252
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 5253
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 5254
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 5255
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5256

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5258
# Body
# {
.annotate 'line', 5260
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5261
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5263
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5264
# var t: $P2
null $P2
.annotate 'line', 5265
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5266
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 5267
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5269
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5272
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5275
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5278
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5281
__ARG_1.'unget'($P2)
.annotate 'line', 5282
.return($P1)
# }
.annotate 'line', 5283

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5285
# Body
# {
.annotate 'line', 5287
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5289
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5290
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5291
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5292
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5293
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5294
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5297
__ARG_1.'unget'($P2)
.annotate 'line', 5298
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5300

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5302
# Body
# {
.annotate 'line', 5304
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5305
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5306
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5308
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5309
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5310
# var subexpr: $P2
null $P2
.annotate 'line', 5311
eq $I1, 0, __label_0
# {
.annotate 'line', 5312
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5313
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5314
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
.annotate 'line', 5316
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5319
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5322
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5325
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5328
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5330
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5333
__ARG_1.'unget'($P1)
.annotate 'line', 5334
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5336
.return($P2)
# }
.annotate 'line', 5337

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5339
# Body
# {
.annotate 'line', 5341
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5342
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5344
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5345
# var t: $P2
null $P2
.annotate 'line', 5346
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5347
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5348
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5349
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5350
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
.annotate 'line', 5352
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5355
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5358
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5361
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5364
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5366
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5367
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5369
__ARG_1.'unget'($P2)
.annotate 'line', 5370
.return($P1)
# }
.annotate 'line', 5371

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5373
# Body
# {
.annotate 'line', 5375
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5377
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5378
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5379
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5380
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5381
# var expr: $P4
null $P4
.annotate 'line', 5382
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5383
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5385
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5386
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5388
__ARG_1.'unget'($P2)
.annotate 'line', 5389
.return($P1)
# }
.annotate 'line', 5390

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5392
# Body
# {
.annotate 'line', 5394
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5396
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5397
# var rexpr: $P2
null $P2
.annotate 'line', 5398
# var t: $P3
null $P3
.annotate 'line', 5399
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5400
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 28
.annotate 'line', 5401
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5403
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5404
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5407
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5408
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5411
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5414
__ARG_1.'unget'($P3)
.annotate 'line', 5415
.return($P1)
# }
.annotate 'line', 5416

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5418
# Body
# {
.annotate 'line', 5420
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5421
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5423
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5424
# var rexpr: $P2
null $P2
.annotate 'line', 5425
# var t: $P3
null $P3
.annotate 'line', 5426
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5427
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5428
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
.annotate 'line', 5430
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5431
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5434
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5435
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5438
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5439
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5442
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5443
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5446
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5449
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5452
__ARG_1.'unget'($P3)
.annotate 'line', 5453
.return($P1)
# }
.annotate 'line', 5454

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5456
# Body
# {
.annotate 'line', 5458
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5459
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5461
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5462
# var t: $P2
null $P2
.annotate 'line', 5463
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5464
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5465
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5466
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
.annotate 'line', 5468
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5471
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5474
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5477
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5480
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5483
__ARG_1.'unget'($P2)
.annotate 'line', 5484
.return($P1)
# }
.annotate 'line', 5485

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5487
# Body
# {
.annotate 'line', 5489
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5491
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5492
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5493
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5494
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5495
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5497
__ARG_1.'unget'($P2)
.annotate 'line', 5498
.return($P1)
# }
.annotate 'line', 5499

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5501
# Body
# {
.annotate 'line', 5503
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5505
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5506
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5507
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5508
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5509
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5511
__ARG_1.'unget'($P2)
.annotate 'line', 5512
.return($P1)
# }
.annotate 'line', 5513

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5515
# Body
# {
.annotate 'line', 5517
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5519
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5520
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5521
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5522
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5523
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5525
__ARG_1.'unget'($P2)
.annotate 'line', 5526
.return($P1)
# }
.annotate 'line', 5527

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5529
# Body
# {
.annotate 'line', 5531
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5533
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5534
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5535
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5536
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5537
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5539
__ARG_1.'unget'($P2)
.annotate 'line', 5540
.return($P1)
# }
.annotate 'line', 5541

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5543
# Body
# {
.annotate 'line', 5545
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5546
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5548
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5549
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5550
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5551
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5552
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5553
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5554
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5557
__ARG_1.'unget'($P2)
.annotate 'line', 5558
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5560

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5562
# Body
# {
.annotate 'line', 5564
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5565
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5566
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5568
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5569
# var t: $P2
null $P2
.annotate 'line', 5570
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5571
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5572
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5573
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5574
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
.annotate 'line', 5576
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5579
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5582
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5585
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5588
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5591
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5594
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5596
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5597
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5599
__ARG_1.'unget'($P2)
.annotate 'line', 5600
.return($P1)
# }
.annotate 'line', 5601

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5603
# Body
# {
.annotate 'line', 5605
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5607
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5608

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5621
# Body
# {
.annotate 'line', 5623
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5624
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5625
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5626
setattribute self, 'brlabel', $P2
.annotate 'line', 5627
.return($S1)
# }
.annotate 'line', 5628

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5629
# Body
# {
.annotate 'line', 5631
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5632
unless_null $P1, __label_0
.annotate 'line', 5633
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5634
.return($P1)
# }
.annotate 'line', 5635

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5619
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5642
# Body
# {
.annotate 'line', 5644
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5645
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5646
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5647
setattribute self, 'cntlabel', $P2
.annotate 'line', 5648
.return($S1)
# }
.annotate 'line', 5649

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5650
# Body
# {
.annotate 'line', 5652
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5653
unless_null $P1, __label_0
.annotate 'line', 5654
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5655
.return($P1)
# }
.annotate 'line', 5656

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5638
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5640
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5670
# Body
# {
.annotate 'line', 5672
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5673
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5674
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5675
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5676
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5677
# {
.annotate 'line', 5678
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5679
$P2.'push'($P3)
# }
.annotate 'line', 5680
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5682
'RequireOp'(';', $P1)
.annotate 'line', 5683
setattribute self, 'values', $P2
# }
.annotate 'line', 5684

.end # parse


.sub 'optimize' :method

.annotate 'line', 5685
# Body
# {
.annotate 'line', 5687
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5688
.return(self)
# }
.annotate 'line', 5689

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5690
# Body
# {
.annotate 'line', 5692
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5693
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5694
# int n: $I1
set $P5, $P2
set $I1, $P5
.annotate 'line', 5697
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5698
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5699
$P6 = $P3.'cantailcall'()
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 5700
self.'annotate'(__ARG_1)
.annotate 'line', 5701
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5704
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 5705
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5706
# string reg: $S1
null $S1
.annotate 'line', 5707
$P6 = $P4.'isnull'()
if_null $P6, __label_6
unless $P6 goto __label_6
# {
.annotate 'line', 5708
$P7 = self.'tempreg'('P')
set $S1, $P7
.annotate 'line', 5709
__ARG_1.'emitnull'($S1)
# }
goto __label_7
__label_6: # else
.annotate 'line', 5712
$P7 = $P4.'emit_get'(__ARG_1)
set $S1, $P7
__label_7: # endif
.annotate 'line', 5713
$P1.'push'($S1)
# }
__label_3: # for iteration
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 5715
self.'annotate'(__ARG_1)
.annotate 'line', 5716
self.'emitret'(__ARG_1)
.annotate 'line', 5717
# string sep: $S2
set $S2, ''
.annotate 'line', 5718
iter $P8, $P1
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
# {
.annotate 'line', 5719
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5720
# }
goto __label_8
__label_9: # endfor
.annotate 'line', 5722
__ARG_1.'say'(')')
# }
.annotate 'line', 5723

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5666
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5668
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5728
# Body
# {
.annotate 'line', 5730
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5731

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5732
# Body
# {
.annotate 'line', 5734
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5735

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5726
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5740
# Body
# {
.annotate 'line', 5742
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5743

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5744
# Body
# {
.annotate 'line', 5746
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5747

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5738
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5758
# Body
# {
.annotate 'line', 5760
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5761
setattribute self, 'name', __ARG_1
.annotate 'line', 5762
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5763
setattribute self, 'value', $P2
# }
.annotate 'line', 5764

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5765
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5766
# Body
# {
.annotate 'line', 5768
self.'annotate'(__ARG_1)
.annotate 'line', 5769
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5770
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5771
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5772

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5754
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5756
addattribute $P0, 'name'
.annotate 'line', 5757
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5783
# Body
# {
.annotate 'line', 5785
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5786
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5787
'RequireIdentifier'($P1)
.annotate 'line', 5788
setattribute self, 'label', $P1
.annotate 'line', 5789
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5790

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5791
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5792
# Body
# {
.annotate 'line', 5794
self.'annotate'(__ARG_1)
.annotate 'line', 5795
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5796
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5797
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5798

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5779
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5781
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5807
# Body
# {
.annotate 'line', 5809
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5810

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5811
# Body
# {
.annotate 'line', 5813
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5814
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5815
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5816

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5805
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

.annotate 'line', 5827
# Body
# {
.annotate 'line', 5829
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5830
self.'parsecondition'(__ARG_2)
.annotate 'line', 5831
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5832
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5833
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5834
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5836
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5837
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5839

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5840
# Body
# {
.annotate 'line', 5842
self.'optimize_condition'()
.annotate 'line', 5843
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5844
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5845
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5846
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5848
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5850
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5852
.return(self)
# }
.annotate 'line', 5853

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5854
# Body
# {
.annotate 'line', 5856
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5857
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5858
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5859
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5860
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5861
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5862
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5863
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5864
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5865
self.'annotate'(__ARG_1)
.annotate 'line', 5866
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5867
$P1.'emit'(__ARG_1)
.annotate 'line', 5869
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5870
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5871
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5872
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5874
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5875

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5823
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5825
addattribute $P0, 'truebranch'
.annotate 'line', 5826
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5885
# Body
# {
.annotate 'line', 5887
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5888

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5889
# Body
# {
.annotate 'line', 5891
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5892
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5894
self.'annotate'(__ARG_1)
.annotate 'line', 5895
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5896
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5897
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5898
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5899

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5882
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5884
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5908
# Body
# {
.annotate 'line', 5910
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5911
self.'parsecondition'(__ARG_2)
.annotate 'line', 5912
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5913

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5914
# Body
# {
.annotate 'line', 5916
self.'optimize_condition'()
.annotate 'line', 5917
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5918
.return(self)
# }
.annotate 'line', 5919

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5920
# Body
# {
.annotate 'line', 5922
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5924
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5927
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5930
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5931
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5933
self.'annotate'(__ARG_1)
.annotate 'line', 5934
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5935
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5936
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5937
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5938
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5940

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5906
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

.annotate 'line', 5949
# Body
# {
.annotate 'line', 5951
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5952
self.'parsebody'(__ARG_2)
.annotate 'line', 5953
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5954
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5955

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5956
# Body
# {
.annotate 'line', 5958
self.'optimize_condition'()
.annotate 'line', 5959
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5960
.return(self)
# }
.annotate 'line', 5961

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5962
# Body
# {
.annotate 'line', 5964
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5966
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5969
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5970
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5971
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5973
self.'annotate'(__ARG_1)
.annotate 'line', 5974
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5976
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5977
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5978
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5980

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5947
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

.annotate 'line', 5989
# Body
# {
.annotate 'line', 5991
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5992
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5993

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5994
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5995
# Body
# {
.annotate 'line', 5997
self.'annotate'(__ARG_1)
.annotate 'line', 5998
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5999
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6000

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5987
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6009
# Body
# {
.annotate 'line', 6011
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6012
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6013

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6014
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6015
# Body
# {
.annotate 'line', 6017
self.'annotate'(__ARG_1)
.annotate 'line', 6018
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6019
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6020

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6007
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6034
# Body
# {
.annotate 'line', 6036
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6037
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6038
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6039
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6040
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6041
$P1 = __ARG_2.'get'()
.annotate 'line', 6042
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 6043
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6044
$P1 = __ARG_2.'get'()
.annotate 'line', 6045
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 6046
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6047
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 6048
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 6049
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 6050
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 6051
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 6052
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 6053
$P1 = __ARG_2.'get'()
.annotate 'line', 6054
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 6055
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6056
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6057
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
.annotate 'line', 6058
__ARG_2.'unget'($P1)
.annotate 'line', 6059
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6061
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 6062
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6065
$P1 = __ARG_2.'get'()
.annotate 'line', 6066
$P13 = $P1.'isop'(':')
isfalse $I4, $P13
unless $I4 goto __label_13
.annotate 'line', 6067
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6068
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
.annotate 'line', 6069
__ARG_2.'unget'($P1)
.annotate 'line', 6070
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6072
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6075

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6076
# Body
# {
.annotate 'line', 6078
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6079
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6080
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6081
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6082
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 6083
.return(self)
# }
.annotate 'line', 6084

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6085
# Body
# {
.annotate 'line', 6088
# string type: $S1
set $S1, ''
.annotate 'line', 6089
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6090
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6091
ne $S2, 'N', __label_3
.annotate 'line', 6092
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6093
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6095
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 6096
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6099
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 6100
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
set $S9, $P11
ne $S9, $S1, __label_8
.annotate 'line', 6101
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6103
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 6104
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6108
self.'genbreaklabel'()
.annotate 'line', 6109
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 6110
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6111
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 6112
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 6113
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 6114
$P2.'push'($S7)
.annotate 'line', 6115
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6116
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6118
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6121
__ARG_1.'comment'('switch')
.annotate 'line', 6122
self.'annotate'(__ARG_1)
.annotate 'line', 6123
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6124
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 6125
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6126
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6127
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6128
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6129
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 6130
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6133
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6134
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 6135
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6137
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 6138

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6027
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6029
addattribute $P0, 'condition'
.annotate 'line', 6030
addattribute $P0, 'case_value'
.annotate 'line', 6031
addattribute $P0, 'case_st'
.annotate 'line', 6032
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6150
# Body
# {
.annotate 'line', 6152
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6153
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6154
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6155
__ARG_2.'unget'($P1)
.annotate 'line', 6156
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6158
$P1 = __ARG_2.'get'()
.annotate 'line', 6159
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6160
__ARG_2.'unget'($P1)
.annotate 'line', 6161
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6162
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6164
$P1 = __ARG_2.'get'()
.annotate 'line', 6165
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 6166
__ARG_2.'unget'($P1)
.annotate 'line', 6167
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 6168
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6170
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6171

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6172
# Body
# {
.annotate 'line', 6174
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6175
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6176
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6177
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6178
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 6179
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 6180
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 6181
.return(self)
# }
.annotate 'line', 6182

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6183
# Body
# {
.annotate 'line', 6185
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6186
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6187
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6188
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6189
.return()
# }
__label_0: # endif
.annotate 'line', 6191
__ARG_1.'comment'('for loop')
.annotate 'line', 6192
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6193
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 6194
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 6195
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 6196
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6198
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6199
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 6200
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6202
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 6203
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6204
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 6205
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 6206
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6208
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6209

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6145
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6147
addattribute $P0, 'initializer'
.annotate 'line', 6148
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6221
# Body
# {
.annotate 'line', 6223
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6224
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6225
eq __ARG_5, '', __label_1
.annotate 'line', 6226
$P1 = 'typetoregcheck'(__ARG_5)
self.'createvar'($S1, $P1)
__label_1: # endif
.annotate 'line', 6227
setattribute self, 'varname', __ARG_4
.annotate 'line', 6228
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P3
.annotate 'line', 6229
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6230
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6231

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6232
# Body
# {
.annotate 'line', 6234
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6235
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6236
.return(self)
# }
.annotate 'line', 6237

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6238
# Body
# {
.annotate 'line', 6240
self.'annotate'(__ARG_1)
.annotate 'line', 6241
# string regcont: $S1
null $S1
.annotate 'line', 6242
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6243
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6244
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6245
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6248
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 6249
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 6250
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 6251
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 6252
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 6253
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6254
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6255
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6256
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6257
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 6258
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 6259
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6260
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6261

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6216
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6218
addattribute $P0, 'varname'
.annotate 'line', 6219
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6266
# Body
# {
.annotate 'line', 6268
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6269
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6270
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6271
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6272
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6274
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6275
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6276
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6277
__ARG_2.'unget'($P3)
.annotate 'line', 6278
__ARG_2.'unget'($P2)
.annotate 'line', 6279
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6281
new $P8, [ 'ForStatement' ]
$P8.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P7, $P8
.return($P7)
# }
.annotate 'line', 6282

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6292
# Body
# {
.annotate 'line', 6294
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6295
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6296

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6297
# Body
# {
.annotate 'line', 6299
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6300
.return(self)
# }
.annotate 'line', 6301

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6302
# Body
# {
.annotate 'line', 6304
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6305
self.'annotate'(__ARG_1)
.annotate 'line', 6306
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6307

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6288
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6290
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6321
# Body
# {
.annotate 'line', 6323
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6324
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6325
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6326
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6329
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6331
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6332
$P1 = __ARG_2.'get'()
.annotate 'line', 6333
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6334
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6335
$P1 = __ARG_2.'get'()
.annotate 'line', 6336
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6337
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6338
$P1 = __ARG_2.'get'()
.annotate 'line', 6339
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6340
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6341
setattribute self, 'exname', $P1
.annotate 'line', 6342
self.'createvar'($S1, 'P')
.annotate 'line', 6343
$P1 = __ARG_2.'get'()
.annotate 'line', 6344
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6345
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6347
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6348

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6349
# Body
# {
.annotate 'line', 6351
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6352
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6353
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6354
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6355
.return(self)
# }
.annotate 'line', 6356

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6357
# Body
# {
.annotate 'line', 6359
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6360
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6361
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6362
# string exreg: $S4
null $S4
.annotate 'line', 6363
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6364
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6365
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6368
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6370
self.'annotate'(__ARG_1)
.annotate 'line', 6371
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6373
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6374
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6376
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6377
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6378
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6379
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6380
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6381
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
.annotate 'line', 6384
eq $I1, 1, __label_15
.annotate 'line', 6385
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_15: # endif
.annotate 'line', 6386
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6387
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_16
set $S6, $P14
__label_16:
.annotate 'line', 6388
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6392
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6393
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6394
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6395
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_17: # for iteration
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6397
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6398
# string sep: $S7
set $S7, ''
.annotate 'line', 6399
iter $P15, $P5
set $P15, 0
__label_20: # for iteration
unless $P15 goto __label_21
shift $S8, $P15
# {
.annotate 'line', 6400
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6401
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6403
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6406
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6411
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6412
__ARG_1.'comment'('try: begin')
.annotate 'line', 6413
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6414
__ARG_1.'comment'('try: end')
.annotate 'line', 6415
__ARG_1.'say'('pop_eh')
.annotate 'line', 6417
self.'annotate'(__ARG_1)
.annotate 'line', 6418
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6420
__ARG_1.'comment'('catch')
.annotate 'line', 6421
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6422
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6423
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6424
__ARG_1.'say'('pop_eh')
.annotate 'line', 6425
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6427
__ARG_1.'comment'('catch end')
.annotate 'line', 6428
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6429

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6314
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6316
addattribute $P0, 'stry'
.annotate 'line', 6317
addattribute $P0, 'modifiers'
.annotate 'line', 6318
addattribute $P0, 'exname'
.annotate 'line', 6319
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6440
# Body
# {
.annotate 'line', 6442
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6443
setattribute self, 'name', __ARG_3
.annotate 'line', 6444
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6445
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6446

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6436
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6438
addattribute $P0, 'name'
.annotate 'line', 6439
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6463
# Body
# {
.annotate 'line', 6465
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6466
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6467
'RequireIdentifier'($P1)
.annotate 'line', 6468
setattribute self, 'name', $P1
.annotate 'line', 6469
# var vdata: $P2
null $P2
.annotate 'line', 6470
# string reg: $S1
null $S1
.annotate 'line', 6472
$P1 = __ARG_2.'get'()
.annotate 'line', 6473
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
box $P5, 1
.annotate 'line', 6475
setattribute self, 'typearray', $P5
.annotate 'line', 6476
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6477
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6478
$P1 = __ARG_2.'get'()
.annotate 'line', 6479
$P6 = $P1.'isop'(']')
if_null $P6, __label_2
unless $P6 goto __label_2
# {
.annotate 'line', 6481
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6484
__ARG_2.'unget'($P1)
.annotate 'line', 6485
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6486
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6487
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
box $P7, 0
.annotate 'line', 6492
setattribute self, 'typearray', $P7
.annotate 'line', 6493
getattribute $P8, self, 'name'
getattribute $P9, self, 't_reg'
$P2 = self.'createvar'($P8, $P9)
.annotate 'line', 6494
$P9 = $P2.'getreg'()
set $S1, $P9
.annotate 'line', 6495
$P10 = $P1.'isop'('=')
if_null $P10, __label_4
unless $P10 goto __label_4
# {
.annotate 'line', 6497
$P12 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P12
.annotate 'line', 6498
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
box $P10, $S1
.annotate 'line', 6502
setattribute self, 'reg', $P10
.annotate 'line', 6503
$P11 = $P1.'isop'('=')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 6504
$P1 = __ARG_2.'get'()
.annotate 'line', 6505
$P12 = $P1.'isop'('[')
isfalse $I1, $P12
unless $I1 goto __label_6
.annotate 'line', 6506
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 6507
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 6508
$P1 = __ARG_2.'get'()
.annotate 'line', 6509
$P13 = $P1.'isop'(']')
isfalse $I1, $P13
unless $I1 goto __label_7
# {
.annotate 'line', 6510
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 6511
# {
.annotate 'line', 6512
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6513
getattribute $P14, self, 'init'
$P14.'push'($P3)
# }
.annotate 'line', 6514
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_9
if $P15 goto __label_8
__label_9: # enddo
.annotate 'line', 6515
$P16 = $P1.'isop'(']')
isfalse $I2, $P16
unless $I2 goto __label_11
.annotate 'line', 6516
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 6518
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 6520
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6521

.end # parse


.sub 'optimize' :method

.annotate 'line', 6522
# Body
# {
.annotate 'line', 6524
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6525
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6526
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6527
if_null $P1, __label_1
# {
.annotate 'line', 6528
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6529
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6531
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6533
.return(self)
# }
.annotate 'line', 6534

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6535
# Body
# {
.annotate 'line', 6537
self.'annotate'(__ARG_1)
.annotate 'line', 6538
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6539
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6540
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6541
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6542
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
.annotate 'line', 6543
__ARG_1.'comment'($S10)
.annotate 'line', 6545
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6546
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6547
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6549
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6550
ne $S5, $S4, __label_10
# {
.annotate 'line', 6551
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6552
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6554
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6557
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_15
# {
.annotate 'line', 6559
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6562
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_17
set $S6, $P6
__label_17:
.annotate 'line', 6563
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6564
iseq $I5, $S4, 'S'
unless $I5 goto __label_20
iseq $I5, $S5, 'P'
__label_20:
unless $I5 goto __label_18
# {
.annotate 'line', 6565
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_21
set $S7, $P7
__label_21:
.annotate 'line', 6566
__ARG_1.'emitnull'($S3)
.annotate 'line', 6567
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6568
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6569
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6572
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
.annotate 'line', 6578
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6579
if_null $P2, __label_22
# {
.annotate 'line', 6581
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_24
set $S8, $P8
__label_24:
.annotate 'line', 6582
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6586
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_23: # endif
.annotate 'line', 6588
if_null $P1, __label_25
# {
.annotate 'line', 6589
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_26
set $S9, $P9
__label_26:
.annotate 'line', 6590
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6591
unless_null $P2, __label_27
# {
.annotate 'line', 6592
le $I1, 0, __label_28
# {
.annotate 'line', 6594
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6597
# int i: $I2
null $I2
.annotate 'line', 6598
iter $P10, $P1
set $P10, 0
__label_29: # for iteration
unless $P10 goto __label_30
shift $P3, $P10
# {
.annotate 'line', 6599
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6600
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
inc $I2
.annotate 'line', 6601
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6605

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6606
# Body
# {
.annotate 'line', 6608
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6609

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6453
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6455
addattribute $P0, 'name'
.annotate 'line', 6456
addattribute $P0, 't_reg'
.annotate 'line', 6457
addattribute $P0, 't_name'
.annotate 'line', 6458
addattribute $P0, 't_array'
.annotate 'line', 6459
addattribute $P0, 'reg'
.annotate 'line', 6460
addattribute $P0, 'typearray'
.annotate 'line', 6461
addattribute $P0, 'size'
.annotate 'line', 6462
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6612
# Body
# {
.annotate 'line', 6614
# var next: $P1
null $P1
.annotate 'line', 6615
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6616
# {
.annotate 'line', 6617
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6618
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6619
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6620
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6621
'RequireOp'(';', $P1)
.annotate 'line', 6622
.return($P2)
# }
.annotate 'line', 6623

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6635
# Body
# {
.annotate 'line', 6638
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6639
setattribute self, 'type', $P1
.annotate 'line', 6640
setattribute self, 'name', __ARG_4
.annotate 'line', 6641
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6642

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6643
# Body
# {
.annotate 'line', 6645
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6646
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6647
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6648
$P1 = $P1.'optimize'()
.annotate 'line', 6649
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6651
getattribute $P4, self, 'start'
.annotate 'line', 6650
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6653
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6654
setattribute self, 'value', $P1
.annotate 'line', 6655
.return(self)
# }
.annotate 'line', 6656

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6657
# Body
# {
.annotate 'line', 6659
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6660

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6661
# Body
# {
.annotate 'line', 6663
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
.annotate 'line', 6664
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6665

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6629
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6631
addattribute $P0, 'type'
.annotate 'line', 6632
addattribute $P0, 'name'
.annotate 'line', 6633
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6668
# Body
# {
.annotate 'line', 6670
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6671
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6672
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6673
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6675
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6676
# {
.annotate 'line', 6677
$P1 = __ARG_2.'get'()
.annotate 'line', 6678
# var name: $P3
set $P3, $P1
.annotate 'line', 6679
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6680
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6682
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6681
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6683
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6684
.return($P2)
# }
.annotate 'line', 6685

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 6694
# Body
# {
.annotate 'line', 6696
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 6697
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6698
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6699
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6700
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6702
'RequireOp'(';', $P1)
# }
.annotate 'line', 6703

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6704
# Body
# {
.annotate 'line', 6706
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6707
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6708
.return(self)
# }
.annotate 'line', 6709

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6710
# Body
# {
.annotate 'line', 6712
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6713

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6714
# Body
# {
.annotate 'line', 6716
self.'annotate'(__ARG_1)
.annotate 'line', 6717
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6718
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6719
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
.annotate 'line', 6720
__ARG_1.'comment'($S5)
.annotate 'line', 6721
if_null $P1, __label_2
.annotate 'line', 6722
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6724
if_null $P1, __label_4
# {
.annotate 'line', 6725
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6726
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
.annotate 'line', 6728
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 6729
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 6731
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6736
# string value: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_18
set $S4, $P4
__label_18:
.annotate 'line', 6737
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 6740
getattribute $P5, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P5)
__label_8: # default
.annotate 'line', 6742
getattribute $P6, self, 'name'
'SyntaxError'("Invalid var initializer", $P6)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6746
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6747

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6691
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6693
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6752
# Body
# {
.annotate 'line', 6754
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6755
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6756

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6757
# Body
# {
.annotate 'line', 6759
self.'annotate'(__ARG_1)
.annotate 'line', 6760
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6761
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
.annotate 'line', 6762
__ARG_1.'comment'($S3)
.annotate 'line', 6763
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6764

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6750
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6771
# Body
# {
.annotate 'line', 6773
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6774
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 6775
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6776
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6777

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6778
# Body
# {
.annotate 'line', 6780
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6781
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6782

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6783
# Body
# {
.annotate 'line', 6785
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6786
self.'annotate'(__ARG_1)
.annotate 'line', 6787
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6788
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
.annotate 'line', 6789
__ARG_1.'comment'($S4)
.annotate 'line', 6790
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6791

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6767
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6769
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6794
# Body
# {
.annotate 'line', 6796
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6797
'RequireIdentifier'($P1)
.annotate 'line', 6798
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6799
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 6800
$P2 = __ARG_2.'get'()
.annotate 'line', 6801
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 6802
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 6804
__ARG_2.'unget'($P2)
.annotate 'line', 6805
new $P5, [ 'FixedVarStatement' ]
$P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6809
__ARG_2.'unget'($P2)
.annotate 'line', 6810
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P6, $P7
.return($P6)
# }
__label_1: # endif
# }
.annotate 'line', 6812

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6814
# Body
# {
.annotate 'line', 6816
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6817
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6818
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 6819
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 6820

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6828
# Body
# {
box $P1, 'S'
.annotate 'line', 6830
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6831
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6832
setattribute self, 't_array', $P2
.annotate 'line', 6833
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6834

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6835
# Body
# {
.annotate 'line', 6837
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6838

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6826
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6841
# Body
# {
.annotate 'line', 6843
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6844

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6846
# Body
# {
.annotate 'line', 6848
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6849
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6850

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6858
# Body
# {
box $P1, 'I'
.annotate 'line', 6860
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6861
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6862
setattribute self, 't_array', $P2
.annotate 'line', 6863
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6864

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6865
# Body
# {
.annotate 'line', 6867
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6868

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6856
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6871
# Body
# {
.annotate 'line', 6873
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6874

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6876
# Body
# {
.annotate 'line', 6878
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6879
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6880

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6888
# Body
# {
box $P1, 'N'
.annotate 'line', 6890
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6892
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6893
setattribute self, 't_array', $P2
.annotate 'line', 6894
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6895

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6896
# Body
# {
.annotate 'line', 6898
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6899

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6886
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6902
# Body
# {
.annotate 'line', 6904
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6905

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6910
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6911

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6923
# Body
# {
.annotate 'line', 6925
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6926
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6927
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6928
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6929
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6930
__ARG_2.'unget'($P1)
.annotate 'line', 6931
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6932
unless_null $P2, __label_2
.annotate 'line', 6933
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 6934
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6936
setattribute self, 'end', $P1
# }
.annotate 'line', 6937

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6938
# Body
# {
.annotate 'line', 6940
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6941
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6942
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6943
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6944
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6945
.return($S2)
# }
.annotate 'line', 6946

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6947
# Body
# {
.annotate 'line', 6949
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6950
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6951
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6952
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6953
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6954
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6955
$P1[$S1] = $S3
.annotate 'line', 6956
.return($S3)
# }
.annotate 'line', 6957

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6958
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6959
# Body
# {
.annotate 'line', 6961
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6962
.return(self)
# }
.annotate 'line', 6963

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6964
# Body
# {
.annotate 'line', 6966
__ARG_1.'comment'('{')
.annotate 'line', 6967
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6968
$P1.'emit'(__ARG_1)
.annotate 'line', 6969
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6971
__ARG_1.'comment'('}')
# }
.annotate 'line', 6972

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6917
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6919
addattribute $P0, 'statements'
.annotate 'line', 6920
addattribute $P0, 'end'
.annotate 'line', 6921
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6985
# Body
# {
box $P3, 1
.annotate 'line', 6988
setattribute self, 'nreg', $P3
.annotate 'line', 6989
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6990
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6991
setattribute self, 'tempreg', $P1
.annotate 'line', 6992
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6993

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6994
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6996
setattribute self, 'type', $P1
.annotate 'line', 6997
.return(self)
# }
.annotate 'line', 6998

.end # settype


.sub 'createreg' :method

.annotate 'line', 6999
# Body
# {
.annotate 'line', 7001
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7002
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7003
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 7005
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7007
.return($S1)
# }
.annotate 'line', 7008

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7009
# Body
# {
.annotate 'line', 7011
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7012
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7013
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 7014
# string reg: $S1
null $S1
.annotate 'line', 7015
le $I1, 0, __label_0
.annotate 'line', 7016
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 7018
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 7019
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 7021
.return($S1)
# }
.annotate 'line', 7022

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7023
# Body
# {
.annotate 'line', 7025
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 7026
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7027
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7028
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 7029

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6981
addattribute $P0, 'type'
.annotate 'line', 6982
addattribute $P0, 'nreg'
.annotate 'line', 6983
addattribute $P0, 'tempreg'
.annotate 'line', 6984
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7053
# Body
# {
.annotate 'line', 7055
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7056
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
box $P1, 0
.annotate 'line', 7057
setattribute self, 'nlabel', $P1
.annotate 'line', 7058
new $P4, [ 'RegisterStore' ]
$P3 = $P4.'settype'('I')
setattribute self, 'regstI', $P3
.annotate 'line', 7059
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('N')
setattribute self, 'regstN', $P5
.annotate 'line', 7060
new $P7, [ 'RegisterStore' ]
$P6 = $P7.'settype'('S')
setattribute self, 'regstS', $P6
.annotate 'line', 7061
new $P9, [ 'RegisterStore' ]
$P8 = $P9.'settype'('P')
setattribute self, 'regstP', $P8
# }
.annotate 'line', 7062

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7064
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7065
# Body
# {
.annotate 'line', 7068
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7069
unless_null $P1, __label_0
# {
.annotate 'line', 7070
$P1 = self.'generatesubid'()
.annotate 'line', 7071
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7073
.return($P1)
# }
.annotate 'line', 7074

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7076
# Body
# {
.annotate 'line', 7078
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7079
.return($I1)
# }
.annotate 'line', 7080

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7081
# Body
# {
.annotate 'line', 7083
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7084
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7085
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7086
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7087
# {
.annotate 'line', 7088
$P2 = __ARG_1.'get'()
.annotate 'line', 7089
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7090
eq $S1, '', __label_5
.annotate 'line', 7091
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7094
# string argname: $S2
# predefined string
$P6 = self.'getparamnum'()
set $S4, $P6
concat $S2, '__ARG_', $S4
.annotate 'line', 7095
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7097
# string varname: $S3
set $P7, $P2
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 7098
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7099
$P3['name'] = $S3
.annotate 'line', 7100
$P2 = __ARG_1.'get'()
.annotate 'line', 7101
$P7 = $P2.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 7102
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7103
$P3['modifiers'] = $P4
.annotate 'line', 7104
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7106
$P1.'push'($P3)
# }
.annotate 'line', 7107
$P8 = $P2.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 7108
$P8 = $P2.'isop'(')')
isfalse $I1, $P8
unless $I1 goto __label_9
.annotate 'line', 7109
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7111

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7113
# Body
# {
.annotate 'line', 7115
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7116
unless_null $P1, __label_0
.annotate 'line', 7117
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7119
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 7120

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7122
# Body
# {
.annotate 'line', 7124
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7125
.return(self)
# }
.annotate 'line', 7126

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7128
# Body
# {
.annotate 'line', 7130
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7131
unless_null $P1, __label_0
# {
.annotate 'line', 7132
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7133
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7135
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7136

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7137
# Body
# {
.annotate 'line', 7139
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7140
unless_null $P1, __label_0
# {
.annotate 'line', 7141
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7142
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7144
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7145

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7146
# Body
# {
.annotate 'line', 7150
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7151
# string lexname: $S1
null $S1
.annotate 'line', 7152
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 7153
# {
.annotate 'line', 7155
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7156
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7157
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7158
self.'setlex'($S1, $S2)
.annotate 'line', 7159
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7161
.return($S1)
# }
.annotate 'line', 7162

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7164
# Body
# {
.annotate 'line', 7166
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7167
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
.annotate 'line', 7169
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7171
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7173
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7175
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
concat $S4, 'Invalid type in createreg: ', __ARG_1
.annotate 'line', 7177
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7179
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7180
.return($S1)
# }
.annotate 'line', 7181

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7182
# Body
# {
.annotate 'line', 7184
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7185
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
.annotate 'line', 7187
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7189
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7191
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7193
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7195
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 7197
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7198
.return($S1)
# }
.annotate 'line', 7199

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7200
# Body
# {
.annotate 'line', 7202
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
.annotate 'line', 7203
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7204

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7205
# Body
# {
.annotate 'line', 7207
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7208
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7209
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 7211
.return($S1)
# }
.annotate 'line', 7212

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7213
# Body
# {
.annotate 'line', 7215
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7216

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7217
# Body
# {
.annotate 'line', 7219
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7220

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7222
# Body
# {
.annotate 'line', 7224
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 7225
__ARG_1.'say'()
.annotate 'line', 7226
__ARG_1.'print'(".sub ")
.annotate 'line', 7227
$P19 = self.'isanonymous'()
if_null $P19, __label_1
unless $P19 goto __label_1
.annotate 'line', 7228
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7230
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7231
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7232
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7233
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7234
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7235
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7236
if_null $P2, __label_5
.annotate 'line', 7237
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7241
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 7242
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7243
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7244
if_null $P3, __label_7
# {
.annotate 'line', 7245
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7246
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7247
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 7248
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 7249
le $I1, 0, __label_11
# {
.annotate 'line', 7250
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7251
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7252
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7253
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 7254
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 7255
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7257
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
.annotate 'line', 7262
ne $S1, 'main', __label_16
.annotate 'line', 7263
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7265
__ARG_1.'say'()
.annotate 'line', 7267
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7268
# var param: $P8
null $P8
.annotate 'line', 7269
# string paramname: $S2
null $S2
.annotate 'line', 7270
# var a: $P9
null $P9
.annotate 'line', 7272
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7273
$S2 = $P8['name']
.annotate 'line', 7274
$P9 = self.'getvar'($S2)
.annotate 'line', 7275
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7276
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7277
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7278
if_null $P10, __label_20
# {
.annotate 'line', 7279
# var named: $P11
null $P11
.annotate 'line', 7280
# var slurpy: $P12
null $P12
.annotate 'line', 7281
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7282
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7283
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7284
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
.annotate 'line', 7292
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7295
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7300
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7303
if_null $P11, __label_31
# {
.annotate 'line', 7304
# string setname: $S5
null $S5
.annotate 'line', 7305
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7306
if $I6 == $I7 goto __label_35
set $I7, 1
if $I6 == $I7 goto __label_36
goto __label_34
# switch
__label_35: # case
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7311
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7312
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7313
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7314
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7317
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7319
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7321
if_null $P12, __label_38
# {
.annotate 'line', 7322
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7326
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7328
__ARG_1.'say'()
.annotate 'line', 7329
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7332
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7333
if_null $P16, __label_39
# {
.annotate 'line', 7335
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
.annotate 'line', 7336
$P31 = $P16[$S6]
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7339
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7340
if_null $P16, __label_42
# {
.annotate 'line', 7342
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
.annotate 'line', 7343
$P32 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7346
__ARG_1.'comment'('Body')
.annotate 'line', 7347
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7349
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7350
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7353
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7354
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7356
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I6, $P17
ge $I4, $I6, __label_47
# {
.annotate 'line', 7357
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7358
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
inc $I4
goto __label_48
__label_47: # for end
.annotate 'line', 7356
# }
__label_45: # endif
# }
.annotate 'line', 7361

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7036
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7038
addattribute $P0, 'name'
.annotate 'line', 7039
addattribute $P0, 'subid'
.annotate 'line', 7040
addattribute $P0, 'modifiers'
.annotate 'line', 7041
addattribute $P0, 'params'
.annotate 'line', 7042
addattribute $P0, 'body'
.annotate 'line', 7043
addattribute $P0, 'regstI'
.annotate 'line', 7044
addattribute $P0, 'regstN'
.annotate 'line', 7045
addattribute $P0, 'regstS'
.annotate 'line', 7046
addattribute $P0, 'regstP'
.annotate 'line', 7047
addattribute $P0, 'nlabel'
.annotate 'line', 7048
addattribute $P0, 'localfun'
.annotate 'line', 7049
addattribute $P0, 'lexicals'
.annotate 'line', 7050
addattribute $P0, 'usedlexicals'
.annotate 'line', 7051
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7373
# Body
# {
.annotate 'line', 7375
self.'FunctionBase'(__ARG_1, __ARG_3)
box $P1, 0
.annotate 'line', 7376
setattribute self, 'paramnum', $P1
box $P1, 0
.annotate 'line', 7377
setattribute self, 'lexnum', $P1
.annotate 'line', 7378
self.'parse'(__ARG_2)
# }
.annotate 'line', 7379

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7381
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7382
# Body
# {
.annotate 'line', 7385
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7386
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7388
.return($I1)
# }
.annotate 'line', 7389

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7390
# Body
# {
.annotate 'line', 7393
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7394
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7396
.return($I1)
# }
.annotate 'line', 7397

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7398
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7400
# Body
# {
.annotate 'line', 7402
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7403
setattribute self, 'name', $P1
.annotate 'line', 7404
$P1 = __ARG_1.'get'()
.annotate 'line', 7405
$P3 = $P1.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7406
# var modifiers: $P2
new $P2, [ 'ModifierList' ]
$P2.'ModifierList'(__ARG_1, self)
.annotate 'line', 7407
setattribute self, 'modifiers', $P2
.annotate 'line', 7408
$P1 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7410
'RequireOp'('(', $P1)
.annotate 'line', 7411
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7413
$P1 = __ARG_1.'get'()
.annotate 'line', 7414
$P4 = $P1.'isop'('{')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 7415
'ExpectedOp'('{', $P1)
__label_1: # endif
.annotate 'line', 7416
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P1, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7417
.return(self)
# }
.annotate 'line', 7418

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7368
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7370
addattribute $P0, 'paramnum'
.annotate 'line', 7371
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7427
# Body
# {
.annotate 'line', 7429
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7430
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7431
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7432
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7433
setattribute self, 'name', $P1
.annotate 'line', 7434
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7435
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7436
'RequireOp'('{', $P2)
.annotate 'line', 7437
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_2, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7438
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7439

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7440
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7441
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7442
# Body
# {
.annotate 'line', 7444
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7445

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7446
# Body
# {
.annotate 'line', 7449
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7450

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7451
# Body
# {
.annotate 'line', 7454
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7455

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7456
# Body
# {
.annotate 'line', 7458
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7459
unless_null $P1, __label_0
# {
.annotate 'line', 7462
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7463
unless_null $P1, __label_1
# {
.annotate 'line', 7465
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7466
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7467
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7468
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7469
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7470
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7471
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7475
$P8 = $P1.'gettype'()
set $S5, $P8
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I2, $P9
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7476
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7477
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7478
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7479
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7480
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7481
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7482
# int flags: $I1
$P10 = $P1.'isvolatile'()
if_null $P10, __label_13
unless $P10 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7483
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
box $P11, $S3
.annotate 'line', 7484
setattribute $P1, 'lexname', $P11
.annotate 'line', 7485
# string reg: $S4
$P11 = $P1.'getreg'()
null $S4
if_null $P11, __label_14
set $S4, $P11
__label_14:
.annotate 'line', 7486
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
.annotate 'line', 7491
isnull $I3, $P1
not $I3
unless $I3 goto __label_16
isa $I4, $P1, 'VarData'
not $I3, $I4
__label_16:
unless $I3 goto __label_15
.annotate 'line', 7492
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7493
.return($P1)
# }
.annotate 'line', 7494

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7425
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7503
# Body
# {
.annotate 'line', 7505
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7506

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7507
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7501
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

.annotate 'line', 7524
# Body
# {
.annotate 'line', 7526
setattribute self, 'owner', __ARG_1
.annotate 'line', 7527
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7528

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7529
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7531
# Body
# {
.annotate 'line', 7533
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7534

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7522
addattribute $P0, 'owner'
.annotate 'line', 7523
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7540
# Body
# {
.annotate 'line', 7542
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7543
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7544

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7545
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7547
# Body
# {
.annotate 'line', 7549
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7550
__ARG_1.'print'($S1)
# }
.annotate 'line', 7551

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7537
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7539
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7558
# Body
# {
.annotate 'line', 7560
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7561
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7562
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7563
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7564
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 7565
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7566
$P2 = __ARG_1.'get'()
.annotate 'line', 7567
$P4 = $P2.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 7568
$P5 = $P2.'checkop'()
set $S1, $P5
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
box $P6, 1
.annotate 'line', 7570
setattribute self, 'hll', $P6
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7574
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7576
# {
.annotate 'line', 7577
$P2 = __ARG_1.'get'()
.annotate 'line', 7578
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7579
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 7580
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7581
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7582
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 7584
setattribute self, 'key', $P1
# }
.annotate 'line', 7585

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7586
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7587
# Body
# {
# predefined int
.annotate 'line', 7589
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7590

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7592
# Body
# {
.annotate 'line', 7594
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7595

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7554
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7556
addattribute $P0, 'key'
.annotate 'line', 7557
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7601
# Body
# {
.annotate 'line', 7603
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7604
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7605
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7606
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7607
$P2 = __ARG_1.'get'()
.annotate 'line', 7608
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7610
__ARG_1.'unget'($P2)
.annotate 'line', 7611
setattribute self, 'key', $P1
# }
.annotate 'line', 7612

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7613
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7615
# Body
# {
.annotate 'line', 7617
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7618
.return($P2)
# }
.annotate 'line', 7619

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7621
# Body
# {
.annotate 'line', 7623
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7624
unless_null $P1, __label_0
# {
.annotate 'line', 7625
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 7626
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 7627
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7629
$P4 = $P1.'getclasskey'()
__ARG_1.'print'($P4)
__label_1: # endif
# }
.annotate 'line', 7630

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7598
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7600
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7633
# Body
# {
.annotate 'line', 7635
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7636
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7637
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7638
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7639
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7640
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7641
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7642
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7643

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7660
# Body
# {
.annotate 'line', 7662
setattribute self, 'parent', __ARG_2
.annotate 'line', 7663
setattribute self, 'owner', __ARG_2
.annotate 'line', 7664
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7665
setattribute self, 'functions', $P1
.annotate 'line', 7666
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 7667
setattribute self, 'members', $P2
.annotate 'line', 7668
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7669
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 7670
setattribute self, 'constants', $P3
.annotate 'line', 7672
# var t: $P4
$P4 = __ARG_1.'get'()
.annotate 'line', 7673
setattribute self, 'name', $P4
.annotate 'line', 7674
$P4 = __ARG_1.'get'()
.annotate 'line', 7675
$P17 = $P4.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7676
# var bases: $P5
getattribute $P5, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7677
# {
.annotate 'line', 7678
# var base: $P6
$P6 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7679
$P5.'push'($P6)
.annotate 'line', 7680
$P4 = __ARG_1.'get'()
.annotate 'line', 7681
$P17 = $P4.'isop'(',')
isfalse $I1, $P17
unless $I1 goto __label_3
goto __label_1 # break
__label_3: # endif
# }
goto __label_2
__label_1: # Infinite loop end
# }
__label_0: # endif
.annotate 'line', 7684
'RequireOp'('{', $P4)
# for loop
.annotate 'line', 7685
$P4 = __ARG_1.'get'()
__label_6: # for condition
$P18 = $P4.'isop'('}')
isfalse $I1, $P18
unless $I1 goto __label_5
# {
.annotate 'line', 7686
# string key: $S1
$P19 = $P4.'checkkeyword'()
null $S1
if_null $P19, __label_7
set $S1, $P19
__label_7:
set $S2, $S1
set $S3, 'function'
.annotate 'line', 7687
if $S2 == $S3 goto __label_10
set $S3, 'var'
if $S2 == $S3 goto __label_11
set $S3, 'const'
if $S2 == $S3 goto __label_12
goto __label_9
# switch
__label_10: # case
.annotate 'line', 7689
# var f: $P7
new $P7, [ 'MethodStatement' ]
$P7.'MethodStatement'($P4, __ARG_1, self)
.annotate 'line', 7690
$P1.'push'($P7)
goto __label_8 # break
__label_11: # case
.annotate 'line', 7693
# var name: $P8
$P8 = __ARG_1.'get'()
.annotate 'line', 7694
$P18 = $P8.'isidentifier'()
isfalse $I2, $P18
unless $I2 goto __label_13
.annotate 'line', 7695
'Expected'("member identifier", $P8)
__label_13: # endif
.annotate 'line', 7696
$P2.'push'($P8)
.annotate 'line', 7697
$P4 = __ARG_1.'get'()
.annotate 'line', 7698
$P19 = $P4.'isop'(';')
isfalse $I3, $P19
unless $I3 goto __label_14
.annotate 'line', 7699
'Expected'("';' in member declaration", $P4)
__label_14: # endif
goto __label_8 # break
__label_12: # case
.annotate 'line', 7702
# var cst: $P9
$P9 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 7703
$P3.'push'($P9)
goto __label_8 # break
__label_9: # default
.annotate 'line', 7706
'SyntaxError'("Unexpected item in class", $P4)
__label_8: # switch end
# }
__label_4: # for iteration
.annotate 'line', 7685
$P4 = __ARG_1.'get'()
goto __label_6
__label_5: # for end
.annotate 'line', 7709
# var classns: $P10
getattribute $P20, self, 'parent'
$P10 = $P20.'getpath'()
.annotate 'line', 7710
getattribute $P20, self, 'name'
$P10.'push'($P20)
.annotate 'line', 7711
setattribute self, 'classns', $P10
# }
.annotate 'line', 7712

.end # ClassStatement


.sub 'generatesubid' :method

.annotate 'line', 7713
# Body
# {
.annotate 'line', 7715
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7716

.end # generatesubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7717
# Body
# {
.annotate 'line', 7719
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7720

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7721
# Body
# {
.annotate 'line', 7723
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7724

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7725
# Body
# {
.annotate 'line', 7727
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7728

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7729
# Body
# {
.annotate 'line', 7731
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7732
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7733
.return(self)
# }
.annotate 'line', 7734

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7735
# Body
# {
.annotate 'line', 7737
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7738

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7739
# Body
# {
.annotate 'line', 7741
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7742
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7743
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7744
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7746
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7748
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7749
# int n: $I1
set $I1, 1
.annotate 'line', 7750
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7751
$P3.'annotate'(__ARG_1)
.annotate 'line', 7752
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7753
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7754
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7755
__ARG_1.'say'()
.annotate 'line', 7756
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7758
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7759
__ARG_1.'annotate'($P4)
.annotate 'line', 7760
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7763
__ARG_1.'say'('.end')
# }
.annotate 'line', 7764

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7649
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7651
addattribute $P0, 'parent'
.annotate 'line', 7652
addattribute $P0, 'owner'
.annotate 'line', 7653
addattribute $P0, 'name'
.annotate 'line', 7654
addattribute $P0, 'bases'
.annotate 'line', 7655
addattribute $P0, 'constants'
.annotate 'line', 7656
addattribute $P0, 'functions'
.annotate 'line', 7657
addattribute $P0, 'members'
.annotate 'line', 7658
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7771
# Body
# {
.annotate 'line', 7773
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7774
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7775
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 7776
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7777
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7778
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7783
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7784
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7785
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7786
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7787
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7788
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7789
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7790
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 7788
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
.annotate 'line', 7795
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7796
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7801
load_bytecode 'PGE.pbc'
.annotate 'line', 7802
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7803
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7805
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
.annotate 'line', 7806
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7807
$P8 = $P7($S4)
.annotate 'line', 7808
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7809
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7810
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7811
# int ivalue: $I1
null $I1
.annotate 'line', 7812
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7813
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7818
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7817
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7816
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7805
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7822
$P5.'close'()
# }
.annotate 'line', 7823

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7835
# Body
# {
.annotate 'line', 7837
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7838
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7839
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7840
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7841

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7842
# Body
# {
.annotate 'line', 7844
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7845
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7846
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7847
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7848
.return($P4)
# }
.annotate 'line', 7849

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7850
# Body
# {
.annotate 'line', 7854
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
.annotate 'line', 7856
.return($P5)
__label_3: # case
.annotate 'line', 7859
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7864
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7865
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7866
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7867
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7868
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7869
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7870
if_null $P4, __label_8
.annotate 'line', 7871
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7875
.return($P5)
# }
.annotate 'line', 7876

.end # findclasskey_base


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7877
# Body
# {
.annotate 'line', 7879
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7880
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 7881
$P1 = __ARG_2.'get'()
.annotate 'line', 7883
# var modifier: $P2
null $P2
.annotate 'line', 7884
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 7885
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 7886
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 7889
'RequireOp'('{', $P1)
.annotate 'line', 7890
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 7891
getattribute $P5, self, 'namespaces'
$P5.'push'($P3)
.annotate 'line', 7892
getattribute $P6, self, 'items'
$P6.'push'($P3)
.annotate 'line', 7893
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 7894

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7895
# Body
# {
.annotate 'line', 7897
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 7898
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 7899
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 7900
# var t: $P4
null $P4
# for loop
.annotate 'line', 7901
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 7903
# string key: $S1
$P9 = $P4.'checkkeyword'()
null $S1
if_null $P9, __label_4
set $S1, $P9
__label_4:
set $S4, $S1
set $S5, 'namespace'
.annotate 'line', 7904
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
.annotate 'line', 7906
self.'parsenamespace'($P4, __ARG_1)
goto __label_5 # break
__label_8: # case
.annotate 'line', 7909
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 7910
$P1.'push'($P5)
goto __label_5 # break
__label_9: # case
.annotate 'line', 7913
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 7914
$P2.'push'($P6)
.annotate 'line', 7915
$P1.'push'($P6)
goto __label_5 # break
__label_10: # case
.annotate 'line', 7918
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'(__ARG_1, self)
.annotate 'line', 7919
$P3.'push'($P7)
.annotate 'line', 7920
$P1.'push'($P7)
goto __label_5 # break
__label_11: # case
.annotate 'line', 7923
$P4 = __ARG_1.'get'()
.annotate 'line', 7924
$P8 = $P4.'iskeyword'('extern')
isfalse $I1, $P8
unless $I1 goto __label_14
.annotate 'line', 7925
'SyntaxError'('Unsupported at nmaespace level', $P4)
__label_14: # endif
.annotate 'line', 7926
$P4 = __ARG_1.'get'()
.annotate 'line', 7927
$P9 = $P4.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_15
.annotate 'line', 7928
'Expected'('string literal', $P4)
__label_15: # endif
.annotate 'line', 7929
# string reqlib: $S2
set $P10, $P4
null $S2
if_null $P10, __label_16
set $S2, $P10
__label_16:
.annotate 'line', 7930
self.'addlib'($S2)
.annotate 'line', 7931
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_12: # case
.annotate 'line', 7934
'include_parrot'($P4, __ARG_1, self)
goto __label_5 # break
__label_13: # case
.annotate 'line', 7937
$P4 = __ARG_1.'get'()
.annotate 'line', 7938
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_17
.annotate 'line', 7939
'Expected'('string literal', $P4)
__label_17: # endif
.annotate 'line', 7940
# string reqload: $S3
set $P12, $P4
null $S3
if_null $P12, __label_18
set $S3, $P12
__label_18:
.annotate 'line', 7941
self.'addload'($S3)
.annotate 'line', 7942
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_6: # default
.annotate 'line', 7945
'SyntaxError'("Unexpected token", $P4)
__label_5: # switch end
# }
__label_0: # for iteration
.annotate 'line', 7901
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
if_null $P4, __label_19
unless $P4 goto __label_19
.annotate 'line', 7949
self.'close_ns'($P4)
goto __label_20
__label_19: # else
.annotate 'line', 7951
self.'unclosed_ns'()
__label_20: # endif
# }
.annotate 'line', 7952

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7953
# Body
# {
.annotate 'line', 7955
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7956

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7957
# Body
# {
.annotate 'line', 7959
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7960
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7962
# int activate: $I1
set $I1, 1
.annotate 'line', 7963
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7964
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7965
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
unless $I1 goto __label_6
.annotate 'line', 7968
# {
.annotate 'line', 7969
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7970
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7972
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7974

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7827
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7829
addattribute $P0, 'namespaces'
.annotate 'line', 7830
addattribute $P0, 'classes'
.annotate 'line', 7831
addattribute $P0, 'functions'
.annotate 'line', 7832
addattribute $P0, 'items'
.annotate 'line', 7833
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7989
# Body
# {
.annotate 'line', 7992
setattribute self, 'parent', __ARG_1
.annotate 'line', 7993
setattribute self, 'start', __ARG_2
.annotate 'line', 7994
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7995
setattribute self, 'name', $P2
.annotate 'line', 7996
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7997
if_null __ARG_4, __label_0
# {
.annotate 'line', 7998
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7999
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8001

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 8002
# Body
# {
.annotate 'line', 8004
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8005

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8006
# Body
# {
.annotate 'line', 8008
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8009

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 8010
# Body
# {
.annotate 'line', 8012
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 8013
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 8014
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 8015
.return($P1)
# }
.annotate 'line', 8016

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8017
# Body
# {
.annotate 'line', 8019
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8020

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8021
# Body
# {
.annotate 'line', 8023
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8024

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8025
# Body
# {
.annotate 'line', 8027
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8028
unless_null $P1, __label_0
.annotate 'line', 8029
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8031
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8032

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8033
# Body
# {
.annotate 'line', 8037
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8038
unless_null $P1, __label_0
.annotate 'line', 8039
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8040
.return($P1)
# }
.annotate 'line', 8041

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8042
# Body
# {
.annotate 'line', 8044
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8045

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8046
# Body
# {
# }
.annotate 'line', 8049

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8050
# Body
# {
.annotate 'line', 8052
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8053
if_null $P1, __label_0
# {
.annotate 'line', 8054
$P1 = $P1.'optimize'()
.annotate 'line', 8055
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8057
self.'optimize_base'()
.annotate 'line', 8058
.return(self)
# }
.annotate 'line', 8059

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8060
# Body
# {
.annotate 'line', 8062
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8063
if_null $P1, __label_0
.annotate 'line', 8064
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8066
self.'emit_base'(__ARG_1)
.annotate 'line', 8068
if_null $P1, __label_1
.annotate 'line', 8069
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8070

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7981
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7983
addattribute $P0, 'parent'
.annotate 'line', 7984
addattribute $P0, 'start'
.annotate 'line', 7985
addattribute $P0, 'name'
.annotate 'line', 7986
addattribute $P0, 'modifier'
.annotate 'line', 7987
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8085
# Body
# {
.annotate 'line', 8087
setattribute self, 'unit', __ARG_1
.annotate 'line', 8088
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P2, 0
.annotate 'line', 8089
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8090

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8091
# Body
# {
.annotate 'line', 8093
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8094
$P1[__ARG_1] = 1
# }
.annotate 'line', 8095

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8096
# Body
# {
.annotate 'line', 8098
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8099
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8100

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8102
# Body
# {
.annotate 'line', 8104
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8105
# int idgen: $I1
set $P2, $P1
set $I1, $P2
inc $I1
assign $P1, $I1
.annotate 'line', 8108
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8109
.return($S1)
# }
.annotate 'line', 8110

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8112
# Body
# {
.annotate 'line', 8114
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8115
unless_null $P1, __label_0
# {
.annotate 'line', 8116
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8117
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8119
$P1[__ARG_1] = 1
# }
.annotate 'line', 8120

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8121
# Body
# {
.annotate 'line', 8123
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8124
unless_null $P1, __label_0
# {
.annotate 'line', 8125
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8126
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8128
$P1[__ARG_1] = 1
# }
.annotate 'line', 8129

.end # addload


.sub 'getpath' :method

.annotate 'line', 8130
# Body
# {
.annotate 'line', 8132
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8133
.return($P1)
# }
.annotate 'line', 8134

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8135
# Body
# {
.annotate 'line', 8137
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8138

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8139
# Body
# {
.annotate 'line', 8142
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8143

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8144
# Body
# {
# }
.annotate 'line', 8147

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8148
# Body
# {
.annotate 'line', 8150
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8151

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8152
# Body
# {
.annotate 'line', 8154
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8155

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8156
# Body
# {
.annotate 'line', 8158
self.'optimize_base'()
.annotate 'line', 8159
.return(self)
# }
.annotate 'line', 8160

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8161
# Body
# {
.annotate 'line', 8163
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8166
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8167
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8170
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
.annotate 'line', 8173
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8174
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8175
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8176
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8179
# int somelib: $I1
null $I1
.annotate 'line', 8180
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8181
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 8183
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8184
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8187
# int someload: $I2
null $I2
.annotate 'line', 8188
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8189
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 8191
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8192
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8193
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8194
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8197
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8199
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8200

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8077
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8079
addattribute $P0, 'unit'
.annotate 'line', 8080
addattribute $P0, 'predefs_used'
.annotate 'line', 8081
addattribute $P0, 'libs'
.annotate 'line', 8082
addattribute $P0, 'loads'
.annotate 'line', 8083
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8214
# Body
# {
box $P3, 1
.annotate 'line', 8216
setattribute self, 'warnings', $P3
.annotate 'line', 8217
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8220
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8224
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8223
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8222
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8228
new $P6, [ 'TokenInteger' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
$P6.'TokenInteger'($P7, $P8, 'false')
set $P5, $P6
.annotate 'line', 8227
$P4 = 'integerValue'($P1, $P5, 1)
.annotate 'line', 8226
$P1.'createconst'('true', 'I', $P4, '')
.annotate 'line', 8234
new $P9, [ 'StringLiteral' ]
.annotate 'line', 8235
new $P11, [ 'TokenQuoted' ]
getattribute $P12, $P2, 'file'
getattribute $P13, $P2, 'line'
# predefined string
# predefined int
set $I2, "2"
add $I1, $I2, 1
set $S1, $I1
$P11.'TokenQuoted'($P12, $P13, $S1)
set $P10, $P11
$P9.'StringLiteral'($P1, $P10)
set $P8, $P9
.annotate 'line', 8233
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 8238
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8239

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8240
# Body
# {
.annotate 'line', 8242
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8243

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8244
# Body
# {
# predefined int
.annotate 'line', 8246
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8247

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8248
# Body
# {
.annotate 'line', 8250
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8251

.end # parse


.sub 'optimize' :method

.annotate 'line', 8252
# Body
# {
.annotate 'line', 8254
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8255

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8256
# Body
# {
.annotate 'line', 8258
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8259
__ARG_1.'say'('')
.annotate 'line', 8261
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8263
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8264

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8211
addattribute $P0, 'rootns'
.annotate 'line', 8212
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('nowarn')

.annotate 'line', 8271
# Body
# {
.annotate 'line', 8275
unless_null __ARG_2, __label_0
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8277
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8278
$P1.'open'('__eval__', 'w')
.annotate 'line', 8279
$P1.'puts'(__ARG_1)
.annotate 'line', 8280
$P1.'close'()
.annotate 'line', 8281
$P1.'open'('__eval__', 'r')
.annotate 'line', 8282
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8283
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
unless __ARG_3 goto __label_1
.annotate 'line', 8285
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8286
$P3.'parse'($P2)
.annotate 'line', 8287
$P1.'close'()
.annotate 'line', 8288
$P3.'optimize'()
.annotate 'line', 8289
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8290
$P4.'open'('__eval__', 'w')
.annotate 'line', 8291
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8292
$P5.'initialize'($P4)
.annotate 'line', 8293
$P3.'emit'($P5)
.annotate 'line', 8294
$P5.'close'()
.annotate 'line', 8295
$P4.'close'()
.annotate 'line', 8296
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_2
set $S1, $P8
__label_2:
.annotate 'line', 8297
# var object: $P6
null $P6
set $S2, __ARG_2
set $S3, 'pir'
.annotate 'line', 8298
if $S2 == $S3 goto __label_5
set $S3, 'pbc'
if $S2 == $S3 goto __label_6
set $S3, ''
if $S2 == $S3 goto __label_7
goto __label_4
# switch
__label_5: # case
.annotate 'line', 8300
new $P6, [ 'String' ]
assign $P6, $S1
goto __label_3 # break
__label_6: # case
__label_7: # case
.annotate 'line', 8305
# var pircomp: $P7
# predefined compreg
compreg $P7, 'PIR'
.annotate 'line', 8306
$P6 = $P7($S1)
goto __label_3 # break
__label_4: # default
.annotate 'line', 8307
# predefined die
.annotate 'line', 8309
die 'Invalid target'
__label_3: # switch end
.annotate 'line', 8311
.return($P6)
# }
.annotate 'line', 8312

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('nowarn')

.annotate 'line', 8313
# Body
# {
.annotate 'line', 8316
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8317
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8318
$P1.'encoding'('utf8')
.annotate 'line', 8319
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8320
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
unless __ARG_3 goto __label_0
.annotate 'line', 8322
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8323
$P3.'parse'($P2)
.annotate 'line', 8324
$P1.'close'()
.annotate 'line', 8325
$P3.'optimize'()
.annotate 'line', 8326
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8327
$P4.'initialize'(__ARG_2)
.annotate 'line', 8328
$P3.'emit'($P4)
.annotate 'line', 8329
$P4.'close'()
# }
.annotate 'line', 8330

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param int __ARG_2 :optional :named('nowarn')

.annotate 'line', 8331
# Body
# {
.annotate 'line', 8334
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8335
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8336
$P1.'encoding'('utf8')
.annotate 'line', 8337
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8338
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
unless __ARG_2 goto __label_0
.annotate 'line', 8340
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8341
$P3.'parse'($P2)
.annotate 'line', 8342
$P1.'close'()
.annotate 'line', 8343
$P3.'optimize'()
.annotate 'line', 8344
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8345
$P4.'open'('__eval__', 'w')
.annotate 'line', 8346
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8347
$P5.'initialize'($P4)
.annotate 'line', 8348
$P3.'emit'($P5)
.annotate 'line', 8349
$P5.'close'()
.annotate 'line', 8350
$P4.'close'()
.annotate 'line', 8351
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_1
set $S1, $P8
__label_1:
.annotate 'line', 8352
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8353
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8354
.return($P7)
# }
.annotate 'line', 8355

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 8360
# Body
# {
.annotate 'line', 8362
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 8363
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 8364
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8365
$P1.'parse'(__ARG_1)
.annotate 'line', 8367
$P1.'optimize'()
.annotate 'line', 8369
# var handle: $P2
null $P2
.annotate 'line', 8370
ne __ARG_2, '-', __label_1
.annotate 'line', 8371
# pirop getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 8373
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 8374
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8375
$P3.'initialize'($P2)
.annotate 'line', 8376
$P1.'emit'($P3)
.annotate 'line', 8377
$P3.'close'()
.annotate 'line', 8378
$P2.'close'()
# }
.annotate 'line', 8379

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8385
# Body
# {
.annotate 'line', 8387
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8388
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8389

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8391
# Body
# {
.annotate 'line', 8393
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8394
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8395
$P1.'notOptStop'(1)
.annotate 'line', 8396
$P1.'push_string'('o=s')
.annotate 'line', 8397
$P1.'push_string'('e=s')
.annotate 'line', 8398
$P1.'push_string'('c')
.annotate 'line', 8399
$P1.'push_string'('noan')
.annotate 'line', 8400
$P1.'push_string'('nowarn')
.annotate 'line', 8402
__ARG_1.'shift'()
.annotate 'line', 8403
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8404
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8405
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8406
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8407
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8408
# var opt_nowarn: $P7
$P7 = $P2['nowarn']
.annotate 'line', 8409
# int warn: $I1
set $I1, 1
.annotate 'line', 8410
if_null $P7, __label_0
null $I1
__label_0: # endif
.annotate 'line', 8413
# int argc: $I2
set $P10, __ARG_1
set $I2, $P10
.annotate 'line', 8414
# string filename: $S1
null $S1
.annotate 'line', 8415
# string expr: $S2
null $S2
.annotate 'line', 8416
# var file: $P8
null $P8
.annotate 'line', 8417
unless_null $P4, __label_1
# {
.annotate 'line', 8418
ne $I2, 0, __label_3
# predefined Error
.annotate 'line', 8419
root_new $P10, ['parrot';'Exception']
$P10['message'] = 'No file'
throw $P10
__label_3: # endif
.annotate 'line', 8421
$S1 = __ARG_1[0]
.annotate 'line', 8422
# predefined open
root_new $P8, ['parrot';'FileHandle']
$P8.'open'($S1)
.annotate 'line', 8423
$P8.'encoding'('utf8')
# }
goto __label_2
__label_1: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8428
new $P8, [ 'StringHandle' ]
.annotate 'line', 8429
$P8.'open'('__eval__', 'w')
.annotate 'line', 8430
$P8.'puts'($S2)
.annotate 'line', 8431
$P8.'close'()
.annotate 'line', 8432
$P8.'open'('__eval__')
set $S1, '__eval__'
.annotate 'line', 8433
# }
__label_2: # endif
.annotate 'line', 8436
# var t: $P9
new $P9, [ 'Tokenizer' ]
$P9.'Tokenizer'($P8, $S1)
.annotate 'line', 8438
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8439
if_null $P3, __label_4
set $S3, $P3
__label_4: # endif
.annotate 'line', 8441
'winxed_parser'($P9, $S3, $I1)
.annotate 'line', 8443
$P8.'close'()
# }
.annotate 'line', 8444

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 8446
# Body
# {
.annotate 'line', 8448
# int i: $I1
set $I1, 1
.annotate 'line', 8449
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 8450
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 8451
# string subname: $S1
null $S1
.annotate 'line', 8452
if_null $P2, __label_2
# {
set $S1, $P2
.annotate 'line', 8454
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 8455
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
.annotate 'line', 8457
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 8458
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 8459
eq $S3, '', __label_6
# {
.annotate 'line', 8460
# int line: $I2
$I2 = $P3['line']
set $I4, $I1
inc $I1
mul $I3, 2, $I4
.annotate 'line', 8461
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
.annotate 'line', 8464

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8466
# Body
# {
.annotate 'line', 8468
# int retval: $I1
null $I1
.annotate 'line', 8469
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 8475
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8469
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8478
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8479
# int type: $I2
$I2 = $P1['type']
set $I3, $I2
set $I4, 556
.annotate 'line', 8480
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 8483
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 8487
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8488
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
set $I1, 2
__label_2: # switch end
.annotate 'line', 8489
# }
# catch end
__label_1:
.annotate 'line', 8492
# predefined exit
exit $I1
# }
.annotate 'line', 8493

.end # main

# End generated code
