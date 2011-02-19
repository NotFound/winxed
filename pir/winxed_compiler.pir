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
$P2 = __ARG_2.'show'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 71
concat $S0, __ARG_1, ' near '
concat $S0, $S0, $S1
set __ARG_1, $S0
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
concat $S3, __ARG_1, ' in '
concat $S3, $S3, $S2
concat $S3, $S3, ' line '
concat $S3, $S3, $S1
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
$P2 = __ARG_2.'viewable'()
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
.annotate 'line', 91
# string m: $S4
concat $S4, __ARG_1, ' in '
concat $S4, $S4, $S2
concat $S4, $S4, ' line '
concat $S4, $S4, $S1
concat $S4, $S4, ' near '
concat $S4, $S4, $S3
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
.annotate 'line', 98
concat $S1, "Expected ", __ARG_1
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 99

.end # Expected


.sub 'ExpectedIdentifier'
.param pmc __ARG_1

.annotate 'line', 101
# Body
# {
.annotate 'line', 103
'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 104

.end # ExpectedIdentifier


.sub 'ExpectedOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 106
# Body
# {
.annotate 'line', 108
concat $S1, "Expected '", __ARG_1
concat $S1, $S1, "'"
'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 109

.end # ExpectedOp


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 111
# Body
# {
.annotate 'line', 113
$P1 = __ARG_2.'isop'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 114
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 115

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 117
# Body
# {
.annotate 'line', 119
$P1 = __ARG_2.'iskeyword'(__ARG_1)
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 120
'ExpectedOp'(__ARG_1, __ARG_2)
__label_0: # endif
# }
.annotate 'line', 121

.end # RequireKeyword


.sub 'RequireIdentifier'
.param pmc __ARG_1

.annotate 'line', 123
# Body
# {
.annotate 'line', 125
$P1 = __ARG_1.'isidentifier'()
isfalse $I1, $P1
unless $I1 goto __label_0
.annotate 'line', 126
'ExpectedIdentifier'(__ARG_1)
__label_0: # endif
# }
.annotate 'line', 127

.end # RequireIdentifier


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 129
# Body
# {
.annotate 'line', 131
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 132
'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 133

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 135
# Body
# {
.annotate 'line', 137
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 138
'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 139

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 149
# Body
# {
.annotate 'line', 151
box $P1, __ARG_1
setattribute self, 'file', $P1
.annotate 'line', 152
box $P1, __ARG_2
setattribute self, 'line', $P1
# }
.annotate 'line', 153

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 154
# Body
# {
.annotate 'line', 156
.return(1)
# }
.annotate 'line', 157

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 158
# Body
# {
.annotate 'line', 160
.return(1)
# }
.annotate 'line', 161

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 163
# Body
# {
.return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 164
# Body
# {
.return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 165
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 166
# Body
# {
.return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 167
# Body
# {
.return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 168
# Body
# {
.return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 170
# Body
# {
.annotate 'line', 172
'InternalError'('Not a literal string', self)
# }
.annotate 'line', 173

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 174
# Body
# {
.annotate 'line', 176
'ExpectedIdentifier'(self)
# }
.annotate 'line', 177

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 178
# Body
# {
.return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 179
# Body
# {
.return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 180
# Body
# {
.return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 181
# Body
# {
.return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 182
# Body
# {
.return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 183
# Body
# {
.annotate 'line', 185
# string r: $S1
$P1 = self.'viewable'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 186
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
.annotate 'line', 187

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 147
addattribute $P0, 'file'
.annotate 'line', 148
addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 192
# Body
# {
.annotate 'line', 194
self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 195

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 196
# Body
# {
.annotate 'line', 198
.return(0)
# }
.annotate 'line', 199

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 200
# Body
# {
.annotate 'line', 202
.return(0)
# }
.annotate 'line', 203

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 204
# Body
# {
.return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 205
# Body
# {
.return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenEof' ]
.annotate 'line', 190
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 211
# Body
# {
.annotate 'line', 213
self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 214
box $P1, __ARG_3
setattribute self, 'str', $P1
# }
.annotate 'line', 215

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 216
# Body
# {
getattribute $P1, self, 'str'
.return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 217
# Body
# {
.annotate 'line', 219
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 220

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 208
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.annotate 'line', 210
addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 225
# Body
# {
.annotate 'line', 227
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 228

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 229
# Body
# {
.return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenComment' ]
.annotate 'line', 223
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 234
# Body
# {
.annotate 'line', 236
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 237

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 238
# Body
# {
.annotate 'line', 240
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 241

.end # isop


.sub 'checkop' :method

.annotate 'line', 242
# Body
# {
# predefined string
.annotate 'line', 244
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 245

.end # checkop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenOp' ]
.annotate 'line', 232
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 250
# Body
# {
.annotate 'line', 252
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 253

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 254
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 255
# Body
# {
.annotate 'line', 257
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 258

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 259
# Body
# {
# predefined string
.annotate 'line', 261
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 262

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 263
# Body
# {
.annotate 'line', 265
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 266

.end # iskeyword

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 248
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 271
# Body
# {
.return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 272
# Body
# {
.annotate 'line', 274
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 275

.end # rawstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenString' ]
.annotate 'line', 269
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 280
# Body
# {
.annotate 'line', 282
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 283

.end # TokenQuoted


.sub 'get_string' :method :vtable

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

.end # get_string


.sub 'viewable' :method

.annotate 'line', 288
# Body
# {
# predefined string
.annotate 'line', 290
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, $S2, '"'
.return($S2)
# }
.annotate 'line', 291

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 278
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 296
# Body
# {
.annotate 'line', 298
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 299

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

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

.end # get_string


.sub 'viewable' :method

.annotate 'line', 304
# Body
# {
# predefined string
.annotate 'line', 306
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, $S2, "'"
.return($S2)
# }
.annotate 'line', 307

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 294
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 312
# Body
# {
.annotate 'line', 314
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 315

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 316
# Body
# {
.return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 310
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 321
# Body
# {
.annotate 'line', 323
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 324

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 325
# Body
# {
.return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 319
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 333
# Body
# {
.annotate 'line', 335
# string s: $S1
set $S1, ''
.annotate 'line', 336
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 337
eq $S2, '"', __label_1
# {
.annotate 'line', 338
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 339
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 341
ne $S2, '\', __label_5
# {
.annotate 'line', 342
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 343
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 344
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
.annotate 'line', 345
concat $S1, $S1, $S2
concat $S1, $S1, $S3
# }
goto __label_6
__label_5: # else
.annotate 'line', 348
concat $S1, $S1, $S2
__label_6: # endif
.annotate 'line', 349
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 351
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 352

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 354
# Body
# {
.annotate 'line', 356
# string s: $S1
set $S1, ''
.annotate 'line', 357
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 358
eq $S2, "'", __label_1
# {
.annotate 'line', 359
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 360
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 361
concat $S1, $S1, $S2
.annotate 'line', 362
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 364
new $P2, [ 'TokenSingleQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 365

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 367
# Body
# {
.annotate 'line', 369
# string mark: $S1
set $S1, ''
.annotate 'line', 370
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 371
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 374
set $S5, $S2
set $S6, '"'
if $S5 == $S6 goto __label_6
set $S6, '\'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 376
set $S2, '\"'
goto __label_4 # break
__label_7: # case
.annotate 'line', 379
set $S2, '\\'
goto __label_4 # break
__label_5: # default
__label_4: # switch end
.annotate 'line', 382
concat $S0, $S1, $S2
set $S1, $S0
.annotate 'line', 383
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 385
ne $S2, '', __label_8
.annotate 'line', 386
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
.annotate 'line', 387
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 389
# string content: $S3
set $S3, ''
.annotate 'line', 390
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 391
# {
.annotate 'line', 392
set $S4, ''
.annotate 'line', 393
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_13: # while
.annotate 'line', 394
isne $I1, $S2, "\n"
unless $I1 goto __label_14
isne $I1, $S2, ''
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 395
set $S5, $S2
set $S6, '"'
if $S5 == $S6 goto __label_17
set $S6, '\'
if $S5 == $S6 goto __label_18
goto __label_16
# switch
__label_17: # case
.annotate 'line', 397
set $S2, '\"'
goto __label_15 # break
__label_18: # case
.annotate 'line', 400
set $S2, '\\'
goto __label_15 # break
__label_16: # default
__label_15: # switch end
.annotate 'line', 403
concat $S4, $S4, $S2
.annotate 'line', 404
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 406
ne $S2, '', __label_19
.annotate 'line', 407
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 408
eq $S4, $S1, __label_20
.annotate 'line', 409
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
__label_20: # endif
# }
__label_11: # continue
.annotate 'line', 410
ne $S4, $S1, __label_9
__label_10: # enddo
.annotate 'line', 411
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 412

.end # getheredoc


.sub 'getident'
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
__label_2: # while
.annotate 'line', 418
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 419
concat $S1, $S1, $S2
.annotate 'line', 420
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 422
__ARG_1.'ungetchar'($S2)
.annotate 'line', 423
new $P2, [ 'TokenIdentifier' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenIdentifier'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 424

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 426
# Body
# {
.annotate 'line', 428
# string s: $S1
null $S1
.annotate 'line', 429
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 430
# {
.annotate 'line', 431
concat $S1, $S1, $S2
.annotate 'line', 432
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_2: # continue
.annotate 'line', 433
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 434
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 435
# int hexval: $I1
null $I1
# int h: $I2
null $I2
.annotate 'line', 436
$P1 = __ARG_1.'getchar'()
set $S2, $P1
__label_7: # while
.annotate 'line', 437
$P1 = 'hexdigit'($S2)
set $I2, $P1
lt $I2, 0, __label_6
# {
.annotate 'line', 438
mul $I3, $I1, 16
add $I1, $I3, $I2
.annotate 'line', 439
concat $S1, $S1, $S2
.annotate 'line', 440
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 442
__ARG_1.'ungetchar'($S2)
.annotate 'line', 443
set $S1, $I1
.annotate 'line', 444
new $P2, [ 'TokenInteger' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenInteger'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
__label_3: # endif
.annotate 'line', 446
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 447
# {
.annotate 'line', 448
concat $S1, $S1, $S2
.annotate 'line', 449
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_12: # continue
.annotate 'line', 450
$P1 = 'isdigit'($S2)
if_null $P1, __label_11
if $P1 goto __label_10
__label_11: # enddo
.annotate 'line', 451
iseq $I3, $S2, 'e'
if $I3 goto __label_14
iseq $I3, $S2, 'E'
__label_14:
unless $I3 goto __label_13
# {
.annotate 'line', 452
concat $S1, $S1, 'E'
.annotate 'line', 453
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_16
iseq $I3, $S2, '-'
__label_16:
unless $I3 goto __label_15
# {
.annotate 'line', 454
concat $S1, $S1, $S2
.annotate 'line', 455
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 457
$P1 = 'isdigit'($S2)
if_null $P1, __label_17
unless $P1 goto __label_17
# {
.annotate 'line', 458
concat $S1, $S1, $S2
.annotate 'line', 459
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 462
__ARG_1.'ungetchar'($S2)
.annotate 'line', 463
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 466
iseq $I3, $S2, 'e'
if $I3 goto __label_21
iseq $I3, $S2, 'E'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 467
concat $S1, $S1, 'E'
.annotate 'line', 468
$P1 = __ARG_1.'getchar'()
set $S2, $P1
iseq $I3, $S2, '+'
if $I3 goto __label_23
iseq $I3, $S2, '-'
__label_23:
unless $I3 goto __label_22
# {
.annotate 'line', 469
concat $S1, $S1, $S2
.annotate 'line', 470
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 472
$P1 = 'isdigit'($S2)
if_null $P1, __label_24
unless $P1 goto __label_24
# {
.annotate 'line', 473
concat $S1, $S1, $S2
.annotate 'line', 474
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 476
__ARG_1.'ungetchar'($S2)
.annotate 'line', 477
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 480
__ARG_1.'ungetchar'($S2)
.annotate 'line', 481
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
.annotate 'line', 484

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 486
# Body
# {
.annotate 'line', 488
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 489
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 490
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 491
concat $S1, $S1, $S2
.annotate 'line', 492
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 494
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 495

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 497
# Body
# {
.annotate 'line', 499
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 500
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 501
# {
__label_5: # while
.annotate 'line', 502
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 503
concat $S1, $S1, $S2
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 504
ne $S2, '', __label_7
.annotate 'line', 505
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
.annotate 'line', 506
concat $S1, $S1, $S2
.annotate 'line', 507
$P1 = __ARG_1.'getchar'()
set $S2, $P1
.annotate 'line', 508
ne $S2, '', __label_8
.annotate 'line', 509
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
__label_3: # continue
.annotate 'line', 510
ne $S2, '/', __label_1
__label_2: # enddo
.annotate 'line', 511
concat $S1, $S1, '/'
.annotate 'line', 512
new $P2, [ 'TokenComment' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 513

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 515
# Body
# {
.annotate 'line', 517
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 518
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 519

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 533
# Body
# {
.annotate 'line', 535
.const 'Sub' $P2 = 'getop'
.annotate 'line', 537
setattribute self, 'h', __ARG_1
.annotate 'line', 538
box $P3, ''
setattribute self, 'pending', $P3
.annotate 'line', 539
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P4
.annotate 'line', 540
box $P3, __ARG_2
setattribute self, 'filename', $P3
.annotate 'line', 541
box $P3, 1
setattribute self, 'line', $P3
.annotate 'line', 542
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 543
root_new $P3, ['parrot';'Hash']
get_hll_global $P4, 'getident'
$P3[''] = $P4
$P3['{'] = $P2
$P1['$'] = $P3
get_hll_global $P5, 'getquoted'
$P1['"'] = $P5
get_hll_global $P6, 'getsinglequoted'
$P1["'"] = $P6
.annotate 'line', 546
root_new $P7, ['parrot';'Hash']
.annotate 'line', 547
root_new $P8, ['parrot';'Hash']
$P8[''] = $P2
$P8['='] = $P2
$P7['='] = $P8
$P7[':'] = $P2
$P1['='] = $P7
.annotate 'line', 550
root_new $P9, ['parrot';'Hash']
$P9['+'] = $P2
$P9['='] = $P2
$P1['+'] = $P9
.annotate 'line', 551
root_new $P10, ['parrot';'Hash']
$P10['-'] = $P2
$P10['='] = $P2
$P1['-'] = $P10
.annotate 'line', 552
root_new $P11, ['parrot';'Hash']
$P11['='] = $P2
$P1['*'] = $P11
.annotate 'line', 553
root_new $P12, ['parrot';'Hash']
$P12['|'] = $P2
$P1['|'] = $P12
.annotate 'line', 554
root_new $P13, ['parrot';'Hash']
$P13['&'] = $P2
$P1['&'] = $P13
.annotate 'line', 555
root_new $P14, ['parrot';'Hash']
.annotate 'line', 556
root_new $P15, ['parrot';'Hash']
$P15[''] = $P2
get_hll_global $P16, 'getheredoc'
$P15[':'] = $P16
$P14['<'] = $P15
$P14['='] = $P2
$P1['<'] = $P14
.annotate 'line', 559
root_new $P17, ['parrot';'Hash']
$P17['>'] = $P2
$P17['='] = $P2
$P1['>'] = $P17
.annotate 'line', 560
root_new $P18, ['parrot';'Hash']
.annotate 'line', 561
root_new $P19, ['parrot';'Hash']
$P19[''] = $P2
$P19['='] = $P2
$P18['='] = $P19
$P1['!'] = $P18
.annotate 'line', 563
root_new $P20, ['parrot';'Hash']
$P20['%'] = $P2
$P20['='] = $P2
$P1['%'] = $P20
.annotate 'line', 564
root_new $P21, ['parrot';'Hash']
$P21['='] = $P2
get_hll_global $P22, 'getlinecomment'
$P21['/'] = $P22
get_hll_global $P23, 'getcomment'
$P21['*'] = $P23
$P1['/'] = $P21
get_hll_global $P24, 'getlinecomment'
$P1['#'] = $P24
.annotate 'line', 567
setattribute self, 'select', $P1
# }
.annotate 'line', 568

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 569
# Body
# {
.annotate 'line', 571
# var pending: $P1
getattribute $P1, self, 'pending'
.annotate 'line', 572
# string c: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 573
eq $S1, '', __label_1
.annotate 'line', 574
assign $P1, ''
goto __label_2
__label_1: # else
# {
.annotate 'line', 576
# var h: $P2
getattribute $P2, self, 'h'
.annotate 'line', 577
$P3 = $P2.'read'(1)
set $S1, $P3
.annotate 'line', 578
ne $S1, "\n", __label_3
# {
.annotate 'line', 579
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 580
inc $I1
.annotate 'line', 581
box $P3, $I1
setattribute self, 'line', $P3
# }
__label_3: # endif
# }
__label_2: # endif
.annotate 'line', 584
.return($S1)
# }
.annotate 'line', 585

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 586
# Body
# {
.annotate 'line', 588
getattribute $P1, self, 'pending'
assign $P1, __ARG_1
# }
.annotate 'line', 589

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 590
# Body
# {
.annotate 'line', 592
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 593
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 594
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 595
.const 'Sub' $P7 = 'getop'
.annotate 'line', 596
.const 'Sub' $P8 = 'getident'
.annotate 'line', 597
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 599
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 600
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 601
.return($P1)
# }
__label_0: # endif
.annotate 'line', 603
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 604
$P10 = $P4($S1)
if_null $P10, __label_2
unless $P10 goto __label_2
.annotate 'line', 605
$P11 = self.'getchar'()
set $S1, $P11
goto __label_3
__label_2: # endwhile
.annotate 'line', 606
# int line: $I1
getattribute $P10, self, 'line'
set $I1, $P10
.annotate 'line', 607
ne $S1, '', __label_4
.annotate 'line', 608
new $P11, [ 'TokenEof' ]
getattribute $P12, self, 'filename'
$P11.'TokenEof'($P12)
set $P10, $P11
.return($P10)
__label_4: # endif
.annotate 'line', 609
$P10 = $P5($S1)
if_null $P10, __label_5
unless $P10 goto __label_5
.annotate 'line', 610
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 611
$P10 = $P6($S1)
if_null $P10, __label_6
unless $P10 goto __label_6
.annotate 'line', 612
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 614
# string op: $S2
set $S2, $S1
.annotate 'line', 615
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 616
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 618
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 619
$P10 = self.'getchar'()
set $S1, $P10
.annotate 'line', 620
set $P2, $P3
.annotate 'line', 621
$P3 = $P2[$S1]
.annotate 'line', 622
unless_null $P3, __label_10
# {
.annotate 'line', 623
self.'ungetchar'($S1)
.annotate 'line', 624
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
.annotate 'line', 627
concat $S2, $S2, $S1
__label_11: # endif
# }
goto __label_8
__label_7: # endwhile
.annotate 'line', 629
if_null $P3, __label_12
unless $P3 goto __label_12
.annotate 'line', 630
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 631
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 632

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 633
# Body
# {
.annotate 'line', 635
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 636
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 637
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 638
.return($P1)
# }
.annotate 'line', 639

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 640
# Body
# {
.annotate 'line', 642
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }
.annotate 'line', 643

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 527
addattribute $P0, 'h'
.annotate 'line', 528
addattribute $P0, 'pending'
.annotate 'line', 529
addattribute $P0, 'select'
.annotate 'line', 530
addattribute $P0, 'stacked'
.annotate 'line', 531
addattribute $P0, 'filename'
.annotate 'line', 532
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

.annotate 'line', 662
# Body
# {
.annotate 'line', 664
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
.annotate 'line', 665
.return('I')
__label_3: # case
.annotate 'line', 666
.return('N')
__label_4: # case
.annotate 'line', 667
.return('S')
__label_5: # case
.annotate 'line', 668
.return('P')
__label_1: # default
.annotate 'line', 669
.return('')
__label_0: # switch end
# }
.annotate 'line', 671

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 673
# Body
# {
.annotate 'line', 675
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
.annotate 'line', 676
.return('int')
__label_3: # case
.annotate 'line', 677
.return('num')
__label_4: # case
.annotate 'line', 678
.return('string')
__label_5: # case
.annotate 'line', 679
.return('pmc')
__label_1: # default
.annotate 'line', 680
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 682

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 697
# Body
# {
.annotate 'line', 699
setattribute self, 'handle', __ARG_1
.annotate 'line', 700
box $P1, ''
setattribute self, 'file', $P1
.annotate 'line', 701
box $P1, 0
setattribute self, 'line', $P1
.annotate 'line', 702
box $P1, 0
setattribute self, 'pendingf', $P1
.annotate 'line', 703
box $P1, 0
setattribute self, 'pendingl', $P1
# }
.annotate 'line', 704

.end # initialize


.sub 'disable_annotations' :method

.annotate 'line', 705
# Body
# {
.annotate 'line', 707
box $P1, 1
setattribute self, 'noan', $P1
# }
.annotate 'line', 708

.end # disable_annotations


.sub 'close' :method

.annotate 'line', 709
# Body
# {
.annotate 'line', 711
null $P1
setattribute self, 'handle', $P1
# }
.annotate 'line', 712

.end # close


.sub 'updateannot' :method

.annotate 'line', 713
# Body
# {
.annotate 'line', 715
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 716
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 717
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 718
getattribute $P1, self, 'handle'
$P1.'print'("'")
.annotate 'line', 719
getattribute $P1, self, 'handle'
$P1.'print'("\n")
.annotate 'line', 720
getattribute $P1, self, 'pendingf'
assign $P1, 0
# }
__label_0: # endif
.annotate 'line', 722
getattribute $P1, self, 'pendingl'
if_null $P1, __label_1
unless $P1 goto __label_1
# {
.annotate 'line', 723
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'line', ")
.annotate 'line', 724
getattribute $P1, self, 'handle'
getattribute $P2, self, 'line'
$P1.'print'($P2)
.annotate 'line', 725
getattribute $P1, self, 'handle'
$P1.'print'("\n")
.annotate 'line', 726
getattribute $P1, self, 'pendingl'
assign $P1, 0
# }
__label_1: # endif
# }
.annotate 'line', 728

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 729
# Body
# {
.annotate 'line', 731
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 732
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 733

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 734
# Body
# {
.annotate 'line', 736
self.'updateannot'()
.annotate 'line', 737
self.'vprint'(__ARG_1)
# }
.annotate 'line', 738

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 739
# Body
# {
.annotate 'line', 741
self.'updateannot'()
.annotate 'line', 742
self.'vprint'(__ARG_1)
.annotate 'line', 743
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 744

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 745
# Body
# {
.annotate 'line', 747
getattribute $P3, self, 'noan'
unless_null $P3, __label_0
# {
.annotate 'line', 749
# var file: $P1
getattribute $P1, self, 'file'
.annotate 'line', 750
# var line: $P2
getattribute $P2, self, 'line'
.annotate 'line', 751
# string tfile: $S1
getattribute $P3, __ARG_1, 'file'
null $S1
if_null $P3, __label_1
set $S1, $P3
__label_1:
.annotate 'line', 752
# int tline: $I1
getattribute $P3, __ARG_1, 'line'
set $I1, $P3
.annotate 'line', 753
set $S2, $P1
eq $S2, $S1, __label_2
# {
.annotate 'line', 754
assign $P1, $S1
.annotate 'line', 755
getattribute $P3, self, 'pendingf'
assign $P3, 1
.annotate 'line', 756
assign $P2, 0
# }
__label_2: # endif
.annotate 'line', 758
set $I2, $P2
eq $I2, $I1, __label_3
# {
.annotate 'line', 759
assign $P2, $I1
.annotate 'line', 760
getattribute $P3, self, 'pendingl'
assign $P3, 1
# }
__label_3: # endif
# }
__label_0: # endif
# }
.annotate 'line', 763

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 764
# Body
# {
.annotate 'line', 766
self.'updateannot'()
.annotate 'line', 767
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 768

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 769
# Body
# {
.annotate 'line', 771
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 772
$P1.'print'(__ARG_1)
.annotate 'line', 773
$P1.'print'(':')
.annotate 'line', 774
if_null __ARG_2, __label_0
# {
.annotate 'line', 775
$P1.'print'(' # ')
.annotate 'line', 776
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 778
$P1.'print'("\n")
# }
.annotate 'line', 779

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 780
# Body
# {
.annotate 'line', 782
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 783
$P1.'print'('goto ')
.annotate 'line', 784
$P1.'print'(__ARG_1)
.annotate 'line', 785
if_null __ARG_2, __label_0
# {
.annotate 'line', 786
$P1.'print'(' # ')
.annotate 'line', 787
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 789
$P1.'print'("\n")
# }
.annotate 'line', 790

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 792
# Body
# {
.annotate 'line', 794
self.'say'('if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 795

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 796
# Body
# {
.annotate 'line', 798
self.'say'('unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 799

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 801
# Body
# {
.annotate 'line', 803
self.'say'('if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 804

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 805
# Body
# {
.annotate 'line', 807
self.'say'("null ", __ARG_1)
# }
.annotate 'line', 808

.end # emitnull


.sub 'emitinc' :method
.param string __ARG_1

.annotate 'line', 809
# Body
# {
.annotate 'line', 811
self.'say'('inc ', __ARG_1)
# }
.annotate 'line', 812

.end # emitinc


.sub 'emitdec' :method
.param string __ARG_1

.annotate 'line', 814
# Body
# {
.annotate 'line', 816
self.'say'('dec ', __ARG_1)
# }
.annotate 'line', 817

.end # emitdec


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 818
# Body
# {
.annotate 'line', 820
self.'say'("set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 821

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 822
# Body
# {
.annotate 'line', 824
self.'say'("assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 825

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 826
# Body
# {
.annotate 'line', 828
self.'say'("box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 829

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 830
# Body
# {
.annotate 'line', 832
self.'say'("unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 833

.end # emitunbox


.sub 'emitbinop' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 834
# Body
# {
.annotate 'line', 836
self.'say'(__ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 837

.end # emitbinop


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 838
# Body
# {
.annotate 'line', 840
self.'say'("add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 841

.end # emitaddto


.sub 'emitsubto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 842
# Body
# {
.annotate 'line', 844
self.'say'("sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 845

.end # emitsubto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 846
# Body
# {
.annotate 'line', 848
self.'say'("add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 849

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 850
# Body
# {
.annotate 'line', 852
self.'say'("mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 853

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 854
# Body
# {
.annotate 'line', 856
self.'say'("concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 857

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 858
# Body
# {
.annotate 'line', 860
self.'say'("concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 861

.end # emitconcat


.sub 'emitprint' :method
.param string __ARG_1

.annotate 'line', 862
# Body
# {
.annotate 'line', 864
self.'say'('print ', __ARG_1)
# }
.annotate 'line', 865

.end # emitprint


.sub 'emitsay' :method
.param string __ARG_1

.annotate 'line', 866
# Body
# {
.annotate 'line', 868
self.'say'('say ', __ARG_1)
# }
.annotate 'line', 869

.end # emitsay

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 690
addattribute $P0, 'handle'
.annotate 'line', 691
addattribute $P0, 'file'
.annotate 'line', 692
addattribute $P0, 'line'
.annotate 'line', 693
addattribute $P0, 'pendingf'
.annotate 'line', 694
addattribute $P0, 'pendingl'
.annotate 'line', 695
addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 876
# Body
# {
.annotate 'line', 878
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 879

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 881
# Body
# {
.annotate 'line', 883
# var t: $P1
new $P1, [ 'TokenFloat' ]
getattribute $P2, __ARG_2, 'file'
getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 884
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 885

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 887
# Body
# {
.annotate 'line', 893
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 894
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 895
.return($I1)
# }
.annotate 'line', 896

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

.annotate 'line', 914
# Body
# {
.annotate 'line', 916
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 917
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 918
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 919
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 920
'InternalError'('non void predef without {res}')
__label_2: # endif
.annotate 'line', 921
box $P1, __ARG_2
setattribute self, 'body', $P1
.annotate 'line', 922
box $P1, __ARG_1
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 923

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 924
# Body
# {
.annotate 'line', 926
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 927
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 929
# int pos: $I1
null $I1
.annotate 'line', 930
ne $S2, 'v', __label_2
# {
.annotate 'line', 931
isnull $I4, __ARG_3
not $I4
unless $I4 goto __label_5
isne $I4, __ARG_3, ''
__label_5:
unless $I4 goto __label_4
.annotate 'line', 932
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 935
isnull $I4, __ARG_3
if $I4 goto __label_7
iseq $I4, __ARG_3, ''
__label_7:
unless $I4 goto __label_6
.annotate 'line', 936
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 937
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 938
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
.annotate 'line', 941
# int n: $I2
set $P1, __ARG_4
set $I2, $P1
# for loop
.annotate 'line', 942
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 943
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 944
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 945
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 946
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
.annotate 'line', 942
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 948
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 949
__ARG_1.'say'($S1)
# }
.annotate 'line', 950

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 912
addattribute $P0, 'body'
.annotate 'line', 913
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 965
# Body
# {
.annotate 'line', 967
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 968
.return($S1)
# }
.annotate 'line', 969

.end # name


.sub 'result' :method

.annotate 'line', 970
# Body
# {
.annotate 'line', 972
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 973

.end # result


.sub 'params' :method

.annotate 'line', 974
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 975
# Body
# {
.annotate 'line', 977
# string type: $S1
null $S1
.annotate 'line', 978
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
.annotate 'line', 979
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 980
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 981
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_5: # case
.annotate 'line', 982
getattribute $P4, self, 'type3'
set $S1, $P4
goto __label_0 # break
__label_1: # default
.annotate 'line', 984
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 986
.return($S1)
# }
.annotate 'line', 987

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 988
# Body
# {
.annotate 'line', 995
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 996
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 997
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 999
setattribute self, 'body', __ARG_2
__label_1: # endif
.annotate 'line', 1000
box $P1, __ARG_3
setattribute self, 'typeresult', $P1
.annotate 'line', 1001
# int n: $I1
null $I1
.annotate 'line', 1002
if_null __ARG_4, __label_2
# {
.annotate 'line', 1003
box $P1, __ARG_4
setattribute self, 'type0', $P1
.annotate 'line', 1004
set $S1, __ARG_4
set $S2, '*'
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
.annotate 'line', 1006
set $I1, -1
goto __label_3 # break
__label_6: # case
.annotate 'line', 1009
set $I1, -2
.annotate 'line', 1010
if_null __ARG_5, __label_7
.annotate 'line', 1011
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
.annotate 'line', 1014
set $I1, 1
.annotate 'line', 1015
if_null __ARG_5, __label_8
# {
.annotate 'line', 1016
box $P1, __ARG_5
setattribute self, 'type1', $P1
.annotate 'line', 1017
inc $I1
# }
__label_8: # endif
.annotate 'line', 1019
if_null __ARG_6, __label_9
# {
.annotate 'line', 1020
box $P1, __ARG_6
setattribute self, 'type2', $P1
.annotate 'line', 1021
inc $I1
# }
__label_9: # endif
.annotate 'line', 1023
if_null __ARG_7, __label_10
# {
.annotate 'line', 1024
box $P1, __ARG_7
setattribute self, 'type3', $P1
.annotate 'line', 1025
inc $I1
# }
__label_10: # endif
__label_3: # switch end
# }
__label_2: # endif
.annotate 'line', 1029
box $P1, $I1
setattribute self, 'nparams', $P1
.annotate 'line', 1030
.return(self)
# }
.annotate 'line', 1031

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

.annotate 'line', 1032
# Body
# {
.annotate 'line', 1041
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1042
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1043
.return(self)
# }
.annotate 'line', 1044

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1045
# Body
# {
.annotate 'line', 1047
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1048
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1049
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1050
$P2 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P2
__label_1: # endif
.annotate 'line', 1051
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1052
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1053

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 955
addattribute $P0, 'name'
.annotate 'line', 956
addattribute $P0, 'body'
.annotate 'line', 957
addattribute $P0, 'evalfun'
.annotate 'line', 958
addattribute $P0, 'typeresult'
.annotate 'line', 959
addattribute $P0, 'type0'
.annotate 'line', 960
addattribute $P0, 'type1'
.annotate 'line', 961
addattribute $P0, 'type2'
.annotate 'line', 962
addattribute $P0, 'type3'
.annotate 'line', 963
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1059
# Body
# {
.annotate 'line', 1061
box $P1, __ARG_1
setattribute self, 'type', $P1
# }
.annotate 'line', 1062

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1063
# Body
# {
.annotate 'line', 1065
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1066
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1067
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1068
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1069
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1070
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1071
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1073
# string arg: $S3
$P2 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 1074
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1076
ne $S3, 'null', __label_7
.annotate 'line', 1077
__ARG_1.'emitnull'(__ARG_3)
goto __label_8
__label_7: # else
.annotate 'line', 1079
__ARG_1.'emitset'(__ARG_3, $S3)
__label_8: # endif
# }
__label_4: # endif
# }
.annotate 'line', 1081

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1058
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1086
# Body
# {
.annotate 'line', 1088
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1089
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1090
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1091
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1092
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_2: # for iteration
.annotate 'line', 1091
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1093
$P1 = __ARG_4[$I1]
__ARG_1.'emitsay'($P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1096
__ARG_1.'emitsay'("''")
__label_1: # endif
# }
.annotate 'line', 1097

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

.annotate 'line', 1102
# Body
# {
.annotate 'line', 1104
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1105
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1106
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1107
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1108
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1107
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1109
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1110

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

.annotate 'line', 1115
# Body
# {
.annotate 'line', 1117
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1118
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1119
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1120
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
.annotate 'line', 1119
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1121

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length' :subid('WSubId_1')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1124
# Body
# {
.annotate 'line', 1126
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1127
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1128
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1129

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1131
# Body
# {
.annotate 'line', 1133
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1134
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1135
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1136

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1138
# Body
# {
.annotate 'line', 1140
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1141
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1142
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1143

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
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
.annotate 'line', 1148
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1149
# var argn: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1150
# int n: $I1
getattribute $P3, $P2, 'numval'
set $I1, $P3
.annotate 'line', 1151
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1152

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1154
# Body
# {
.annotate 'line', 1156
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1158
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1159
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1161
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1162
new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 1163

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1165
# Body
# {
.annotate 'line', 1167
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1168
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1169
# string str: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1170
# int pos: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1172
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1173
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1174

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1176
# Body
# {
.annotate 'line', 1178
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1179
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1180
# var arglen: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1181
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1182
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1183
# int len: $I2
getattribute $P5, $P3, 'numval'
set $I2, $P5
.annotate 'line', 1185
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1186
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
set $P5, $P6
.return($P5)
# }
.annotate 'line', 1187

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1189
# Body
# {
.annotate 'line', 1191
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1192
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1193
# string strfrom: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1194
# string strsearch: $S2
$P3 = $P2.'get_value'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 1195
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1196

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1198
# Body
# {
.annotate 'line', 1200
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1201
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1202
# var argpos: $P3
$P4 = __ARG_3[2]
getattribute $P3, $P4, 'arg'
.annotate 'line', 1203
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1204
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1205
# int pos: $I1
getattribute $P4, $P3, 'numval'
set $I1, $P4
.annotate 'line', 1206
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1207

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1209
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
.annotate 'line', 1221
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1222
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1223
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1222
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1221
$P1.'push'($P12)
.annotate 'line', 1226
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1227
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1226
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1221
$P1.'push'($P16)
.annotate 'line', 1230
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1231
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1230
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1221
$P1.'push'($P20)
.annotate 'line', 1234
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1221
$P1.'push'($P24)
.annotate 'line', 1238
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1221
$P1.'push'($P26)
.annotate 'line', 1242
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1221
$P1.'push'($P28)
.annotate 'line', 1246
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1221
$P1.'push'($P30)
.annotate 'line', 1250
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1221
$P1.'push'($P32)
.annotate 'line', 1254
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('getstdin', 'getstdin {res}', 'P')
.annotate 'line', 1221
$P1.'push'($P34)
.annotate 'line', 1258
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('getstdout', 'getstdout {res}', 'P')
.annotate 'line', 1221
$P1.'push'($P36)
.annotate 'line', 1262
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('getstderr', 'getstderr {res}', 'P')
.annotate 'line', 1221
$P1.'push'($P38)
.annotate 'line', 1266
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P40)
.annotate 'line', 1271
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P42)
.annotate 'line', 1276
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P44)
.annotate 'line', 1281
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1221
$P1.'push'($P46)
.annotate 'line', 1287
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1221
$P1.'push'($P48)
.annotate 'line', 1294
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1221
$P1.'push'($P50)
.annotate 'line', 1298
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1298
$P52 = $P53.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1221
$P1.'push'($P52)
.annotate 'line', 1303
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1303
$P54 = $P55.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1221
$P1.'push'($P54)
.annotate 'line', 1308
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1308
$P56 = $P57.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1221
$P1.'push'($P56)
.annotate 'line', 1315
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1315
$P58 = $P59.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1221
$P1.'push'($P58)
.annotate 'line', 1320
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1320
$P60 = $P61.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1221
$P1.'push'($P60)
.annotate 'line', 1325
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1325
$P62 = $P63.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1221
$P1.'push'($P62)
.annotate 'line', 1330
new $P65, [ 'PredefFunction' ]
.annotate 'line', 1330
$P64 = $P65.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1221
$P1.'push'($P64)
.annotate 'line', 1335
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
.annotate 'line', 1221
$P1.'push'($P66)
.annotate 'line', 1339
new $P69, [ 'PredefFunction' ]
.annotate 'line', 1339
$P68 = $P69.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P68)
.annotate 'line', 1344
new $P71, [ 'PredefFunction' ]
.annotate 'line', 1344
$P70 = $P71.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1221
$P1.'push'($P70)
.annotate 'line', 1349
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1221
$P1.'push'($P72)
.annotate 'line', 1353
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P74)
.annotate 'line', 1357
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P76)
.annotate 'line', 1361
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P78)
.annotate 'line', 1365
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P80)
.annotate 'line', 1369
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P82)
.annotate 'line', 1374
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P84)
.annotate 'line', 1379
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P86)
.annotate 'line', 1383
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P88)
.annotate 'line', 1387
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P90)
.annotate 'line', 1391
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P92)
.annotate 'line', 1395
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P94)
.annotate 'line', 1399
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P96)
.annotate 'line', 1403
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P98)
.annotate 'line', 1407
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P100)
.annotate 'line', 1411
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P102)
.annotate 'line', 1415
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P104)
.annotate 'line', 1419
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1221
$P1.'push'($P106)
.annotate 'line', 1423
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1221
$P1.'push'($P108)
.annotate 'line', 1427
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P110)
.annotate 'line', 1431
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
.annotate 'line', 1221
$P1.'push'($P112)
.annotate 'line', 1435
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P114)
.annotate 'line', 1439
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P116)
.annotate 'line', 1443
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1221
$P1.'push'($P118)
.annotate 'line', 1447
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1221
$P1.'push'($P120)
.annotate 'line', 1451
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P122)
.annotate 'line', 1455
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1221
$P1.'push'($P124)
.annotate 'line', 1459
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P126)
.annotate 'line', 1464
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P128)
.annotate 'line', 1469
new $P131, [ 'PredefFunction' ]
$P130 = $P131.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1221
$P1.'push'($P130)
.annotate 'line', 1473
new $P133, [ 'PredefFunction' ]
$P132 = $P133.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1221
$P1.'push'($P132)
.annotate 'line', 1477
new $P135, [ 'PredefFunction' ]
$P134 = $P135.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1221
$P1.'push'($P134)
.annotate 'line', 1481
new $P137, [ 'PredefFunction' ]
$P136 = $P137.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1221
$P1.'push'($P136)
.annotate 'line', 1485
new $P139, [ 'PredefFunction' ]
$P138 = $P139.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1221
$P1.'push'($P138)
.annotate 'line', 1489
new $P141, [ 'PredefFunction' ]
.annotate 'line', 1490
new $P142, [ 'Predef_print' ]
.annotate 'line', 1489
$P140 = $P141.'set'('print', $P142, 'v', '*')
.annotate 'line', 1221
$P1.'push'($P140)
.annotate 'line', 1493
new $P144, [ 'PredefFunction' ]
.annotate 'line', 1494
new $P145, [ 'Predef_say' ]
.annotate 'line', 1493
$P143 = $P144.'set'('say', $P145, 'v', '*')
.annotate 'line', 1221
$P1.'push'($P143)
.annotate 'line', 1497
new $P147, [ 'PredefFunction' ]
.annotate 'line', 1498
new $P148, [ 'Predef_cry' ]
.annotate 'line', 1497
$P146 = $P147.'set'('cry', $P148, 'v', '*')
.annotate 'line', 1221
$P1.'push'($P146)
__label_1: # Infinite loop
.annotate 'line', 1503
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1504

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1506
# Body
# {
.annotate 'line', 1508
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1509
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1510
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1511
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1512
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1513
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1514
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1516
.return($P2)
# }
.annotate 'line', 1517

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1526
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1527
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1526
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1528

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1530
# Body
# {
.annotate 'line', 1532
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1533
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1534
$P3 = $P2.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 1535
$P1.'push'($P2)
__label_2: # while
.annotate 'line', 1536
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 1537
$P2 = __ARG_1.'get'()
.annotate 'line', 1538
$P1.'push'($P2)
# }
goto __label_2
__label_1: # endwhile
# }
__label_0: # endif
.annotate 'line', 1541
__ARG_1.'unget'($P2)
.annotate 'line', 1542
.return($P1)
# }
.annotate 'line', 1543

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1545
# Body
# {
.annotate 'line', 1547
# string list: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1548
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 1549
$P4 = $P2.'getidentifier'()
$P1.'push'($P4)
goto __label_0
__label_1: # endfor
.annotate 'line', 1550
.return($P1)
# }
.annotate 'line', 1551

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1562
# Body
# {
.annotate 'line', 1564
setattribute self, 'start', __ARG_1
.annotate 'line', 1565
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1566

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1567
# Body
# {
.annotate 'line', 1569
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1570

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1571
# Body
# {
.annotate 'line', 1573
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1574

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1575
# Body
# {
.annotate 'line', 1577
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1578

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1579
# Body
# {
.annotate 'line', 1581
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1582

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1583
# Body
# {
.annotate 'line', 1585
getattribute $P1, self, 'owner'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1586

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1587
# Body
# {
.annotate 'line', 1589
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1590

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1591
# Body
# {
.annotate 'line', 1593
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1594

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1559
addattribute $P0, 'start'
.annotate 'line', 1560
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1607
# Body
# {
.annotate 'line', 1609
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1610

.end # init


.sub 'numargs' :method

.annotate 'line', 1612
# Body
# {
.annotate 'line', 1614
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1615

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1616
# Body
# {
.annotate 'line', 1618
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1619
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1620

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1622
# Body
# {
.annotate 'line', 1624
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1625
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1626
# {
.annotate 'line', 1627
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1628
$P1.'push'($P3)
# }
__label_2: # continue
.annotate 'line', 1629
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1630
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1631

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1633
# Body
# {
.annotate 'line', 1635
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1636
if_null $P1, __label_0
.annotate 'line', 1637
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1638

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1639
# Body
# {
.annotate 'line', 1641
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1642
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1643
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1644
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1645
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1646
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1647
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1644
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1649
.return($P2)
# }
.annotate 'line', 1650

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1651
# Body
# {
.annotate 'line', 1653
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1654
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1655

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1605
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1667
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1668
# Body
# {
.annotate 'line', 1670
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1671
.return($I1)
# }
.annotate 'line', 1672

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1673
# Body
# {
.annotate 'line', 1675
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1676
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1677
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1679
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1680

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1681
# Body
# {
.annotate 'line', 1683
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 1684
if_null __ARG_2, __label_0
.annotate 'line', 1685
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1686

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1687
# Body
# {
.annotate 'line', 1689
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1690

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1664
addattribute $P0, 'name'
.annotate 'line', 1665
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1697
# Body
# {
.annotate 'line', 1699
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1700
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1701
# {
.annotate 'line', 1702
$P2 = __ARG_1.'get'()
.annotate 'line', 1703
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1704
$P2 = __ARG_1.'get'()
.annotate 'line', 1705
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1706
$P4 = $P2.'isop'('(')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 1707
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1708
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1710
new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
set $P4, $P5
$P1.'push'($P4)
# }
__label_2: # continue
.annotate 'line', 1711
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1712
'RequireOp'(']', $P2)
.annotate 'line', 1713
setattribute self, 'list', $P1
# }
.annotate 'line', 1714

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1715
# Body
# {
.annotate 'line', 1717
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1718
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1719

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1720
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1721
# Body
# {
.annotate 'line', 1723
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1724
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1725
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1726
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1727
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1728
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1725
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1731
.return($P3)
# }
.annotate 'line', 1732

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1695
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1739
# Body
# {
.annotate 'line', 1741
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1742
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
.annotate 'line', 1743

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1745
# Body
# {
.annotate 'line', 1747
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1748
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1750
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1751
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1753

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1755
# Body
# {
.annotate 'line', 1757
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1758
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1759
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1760
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1761
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1763
__ARG_2.'unget'($P1)
.annotate 'line', 1764
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1766

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1768
# Body
# {
.annotate 'line', 1770
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1771
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1772
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1773
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1774
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1775
$P4 = $P1.'isop'('${')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 1776
new $P6, [ 'PiropStatement' ]
$P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 1778
# string key: $S1
$P4 = $P1.'checkkeyword'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1779
# var st: $P2
null $P2
.annotate 'line', 1780
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
.annotate 'line', 1782
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1784
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1787
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1790
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1792
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1794
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1796
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1798
new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_14: # case
.annotate 'line', 1800
new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P6, $P7
.return($P6)
__label_15: # case
.annotate 'line', 1802
new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_16: # case
.annotate 'line', 1804
new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_17: # case
.annotate 'line', 1806
new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_18: # case
.annotate 'line', 1808
new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_19: # case
.annotate 'line', 1810
new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_20: # case
.annotate 'line', 1812
new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_21: # case
.annotate 'line', 1814
new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_22: # case
.annotate 'line', 1816
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1818
new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_24: # case
.annotate 'line', 1820
new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_5: # default
.annotate 'line', 1822
$P26 = $P1.'isidentifier'()
if_null $P26, __label_25
unless $P26 goto __label_25
# {
.annotate 'line', 1823
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1824
$P4 = $P3.'isop'(':')
if_null $P4, __label_26
unless $P4 goto __label_26
.annotate 'line', 1825
new $P6, [ 'LabelStatement' ]
$P6.'LabelStatement'($P1, __ARG_2)
set $P5, $P6
.return($P5)
__label_26: # endif
.annotate 'line', 1826
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1828
__ARG_1.'unget'($P1)
.annotate 'line', 1829
new $P5, [ 'ExprStatement' ]
$P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_4: # switch end
.annotate 'line', 1831
unless_null $P2, __label_27
.annotate 'line', 1832
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1833
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1834

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1842
# Body
# {
.annotate 'line', 1844
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1845

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1846
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1847
# Body
# {
.annotate 'line', 1849
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1850

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1851
# Body
# {
.annotate 'line', 1853
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1854

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1855
# Body
# {
.annotate 'line', 1857
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1858

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1859
# Body
# {
.annotate 'line', 1861
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1862

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1863
# Body
# {
.annotate 'line', 1865
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1866

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1867
# Body
# {
.annotate 'line', 1869
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1870

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1871
# Body
# {
.annotate 'line', 1873
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1874

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1875
# Body
# {
.annotate 'line', 1877
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1878

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1879
# Body
# {
.annotate 'line', 1881
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1882

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1883
# Body
# {
.annotate 'line', 1885
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1886

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1888
# Body
# {
.annotate 'line', 1893
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1894

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1895
# Body
# {
.annotate 'line', 1897
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1898

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1899
# Body
# {
.annotate 'line', 1901
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1902

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1903
# Body
# {
.annotate 'line', 1905
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1907
.return(self)
# }
.annotate 'line', 1908

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1840
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1913
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1914
# Body
# {
.annotate 'line', 1916
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1917

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1918
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1919
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1911
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1929
# Body
# {
.annotate 'line', 1931
# var statements: $P1
getattribute $P1, self, 'statements'
.annotate 'line', 1932
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 1933
# int empty: $I2
set $I2, 1
# for loop
.annotate 'line', 1934
# int i: $I3
null $I3
__label_2: # for condition
ge $I3, $I1, __label_1
# {
.annotate 'line', 1935
# var st: $P2
$P3 = $P1[$I3]
$P2 = $P3.'optimize'()
.annotate 'line', 1936
set $I4, $I2
unless $I4 goto __label_4
$P3 = $P2.'isempty'()
isfalse $I4, $P3
__label_4:
unless $I4 goto __label_3
.annotate 'line', 1937
null $I2
__label_3: # endif
.annotate 'line', 1938
$P1[$I3] = $P2
# }
__label_0: # for iteration
.annotate 'line', 1934
inc $I3
goto __label_2
__label_1: # for end
.annotate 'line', 1940
unless $I2 goto __label_5
.annotate 'line', 1941
new $P3, [ 'EmptyStatement' ]
.return($P3)
goto __label_6
__label_5: # else
.annotate 'line', 1943
.return(self)
__label_6: # endif
# }
.annotate 'line', 1944

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1927
addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1949
# Body
# {
.annotate 'line', 1951
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1952
$P1.'push'(__ARG_1)
.annotate 'line', 1953
$P1.'push'(__ARG_2)
.annotate 'line', 1954
setattribute self, 'statements', $P1
# }
.annotate 'line', 1955

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1956
# Body
# {
.return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1957
# Body
# {
.annotate 'line', 1959
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1960
.return(self)
# }
.annotate 'line', 1961

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1962
# Body
# {
.annotate 'line', 1964
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1965
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1966

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1947
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1969
# Body
# {
.annotate 'line', 1971
unless_null __ARG_1, __label_0
.annotate 'line', 1972
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1973
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1974
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1976
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1977

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1988
# Body
# {
.annotate 'line', 1990
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1991
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1992
# int dotted: $I1
null $I1
.annotate 'line', 1993
$P4 = $P1.'isop'('.')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 1994
set $I1, 1
.annotate 'line', 1995
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1997
# string opname: $S1
$P4 = $P1.'getidentifier'()
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 1998
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S4, $S3, $S1
box $P4, $S4
setattribute self, 'opname', $P4
.annotate 'line', 1999
$P1 = __ARG_2.'get'()
.annotate 'line', 2000
$P4 = $P1.'isop'('}')
isfalse $I2, $P4
unless $I2 goto __label_4
# {
.annotate 'line', 2001
__ARG_2.'unget'($P1)
.annotate 'line', 2002
# var args: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_5: # do
.annotate 'line', 2003
# {
.annotate 'line', 2004
# var arg: $P3
null $P3
.annotate 'line', 2005
$P1 = __ARG_2.'get'()
.annotate 'line', 2006
$P4 = $P1.'isop'(':')
if_null $P4, __label_8
unless $P4 goto __label_8
# {
.annotate 'line', 2007
$P1 = __ARG_2.'get'()
.annotate 'line', 2008
# string label: $S2
$P4 = $P1.'getidentifier'()
null $S2
if_null $P4, __label_10
set $S2, $P4
__label_10:
.annotate 'line', 2009
new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
set $P3, $P4
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 2012
__ARG_2.'unget'($P1)
.annotate 'line', 2013
$P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
__label_9: # endif
.annotate 'line', 2015
$P2.'push'($P3)
# }
__label_7: # continue
.annotate 'line', 2016
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_6
if $P4 goto __label_5
__label_6: # enddo
.annotate 'line', 2017
'RequireOp'('}', $P1)
.annotate 'line', 2018
setattribute self, 'args', $P2
# }
__label_4: # endif
.annotate 'line', 2020
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2021

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 2022
# Body
# {
.annotate 'line', 2024
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2025
if_null $P1, __label_0
.annotate 'line', 2026
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 2027
.return(self)
# }
.annotate 'line', 2028

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2029
# Body
# {
.annotate 'line', 2031
# string opname: $S1
getattribute $P4, self, 'opname'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2032
self.'annotate'(__ARG_1)
.annotate 'line', 2033
concat $S3, 'pirop ', $S1
__ARG_1.'comment'($S3)
.annotate 'line', 2034
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2035
unless_null $P1, __label_1
.annotate 'line', 2036
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 2038
__ARG_1.'print'($S1, ' ')
.annotate 'line', 2039
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2040
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 2041
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 2042
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 2043
# string reg: $S2
$P4 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_6
set $S2, $P4
__label_6:
.annotate 'line', 2044
$P2.'push'($S2)
# }
__label_3: # for iteration
.annotate 'line', 2041
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 2046
# predefined join
join $S3, ', ', $P2
__ARG_1.'say'($S3)
# }
__label_2: # endif
# }
.annotate 'line', 2048

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1983
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1985
addattribute $P0, 'opname'
.annotate 'line', 1986
addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2058
# Body
# {
.annotate 'line', 2060
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2061
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2062
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2063
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2064
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2065
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
.annotate 'line', 2066
.return(self)
# }
.annotate 'line', 2067

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2068
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2069
# Body
# {
.annotate 'line', 2071
self.'annotate'(__ARG_1)
.annotate 'line', 2072
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2073

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2055
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2057
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2083
# Body
# {
.annotate 'line', 2085
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2086
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2087
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2088
box $P1, $S1
setattribute self, 'symbol', $P1
# }
.annotate 'line', 2089

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2090
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2091
# Body
# {
.annotate 'line', 2093
self.'annotate'(__ARG_1)
.annotate 'line', 2094
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2095
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2096

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2080
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2082
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2108
# Body
# {
.annotate 'line', 2110
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2111
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2112
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2113
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2114
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2115
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
# }
.annotate 'line', 2116

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2117
# Body
# {
.annotate 'line', 2119
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2120
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2121
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2123
# var symbol: $P3
$P3 = self.'findsymbol'($P1)
.annotate 'line', 2124
if_null $P3, __label_0
# {
.annotate 'line', 2125
isa $I1, $P3, 'FunctionStatement'
unless $I1 goto __label_1
# {
.annotate 'line', 2126
# string subid: $S2
$P4 = $P3.'makesubid'()
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2127
box $P4, $S2
setattribute self, 'subid', $P4
# }
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2130
.return(self)
# }
.annotate 'line', 2131

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2132
# Body
# {
.annotate 'line', 2134
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2135
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2136
# var vdata: $P2
$P2 = self.'getvar'($S1)
.annotate 'line', 2137
getattribute $P3, self, 'subid'
if_null $P3, __label_0
# {
.annotate 'line', 2138
# string subid: $S2
getattribute $P4, self, 'subid'
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2139
$P3 = $P2.'getreg'()
__ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 2142
self.'annotate'(__ARG_1)
.annotate 'line', 2143
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2144
$P1.'pop'()
.annotate 'line', 2145
# predefined elements
elements $I1, $P1
null $I2
if $I1 == $I2 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 2147
__ARG_1.'say'("'", $S1, "'")
goto __label_3 # break
__label_4: # default
.annotate 'line', 2150
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_3: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2153

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2103
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2105
addattribute $P0, 'path'
.annotate 'line', 2106
addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2163
# Body
# {
.annotate 'line', 2165
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2166
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2167
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2168

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2169
# Body
# {
.annotate 'line', 2171
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2172
.return(self)
# }
.annotate 'line', 2173

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2174
# Body
# {
.annotate 'line', 2176
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2177

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2160
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2162
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2194
# Body
# {
.annotate 'line', 2196
setattribute self, 'type', __ARG_1
.annotate 'line', 2197
setattribute self, 'reg', __ARG_2
.annotate 'line', 2198
setattribute self, 'scope', __ARG_3
.annotate 'line', 2199
box $P1, __ARG_4
setattribute self, 'flags', $P1
.annotate 'line', 2200
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2201

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2202
# Body
# {
.annotate 'line', 2204
box $P1, __ARG_1
setattribute self, 'id', $P1
# }
.annotate 'line', 2205

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2206
# Body
# {
.annotate 'line', 2208
box $P1, __ARG_1
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2209

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2210
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2211
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2212
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2213
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2214
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2215
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2216
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2217
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
.annotate 'line', 2186
addattribute $P0, 'type'
.annotate 'line', 2187
addattribute $P0, 'reg'
.annotate 'line', 2188
addattribute $P0, 'scope'
.annotate 'line', 2189
addattribute $P0, 'flags'
.annotate 'line', 2190
addattribute $P0, 'value'
.annotate 'line', 2191
addattribute $P0, 'id'
.annotate 'line', 2192
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2223
# Body
# {
.annotate 'line', 2225
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2226

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2227
# Body
# {
.annotate 'line', 2229
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2230

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2222
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2237
# Body
# {
.annotate 'line', 2239
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2240

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2241
# Body
# {
.annotate 'line', 2243
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2244
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2245
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2246
if_null $P2, __label_1
.annotate 'line', 2247
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2248
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2249
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2250
$P1[$S1] = $P3
.annotate 'line', 2251
.return($P3)
# }
.annotate 'line', 2252

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2253
# Body
# {
.annotate 'line', 2255
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2256
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2257
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2258
if_null $P2, __label_1
.annotate 'line', 2259
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2260
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2261

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2262
# Body
# {
.annotate 'line', 2264
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2265
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2266
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2267
if_null $P2, __label_1
.annotate 'line', 2268
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2269
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2270
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2271
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2272
$P1[$S1] = $P3
# }
.annotate 'line', 2273

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2274
# Body
# {
.annotate 'line', 2276
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2277
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2278
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2279
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2280
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2281
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2282
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2283
.return($P2)
# }
.annotate 'line', 2284

.end # getvar


.sub 'getlocalvar' :method
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
.return($P2)
# }
.annotate 'line', 2291

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2292
# Body
# {
.annotate 'line', 2294
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2295
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2296
.return($S1)
# }
.annotate 'line', 2297

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2298
# Body
# {
.annotate 'line', 2300
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2302
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2303
.return('__WLEX_self')
# }
.annotate 'line', 2304

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2236
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2313
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2323
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2324
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2325
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2326
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2327
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2328
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2329
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2330
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2331
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2332
# Body
# {
.annotate 'line', 2334
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2335

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2336
# Body
# {
.annotate 'line', 2338
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2339

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2340
# Body
# {
.annotate 'line', 2343
.return(self)
# }
.annotate 'line', 2344

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2345
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2346
# Body
# {
.annotate 'line', 2348
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2349
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2350
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2351
.return($S2)
# }
.annotate 'line', 2352

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2353
# Body
# {
.annotate 'line', 2355
# string reg: $S1
null $S1
.annotate 'line', 2356
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2357
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2359
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2360
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2362
.return($S1)
# }
.annotate 'line', 2363

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2364
# Body
# {
.annotate 'line', 2366
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2367

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2321
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2372
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2370
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2380
# Body
# {
.annotate 'line', 2382
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2383
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2384
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2385
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2386
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2387

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2388
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2389
# Body
# {
.annotate 'line', 2391
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2392
.return(self)
# }
.annotate 'line', 2393

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2394
# Body
# {
.annotate 'line', 2396
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2397
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2398
self.'annotate'(__ARG_1)
.annotate 'line', 2399
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2400
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2401
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2402

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2377
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2379
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2415
# Body
# {
.annotate 'line', 2417
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2418
.return(self)
# }
.annotate 'line', 2419

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2420
# Body
# {
.annotate 'line', 2422
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2423

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2427
.return(self)
# }
.annotate 'line', 2428

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2429
# Body
# {
.annotate 'line', 2431
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2432
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2433
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2435
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2436
ne $I1, 0, __label_4
.annotate 'line', 2437
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2439
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2442
.return(0)
# }
.annotate 'line', 2443

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2444
# Body
# {
.annotate 'line', 2446
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2448
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2449
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2450
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2452
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2453
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2454
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
.annotate 'line', 2457
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2460
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2463
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2466

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2467
# Body
# {
.annotate 'line', 2469
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2471
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2472
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2473
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2475
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2476
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2477
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
.annotate 'line', 2480
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2483
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2486
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2489

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2414
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2496
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2497
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2494
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2505
# Body
# {
.annotate 'line', 2507
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2508
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2509

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2510
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2511
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2512
# Body
# {
.annotate 'line', 2514
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2515
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2516
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2517
# int need_unicode: $I2
null $I2
.annotate 'line', 2518
box $P2, $S1
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2519
le $I3, 127, __label_3
# {
.annotate 'line', 2520
set $I2, 1
goto __label_2 # break
.annotate 'line', 2521
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2524
unless $I2 goto __label_4
# {
.annotate 'line', 2525
unless $I1 goto __label_5
# {
.annotate 'line', 2526
null $I1
.annotate 'line', 2527
# string saux: $S2
set $S2, $S1
.annotate 'line', 2528
set $S1, ''
.annotate 'line', 2529
box $P2, $S2
iter $P4, $P2
set $P4, 0
__label_6: # for iteration
unless $P4 goto __label_7
shift $S3, $P4
# {
.annotate 'line', 2530
ne $S3, '\', __label_8
.annotate 'line', 2531
set $S3, '\\'
__label_8: # endif
.annotate 'line', 2532
concat $S1, $S1, $S3
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2535
# string result: $S4
set $S4, ''
.annotate 'line', 2536
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2537
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2538
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2539
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2540
le $I6, 127, __label_12
# {
.annotate 'line', 2541
# string h: $S6
box $P5, $I6
$P2 = $P5.'get_as_base'(16)
null $S6
if_null $P2, __label_14
set $S6, $P2
__label_14:
.annotate 'line', 2542
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
# }
goto __label_13
__label_12: # else
.annotate 'line', 2545
concat $S4, $S4, $S5
__label_13: # endif
# }
__label_9: # for iteration
.annotate 'line', 2537
inc $I5
goto __label_11
__label_10: # for end
.annotate 'line', 2547
set $S1, $S4
# }
__label_4: # endif
.annotate 'line', 2549
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
.annotate 'line', 2550
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
.annotate 'line', 2551
unless $I2 goto __label_17
.annotate 'line', 2552
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2553
.return($S1)
# }
.annotate 'line', 2554

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2555
# Body
# {
.annotate 'line', 2557
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2558
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2559
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2560
# var s: $P2
box $P2, $S1
.annotate 'line', 2561
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2563
.return($S1)
# }
.annotate 'line', 2564

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2565
# Body
# {
.annotate 'line', 2567
set $S1, __ARG_2
eq $S1, '', __label_0
.annotate 'line', 2568
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2569

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2570
# Body
# {
.annotate 'line', 2572
.tailcall self.'getPirString'()
# }
.annotate 'line', 2573

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2502
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2504
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2582
# Body
# {
.annotate 'line', 2585
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2586
setattribute self, 'pos', __ARG_2
.annotate 'line', 2587
# int n: $I1
null $I1
.annotate 'line', 2588
unless __ARG_4 goto __label_0
.annotate 'line', 2589
set $I1, __ARG_3
goto __label_1
__label_0: # else
# {
.annotate 'line', 2591
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2592
set $I1, $S1
# }
__label_1: # endif
.annotate 'line', 2594
box $P1, $I1
setattribute self, 'numval', $P1
# }
.annotate 'line', 2595

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2596
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2597
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2598
# Body
# {
.annotate 'line', 2600
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2601
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2602
.return($I1)
# }
.annotate 'line', 2603

.end # getIntegerValue


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
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2608
ne $I1, 0, __label_1
.annotate 'line', 2609
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2611
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2613

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2614
# Body
# {
.annotate 'line', 2616
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2617

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2578
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2580
addattribute $P0, 'pos'
.annotate 'line', 2581
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2625
# Body
# {
.annotate 'line', 2627
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2628
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2629

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2630
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2631
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2632
# Body
# {
.annotate 'line', 2634
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2635
# var n: $P1
new $P1, [ 'Float' ]
.annotate 'line', 2636
assign $P1, $S1
.annotate 'line', 2637
.return($P1)
# }
.annotate 'line', 2638

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2639
# Body
# {
.annotate 'line', 2641
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2642
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2643
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2645

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2646
# Body
# {
.annotate 'line', 2650
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2651
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
.annotate 'line', 2652
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2653
.return($S1)
# }
.annotate 'line', 2654

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2622
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2624
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2662
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2663
# Body
# {
.annotate 'line', 2665
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2666
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2667

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2668
# Body
# {
.annotate 'line', 2670
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2671

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2672
# Body
# {
.annotate 'line', 2674
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2675
if_null $P1, __label_0
.annotate 'line', 2676
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2678
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
.annotate 'line', 2681
.return('P')
__label_3: # default
.annotate 'line', 2683
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2686

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2687
# Body
# {
.annotate 'line', 2689
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2690
.return($S1)
# }
.annotate 'line', 2691

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2692
# Body
# {
.annotate 'line', 2694
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2695
unless_null $P1, __label_0
.annotate 'line', 2696
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2697
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2698
# string s: $S1
null $S1
.annotate 'line', 2699
unless_null $P2, __label_1
# {
.annotate 'line', 2700
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2701
set $S3, $S2
set $S4, 'self'
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 2703
set $S1, 'self'
goto __label_4 # break
__label_7: # case
.annotate 'line', 2705
set $S1, 'null'
goto __label_4 # break
__label_5: # default
.annotate 'line', 2707
set $S1, ''
__label_4: # switch end
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2711
$P3 = $P2.'getid'()
if_null $P3, __label_8
.annotate 'line', 2712
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2714
$P4 = $P2.'getreg'()
set $S1, $P4
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2716
.return($S1)
# }
.annotate 'line', 2717

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2718
# Body
# {
.annotate 'line', 2720
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2721
set $S2, $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2722
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2723
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2725
.return($P1)
# }
.annotate 'line', 2726

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2727
# Body
# {
.annotate 'line', 2729
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2730
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2731
if_null $P2, __label_0
# {
.annotate 'line', 2732
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2733
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2735
.return(self)
# }
.annotate 'line', 2736

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2737
# Body
# {
.annotate 'line', 2739
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2740
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2741
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2742
# string lexname: $S2
$P2 = $P1.'getlex'()
null $S2
if_null $P2, __label_3
set $S2, $P2
__label_3:
.annotate 'line', 2743
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2744
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2746
.return($S1)
# }
.annotate 'line', 2747

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2748
# Body
# {
.annotate 'line', 2750
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2751
self.'annotate'(__ARG_1)
.annotate 'line', 2752
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2753
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2755

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2756
# Body
# {
.annotate 'line', 2758
self.'annotate'(__ARG_1)
.annotate 'line', 2759
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2760
.return($S1)
# }
.annotate 'line', 2761

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2762
# Body
# {
.annotate 'line', 2764
self.'annotate'(__ARG_1)
.annotate 'line', 2765
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2766
die "NO"
__label_0: # endif
.annotate 'line', 2767
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2768
# string lreg: $S2
$P2 = self.'getIdentifier'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 2769
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
# {
.annotate 'line', 2770
set $S6, $S1
set $S7, 'S'
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2773
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2776
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2779
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2780
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2782
# string typeright: $S3
$P2 = __ARG_2.'checkresult'()
null $S3
if_null $P2, __label_11
set $S3, $P2
__label_11:
.annotate 'line', 2783
ne $S3, 'v', __label_12
.annotate 'line', 2784
getattribute $P2, self, 'start'
'SyntaxError'("Can't assign from void expression", $P2)
__label_12: # endif
.annotate 'line', 2785
ne $S1, $S3, __label_13
# {
.annotate 'line', 2786
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2789
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_15
set $S4, $P2
__label_15:
.annotate 'line', 2790
self.'annotate'(__ARG_1)
.annotate 'line', 2791
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2792
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2794
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2797
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2798
$P2 = $P1.'isvolatile'()
if_null $P2, __label_19
unless $P2 goto __label_19
# {
.annotate 'line', 2799
# string lexname: $S5
$P3 = $P1.'getlex'()
null $S5
if_null $P3, __label_20
set $S5, $P3
__label_20:
.annotate 'line', 2800
isnull $I1, $S5
not $I1
unless $I1 goto __label_22
isne $I1, $S5, ''
__label_22:
unless $I1 goto __label_21
.annotate 'line', 2801
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_21: # endif
# }
__label_19: # endif
.annotate 'line', 2803
.return($S2)
# }
.annotate 'line', 2804

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2659
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2661
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2811
# Body
# {
.annotate 'line', 2813
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2814

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2809
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2822
# Body
# {
.annotate 'line', 2824
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2825
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2826

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2827
# Body
# {
.annotate 'line', 2829
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2830

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2831
# Body
# {
.annotate 'line', 2833
self.'optimizearg'()
.annotate 'line', 2834
.return(self)
# }
.annotate 'line', 2835

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2819
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2821
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2844
# Body
# {
.annotate 'line', 2846
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2847
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2848
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2849

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2850
# Body
# {
.annotate 'line', 2852
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2853
.return(self)
# }
.annotate 'line', 2854

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2855
# Body
# {
.annotate 'line', 2857
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2858

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2859
# Body
# {
.annotate 'line', 2861
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2862
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2863

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2864
# Body
# {
.annotate 'line', 2866
self.'optimizearg'()
.annotate 'line', 2867
.return(self)
# }
.annotate 'line', 2868

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2869
# Body
# {
.annotate 'line', 2871
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2872
.return($S1)
# }
.annotate 'line', 2873

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2874
# Body
# {
.annotate 'line', 2876
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2877
.return($S1)
# }
.annotate 'line', 2878

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2840
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2842
addattribute $P0, 'lexpr'
.annotate 'line', 2843
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2885
# Body
# {
.annotate 'line', 2887
.return('I')
# }
.annotate 'line', 2888

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2889
# Body
# {
.annotate 'line', 2891
self.'optimizearg'()
.annotate 'line', 2892
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2893
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2894
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2895
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2896
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2897
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
$P5 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P3, $P4, $P5)
# }
__label_0: # endif
.annotate 'line', 2899
.return(self)
# }
.annotate 'line', 2900

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2883
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2907
# Body
# {
.annotate 'line', 2909
.return('I')
# }
.annotate 'line', 2910

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2911
# Body
# {
.annotate 'line', 2913
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2914
.return(self)
# }
.annotate 'line', 2915

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2916
# Body
# {
.annotate 'line', 2918
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2919
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_2
$P2 = $P1.'checkresult'()
set $S1, $P2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 2920
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 2921
self.'annotate'(__ARG_1)
.annotate 'line', 2922
__ARG_1.'print'('delete ')
.annotate 'line', 2923
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 2924
__ARG_1.'say'()
.annotate 'line', 2925
set $S1, __ARG_2
eq $S1, '', __label_3
.annotate 'line', 2926
__ARG_1.'emitset'(__ARG_2, '1')
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 2929
getattribute $P2, self, 'start'
'SyntaxError'("delete with invalid operator", $P2)
__label_1: # endif
# }
.annotate 'line', 2930

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 2905
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2937
# Body
# {
.annotate 'line', 2939
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2940

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2941
# Body
# {
.annotate 'line', 2943
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2944
.return(self)
# }
.annotate 'line', 2945

.end # set


.sub 'optimize' :method

.annotate 'line', 2946
# Body
# {
.annotate 'line', 2948
self.'optimizearg'()
.annotate 'line', 2949
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2950
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2951
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2952
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2955
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isfloatliteral'()
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 2956
# var numval: $P2
getattribute $P5, self, 'subexpr'
getattribute $P2, $P5, 'numval'
.annotate 'line', 2957
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2958
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P3, $P5, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2961
.return(self)
# }
.annotate 'line', 2962

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2963
# Body
# {
.annotate 'line', 2965
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2966
self.'annotate'(__ARG_1)
.annotate 'line', 2967
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2968

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2935
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2975
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2976
# Body
# {
.annotate 'line', 2978
.return('I')
# }
.annotate 'line', 2979

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2980
# Body
# {
.annotate 'line', 2982
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2983
.return(self)
# }
.annotate 'line', 2984

.end # set


.sub 'optimize' :method

.annotate 'line', 2985
# Body
# {
.annotate 'line', 2987
self.'optimizearg'()
.annotate 'line', 2988
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2989
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2990
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2991
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2992
getattribute $P3, self, 'owner'
getattribute $P4, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P4, $I2)
# }
__label_0: # endif
.annotate 'line', 2994
$P3 = $P1.'isnegable'()
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 2995
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2996
.return(self)
# }
.annotate 'line', 2997

.end # optimize


.sub 'negated' :method

.annotate 'line', 2998
# Body
# {
.annotate 'line', 3000
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 3001

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3002
# Body
# {
.annotate 'line', 3004
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3005
self.'annotate'(__ARG_1)
.annotate 'line', 3006
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3007
set $S3, $S2
set $S4, 'I'
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 3009
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 3012
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 3015
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 3017

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2973
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3024
# Body
# {
.annotate 'line', 3026
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3027

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3031
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3032
.return(self)
# }
.annotate 'line', 3033

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3034
# Body
# {
.annotate 'line', 3036
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3037
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3038
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3039

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3040
# Body
# {
.annotate 'line', 3042
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3043
self.'annotate'(__ARG_1)
.annotate 'line', 3044
__ARG_1.'emitinc'($S1)
.annotate 'line', 3045
.return($S1)
# }
.annotate 'line', 3046

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3022
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

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


.sub 'checkresult' :method

.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3061

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3065
self.'annotate'(__ARG_1)
.annotate 'line', 3066
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3067
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3068
__ARG_1.'emitinc'($S1)
.annotate 'line', 3069
.return($S1)
# }
.annotate 'line', 3070

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3051
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3077
# Body
# {
.annotate 'line', 3079
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3080

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3081
# Body
# {
.annotate 'line', 3083
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3084
.return(self)
# }
.annotate 'line', 3085

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3086
# Body
# {
.annotate 'line', 3088
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3089
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3090
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3091

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3092
# Body
# {
.annotate 'line', 3094
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3095
self.'annotate'(__ARG_1)
.annotate 'line', 3096
__ARG_1.'emitdec'($S1)
.annotate 'line', 3097
.return($S1)
# }
.annotate 'line', 3098

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3075
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3105
# Body
# {
.annotate 'line', 3107
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3108
.return(self)
# }
.annotate 'line', 3109

.end # set


.sub 'checkresult' :method

.annotate 'line', 3110
# Body
# {
.annotate 'line', 3112
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3113

.end # checkresult


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
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3119
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3120
__ARG_1.'emitdec'($S1)
.annotate 'line', 3121
.return($S1)
# }
.annotate 'line', 3122

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3103
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3131
# Body
# {
.annotate 'line', 3133
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3134
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3135
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3136
.return(self)
# }
.annotate 'line', 3137

.end # set


.sub 'checkresult' :method

.annotate 'line', 3138
# Body
# {
.annotate 'line', 3140
getattribute $P1, self, 'lexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3141

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3142
# Body
# {
.annotate 'line', 3144
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 3145
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 3146
.return(self)
# }
.annotate 'line', 3147

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3148
# Body
# {
.annotate 'line', 3150
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3151

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3152
# Body
# {
.annotate 'line', 3154
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3155
set $S2, __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 3156
self.'annotate'(__ARG_1)
.annotate 'line', 3157
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3159

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3127
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3129
addattribute $P0, 'lexpr'
.annotate 'line', 3130
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3166
# Body
# {
.annotate 'line', 3168
self.'annotate'(__ARG_1)
.annotate 'line', 3169
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3170
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3171

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3164
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3178
# Body
# {
.annotate 'line', 3180
self.'annotate'(__ARG_1)
.annotate 'line', 3181
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3182
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3183
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3184

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3185
# Body
# {
.annotate 'line', 3187
self.'annotate'(__ARG_1)
.annotate 'line', 3188
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3189
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3190
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3191
.return($S1)
# }
.annotate 'line', 3192

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3176
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3199
# Body
# {
.annotate 'line', 3201
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3202
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3203
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3204
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3205
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3206
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
isa $I1, $P2, 'ConcatString'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 3207
$P2.'emit_concat_to'(__ARG_1, $S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3209
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_6
set $S4, $P3
__label_6:
.annotate 'line', 3210
# string aux: $S5
null $S5
.annotate 'line', 3211
self.'annotate'(__ARG_1)
.annotate 'line', 3212
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
.annotate 'line', 3214
eq $S2, 'S', __label_12
# {
.annotate 'line', 3215
$P3 = self.'tempreg'('S')
set $S5, $P3
.annotate 'line', 3216
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3217
set $S4, $S5
# }
__label_12: # endif
.annotate 'line', 3219
__ARG_1.'emitconcat1'($S3, $S4)
goto __label_7 # break
__label_10: # case
__label_11: # case
.annotate 'line', 3223
eq $S1, $S2, __label_13
# {
.annotate 'line', 3224
$P3 = self.'tempreg'($S1)
set $S5, $P3
.annotate 'line', 3225
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3226
set $S4, $S5
# }
__label_13: # endif
.annotate 'line', 3228
__ARG_1.'emitaddto'($S3, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 3231
__ARG_1.'emitaddto'($S3, $S4)
__label_7: # switch end
# }
__label_4: # endif
.annotate 'line', 3234
.return($S3)
# }
.annotate 'line', 3235

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3197
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3242
# Body
# {
.annotate 'line', 3244
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3245
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3246
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3247
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3248
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3249
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3250
# string aux: $S5
null $S5
.annotate 'line', 3251
self.'annotate'(__ARG_1)
.annotate 'line', 3252
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
.annotate 'line', 3254
getattribute $P3, self, 'start'
'InternalError'('-= to string must not happen', $P3)
__label_7: # case
__label_8: # case
.annotate 'line', 3257
eq $S1, $S2, __label_9
# {
.annotate 'line', 3258
$P4 = self.'tempreg'($S1)
set $S5, $P4
.annotate 'line', 3259
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3260
set $S4, $S5
# }
__label_9: # endif
.annotate 'line', 3262
__ARG_1.'emitsubto'($S3, $S4)
goto __label_4 # break
__label_5: # default
.annotate 'line', 3265
__ARG_1.'emitsubto'($S3, $S4)
__label_4: # switch end
.annotate 'line', 3267
.return($S3)
# }
.annotate 'line', 3268

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3240
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3275
# Body
# {
.annotate 'line', 3277
# string ltype: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3278
# string rtype: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3279
# string lreg: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3280
# string rreg: $S4
null $S4
.annotate 'line', 3281
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 3283
ne $S2, 'I', __label_6
.annotate 'line', 3284
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
goto __label_7
__label_6: # else
# {
.annotate 'line', 3286
$P3 = self.'tempreg'('I')
set $S4, $P3
.annotate 'line', 3287
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S4)
# }
__label_7: # endif
.annotate 'line', 3289
self.'annotate'(__ARG_1)
.annotate 'line', 3290
__ARG_1.'say'('repeat ', $S3, ', ', $S3, ', ', $S4)
goto __label_3 # break
__label_4: # default
.annotate 'line', 3293
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
.annotate 'line', 3294
self.'annotate'(__ARG_1)
.annotate 'line', 3295
__ARG_1.'say'('mul ', $S3, ', ', $S4)
__label_3: # switch end
.annotate 'line', 3297
.return($S3)
# }
.annotate 'line', 3298

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3273
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3305
# Body
# {
.annotate 'line', 3307
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3308
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3309
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3310
self.'annotate'(__ARG_1)
.annotate 'line', 3311
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3312
.return($S2)
# }
.annotate 'line', 3313

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3303
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3320
# Body
# {
.annotate 'line', 3322
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3323
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3324
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3325
self.'annotate'(__ARG_1)
.annotate 'line', 3326
__ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3327
.return($S2)
# }
.annotate 'line', 3328

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3318
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3335
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3336
# Body
# {
.annotate 'line', 3338
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3339
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3340
# string regl: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3341
# string regr: $S4
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_3
set $S4, $P1
__label_3:
.annotate 'line', 3342
self.'annotate'(__ARG_1)
.annotate 'line', 3343
# string aux: $S5
null $S5
.annotate 'line', 3344
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3346
ne $S1, 'I', __label_7
# {
.annotate 'line', 3347
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3348
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3349
set $S3, $S5
# }
__label_7: # endif
.annotate 'line', 3351
ne $S2, 'I', __label_8
# {
.annotate 'line', 3352
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3353
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3354
set $S4, $S5
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3357
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3358
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3359
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3360
set $S3, $S5
# }
goto __label_10
__label_9: # else
.annotate 'line', 3362
iseq $I1, $S2, 'P'
unless $I1 goto __label_14
iseq $I1, $S1, 'I'
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3363
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3364
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3365
set $S4, $S5
# }
goto __label_13
__label_12: # else
.annotate 'line', 3367
iseq $I1, $S2, 'S'
unless $I1 goto __label_17
iseq $I1, $S1, 'P'
__label_17:
unless $I1 goto __label_15
# {
.annotate 'line', 3368
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3369
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3370
set $S3, $S5
# }
goto __label_16
__label_15: # else
.annotate 'line', 3372
iseq $I1, $S2, 'P'
unless $I1 goto __label_19
iseq $I1, $S1, 'S'
__label_19:
unless $I1 goto __label_18
# {
.annotate 'line', 3373
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3374
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3375
set $S4, $S5
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 3378
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
.annotate 'line', 3380
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3383
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3386
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3387
# }
.annotate 'line', 3389

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3390
# Body
# {
.annotate 'line', 3392
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3393

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3394
# Body
# {
.annotate 'line', 3396
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3397

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3398
# Body
# {
.annotate 'line', 3400
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3401

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3333
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3414
# Body
# {
.annotate 'line', 3416
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3417
setattribute self, 'expr', __ARG_2
.annotate 'line', 3418
box $P1, __ARG_3
setattribute self, 'checknull', $P1
# }
.annotate 'line', 3419

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3420
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3421
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3422
# Body
# {
.annotate 'line', 3424
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
.annotate 'line', 3425
box $P1, $I1
setattribute self, 'checknull', $P1
.annotate 'line', 3426
.return(self)
# }
.annotate 'line', 3427

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3428
# Body
# {
.annotate 'line', 3430
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3431
self.'annotate'(__ARG_1)
.annotate 'line', 3432
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3433
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3434
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3435

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3436
# Body
# {
.annotate 'line', 3438
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3439
self.'annotate'(__ARG_1)
.annotate 'line', 3440
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
.annotate 'line', 3441

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3409
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3411
addattribute $P0, 'expr'
.annotate 'line', 3412
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3448
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3449
# Body
# {
.annotate 'line', 3451
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3452

.end # negated


.sub 'optimize' :method

.annotate 'line', 3453
# Body
# {
.annotate 'line', 3455
self.'optimizearg'()
.annotate 'line', 3456
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3457
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3458
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3459
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3460
unless $I1 goto __label_0
# {
.annotate 'line', 3461
unless $I2 goto __label_1
.annotate 'line', 3462
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3464
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3466
unless $I2 goto __label_3
.annotate 'line', 3467
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3468
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3469
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3470
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3471
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3472
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3473
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3474
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
iseq $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3477
.return(self)
# }
.annotate 'line', 3478

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3479
# Body
# {
.annotate 'line', 3481
__ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3482

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3483
# Body
# {
.annotate 'line', 3485
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3486

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3487
# Body
# {
.annotate 'line', 3489
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3490

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3491
# Body
# {
.annotate 'line', 3493
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3494

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3446
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3501
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3502
# Body
# {
.annotate 'line', 3504
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3505

.end # negated


.sub 'optimize' :method

.annotate 'line', 3506
# Body
# {
.annotate 'line', 3508
self.'optimizearg'()
.annotate 'line', 3509
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3510
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3511
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3512
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3513
unless $I1 goto __label_0
# {
.annotate 'line', 3514
unless $I2 goto __label_1
.annotate 'line', 3515
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3517
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3519
unless $I2 goto __label_3
.annotate 'line', 3520
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3521
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3522
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3523
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3524
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3525
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3526
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3527
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
isne $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3530
.return(self)
# }
.annotate 'line', 3531

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3532
# Body
# {
.annotate 'line', 3534
__ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3535

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3536
# Body
# {
.annotate 'line', 3538
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3539

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3540
# Body
# {
.annotate 'line', 3542
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3543

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3544
# Body
# {
.annotate 'line', 3546
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3547

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3499
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

.annotate 'line', 3555
# Body
# {
.annotate 'line', 3557
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3558
box $P1, __ARG_1
setattribute self, 'positive', $P1
# }
.annotate 'line', 3559

.end # OpSameExpr


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
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3564
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
.annotate 'line', 3565

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3566
# Body
# {
.annotate 'line', 3568
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3569
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3570
__ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3571

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3572
# Body
# {
.annotate 'line', 3574
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3575

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3576
# Body
# {
.annotate 'line', 3578
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3579
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3580
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
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
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3585
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3586
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3587

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3552
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3554
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3594
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3595
# Body
# {
.annotate 'line', 3597
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3598

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3599
# Body
# {
.annotate 'line', 3601
__ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3602

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3603
# Body
# {
.annotate 'line', 3605
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3606

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3607
# Body
# {
.annotate 'line', 3609
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3610

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3592
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3617
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3618
# Body
# {
.annotate 'line', 3620
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3621

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3622
# Body
# {
.annotate 'line', 3624
__ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3625

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3626
# Body
# {
.annotate 'line', 3628
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3629

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3633

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3615
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3640
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3641
# Body
# {
.annotate 'line', 3643
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3644

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3645
# Body
# {
.annotate 'line', 3647
__ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3648

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3649
# Body
# {
.annotate 'line', 3651
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3652

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3653
# Body
# {
.annotate 'line', 3655
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3656

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3638
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3663
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3664
# Body
# {
.annotate 'line', 3666
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3667

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3668
# Body
# {
.annotate 'line', 3670
__ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3671

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3672
# Body
# {
.annotate 'line', 3674
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3675

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3676
# Body
# {
.annotate 'line', 3678
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3679

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3661
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3686
# Body
# {
.annotate 'line', 3688
.return('I')
# }
.annotate 'line', 3689

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3684
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3696
# Body
# {
.annotate 'line', 3698
self.'optimizearg'()
.annotate 'line', 3699
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3700
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3701
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3702
eq $I1, 0, __label_1
.annotate 'line', 3703
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3705
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3707
.return(self)
# }
.annotate 'line', 3708

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3709
# Body
# {
.annotate 'line', 3711
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
.annotate 'line', 3712
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3713
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3714
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 3715
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3718
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_8
set $S4, $P1
__label_8:
.annotate 'line', 3719
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3720
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3721
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3722
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3724

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3694
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3731
# Body
# {
.annotate 'line', 3733
self.'optimizearg'()
.annotate 'line', 3734
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3735
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3736
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3737
ne $I1, 0, __label_1
.annotate 'line', 3738
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3740
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3742
.return(self)
# }
.annotate 'line', 3743

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3744
# Body
# {
.annotate 'line', 3746
# string res: $S1
null $S1
.annotate 'line', 3747
if_null __ARG_2, __label_0
.annotate 'line', 3748
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3750
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3751
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3752
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3753
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_6
set $S3, $P1
__label_6:
.annotate 'line', 3754
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3757
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_7
set $S4, $P1
__label_7:
.annotate 'line', 3758
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3759
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3760
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3761
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3763

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3729
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3768
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3776
# Body
# {
.annotate 'line', 3778
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
.annotate 'line', 3779
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3780
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3781
self.'annotate'(__ARG_1)
.annotate 'line', 3782
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3783

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3784
# Body
# {
.annotate 'line', 3786
band $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3787

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3774
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3794
# Body
# {
.annotate 'line', 3796
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
.annotate 'line', 3797
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3798
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3799
self.'annotate'(__ARG_1)
.annotate 'line', 3800
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3801

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3802
# Body
# {
.annotate 'line', 3804
bor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3805

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3792
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3812
# Body
# {
.annotate 'line', 3814
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
.annotate 'line', 3815
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3816
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3817
self.'annotate'(__ARG_1)
.annotate 'line', 3818
__ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3819

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3820
# Body
# {
.annotate 'line', 3822
bxor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3823

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3810
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3831
# Body
# {
.annotate 'line', 3833
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3834
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3835
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3836
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3837
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3839
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3841
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_4
# {
.annotate 'line', 3842
getattribute $P2, __ARG_4, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3843
getattribute $P1, self, 'values'
$P1.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3846
root_new $P2, ['parrot';'ResizablePMCArray']
$P2.'push'(__ARG_3)
$P2.'push'(__ARG_4)
setattribute self, 'values', $P2
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3847

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3848
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3849
# Body
# {
.annotate 'line', 3851
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3852
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3853
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3854
# int i: $I2
null $I2
# for loop
.annotate 'line', 3855
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3856
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3855
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3857
.return($P2)
# }
.annotate 'line', 3858

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3859
# Body
# {
.annotate 'line', 3861
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3862
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3863
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3864
self.'annotate'(__ARG_1)
.annotate 'line', 3865
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3866
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3867
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3866
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3868
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3869

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3870
# Body
# {
.annotate 'line', 3872
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3873
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3874
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3875
self.'annotate'(__ARG_1)
.annotate 'line', 3876
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3877
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3878
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_1: # for iteration
.annotate 'line', 3877
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3879
.return($S1)
# }
.annotate 'line', 3880

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3881
# Body
# {
.annotate 'line', 3883
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3884
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3885
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3886
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3887
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3886
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3888

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3889
# Body
# {
.annotate 'line', 3891
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3892
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3893
self.'annotate'(__ARG_1)
.annotate 'line', 3894
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3895
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3896
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3895
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3897

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3828
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3830
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3904
# Body
# {
.annotate 'line', 3906
self.'optimizearg'()
.annotate 'line', 3907
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3908
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3909
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3910
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3911
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3912
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3913
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3914
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3915
# var t: $P5
null $P5
.annotate 'line', 3916
# string es: $S3
getattribute $P10, $P3, 'str'
null $S3
if_null $P10, __label_6
set $S3, $P10
__label_6:
.annotate 'line', 3917
# string rs: $S4
getattribute $P10, $P4, 'str'
null $S4
if_null $P10, __label_7
set $S4, $P10
__label_7:
.annotate 'line', 3918
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3919
new $P10, [ 'TokenSingleQuoted' ]
getattribute $P11, $P3, 'file'
getattribute $P12, $P3, 'line'
concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
set $P5, $P10
goto __label_9
__label_8: # else
.annotate 'line', 3921
new $P13, [ 'TokenQuoted' ]
getattribute $P14, $P3, 'file'
getattribute $P15, $P3, 'line'
concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
set $P5, $P13
__label_9: # endif
.annotate 'line', 3922
new $P11, [ 'StringLiteral' ]
getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
set $P10, $P11
.return($P10)
# }
__label_4: # endif
.annotate 'line', 3924
iseq $I3, $S1, 'I'
unless $I3 goto __label_12
iseq $I3, $S2, 'I'
__label_12:
unless $I3 goto __label_11
# {
.annotate 'line', 3925
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3926
# int ln: $I1
set $P10, $P6
set $I1, $P10
.annotate 'line', 3927
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3928
# int rn: $I2
set $P10, $P7
set $I2, $P10
.annotate 'line', 3929
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $I3, $I1, $I2
.tailcall 'integerValue'($P10, $P11, $I3)
# }
__label_11: # endif
# {
.annotate 'line', 3932
$P10 = 'floatresult'($S1, $S2)
if_null $P10, __label_13
unless $P10 goto __label_13
# {
.annotate 'line', 3933
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3934
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3935
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3936
# float rf: $N2
# predefined string
set $S5, $P9
set $N2, $S5
.annotate 'line', 3937
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3941
iseq $I3, $S1, 'S'
unless $I3 goto __label_15
iseq $I3, $S2, 'S'
__label_15:
unless $I3 goto __label_14
# {
.annotate 'line', 3942
new $P11, [ 'ConcatString' ]
getattribute $P12, self, 'owner'
getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
set $P10, $P11
.return($P10)
# }
__label_14: # endif
.annotate 'line', 3944
.return(self)
# }
.annotate 'line', 3945

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3946
# Body
# {
.annotate 'line', 3948
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3949
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3950
ne $S1, $S2, __label_2
.annotate 'line', 3951
.return($S1)
__label_2: # endif
.annotate 'line', 3952
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3953
.return('S')
__label_3: # endif
.annotate 'line', 3954
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3955
.return('S')
__label_5: # endif
.annotate 'line', 3956
$P1 = 'floatresult'($S1, $S2)
if_null $P1, __label_7
unless $P1 goto __label_7
.annotate 'line', 3957
.return('N')
__label_7: # endif
.annotate 'line', 3958
.return('I')
# }
.annotate 'line', 3959

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3960
# Body
# {
.annotate 'line', 3962
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3963
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3964
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3965
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3966
# string rtype: $S3
$P3 = $P2.'checkresult'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3968
# string rleft: $S4
$P3 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3969
# string rright: $S5
$P3 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_4
set $S5, $P3
__label_4:
.annotate 'line', 3970
ne $S1, 'S', __label_5
# {
.annotate 'line', 3971
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3972
# string aux: $S6
$P3 = self.'tempreg'('S')
null $S6
if_null $P3, __label_9
set $S6, $P3
__label_9:
.annotate 'line', 3973
eq $S2, 'S', __label_10
# {
.annotate 'line', 3974
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 3975
set $S4, $S6
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3978
__ARG_1.'emitset'($S6, $S5)
.annotate 'line', 3979
set $S5, $S6
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3982
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3985
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3986
# string l: $S7
null $S7
.annotate 'line', 3987
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3989
$P3 = self.'tempreg'('I')
set $S7, $P3
.annotate 'line', 3990
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3992
# string r: $S8
null $S8
.annotate 'line', 3993
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3995
$P3 = self.'tempreg'('I')
set $S8, $P3
.annotate 'line', 3996
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3998
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 4001
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 4003

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3902
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 4010
# Body
# {
.annotate 'line', 4012
self.'optimizearg'()
.annotate 'line', 4013
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4014
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4015
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4016
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4017
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4018
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4019
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4020
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4021
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4022
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4023
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
sub $I3, $I1, $I2
.tailcall 'integerValue'($P5, $P6, $I3)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4026
.return(self)
# }
.annotate 'line', 4027

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4028
# Body
# {
.annotate 'line', 4030
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4031
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4032
ne $S1, $S2, __label_2
.annotate 'line', 4033
.return($S1)
__label_2: # endif
.annotate 'line', 4034
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4035
.return('N')
__label_3: # endif
.annotate 'line', 4036
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4037
.return('N')
__label_5: # endif
.annotate 'line', 4038
.return('I')
# }
.annotate 'line', 4039

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4040
# Body
# {
.annotate 'line', 4042
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4043
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4044
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 4045

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4008
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 4052
# Body
# {
.annotate 'line', 4054
self.'optimizearg'()
.annotate 'line', 4055
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4056
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4057
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4058
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4059
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 4060
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4061
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4062
# int ln: $I1
set $P7, $P3
set $I1, $P7
.annotate 'line', 4063
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4064
# int rn: $I2
set $P7, $P4
set $I2, $P7
.annotate 'line', 4065
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $I3, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I3)
# }
__label_4: # endif
# {
.annotate 'line', 4068
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4069
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 4070
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 4071
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 4072
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 4073
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P7, $P8, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4077
.return(self)
# }
.annotate 'line', 4078

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4079
# Body
# {
.annotate 'line', 4081
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4082
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4083
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4084
ne $S1, $S2, __label_2
.annotate 'line', 4085
.return($S1)
__label_2: # endif
.annotate 'line', 4086
ne $S1, 'S', __label_3
.annotate 'line', 4087
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 4089
.return('N')
__label_4: # endif
# }
.annotate 'line', 4090

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4091
# Body
# {
.annotate 'line', 4093
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4094
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4095
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4096
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4097
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 4098
ne $S1, 'S', __label_2
# {
.annotate 'line', 4099
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4100
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4101
# string rval: $S5
null $S5
.annotate 'line', 4102
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 4104
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 4107
$P3 = self.'tempreg'('I')
set $S5, $P3
.annotate 'line', 4108
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 4110
self.'annotate'(__ARG_1)
.annotate 'line', 4111
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4112
.return()
# }
__label_2: # endif
.annotate 'line', 4114
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
.annotate 'line', 4115
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4116
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4117
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4118
.return()
# }
__label_6: # endif
.annotate 'line', 4123
ne $S1, 'N', __label_10
# {
.annotate 'line', 4124
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4125
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4126
# string rval: $S6
null $S6
.annotate 'line', 4127
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 4129
$P3 = self.'tempreg'('N')
set $S6, $P3
.annotate 'line', 4130
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4131
set $S6, $S4
goto __label_11 # break
__label_14: # case
.annotate 'line', 4134
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 4137
$P4 = self.'tempreg'('N')
set $S6, $P4
.annotate 'line', 4138
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 4140
set $S7, __ARG_2
eq $S7, '', __label_15
# {
.annotate 'line', 4141
self.'annotate'(__ARG_1)
.annotate 'line', 4142
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
__label_15: # endif
.annotate 'line', 4144
.return()
# }
__label_10: # endif
.annotate 'line', 4147
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 4148
$P3 = $P1.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_18
$I3 = $P1.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 4149
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S3, $P4
.annotate 'line', 4150
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4153
$P3 = $P1.'getIntegerValue'()
set $I1, $P3
.annotate 'line', 4154
set $S3, $I1
# }
__label_17: # endif
.annotate 'line', 4156
$P3 = $P2.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_21
$I3 = $P2.'isidentifier'()
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 4157
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S4, $P4
.annotate 'line', 4158
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 4161
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
.annotate 'line', 4163
$P4 = self.'checkresult'()
$P3 = self.'tempreg'($P4)
set $S4, $P3
.annotate 'line', 4164
$P2.'emit'(__ARG_1, $S4)
goto __label_22 # break
__label_25: # case
.annotate 'line', 4167
$P5 = $P2.'emit_get'(__ARG_1)
set $S4, $P5
goto __label_22 # break
__label_26: # case
__label_23: # default
.annotate 'line', 4171
$P6 = $P2.'getIntegerValue'()
set $I2, $P6
.annotate 'line', 4172
set $S4, $I2
goto __label_22 # break
__label_22: # switch end
.annotate 'line', 4173
# }
__label_20: # endif
.annotate 'line', 4176
self.'annotate'(__ARG_1)
.annotate 'line', 4177
set $S7, __ARG_2
ne $S7, '', __label_27
.annotate 'line', 4178
$P3 = self.'checkresult'()
__ARG_2 = self.'tempreg'($P3)
__label_27: # endif
.annotate 'line', 4179
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4180

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4050
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4187
# Body
# {
.annotate 'line', 4189
self.'optimizearg'()
.annotate 'line', 4190
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4191
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4192
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4193
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4194
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4195
# var lval: $P3
null $P3
.annotate 'line', 4196
# var rval: $P4
null $P4
.annotate 'line', 4197
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4198
getattribute $P3, $P1, 'numval'
.annotate 'line', 4199
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4200
getattribute $P4, $P2, 'numval'
.annotate 'line', 4201
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4202
eq $I2, 0, __label_6
.annotate 'line', 4203
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
.annotate 'line', 4206
$P5 = 'floatresult'($S1, $S2)
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4207
getattribute $P3, $P1, 'numval'
.annotate 'line', 4208
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4209
getattribute $P4, $P2, 'numval'
.annotate 'line', 4210
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
.annotate 'line', 4211
set $N3, 0
eq $N2, $N3, __label_8
.annotate 'line', 4212
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
.annotate 'line', 4216
.return(self)
# }
.annotate 'line', 4217

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4218
# Body
# {
.annotate 'line', 4220
.return('N')
# }
.annotate 'line', 4221

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4222
# Body
# {
.annotate 'line', 4224
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4225
# var aux: $P2
null $P2
.annotate 'line', 4226
# var lreg: $P3
$P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4227
$P6 = $P1.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_0
# {
.annotate 'line', 4228
$P2 = self.'tempreg'('N')
.annotate 'line', 4229
__ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4230
set $P3, $P2
# }
__label_0: # endif
.annotate 'line', 4232
# var rexpr: $P4
getattribute $P4, self, 'rexpr'
.annotate 'line', 4233
# var rreg: $P5
$P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4234
$P6 = $P4.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_1
# {
.annotate 'line', 4235
$P2 = self.'tempreg'('N')
.annotate 'line', 4236
__ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4237
set $P5, $P2
# }
__label_1: # endif
.annotate 'line', 4239
self.'annotate'(__ARG_1)
.annotate 'line', 4240
__ARG_1.'say'('div ', __ARG_2, ', ', $P3, ', ', $P5)
# }
.annotate 'line', 4241

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4185
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4248
# Body
# {
.annotate 'line', 4250
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4251
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4252
self.'annotate'(__ARG_1)
.annotate 'line', 4253
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4254

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4255
# Body
# {
.annotate 'line', 4257
mod $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4258

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4246
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4265
# Body
# {
.annotate 'line', 4267
.return('I')
# }
.annotate 'line', 4268

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4269
# Body
# {
.annotate 'line', 4271
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4272
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4273
self.'annotate'(__ARG_1)
.annotate 'line', 4278
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4279

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4263
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4286
# Body
# {
.annotate 'line', 4288
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
.annotate 'line', 4289
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4290
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4291
self.'annotate'(__ARG_1)
.annotate 'line', 4292
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4293

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4294
# Body
# {
.annotate 'line', 4296
shl $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4297

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4284
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4304
# Body
# {
.annotate 'line', 4306
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
.annotate 'line', 4307
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4308
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4309
self.'annotate'(__ARG_1)
.annotate 'line', 4310
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4311

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4312
# Body
# {
.annotate 'line', 4314
shr $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4315

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4302
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4324
# Body
# {
.annotate 'line', 4326
setattribute self, 'arg', __ARG_1
.annotate 'line', 4327
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4328

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4329
# Body
# {
.annotate 'line', 4331
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4332
.return(self)
# }
.annotate 'line', 4333

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4334
# Body
# {
.annotate 'line', 4336
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4337

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4322
addattribute $P0, 'arg'
.annotate 'line', 4323
addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 4347
# Body
# {
.annotate 'line', 4349
setattribute self, 'owner', __ARG_1
.annotate 'line', 4350
setattribute self, 'start', __ARG_2
.annotate 'line', 4351
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4352
# var t: $P2
$P2 = __ARG_3.'get'()
.annotate 'line', 4353
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4354
__ARG_3.'unget'($P2)
__label_1: # do
.annotate 'line', 4355
# {
.annotate 'line', 4356
# var modifier: $P3
null $P3
.annotate 'line', 4357
# var expr: $P4
$P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4358
$P2 = __ARG_3.'get'()
.annotate 'line', 4359
$P5 = $P2.'isop'(':')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4360
$P2 = __ARG_3.'get'()
.annotate 'line', 4361
$P5 = $P2.'isop'('[')
if_null $P5, __label_5
unless $P5 goto __label_5
# {
.annotate 'line', 4362
new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_3, __ARG_1)
set $P3, $P6
.annotate 'line', 4363
$P2 = __ARG_3.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4366
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4369
new $P6, [ 'Argument' ]
$P6.'Argument'($P4, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
__label_3: # continue
.annotate 'line', 4370
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4371
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_7
.annotate 'line', 4372
'SyntaxError'("Unfinished argument list", $P2)
__label_7: # endif
.annotate 'line', 4373
# predefined elements
elements $I1, $P1
le $I1, 0, __label_8
.annotate 'line', 4374
setattribute self, 'args', $P1
__label_8: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4376

.end # ArgumentList


.sub 'numargs' :method

.annotate 'line', 4377
# Body
# {
.annotate 'line', 4379
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4380
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.return($I1)
# }
.annotate 'line', 4381

.end # numargs


.sub 'getrawargs' :method

.annotate 'line', 4382
# Body
# {
.annotate 'line', 4384
getattribute $P1, self, 'args'
.return($P1)
# }
.annotate 'line', 4385

.end # getrawargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 4386
# Body
# {
.annotate 'line', 4388
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4389
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 4390

.end # getarg


.sub 'getfreearg' :method
.param int __ARG_1

.annotate 'line', 4391
# Body
# {
.annotate 'line', 4393
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4394
$P2 = $P1[__ARG_1]
getattribute $P3, $P2, 'arg'
.return($P3)
# }
.annotate 'line', 4395

.end # getfreearg


.sub 'optimize' :method

.annotate 'line', 4396
# Body
# {
.annotate 'line', 4398
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4399
if_null $P1, __label_0
.annotate 'line', 4400
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 4401
.return(self)
# }
.annotate 'line', 4402

.end # optimize


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 4403
# Body
# {
.annotate 'line', 4405
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4406
unless_null $P1, __label_0
# {
.annotate 'line', 4407
# string regs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4408
# string pnull: $S1
set $S1, ''
.annotate 'line', 4409
set $P1, $P2
.annotate 'line', 4410
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4411
# int nargs: $I1
# predefined elements
elements $I1, $P3
# for loop
.annotate 'line', 4412
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4413
# var a: $P4
$P5 = $P3[$I2]
getattribute $P4, $P5, 'arg'
.annotate 'line', 4414
# string reg: $S2
null $S2
.annotate 'line', 4415
$P5 = $P4.'isnull'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4417
ne $S1, '', __label_6
# {
.annotate 'line', 4418
getattribute $P7, self, 'owner'
$P6 = $P7.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4419
__ARG_1.'emitnull'($S1)
.annotate 'line', 4420
set $S2, $S1
# }
__label_6: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 4424
$P5 = $P4.'emit_get'(__ARG_1)
set $S2, $P5
__label_5: # endif
.annotate 'line', 4425
$P1.'push'($S2)
# }
__label_1: # for iteration
.annotate 'line', 4412
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4427
setattribute self, 'argregs', $P1
# }
__label_0: # endif
.annotate 'line', 4429
.return($P1)
# }
.annotate 'line', 4430

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 4431
# Body
# {
.annotate 'line', 4433
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4434
# var argreg: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4436
# string sep: $S1
set $S1, ''
.annotate 'line', 4437
# int n: $I1
$P6 = self.'numargs'()
set $I1, $P6
# for loop
.annotate 'line', 4438
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4439
# string a: $S2
$S2 = $P2[$I2]
.annotate 'line', 4440
__ARG_1.'print'($S1, $S2)
.annotate 'line', 4441
# int isflat: $I3
null $I3
# int isnamed: $I4
null $I4
.annotate 'line', 4442
# string setname: $S3
set $S3, ''
.annotate 'line', 4443
# var modifiers: $P3
$P6 = $P1[$I2]
getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4444
if_null $P3, __label_3
# {
.annotate 'line', 4445
$P6 = $P3.'getlist'()
iter $P7, $P6
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4446
# string name: $S4
$P8 = $P4.'getname'()
null $S4
if_null $P8, __label_6
set $S4, $P8
__label_6:
.annotate 'line', 4447
ne $S4, 'flat', __label_7
.annotate 'line', 4448
set $I3, 1
__label_7: # endif
.annotate 'line', 4449
ne $S4, 'named', __label_8
# {
.annotate 'line', 4450
set $I4, 1
.annotate 'line', 4451
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
.annotate 'line', 4455
# var argmod: $P5
$P5 = $P4.'getarg'(0)
.annotate 'line', 4456
$P8 = $P5.'isstringliteral'()
isfalse $I7, $P8
unless $I7 goto __label_13
.annotate 'line', 4457
getattribute $P9, self, 'start'
'SyntaxError'('Invalid modifier', $P9)
__label_13: # endif
.annotate 'line', 4458
$P10 = $P5.'getPirString'()
set $S3, $P10
goto __label_9 # break
__label_10: # default
.annotate 'line', 4461
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
.annotate 'line', 4466
and $I5, $I3, $I4
unless $I5 goto __label_14
.annotate 'line', 4467
__ARG_1.'print'(' :flat :named')
goto __label_15
__label_14: # else
.annotate 'line', 4468
unless $I3 goto __label_16
.annotate 'line', 4469
__ARG_1.'print'(' :flat')
goto __label_17
__label_16: # else
.annotate 'line', 4470
unless $I4 goto __label_18
# {
.annotate 'line', 4471
__ARG_1.'print'(' :named')
.annotate 'line', 4472
eq $S3, '', __label_19
.annotate 'line', 4473
__ARG_1.'print'("(", $S3, ")")
__label_19: # endif
# }
__label_18: # endif
__label_17: # endif
__label_15: # endif
.annotate 'line', 4475
set $S1, ', '
# }
__label_0: # for iteration
.annotate 'line', 4438
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4477

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4342
addattribute $P0, 'owner'
.annotate 'line', 4343
addattribute $P0, 'start'
.annotate 'line', 4344
addattribute $P0, 'args'
.annotate 'line', 4345
addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4480
# Body
# {
.annotate 'line', 4482
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4483
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4484
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4485
.return(1)
# }
.annotate 'line', 4486

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4495
# Body
# {
.annotate 'line', 4497
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4498
setattribute self, 'predef', __ARG_3
.annotate 'line', 4499
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4500

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4501
# Body
# {
.annotate 'line', 4503
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4504

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4505
# Body
# {
.annotate 'line', 4507
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4508
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4509
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4510
# var arg: $P4
null $P4
.annotate 'line', 4511
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
.annotate 'line', 4512
# string pnull: $S1
set $S1, ''
.annotate 'line', 4513
set $I4, $I1
set $I5, -1
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4515
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4516
# string reg: $S2
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4518
ne $S2, 'null', __label_7
# {
.annotate 'line', 4519
ne $S1, '', __label_8
# {
.annotate 'line', 4520
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4521
__ARG_1.'emitnull'($S1)
# }
__label_8: # endif
.annotate 'line', 4523
set $S2, $S1
# }
__label_7: # endif
.annotate 'line', 4525
$P3.'push'($S2)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4529
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4530
iter $P9, $P2
set $P9, 0
__label_9: # for iteration
unless $P9 goto __label_10
shift $P4, $P9
.annotate 'line', 4531
getattribute $P8, $P4, 'arg'
$P5.'push'($P8)
goto __label_9
__label_10: # endfor
.annotate 'line', 4532
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4533
.return()
__label_1: # default
.annotate 'line', 4535
# int n: $I2
getattribute $P12, self, 'args'
set $I2, $P12
# for loop
.annotate 'line', 4536
# int i: $I3
null $I3
__label_13: # for condition
ge $I3, $I2, __label_12
# {
.annotate 'line', 4537
$P13 = $P2[$I3]
getattribute $P4, $P13, 'arg'
.annotate 'line', 4538
# string argtype: $S3
$P6 = $P4.'checkresult'()
null $S3
if_null $P6, __label_14
set $S3, $P6
__label_14:
.annotate 'line', 4539
# string paramtype: $S4
$P6 = $P1.'paramtype'($I3)
null $S4
if_null $P6, __label_15
set $S4, $P6
__label_15:
.annotate 'line', 4540
# string argr: $S5
null $S5
.annotate 'line', 4541
$P6 = $P4.'isnull'()
if_null $P6, __label_16
unless $P6 goto __label_16
# {
.annotate 'line', 4542
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
.annotate 'line', 4546
$P8 = self.'tempreg'($S4)
set $S5, $P8
.annotate 'line', 4547
__ARG_1.'emitnull'($S5)
__label_19: # default
.annotate 'line', 4549
ne $S1, '', __label_23
# {
.annotate 'line', 4550
$P10 = self.'tempreg'('P')
set $S1, $P10
.annotate 'line', 4551
__ARG_1.'emitnull'($S1)
# }
__label_23: # endif
.annotate 'line', 4553
set $S5, $S1
__label_18: # switch end
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4557
iseq $I4, $S3, $S4
if $I4 goto __label_26
iseq $I4, $S4, '?'
__label_26:
unless $I4 goto __label_24
.annotate 'line', 4558
$P6 = $P4.'emit_get'(__ARG_1)
set $S5, $P6
goto __label_25
__label_24: # else
# {
.annotate 'line', 4560
# string aux: $S6
null $S6
.annotate 'line', 4561
$P6 = self.'tempreg'($S4)
set $S5, $P6
.annotate 'line', 4562
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
.annotate 'line', 4564
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
.annotate 'line', 4568
$P6 = $P4.'emit_get'(__ARG_1)
set $S6, $P6
.annotate 'line', 4569
__ARG_1.'emitbox'($S5, $S6)
goto __label_33 # break
__label_34: # default
.annotate 'line', 4572
$P4.'emit'(__ARG_1, $S5)
__label_33: # switch end
goto __label_27 # break
__label_30: # case
__label_31: # case
__label_32: # case
.annotate 'line', 4578
$P8 = $P4.'emit_get'(__ARG_1)
set $S6, $P8
.annotate 'line', 4579
__ARG_1.'emitset'($S5, $S6)
goto __label_27 # break
__label_28: # default
.annotate 'line', 4582
$P4.'emit'(__ARG_1, $S5)
__label_27: # switch end
# }
__label_25: # endif
# }
__label_17: # endif
.annotate 'line', 4586
$P3.'push'($S5)
# }
__label_11: # for iteration
.annotate 'line', 4536
inc $I3
goto __label_13
__label_12: # for end
__label_0: # switch end
.annotate 'line', 4589
getattribute $P6, self, 'predef'
getattribute $P8, self, 'start'
$P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4590

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4490
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4492
addattribute $P0, 'predef'
.annotate 'line', 4493
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
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
setattribute self, 'funref', __ARG_4
.annotate 'line', 4604
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4605
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 4606
__ARG_1.'unget'($P1)
.annotate 'line', 4607
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
set $P3, $P4
setattribute self, 'args', $P3
# }
__label_0: # endif
# }
.annotate 'line', 4609

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4610
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4611
# Body
# {
.annotate 'line', 4613
getattribute $P8, self, 'funref'
$P7 = $P8.'optimize'()
setattribute self, 'funref', $P7
.annotate 'line', 4614
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4615
# int nargs: $I1
null $I1
.annotate 'line', 4616
if_null $P1, __label_0
# {
.annotate 'line', 4617
$P1 = $P1.'optimize'()
.annotate 'line', 4618
$P6 = $P1.'numargs'()
set $I1, $P6
.annotate 'line', 4619
setattribute self, 'args', $P1
# }
__label_0: # endif
.annotate 'line', 4623
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4624
$P6 = $P2.'isidentifier'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 4625
# string call: $S1
$P7 = $P2.'getName'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4626
# var predef: $P3
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4627
if_null $P3, __label_3
# {
.annotate 'line', 4628
self.'use_predef'($S1)
.annotate 'line', 4629
# var rawargs: $P4
ne $I1, 0, __label_5
root_new $P6, ['parrot';'ResizablePMCArray']
set $P4, $P6
goto __label_4
__label_5:
$P4 = $P1.'getrawargs'()
__label_4:
.annotate 'line', 4632
# var evalfun: $P5
getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4633
if_null $P5, __label_6
# {
.annotate 'line', 4634
$P6 = 'arglist_hascompilevalue'($P4)
if_null $P6, __label_7
unless $P6 goto __label_7
.annotate 'line', 4635
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
.tailcall $P5($P7, $P8, $P4)
__label_7: # endif
# }
__label_6: # endif
.annotate 'line', 4638
new $P7, [ 'CallPredefExpr' ]
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
$P7.'CallPredefExpr'($P8, $P9, $P3, $P4)
set $P6, $P7
.return($P6)
# }
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 4642
.return(self)
# }
.annotate 'line', 4643

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4644
# Body
# {
.annotate 'line', 4646
.return(1)
# }
.annotate 'line', 4647

.end # cantailcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4648
# Body
# {
.annotate 'line', 4650
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4651
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4652
# string call: $S1
null $S1
.annotate 'line', 4653
$P3 = $P1.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4654
$P4 = $P1.'checkIdentifier'()
set $S1, $P4
.annotate 'line', 4655
ne $S1, '', __label_2
# {
.annotate 'line', 4656
# string aux: $S2
$P3 = $P1.'getName'()
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 4657
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4661
unless $I1 goto __label_5
$P3 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P3 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P3
__label_1: # endif
.annotate 'line', 4663
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4664
if_null $P2, __label_6
.annotate 'line', 4665
$P2.'getargvalues'(__ARG_1)
__label_6: # endif
.annotate 'line', 4667
self.'annotate'(__ARG_1)
.annotate 'line', 4669
isnull $I2, __ARG_2
not $I2
unless $I2 goto __label_8
set $S3, __ARG_2
isne $I2, $S3, ''
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 4670
set $S4, __ARG_2
ne $S4, '.tailcall', __label_9
.annotate 'line', 4671
__ARG_1.'print'('.tailcall ')
goto __label_10
__label_9: # else
.annotate 'line', 4673
__ARG_1.'print'(__ARG_2, ' = ')
__label_10: # endif
# }
__label_7: # endif
.annotate 'line', 4676
unless $I1 goto __label_11
.annotate 'line', 4677
$P3 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P3, "'")
goto __label_12
__label_11: # else
.annotate 'line', 4679
__ARG_1.'print'($S1)
__label_12: # endif
.annotate 'line', 4681
__ARG_1.'print'('(')
.annotate 'line', 4682
if_null $P2, __label_13
.annotate 'line', 4683
$P2.'emitargs'(__ARG_1)
__label_13: # endif
.annotate 'line', 4684
__ARG_1.'say'(')')
# }
.annotate 'line', 4685

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4595
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4597
addattribute $P0, 'funref'
.annotate 'line', 4598
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4695
# Body
# {
.annotate 'line', 4697
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4698
setattribute self, 'left', __ARG_4
.annotate 'line', 4699
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4700

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4701
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4702
# Body
# {
.annotate 'line', 4704
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4705
.return(self)
# }
.annotate 'line', 4706

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4707
# Body
# {
.annotate 'line', 4709
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4710

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4711
# Body
# {
.annotate 'line', 4713
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4714
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4715
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4716
eq $S1, 'P', __label_2
# {
.annotate 'line', 4717
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4718
$P2 = self.'tempreg'('P')
set $S2, $P2
.annotate 'line', 4719
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4721
.return($S2)
# }
.annotate 'line', 4722

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4723
# Body
# {
.annotate 'line', 4725
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4726
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4727
# string result: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4728
self.'annotate'(__ARG_1)
.annotate 'line', 4729
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4730
.return($S3)
# }
.annotate 'line', 4731

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4732
# Body
# {
.annotate 'line', 4734
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4735
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4736
self.'annotate'(__ARG_1)
.annotate 'line', 4737
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4738

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4739
# Body
# {
.annotate 'line', 4741
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4742

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4743
# Body
# {
.annotate 'line', 4745
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4746
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4747
# string value: $S3
null $S3
.annotate 'line', 4748
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4750
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4751
$P1 = self.'tempreg'('P')
set __ARG_3, $P1
.annotate 'line', 4752
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
.annotate 'line', 4754
set $S3, __ARG_3
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4757
$P1 = self.'tempreg'('P')
set $S3, $P1
.annotate 'line', 4758
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4760
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4761

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4762
# Body
# {
.annotate 'line', 4764
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4765
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4766
# string value: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4767
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
.annotate 'line', 4768
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4770
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_5
set $S4, $P2
__label_5:
.annotate 'line', 4771
$P1 = __ARG_2.'checkresult'()
set $S5, $P1
eq $S5, 'P', __label_6
.annotate 'line', 4772
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
.annotate 'line', 4774
set $S3, $S4
__label_7: # endif
# }
__label_4: # endif
.annotate 'line', 4776
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4777
.return($S3)
# }
.annotate 'line', 4778

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4690
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4692
addattribute $P0, 'left'
.annotate 'line', 4693
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4789
# Body
# {
.annotate 'line', 4791
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4792
setattribute self, 'left', __ARG_4
.annotate 'line', 4793
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4794

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4795
# Body
# {
.annotate 'line', 4797
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4798
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4800
.return('P')
__label_1: # endif
# }
.annotate 'line', 4801

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4802
# Body
# {
.annotate 'line', 4804
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4805
setattribute self, 'left', $P1
.annotate 'line', 4806
self.'optimizeargs'()
.annotate 'line', 4810
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P4 = self.'numargs'()
set $I3, $P4
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4811
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4812
$P4 = $P2.'isintegerliteral'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4813
# int ival: $I1
$P5 = $P2.'getIntegerValue'()
set $I1, $P5
.annotate 'line', 4814
# string sval: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 4815
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, self, 'start'
getattribute $P5, $P4, 'file'
getattribute $P6, self, 'start'
getattribute $P7, $P6, 'line'
.annotate 'line', 4816
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 4817
new $P5, [ 'StringLiteral' ]
getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
set $P4, $P5
.return($P4)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4820
.return(self)
# }
.annotate 'line', 4821

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 4822
# Body
# {
.annotate 'line', 4824
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4825
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4826
isnull $I1, $P1
not $I1
if $I1 goto __label_1
isnull $I1, $P2
not $I1
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4827
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_args', $P3)
__label_0: # endif
.annotate 'line', 4828
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 4829
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_3
__label_2: # else
.annotate 'line', 4831
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_3: # endif
.annotate 'line', 4832
setattribute self, 'regleft', $P1
.annotate 'line', 4833
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4834
setattribute self, 'argregs', $P2
# }
.annotate 'line', 4835

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 4836
# Body
# {
.annotate 'line', 4838
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4839
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4840
isnull $I1, $P1
if $I1 goto __label_1
isnull $I1, $P2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4841
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
__label_0: # endif
.annotate 'line', 4842
getattribute $P3, self, 'regleft'
__ARG_1.'print'($P3, '[')
.annotate 'line', 4843
getattribute $P3, self, 'argregs'
# predefined join
join $S1, '; ', $P3
__ARG_1.'print'($S1)
.annotate 'line', 4844
__ARG_1.'print'(']')
# }
.annotate 'line', 4845

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4846
# Body
# {
.annotate 'line', 4848
self.'emit_prep'(__ARG_1)
.annotate 'line', 4849
# string type: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4850
ne $S1, 'S', __label_1
# {
.annotate 'line', 4851
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4852
# int nargs: $I1
getattribute $P2, self, 'argregs'
# predefined elements
elements $I1, $P2
.annotate 'line', 4853
eq $I1, 1, __label_3
.annotate 'line', 4854
getattribute $P2, self, 'start'
'SyntaxError'('Bad string index', $P2)
__label_3: # endif
.annotate 'line', 4855
set $S2, __ARG_2
ne $S2, '', __label_4
.annotate 'line', 4856
__ARG_2 = self.'tempreg'('S')
__label_4: # endif
.annotate 'line', 4857
getattribute $P2, self, 'regleft'
$P3 = $P1[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 4860
self.'annotate'(__ARG_1)
.annotate 'line', 4861
__ARG_1.'print'(__ARG_2, ' = ')
.annotate 'line', 4862
self.'emit_aux'(__ARG_1)
.annotate 'line', 4863
__ARG_1.'say'('')
# }
__label_2: # endif
# }
.annotate 'line', 4865

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4866
# Body
# {
.annotate 'line', 4868
self.'emit_prep'(__ARG_1)
.annotate 'line', 4869
self.'annotate'(__ARG_1)
.annotate 'line', 4870
self.'emit_aux'(__ARG_1)
.annotate 'line', 4871
__ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 4872

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4873
# Body
# {
.annotate 'line', 4875
self.'emit_prep'(__ARG_1)
.annotate 'line', 4876
# string rreg: $S1
null $S1
.annotate 'line', 4877
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 4878
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 4879
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4882
$P1 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P1
__label_1: # endif
.annotate 'line', 4883
self.'annotate'(__ARG_1)
.annotate 'line', 4884
self.'emit_aux'(__ARG_1)
.annotate 'line', 4885
__ARG_1.'say'(' = ', $S1)
.annotate 'line', 4886
.return($S1)
# }
.annotate 'line', 4887

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4783
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4785
addattribute $P0, 'left'
.annotate 'line', 4786
addattribute $P0, 'regleft'
.annotate 'line', 4787
addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4896
# Body
# {
.annotate 'line', 4898
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4899
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4900
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4901
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4902
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4903
# {
.annotate 'line', 4904
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4905
getattribute $P3, self, 'values'
$P3.'push'($P2)
# }
__label_3: # continue
.annotate 'line', 4906
$P1 = __ARG_1.'get'()
$P3 = $P1.'isop'(',')
if_null $P3, __label_2
if $P3 goto __label_1
__label_2: # enddo
.annotate 'line', 4907
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_4
.annotate 'line', 4908
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4910

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4911
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4912
# Body
# {
.annotate 'line', 4914
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4915
.return(self)
# }
.annotate 'line', 4916

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4917
# Body
# {
.annotate 'line', 4919
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 4920
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4921
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4927
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4929

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4930
# Body
# {
.annotate 'line', 4932
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4933
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4934
.return($S1)
# }
.annotate 'line', 4935

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4936
# Body
# {
.annotate 'line', 4938
self.'annotate'(__ARG_1)
.annotate 'line', 4939
# string itemreg: $S1
null $S1
.annotate 'line', 4940
# string it_p: $S2
null $S2
.annotate 'line', 4941
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4942
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4943
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4945
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4946
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
.annotate 'line', 4947
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
.annotate 'line', 4949
# string aux: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 4950
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4951
__ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 4952
set $S1, $S2
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4956
$P2 = $P1.'isnull'()
if_null $P2, __label_11
unless $P2 goto __label_11
# {
.annotate 'line', 4957
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4958
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4959
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4963
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4965
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4966
self.'annotate'(__ARG_1)
.annotate 'line', 4967
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4970

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4892
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4894
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4980
# Body
# {
.annotate 'line', 4982
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4983
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4984
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4985
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4986
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_0
# {
.annotate 'line', 4987
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4988
# {
.annotate 'line', 4989
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4990
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4991
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4992
$P2.'push'($P4)
.annotate 'line', 4993
$P3.'push'($P5)
# }
__label_3: # continue
.annotate 'line', 4995
$P1 = __ARG_1.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4996
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4997
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4999
setattribute self, 'keys', $P2
.annotate 'line', 5000
setattribute self, 'values', $P3
# }
.annotate 'line', 5001

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 5002
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5003
# Body
# {
.annotate 'line', 5005
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 5006
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5007
.return(self)
# }
.annotate 'line', 5008

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5009
# Body
# {
.annotate 'line', 5011
self.'annotate'(__ARG_1)
.annotate 'line', 5016
set $S6, __ARG_2
eq $S6, '', __label_0
.annotate 'line', 5017
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 5019
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 5020
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5021
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 5022
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 5023
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 5024
# string item: $S1
null $S1
.annotate 'line', 5025
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5026
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 5027
$P5 = self.'tempreg'('P')
set $S1, $P5
.annotate 'line', 5028
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 5031
$P5 = $P3.'emit_get'(__ARG_1)
set $S1, $P5
__label_5: # endif
.annotate 'line', 5033
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5034
# string itemreg: $S3
null $S3
.annotate 'line', 5035
$P5 = $P4.'isnull'()
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 5036
set $S6, __ARG_2
eq $S6, '', __label_9
# {
.annotate 'line', 5037
$P6 = self.'tempreg'('P')
set $S3, $P6
.annotate 'line', 5038
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 5041
$P5 = $P4.'isidentifier'()
if_null $P5, __label_10
unless $P5 goto __label_10
# {
.annotate 'line', 5042
# string s: $S4
$P6 = $P4.'checkIdentifier'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 5043
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
.annotate 'line', 5044
set $S3, $S4
goto __label_14
__label_13: # else
# {
.annotate 'line', 5046
# string id: $S5
$P5 = $P4.'getName'()
null $S5
if_null $P5, __label_16
set $S5, $P5
__label_16:
.annotate 'line', 5047
getattribute $P6, self, 'owner'
$P5 = $P6.'getvar'($S5)
unless_null $P5, __label_17
# {
.annotate 'line', 5048
$P7 = self.'tempreg'('P')
set $S3, $P7
.annotate 'line', 5049
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 5052
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 5056
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_11: # endif
__label_8: # endif
.annotate 'line', 5057
set $S6, __ARG_2
eq $S6, '', __label_19
.annotate 'line', 5058
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 5022
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 5060

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5061
# Body
# {
.annotate 'line', 5063
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5064
self.'emit'(__ARG_1, $S1)
.annotate 'line', 5065
.return($S1)
# }
.annotate 'line', 5066

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4975
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4977
addattribute $P0, 'keys'
.annotate 'line', 4978
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 5075
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 5076
# Body
# {
.annotate 'line', 5080
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 5081
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5082
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 5083
__ARG_1.'unget'($P2)
.annotate 'line', 5084
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 5085
# {
.annotate 'line', 5086
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5087
$P3.'push'($P4)
# }
__label_3: # continue
.annotate 'line', 5088
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 5089
setattribute self, 'initializer', $P3
.annotate 'line', 5090
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 5092

.end # parseinitializer


.sub 'optimize' :method

.annotate 'line', 5093
# Body
# {
.annotate 'line', 5095
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5096
if_null $P1, __label_0
.annotate 'line', 5097
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 5098
.return(self)
# }
.annotate 'line', 5099

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5071
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5073
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5108
# Body
# {
.annotate 'line', 5110
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5112
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 5113
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 5114
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5115
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 5116
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5117
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5118
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 5119
# {
.annotate 'line', 5120
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 5121
'RequireIdentifier'($P3)
.annotate 'line', 5122
$P2.'push'($P3)
# }
__label_8: # continue
.annotate 'line', 5123
$P1 = __ARG_1.'get'()
$P4 = $P1.'isop'('.')
if_null $P4, __label_7
if $P4 goto __label_6
__label_7: # enddo
.annotate 'line', 5124
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 5127
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 5130
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 5132
$P4 = $P1.'isop'('(')
if_null $P4, __label_9
unless $P4 goto __label_9
.annotate 'line', 5133
self.'parseinitializer'(__ARG_1)
goto __label_10
__label_9: # else
.annotate 'line', 5135
__ARG_1.'unget'($P1)
__label_10: # endif
# }
.annotate 'line', 5136

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 5137
# Body
# {
.annotate 'line', 5139
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5140
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5143
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 5144
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 5145
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 5146
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 5147
$P1 = $P3['value']
.annotate 'line', 5148
isa $I2, $P1, 'StringLiteral'
not $I1, $I2
unless $I1 goto __label_6
.annotate 'line', 5149
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 5150
getattribute $P6, $P1, 'strval'
setattribute self, 'value', $P6
# }
goto __label_5
__label_4: # else
.annotate 'line', 5153
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5157
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 5158
if_null $P4, __label_7
.annotate 'line', 5159
getattribute $P5, self, 'initializer'
'optimize_array'($P5)
__label_7: # endif
.annotate 'line', 5160
.return(self)
# }
.annotate 'line', 5161

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 5162
# Body
# {
.annotate 'line', 5164
self.'annotate'(__ARG_1)
.annotate 'line', 5166
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5167
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
.annotate 'line', 5170
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 5171
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 5172
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
.annotate 'line', 5174
# string reginit: $S1
set $S1, ''
.annotate 'line', 5175
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 5176
# string constructor: $S3
null $S3
.annotate 'line', 5177
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
.annotate 'line', 5181
ne $I2, 1, __label_13
# {
.annotate 'line', 5182
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 5183
$P9 = self.'tempreg'('P')
set $S2, $P9
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 5186
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5187
$P9 = $P2.'emit_get'(__ARG_1)
set $S1, $P9
.annotate 'line', 5188
concat $S0, ', ', $S1
set $S1, $S0
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 5192
isne $I3, $I2, 1
unless $I3 goto __label_17
isne $I3, $I2, 2
__label_17:
unless $I3 goto __label_16
.annotate 'line', 5193
getattribute $P9, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P9)
__label_16: # endif
.annotate 'line', 5194
not $I4, __ARG_3
unless $I4 goto __label_18
.annotate 'line', 5195
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_18: # endif
__label_9: # switch end
.annotate 'line', 5198
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
.annotate 'line', 5201
# string name: $S4
getattribute $P10, self, 'value'
$P9 = $P10.'rawstring'()
null $S4
if_null $P9, __label_24
set $S4, $P9
__label_24:
.annotate 'line', 5202
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 5203
isnull $I5, $P3
unless $I5 goto __label_26
$I5 = self.'dowarnings'()
__label_26:
unless $I5 goto __label_25
.annotate 'line', 5204
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
getattribute $P11, self, 'value'
'Warn'($S6, $P11)
__label_25: # endif
.annotate 'line', 5208
getattribute $P12, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P12, " ]", $S1)
.annotate 'line', 5209
le $I1, 1, __label_27
# {
.annotate 'line', 5210
getattribute $P13, self, 'value'
__ARG_1.'say'($S2, ".'", $P13, "'()")
# }
__label_27: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 5214
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 5215
# predefined elements
elements $I4, $P4
sub $I3, $I4, 1
$S3 = $P4[$I3]
.annotate 'line', 5216
$P9 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 5219
# var id: $P5
getattribute $P10, self, 'owner'
getattribute $P11, self, 'value'
$P5 = $P10.'getvar'($P11)
.annotate 'line', 5220
unless_null $P5, __label_28
# {
.annotate 'line', 5222
# var cl: $P6
getattribute $P12, self, 'owner'
getattribute $P13, self, 'value'
$P6 = $P12.'checkclass'($P13)
.annotate 'line', 5223
if_null $P6, __label_30
# {
.annotate 'line', 5224
$P9 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
# }
goto __label_31
__label_30: # else
# {
.annotate 'line', 5227
$P9 = self.'dowarnings'()
if_null $P9, __label_32
unless $P9 goto __label_32
.annotate 'line', 5228
'Warn'('Checking: new unknown type')
__label_32: # endif
.annotate 'line', 5229
getattribute $P9, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P9, "']", $S1)
# }
__label_31: # endif
.annotate 'line', 5231
getattribute $P9, self, 'value'
set $S3, $P9
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 5235
$P9 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P9, "", $S1)
# }
__label_29: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 5239
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 5241
isgt $I3, $I1, 1
if $I3 goto __label_34
isgt $I3, $I1, 0
unless $I3 goto __label_35
iseq $I3, $I2, 1
__label_35:
__label_34:
unless $I3 goto __label_33
# {
.annotate 'line', 5242
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5243
iter $P14, $P1
set $P14, 0
__label_36: # for iteration
unless $P14 goto __label_37
shift $P8, $P14
# {
.annotate 'line', 5244
# string reg: $S5
$P9 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P9, __label_38
set $S5, $P9
__label_38:
.annotate 'line', 5245
$P7.'push'($S5)
# }
goto __label_36
__label_37: # endfor
.annotate 'line', 5247
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5248
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 5249
__ARG_1.'say'(")")
.annotate 'line', 5250
not $I3, __ARG_3
unless $I3 goto __label_39
.annotate 'line', 5251
__ARG_1.'emitset'(__ARG_2, $S2)
__label_39: # endif
# }
__label_33: # endif
# }
.annotate 'line', 5253

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5254
# Body
# {
.annotate 'line', 5256
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5257

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5104
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5106
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5266
# Body
# {
.annotate 'line', 5268
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5269
setattribute self, 'owner', __ARG_2
.annotate 'line', 5270
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5271
setattribute self, 'nskey', $P1
.annotate 'line', 5272
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5273
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5274
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5276
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5277

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5278
# Body
# {
.annotate 'line', 5280
# string reginit: $S1
null $S1
.annotate 'line', 5281
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5282
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5283
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
.annotate 'line', 5287
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5288
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 5291
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 5293
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 5294
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5295
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 5296
__ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5297
null $P4
$P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5298
if_null $S1, __label_7
.annotate 'line', 5299
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 5300
__ARG_1.'say'()
# }
.annotate 'line', 5301

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5262
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5264
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5310
# Body
# {
.annotate 'line', 5312
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5313
setattribute self, 'owner', __ARG_2
.annotate 'line', 5314
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5315
setattribute self, 'nskey', $P1
.annotate 'line', 5316
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5317
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5318
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5320
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5321

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5322
# Body
# {
.annotate 'line', 5324
# string reginit: $S1
null $S1
.annotate 'line', 5325
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5327
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5328
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 5329
le $I1, 0, __label_3
.annotate 'line', 5330
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 5331
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 5332
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 5333
getattribute $P5, self, 'owner'
$P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5334
__ARG_1.'say'()
.annotate 'line', 5336
le $I1, 0, __label_4
# {
.annotate 'line', 5337
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5338
iter $P6, $P1
set $P6, 0
__label_5: # for iteration
unless $P6 goto __label_6
shift $P4, $P6
# {
.annotate 'line', 5339
# string reg: $S3
$P5 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 5340
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 5342
# string constructor: $S4
$P5 = $P2.'last'()
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
.annotate 'line', 5343
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5344
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 5345
__ARG_1.'say'(")")
.annotate 'line', 5346
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 5348

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5306
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5308
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5353
# Body
# {
.annotate 'line', 5355
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5357
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5359
new $P5, [ 'CallExpr' ]
.annotate 'line', 5360
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5359
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5362
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5364
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5366
$P3 = $P1.'isidentifier'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 5369
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5370
__ARG_1.'unget'($P2)
.annotate 'line', 5371
$P3 = $P2.'isop'('.')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 5373
new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P4, $P5
.return($P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5377
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
.annotate 'line', 5382
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5384

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5393
# Body
# {
.annotate 'line', 5395
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5396
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5397
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5398

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5399
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5400
# Body
# {
.annotate 'line', 5402
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5403
# string checkedval: $S1
null $S1
.annotate 'line', 5404
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5405
$P3 = $P1.'getidentifier'()
set $S1, $P3
.annotate 'line', 5406
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
# }
goto __label_1
__label_0: # else
.annotate 'line', 5409
set $S1, $P1
__label_1: # endif
.annotate 'line', 5410
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5411
self.'annotate'(__ARG_1)
.annotate 'line', 5412
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5413

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5388
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5390
addattribute $P0, 'lexpr'
.annotate 'line', 5391
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5428
# Body
# {
.annotate 'line', 5430
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5431
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5432
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5433
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5434
.return(self)
# }
.annotate 'line', 5435

.end # set


.sub 'optimize' :method

.annotate 'line', 5436
# Body
# {
.annotate 'line', 5438
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5439
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
.annotate 'line', 5441
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5443
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5445
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5446
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5447
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5449

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5453

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5454
# Body
# {
.annotate 'line', 5456
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5457
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5458
getattribute $P1, self, 'condition'
$P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5459
getattribute $P1, self, 'etrue'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5460
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5461
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5462
getattribute $P1, self, 'efalse'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5463
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5464

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5418
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5424
addattribute $P0, 'condition'
.annotate 'line', 5425
addattribute $P0, 'etrue'
.annotate 'line', 5426
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

.annotate 'line', 5505
# Body
# {
.annotate 'line', 5507
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
.annotate 'line', 5508
.return(1)
__label_3: # case
.annotate 'line', 5509
.return(2)
__label_4: # case
.annotate 'line', 5510
.return(3)
__label_1: # default
.annotate 'line', 5511
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5513

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5515
# Body
# {
.annotate 'line', 5517
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
.annotate 'line', 5518
.return(8)
__label_3: # case
.annotate 'line', 5519
.return(11)
__label_4: # case
.annotate 'line', 5520
.return(9)
__label_5: # case
.annotate 'line', 5521
.return(10)
__label_1: # default
.annotate 'line', 5523
$P2 = __ARG_1.'iskeyword'('delete')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(31)
goto __label_7
__label_6: # else
.annotate 'line', 5524
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5526

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5528
# Body
# {
.annotate 'line', 5530
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
.annotate 'line', 5531
.return(19)
__label_3: # case
.annotate 'line', 5532
.return(20)
__label_4: # case
.annotate 'line', 5533
.return(21)
__label_5: # case
.annotate 'line', 5534
.return(22)
__label_1: # default
.annotate 'line', 5535
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5537

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5539
# Body
# {
.annotate 'line', 5541
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5542
.return(28)
__label_3: # case
.annotate 'line', 5543
.return(29)
__label_1: # default
.annotate 'line', 5544
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5546

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5548
# Body
# {
.annotate 'line', 5550
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
.annotate 'line', 5551
.return(14)
__label_3: # case
.annotate 'line', 5552
.return(16)
__label_4: # case
.annotate 'line', 5553
.return(15)
__label_5: # case
.annotate 'line', 5554
.return(17)
__label_1: # default
.annotate 'line', 5556
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5557
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5559

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5561
# Body
# {
.annotate 'line', 5563
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
.annotate 'line', 5564
.return(12)
__label_3: # case
.annotate 'line', 5565
.return(13)
__label_4: # case
.annotate 'line', 5566
.return(25)
__label_5: # case
.annotate 'line', 5567
.return(26)
__label_1: # default
.annotate 'line', 5568
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5570

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5572
# Body
# {
.annotate 'line', 5574
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
.annotate 'line', 5575
.return(4)
__label_3: # case
.annotate 'line', 5576
.return(5)
__label_4: # case
.annotate 'line', 5577
.return(6)
__label_5: # case
.annotate 'line', 5578
.return(18)
__label_6: # case
.annotate 'line', 5579
.return(23)
__label_7: # case
.annotate 'line', 5580
.return(24)
__label_8: # case
.annotate 'line', 5581
.return(30)
__label_1: # default
.annotate 'line', 5582
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5584

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5586
# Body
# {
.annotate 'line', 5588
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5590
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5591
# var expr: $P2
null $P2
.annotate 'line', 5592
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5593
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5594
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5595
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5597
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5598
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5599
$P4 = $P1.'isop'('{')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 5600
new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 5601
$P4 = $P1.'iskeyword'('new')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5602
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5603
$P4 = $P1.'isstring'()
if_null $P4, __label_4
unless $P4 goto __label_4
.annotate 'line', 5604
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_4: # endif
.annotate 'line', 5605
$P4 = $P1.'isint'()
if_null $P4, __label_5
unless $P4 goto __label_5
.annotate 'line', 5606
new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_5: # endif
.annotate 'line', 5607
$P4 = $P1.'isfloat'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5608
new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_6: # endif
.annotate 'line', 5609
$P4 = $P1.'iskeyword'('function')
if_null $P4, __label_7
unless $P4 goto __label_7
.annotate 'line', 5610
new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_7: # endif
.annotate 'line', 5611
$P4 = $P1.'isidentifier'()
if_null $P4, __label_8
unless $P4 goto __label_8
.annotate 'line', 5612
new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_8: # endif
.annotate 'line', 5613
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5614

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5616
# Body
# {
.annotate 'line', 5618
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5619
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5621
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5622
# var t: $P2
null $P2
.annotate 'line', 5623
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5624
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5625
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
.annotate 'line', 5627
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5630
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5633
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5636
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5639
__ARG_1.'unget'($P2)
.annotate 'line', 5640
.return($P1)
# }
.annotate 'line', 5641

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5643
# Body
# {
.annotate 'line', 5645
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5647
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5648
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5649
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5650
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5651
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5652
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5655
__ARG_1.'unget'($P2)
.annotate 'line', 5656
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5658

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5660
# Body
# {
.annotate 'line', 5662
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5663
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5664
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5666
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5667
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5668
# var subexpr: $P2
null $P2
.annotate 'line', 5669
eq $I1, 0, __label_0
# {
.annotate 'line', 5670
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5671
# var oper: $P3
null $P3
.annotate 'line', 5672
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
.annotate 'line', 5674
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5677
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5680
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5683
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5686
new $P3, [ 'OpDeleteExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5689
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5691
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5694
__ARG_1.'unget'($P1)
.annotate 'line', 5695
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5697
.return($P2)
# }
.annotate 'line', 5698

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5700
# Body
# {
.annotate 'line', 5702
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5703
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5705
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5706
# var t: $P2
null $P2
.annotate 'line', 5707
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5708
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5709
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5710
# var aux: $P4
null $P4
.annotate 'line', 5711
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
.annotate 'line', 5713
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5716
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5719
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5722
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5725
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5727
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5728
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5730
__ARG_1.'unget'($P2)
.annotate 'line', 5731
.return($P1)
# }
.annotate 'line', 5732

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5734
# Body
# {
.annotate 'line', 5736
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5738
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5739
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5740
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5741
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5742
# var expr: $P4
null $P4
.annotate 'line', 5743
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5744
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5746
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
.annotate 'line', 5747
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5749
__ARG_1.'unget'($P2)
.annotate 'line', 5750
.return($P1)
# }
.annotate 'line', 5751

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5753
# Body
# {
.annotate 'line', 5755
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5757
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5758
# var rexpr: $P2
null $P2
.annotate 'line', 5759
# var t: $P3
null $P3
.annotate 'line', 5760
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5761
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5762
set $I2, $I1
set $I3, 28
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5764
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5765
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5768
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5769
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5772
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5775
__ARG_1.'unget'($P3)
.annotate 'line', 5776
.return($P1)
# }
.annotate 'line', 5777

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5779
# Body
# {
.annotate 'line', 5781
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5782
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5784
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5785
# var rexpr: $P2
null $P2
.annotate 'line', 5786
# var t: $P3
null $P3
.annotate 'line', 5787
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5788
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5789
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
.annotate 'line', 5791
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5792
new $P7, [ 'OpLessExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5795
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5796
new $P8, [ 'OpGreaterExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5799
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5800
new $P9, [ 'OpLessEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5803
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5804
new $P10, [ 'OpGreaterEqualExpr' ]
$P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_8: # case
.annotate 'line', 5807
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5810
'InternalError'('Invalid code in parseExpr_9', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5813
__ARG_1.'unget'($P3)
.annotate 'line', 5814
.return($P1)
# }
.annotate 'line', 5815

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5817
# Body
# {
.annotate 'line', 5819
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5820
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5822
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5823
# var rexpr: $P2
null $P2
.annotate 'line', 5824
# var t: $P3
null $P3
.annotate 'line', 5825
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5826
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5827
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
.annotate 'line', 5829
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5830
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5833
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5834
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5837
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5838
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5841
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5842
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_3: # default
.annotate 'line', 5845
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5848
__ARG_1.'unget'($P3)
.annotate 'line', 5849
.return($P1)
# }
.annotate 'line', 5850

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5852
# Body
# {
.annotate 'line', 5854
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5856
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5857
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5858
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5859
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5860
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5862
__ARG_1.'unget'($P2)
.annotate 'line', 5863
.return($P1)
# }
.annotate 'line', 5864

.end # parseExpr_10


.sub 'parseExpr_11'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5866
# Body
# {
.annotate 'line', 5868
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5870
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5871
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5872
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('^')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5873
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5874
new $P5, [ 'OpBinXorExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5876
__ARG_1.'unget'($P2)
.annotate 'line', 5877
.return($P1)
# }
.annotate 'line', 5878

.end # parseExpr_11


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5880
# Body
# {
.annotate 'line', 5882
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 5884
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5885
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5886
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5887
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5888
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5890
__ARG_1.'unget'($P2)
.annotate 'line', 5891
.return($P1)
# }
.annotate 'line', 5892

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5894
# Body
# {
.annotate 'line', 5896
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5898
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5899
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5900
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5901
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5902
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5904
__ARG_1.'unget'($P2)
.annotate 'line', 5905
.return($P1)
# }
.annotate 'line', 5906

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5908
# Body
# {
.annotate 'line', 5910
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5912
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5913
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5914
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5915
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5916
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5918
__ARG_1.'unget'($P2)
.annotate 'line', 5919
.return($P1)
# }
.annotate 'line', 5920

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5922
# Body
# {
.annotate 'line', 5924
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5925
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5927
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5928
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5929
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5930
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5931
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5932
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5933
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5936
__ARG_1.'unget'($P2)
.annotate 'line', 5937
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5939

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5941
# Body
# {
.annotate 'line', 5943
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5944
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5945
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5947
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5948
# var t: $P2
null $P2
.annotate 'line', 5949
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5950
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5951
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5952
# var expr: $P4
null $P4
.annotate 'line', 5953
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
.annotate 'line', 5955
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5958
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5961
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5964
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5967
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5970
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_10: # case
.annotate 'line', 5973
new $P4, [ 'OpModToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5976
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5978
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5979
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5981
__ARG_1.'unget'($P2)
.annotate 'line', 5982
.return($P1)
# }
.annotate 'line', 5983

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5985
# Body
# {
.annotate 'line', 5987
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5989
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5990

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 6003
# Body
# {
.annotate 'line', 6005
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 6006
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 6007
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6008
box $P1, $S1
setattribute self, 'brlabel', $P1
.annotate 'line', 6009
.return($S1)
# }
.annotate 'line', 6010

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6011
# Body
# {
.annotate 'line', 6013
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 6014
unless_null $P1, __label_0
.annotate 'line', 6015
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 6016
.return($P1)
# }
.annotate 'line', 6017

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 6001
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 6024
# Body
# {
.annotate 'line', 6026
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 6027
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 6028
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6029
box $P1, $S1
setattribute self, 'cntlabel', $P1
.annotate 'line', 6030
.return($S1)
# }
.annotate 'line', 6031

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6032
# Body
# {
.annotate 'line', 6034
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 6035
unless_null $P1, __label_0
.annotate 'line', 6036
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 6037
.return($P1)
# }
.annotate 'line', 6038

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 6020
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 6022
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6052
# Body
# {
.annotate 'line', 6054
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6055
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6056
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6057
__ARG_2.'unget'($P1)
.annotate 'line', 6058
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
set $P3, $P4
setattribute self, 'values', $P3
# }
__label_0: # endif
# }
.annotate 'line', 6060

.end # parse


.sub 'optimize' :method

.annotate 'line', 6061
# Body
# {
.annotate 'line', 6063
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6064
if_null $P1, __label_0
.annotate 'line', 6065
$P1 = $P1.'optimize'()
__label_0: # endif
.annotate 'line', 6066
.return(self)
# }
.annotate 'line', 6067

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6068
# Body
# {
.annotate 'line', 6071
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6072
# int n: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined int
$P3 = $P1.'numargs'()
set $I1, $P3
__label_0:
.annotate 'line', 6075
iseq $I2, $I1, 1
unless $I2 goto __label_3
isa $I2, self, 'ReturnStatement'
__label_3:
unless $I2 goto __label_2
# {
.annotate 'line', 6076
# var func: $P2
$P2 = $P1.'getfreearg'(0)
.annotate 'line', 6077
$P3 = $P2.'cantailcall'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 6078
self.'annotate'(__ARG_1)
.annotate 'line', 6079
.tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
__label_4: # endif
# }
__label_2: # endif
.annotate 'line', 6083
le $I1, 0, __label_5
.annotate 'line', 6084
$P1.'getargvalues'(__ARG_1)
__label_5: # endif
.annotate 'line', 6086
self.'annotate'(__ARG_1)
.annotate 'line', 6087
self.'emitret'(__ARG_1)
.annotate 'line', 6088
le $I1, 0, __label_6
.annotate 'line', 6089
$P1.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 6090
__ARG_1.'say'(')')
# }
.annotate 'line', 6091

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6048
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6050
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6096
# Body
# {
.annotate 'line', 6098
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6099

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6100
# Body
# {
.annotate 'line', 6102
__ARG_1.'print'('.return(')
# }
.annotate 'line', 6103

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6094
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6108
# Body
# {
.annotate 'line', 6110
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6111

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6112
# Body
# {
.annotate 'line', 6114
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 6115

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6106
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6126
# Body
# {
.annotate 'line', 6128
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6129
setattribute self, 'name', __ARG_1
.annotate 'line', 6130
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6131
box $P1, $S1
setattribute self, 'value', $P1
# }
.annotate 'line', 6132

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 6133
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6134
# Body
# {
.annotate 'line', 6136
self.'annotate'(__ARG_1)
.annotate 'line', 6137
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6138
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 6139
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6140

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6122
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6124
addattribute $P0, 'name'
.annotate 'line', 6125
addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6152
# Body
# {
.annotate 'line', 6154
setattribute self, 'owner', __ARG_1
.annotate 'line', 6155
box $P1, __ARG_2
setattribute self, 'label', $P1
# }
.annotate 'line', 6156

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 6157
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 6158
# Body
# {
.annotate 'line', 6160
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6161
# string value: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6162
.return($S2)
# }
.annotate 'line', 6163

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6149
addattribute $P0, 'owner'
.annotate 'line', 6150
addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6174
# Body
# {
.annotate 'line', 6176
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6177
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6178
'RequireIdentifier'($P1)
.annotate 'line', 6179
setattribute self, 'label', $P1
.annotate 'line', 6180
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6181

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 6182
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6183
# Body
# {
.annotate 'line', 6185
self.'annotate'(__ARG_1)
.annotate 'line', 6186
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6187
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6188
concat $S3, 'goto ', $S1
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6189

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6170
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6172
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 6198
# Body
# {
.annotate 'line', 6200
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 6201

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6202
# Body
# {
.annotate 'line', 6204
'ExpectOp'('(', __ARG_1)
.annotate 'line', 6205
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 6206
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6207

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6196
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

.annotate 'line', 6218
# Body
# {
.annotate 'line', 6220
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6221
self.'parsecondition'(__ARG_2)
.annotate 'line', 6222
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 6223
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6224
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6225
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 6227
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 6228
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6230

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6231
# Body
# {
.annotate 'line', 6233
self.'optimize_condition'()
.annotate 'line', 6234
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 6235
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 6236
getattribute $P3, self, 'falsebranch'
$P2 = $P3.'optimize'()
setattribute self, 'falsebranch', $P2
.annotate 'line', 6237
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6239
getattribute $P1, self, 'truebranch'
.return($P1)
__label_3: # case
.annotate 'line', 6241
getattribute $P2, self, 'falsebranch'
.return($P2)
__label_1: # default
__label_0: # switch end
.annotate 'line', 6243
.return(self)
# }
.annotate 'line', 6244

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6245
# Body
# {
.annotate 'line', 6247
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 6248
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 6249
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 6250
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 6251
# string elselabel: $S1
set $S1, ''
.annotate 'line', 6252
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 6253
$P3 = self.'genlabel'()
set $S1, $P3
__label_0: # endif
.annotate 'line', 6254
# string endlabel: $S2
$P3 = self.'genlabel'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6255
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 6256
self.'annotate'(__ARG_1)
.annotate 'line', 6257
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6258
$P1.'emit'(__ARG_1)
.annotate 'line', 6260
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 6261
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6262
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6263
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 6265
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6266

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6214
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 6216
addattribute $P0, 'truebranch'
.annotate 'line', 6217
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6276
# Body
# {
.annotate 'line', 6278
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 6279

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6280
# Body
# {
.annotate 'line', 6282
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6283
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6285
self.'annotate'(__ARG_1)
.annotate 'line', 6286
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6287
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6288
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6289
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6290

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6273
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 6275
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6299
# Body
# {
.annotate 'line', 6301
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6302
self.'parsecondition'(__ARG_2)
.annotate 'line', 6303
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6304

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6305
# Body
# {
.annotate 'line', 6307
self.'optimize_condition'()
.annotate 'line', 6308
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6309
.return(self)
# }
.annotate 'line', 6310

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6311
# Body
# {
.annotate 'line', 6313
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6315
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 6318
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 6321
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 6322
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 6324
self.'annotate'(__ARG_1)
.annotate 'line', 6325
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6326
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6327
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 6328
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6329
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 6331

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6297
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

.annotate 'line', 6340
# Body
# {
.annotate 'line', 6342
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6343
self.'parsebody'(__ARG_2)
.annotate 'line', 6344
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6345
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6346

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6347
# Body
# {
.annotate 'line', 6349
self.'optimize_condition'()
.annotate 'line', 6350
# var body: $P1
getattribute $P2, self, 'body'
$P1 = $P2.'optimize'()
.annotate 'line', 6351
$I1 = $P1.'isempty'()
unless $I1 goto __label_1
$P2 = self.'getvalue'()
set $I2, $P2
iseq $I1, $I2, 2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 6352
new $P3, [ 'EmptyStatement' ]
.return($P3)
__label_0: # endif
.annotate 'line', 6353
setattribute self, 'body', $P1
.annotate 'line', 6354
.return(self)
# }
.annotate 'line', 6355

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6356
# Body
# {
.annotate 'line', 6358
# var body: $P1
getattribute $P1, self, 'body'
.annotate 'line', 6359
# int condvalue: $I1
$P2 = self.'getvalue'()
set $I1, $P2
.annotate 'line', 6360
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6362
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 6365
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 6366
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 6367
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 6369
self.'annotate'(__ARG_1)
.annotate 'line', 6370
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6372
$P1.'emit'(__ARG_1)
.annotate 'line', 6373
__ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6374
eq $I1, 2, __label_6
.annotate 'line', 6375
self.'emit_if'(__ARG_1, $S1, $S2)
__label_6: # endif
.annotate 'line', 6376
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 6378

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6338
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

.annotate 'line', 6387
# Body
# {
.annotate 'line', 6389
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6390
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6391

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6392
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6393
# Body
# {
.annotate 'line', 6395
self.'annotate'(__ARG_1)
.annotate 'line', 6396
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6397
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6398

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6385
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6407
# Body
# {
.annotate 'line', 6409
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6410
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6411

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6412
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6413
# Body
# {
.annotate 'line', 6415
self.'annotate'(__ARG_1)
.annotate 'line', 6416
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6417
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6418

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6405
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6432
# Body
# {
.annotate 'line', 6434
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6435
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6436
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6437
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6438
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6439
$P1 = __ARG_2.'get'()
.annotate 'line', 6440
$P3 = $P1.'isop'(')')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6441
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6442
$P1 = __ARG_2.'get'()
.annotate 'line', 6443
$P3 = $P1.'isop'('{')
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 6444
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6445
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P4
.annotate 'line', 6446
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P4
.annotate 'line', 6447
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P4
__label_4: # while
.annotate 'line', 6448
$P1 = __ARG_2.'get'()
$I1 = $P1.'iskeyword'('case')
if $I1 goto __label_5
$I1 = $P1.'iskeyword'('default')
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 6449
$P3 = $P1.'iskeyword'('case')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 6450
getattribute $P4, self, 'case_value'
$P5 = 'parseExpr'(__ARG_2, self)
$P4.'push'($P5)
.annotate 'line', 6451
$P1 = __ARG_2.'get'()
.annotate 'line', 6452
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_8
.annotate 'line', 6453
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6454
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6455
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
.annotate 'line', 6456
__ARG_2.'unget'($P1)
.annotate 'line', 6457
$P3 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P3)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6459
getattribute $P3, self, 'case_st'
$P3.'push'($P2)
.annotate 'line', 6460
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6463
$P1 = __ARG_2.'get'()
.annotate 'line', 6464
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_13
.annotate 'line', 6465
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6466
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
.annotate 'line', 6467
__ARG_2.'unget'($P1)
.annotate 'line', 6468
getattribute $P3, self, 'default_st'
$P4 = 'parseStatement'(__ARG_2, self)
$P3.'push'($P4)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6470
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6473

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6474
# Body
# {
.annotate 'line', 6476
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6477
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6478
getattribute $P2, self, 'case_st'
iter $P5, $P2
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6479
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6480
getattribute $P2, self, 'default_st'
'optimize_array'($P2)
.annotate 'line', 6481
.return(self)
# }
.annotate 'line', 6482

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6483
# Body
# {
.annotate 'line', 6486
# string type: $S1
set $S1, ''
.annotate 'line', 6487
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6488
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6489
ne $S2, 'N', __label_3
.annotate 'line', 6490
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6491
ne $S1, '', __label_4
.annotate 'line', 6492
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6493
eq $S1, $S2, __label_6
.annotate 'line', 6494
set $S1, 'P'
__label_6: # endif
__label_5: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6497
# string reg: $S3
$P8 = self.'tempreg'($S1)
null $S3
if_null $P8, __label_7
set $S3, $P8
__label_7:
.annotate 'line', 6498
getattribute $P10, self, 'condition'
$P8 = $P10.'checkresult'()
set $S9, $P8
ne $S9, $S1, __label_8
.annotate 'line', 6499
getattribute $P11, self, 'condition'
$P11.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6501
# string regcond: $S4
getattribute $P13, self, 'condition'
$P12 = $P13.'emit_get'(__ARG_1)
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
.annotate 'line', 6502
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6506
self.'genbreaklabel'()
.annotate 'line', 6507
# string defaultlabel: $S5
$P8 = self.'genlabel'()
null $S5
if_null $P8, __label_11
set $S5, $P8
__label_11:
.annotate 'line', 6508
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6509
# string regval: $S6
$P8 = self.'tempreg'($S1)
null $S6
if_null $P8, __label_12
set $S6, $P8
__label_12:
.annotate 'line', 6510
getattribute $P8, self, 'case_value'
iter $P14, $P8
set $P14, 0
__label_13: # for iteration
unless $P14 goto __label_14
shift $P3, $P14
# {
.annotate 'line', 6511
# string label: $S7
$P10 = self.'genlabel'()
null $S7
if_null $P10, __label_15
set $S7, $P10
__label_15:
.annotate 'line', 6512
$P2.'push'($S7)
.annotate 'line', 6513
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6514
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6516
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6519
__ARG_1.'comment'('switch')
.annotate 'line', 6520
self.'annotate'(__ARG_1)
.annotate 'line', 6521
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6522
# int n: $I1
set $P8, $P4
set $I1, $P8
# for loop
.annotate 'line', 6523
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6524
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6525
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6526
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6527
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $P6, $P15
.annotate 'line', 6528
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6523
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6531
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6532
getattribute $P8, self, 'default_st'
iter $P16, $P8
set $P16, 0
__label_21: # for iteration
unless $P16 goto __label_22
shift $P7, $P16
.annotate 'line', 6533
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6535
getattribute $P10, self, 'start'
$P8 = self.'getbreaklabel'($P10)
__ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6536

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6425
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6427
addattribute $P0, 'condition'
.annotate 'line', 6428
addattribute $P0, 'case_value'
.annotate 'line', 6429
addattribute $P0, 'case_st'
.annotate 'line', 6430
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6548
# Body
# {
.annotate 'line', 6550
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6551
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6552
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6553
__ARG_2.'unget'($P1)
.annotate 'line', 6554
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6556
$P1 = __ARG_2.'get'()
.annotate 'line', 6557
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 6558
__ARG_2.'unget'($P1)
.annotate 'line', 6559
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6560
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6562
$P1 = __ARG_2.'get'()
.annotate 'line', 6563
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_2
# {
.annotate 'line', 6564
__ARG_2.'unget'($P1)
.annotate 'line', 6565
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P3
.annotate 'line', 6566
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6568
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6569

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6570
# Body
# {
.annotate 'line', 6572
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6573
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6574
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6575
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6576
getattribute $P1, self, 'iteration'
if_null $P1, __label_2
.annotate 'line', 6577
getattribute $P4, self, 'iteration'
$P3 = $P4.'optimize'()
setattribute self, 'iteration', $P3
__label_2: # endif
.annotate 'line', 6578
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6579
.return(self)
# }
.annotate 'line', 6580

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6581
# Body
# {
.annotate 'line', 6583
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6584
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6585
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6586
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6587
.return()
# }
__label_0: # endif
.annotate 'line', 6589
__ARG_1.'comment'('for loop')
.annotate 'line', 6590
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6591
# string breaklabel: $S2
$P1 = self.'genbreaklabel'()
null $S2
if_null $P1, __label_4
set $S2, $P1
__label_4:
.annotate 'line', 6592
# string condlabel: $S3
$P1 = self.'genlabel'()
null $S3
if_null $P1, __label_5
set $S3, $P1
__label_5:
.annotate 'line', 6593
getattribute $P1, self, 'initializer'
if_null $P1, __label_6
.annotate 'line', 6594
getattribute $P2, self, 'initializer'
$P2.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6596
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6597
getattribute $P1, self, 'condexpr'
if_null $P1, __label_7
.annotate 'line', 6598
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6600
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6601
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6602
getattribute $P1, self, 'iteration'
if_null $P1, __label_8
.annotate 'line', 6603
# string unused: $S4
getattribute $P3, self, 'iteration'
$P2 = $P3.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
__label_8: # endif
.annotate 'line', 6604
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6606
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6607

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6543
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6545
addattribute $P0, 'initializer'
.annotate 'line', 6546
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6620
# Body
# {
.annotate 'line', 6622
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6623
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6624
eq __ARG_5, '', __label_1
# {
.annotate 'line', 6625
# string deftype: $S2
$P1 = 'typetoregcheck'(__ARG_5)
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 6626
self.'createvar'($S1, $S2)
.annotate 'line', 6627
box $P1, $S2
setattribute self, 'deftype', $P1
# }
__label_1: # endif
.annotate 'line', 6629
setattribute self, 'varname', __ARG_4
.annotate 'line', 6630
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P2
.annotate 'line', 6631
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6632
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6633

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6634
# Body
# {
.annotate 'line', 6636
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6637
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6638
.return(self)
# }
.annotate 'line', 6639

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6640
# Body
# {
.annotate 'line', 6642
self.'annotate'(__ARG_1)
.annotate 'line', 6643
# string regcont: $S1
null $S1
.annotate 'line', 6644
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6645
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6646
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6647
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6650
getattribute $P3, self, 'container'
$P2 = $P3.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 6651
# var itvar: $P1
getattribute $P2, self, 'varname'
$P1 = self.'getvar'($P2)
.annotate 'line', 6652
# string iterator: $S3
$P2 = self.'createreg'('P')
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6653
# string continuelabel: $S4
$P2 = self.'gencontinuelabel'()
null $S4
if_null $P2, __label_4
set $S4, $P2
__label_4:
.annotate 'line', 6654
# string breaklabel: $S5
$P2 = self.'genbreaklabel'()
null $S5
if_null $P2, __label_5
set $S5, $P2
__label_5:
.annotate 'line', 6655
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6656
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6657
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6658
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6659
$P2 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P2, ', ', $S3)
.annotate 'line', 6660
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 6661
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6662
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6663

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6614
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6616
addattribute $P0, 'deftype'
.annotate 'line', 6617
addattribute $P0, 'varname'
.annotate 'line', 6618
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6668
# Body
# {
.annotate 'line', 6670
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6671
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6672
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6673
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6674
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6676
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6677
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6678
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6679
__ARG_2.'unget'($P3)
.annotate 'line', 6680
__ARG_2.'unget'($P2)
.annotate 'line', 6681
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6683
new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 6684

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6694
# Body
# {
.annotate 'line', 6696
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6697
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6698

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6699
# Body
# {
.annotate 'line', 6701
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6702
.return(self)
# }
.annotate 'line', 6703

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6704
# Body
# {
.annotate 'line', 6706
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6707
self.'annotate'(__ARG_1)
.annotate 'line', 6708
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6690
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6692
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6723
# Body
# {
.annotate 'line', 6725
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6726
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6727
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6728
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6731
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6733
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6734
$P1 = __ARG_2.'get'()
.annotate 'line', 6735
$P2 = $P1.'iskeyword'('catch')
isfalse $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6736
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6737
$P1 = __ARG_2.'get'()
.annotate 'line', 6738
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_3
.annotate 'line', 6739
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6740
$P1 = __ARG_2.'get'()
.annotate 'line', 6741
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_4
# {
.annotate 'line', 6742
# string exname: $S1
$P3 = $P1.'getidentifier'()
null $S1
if_null $P3, __label_5
set $S1, $P3
__label_5:
.annotate 'line', 6743
setattribute self, 'exname', $P1
.annotate 'line', 6744
self.'createvar'($S1, 'P')
.annotate 'line', 6745
$P1 = __ARG_2.'get'()
.annotate 'line', 6746
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_6
.annotate 'line', 6747
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6749
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P3
# }
.annotate 'line', 6750

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6751
# Body
# {
.annotate 'line', 6753
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6754
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6755
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6756
getattribute $P3, self, 'scatch'
$P2 = $P3.'optimize'()
setattribute self, 'scatch', $P2
.annotate 'line', 6757
.return(self)
# }
.annotate 'line', 6758

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6759
# Body
# {
.annotate 'line', 6761
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6762
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6763
# string labelpasthandler: $S3
$P7 = self.'genlabel'()
null $S3
if_null $P7, __label_2
set $S3, $P7
__label_2:
.annotate 'line', 6764
# string exreg: $S4
null $S4
.annotate 'line', 6765
getattribute $P7, self, 'exname'
if_null $P7, __label_3
# {
.annotate 'line', 6766
# var exname: $P1
getattribute $P8, self, 'exname'
$P1 = self.'getvar'($P8)
.annotate 'line', 6767
$P7 = $P1.'getreg'()
set $S4, $P7
# }
goto __label_4
__label_3: # else
.annotate 'line', 6770
$P7 = self.'tempreg'('P')
set $S4, $P7
__label_4: # endif
.annotate 'line', 6772
self.'annotate'(__ARG_1)
.annotate 'line', 6773
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6775
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6776
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6778
getattribute $P7, self, 'modifiers'
if_null $P7, __label_5
# {
.annotate 'line', 6779
# var modiflist: $P2
getattribute $P8, self, 'modifiers'
$P2 = $P8.'getlist'()
.annotate 'line', 6780
iter $P9, $P2
set $P9, 0
__label_6: # for iteration
unless $P9 goto __label_7
shift $P3, $P9
# {
.annotate 'line', 6781
# string modifname: $S5
$P7 = $P3.'getname'()
null $S5
if_null $P7, __label_8
set $S5, $P7
__label_8:
.annotate 'line', 6782
# int nargs: $I1
$P7 = $P3.'numargs'()
set $I1, $P7
.annotate 'line', 6783
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
.annotate 'line', 6786
eq $I1, 1, __label_15
.annotate 'line', 6787
getattribute $P7, self, 'start'
'SyntaxError'('Wrong modifier args', $P7)
__label_15: # endif
.annotate 'line', 6788
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6789
# string argreg: $S6
$P8 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P8, __label_16
set $S6, $P8
__label_16:
.annotate 'line', 6790
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6794
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6795
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6796
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6797
$P7 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P7)
# }
__label_17: # for iteration
.annotate 'line', 6795
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6799
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6800
# string sep: $S7
set $S7, ''
.annotate 'line', 6801
iter $P10, $P5
set $P10, 0
__label_20: # for iteration
unless $P10 goto __label_21
shift $S8, $P10
# {
.annotate 'line', 6802
__ARG_1.'print'($S7, $S8)
.annotate 'line', 6803
set $S7, ', '
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6805
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6808
getattribute $P7, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P7)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6813
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6814
__ARG_1.'comment'('try: begin')
.annotate 'line', 6815
getattribute $P7, self, 'stry'
$P7.'emit'(__ARG_1)
.annotate 'line', 6816
__ARG_1.'comment'('try: end')
.annotate 'line', 6817
__ARG_1.'say'('pop_eh')
.annotate 'line', 6819
self.'annotate'(__ARG_1)
.annotate 'line', 6820
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6822
__ARG_1.'comment'('catch')
.annotate 'line', 6823
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6824
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6825
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6826
__ARG_1.'say'('pop_eh')
.annotate 'line', 6827
getattribute $P7, self, 'scatch'
$P7.'emit'(__ARG_1)
.annotate 'line', 6829
__ARG_1.'comment'('catch end')
.annotate 'line', 6830
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6831

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6716
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6718
addattribute $P0, 'stry'
.annotate 'line', 6719
addattribute $P0, 'modifiers'
.annotate 'line', 6720
addattribute $P0, 'exname'
.annotate 'line', 6721
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6842
# Body
# {
.annotate 'line', 6844
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6845
setattribute self, 'name', __ARG_3
.annotate 'line', 6846
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6847
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6848

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6838
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6840
addattribute $P0, 'name'
.annotate 'line', 6841
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6865
# Body
# {
.annotate 'line', 6867
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6868
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6869
'RequireIdentifier'($P1)
.annotate 'line', 6870
setattribute self, 'name', $P1
.annotate 'line', 6871
# var vdata: $P2
null $P2
.annotate 'line', 6872
# string reg: $S1
null $S1
.annotate 'line', 6874
$P1 = __ARG_2.'get'()
.annotate 'line', 6875
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6877
box $P5, 1
setattribute self, 'typearray', $P5
.annotate 'line', 6878
getattribute $P4, self, 'name'
$P2 = self.'createvar'($P4, 'P')
.annotate 'line', 6879
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6880
$P1 = __ARG_2.'get'()
.annotate 'line', 6881
$P4 = $P1.'isop'(']')
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 6883
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6886
__ARG_2.'unget'($P1)
.annotate 'line', 6887
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P5
.annotate 'line', 6888
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6889
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6894
box $P4, 0
setattribute self, 'typearray', $P4
.annotate 'line', 6895
getattribute $P4, self, 'name'
getattribute $P5, self, 't_reg'
$P2 = self.'createvar'($P4, $P5)
.annotate 'line', 6896
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6897
$P4 = $P1.'isop'('=')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 6899
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P6
.annotate 'line', 6900
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 6904
box $P4, $S1
setattribute self, 'reg', $P4
.annotate 'line', 6905
$P4 = $P1.'isop'('=')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 6906
$P1 = __ARG_2.'get'()
.annotate 'line', 6907
$P4 = $P1.'isop'('[')
isfalse $I1, $P4
unless $I1 goto __label_6
.annotate 'line', 6908
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 6909
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P5
.annotate 'line', 6910
$P1 = __ARG_2.'get'()
.annotate 'line', 6911
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_7
# {
.annotate 'line', 6912
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 6913
# {
.annotate 'line', 6914
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6915
getattribute $P4, self, 'init'
$P4.'push'($P3)
# }
__label_10: # continue
.annotate 'line', 6916
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_9
if $P4 goto __label_8
__label_9: # enddo
.annotate 'line', 6917
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_11
.annotate 'line', 6918
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 6920
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 6922
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6923

.end # parse


.sub 'optimize' :method

.annotate 'line', 6924
# Body
# {
.annotate 'line', 6926
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6927
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6928
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6929
if_null $P1, __label_1
# {
.annotate 'line', 6930
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6931
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6933
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6935
.return(self)
# }
.annotate 'line', 6936

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6937
# Body
# {
.annotate 'line', 6939
self.'annotate'(__ARG_1)
.annotate 'line', 6940
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6941
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6942
# string reg: $S3
getattribute $P4, self, 'reg'
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 6943
# string t_reg: $S4
getattribute $P4, self, 't_reg'
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 6944
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6945
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
__ARG_1.'comment'($S10)
.annotate 'line', 6947
getattribute $P4, self, 'typearray'
set $I3, $P4
ne $I3, 0, __label_4
# {
.annotate 'line', 6948
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6949
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6951
# string itype: $S5
$P5 = $P1.'checkresult'()
null $S5
if_null $P5, __label_9
set $S5, $P5
__label_9:
.annotate 'line', 6952
ne $S5, $S4, __label_10
# {
.annotate 'line', 6953
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6954
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6956
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6959
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_15
# {
.annotate 'line', 6961
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6964
# string ireg: $S6
null $S6
.annotate 'line', 6965
ne $S5, '', __label_17
.annotate 'line', 6966
$P4 = $P1.'emit_get'(__ARG_1)
set $S6, $P4
goto __label_18
__label_17: # else
# {
.annotate 'line', 6968
$P5 = self.'tempreg'($S5)
set $S6, $P5
.annotate 'line', 6969
$P1.'emit'(__ARG_1, $S6)
# }
__label_18: # endif
.annotate 'line', 6971
iseq $I3, $S4, 'S'
unless $I3 goto __label_21
iseq $I3, $S5, 'P'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 6972
# string auxlabel: $S7
$P4 = self.'genlabel'()
null $S7
if_null $P4, __label_22
set $S7, $P4
__label_22:
.annotate 'line', 6973
__ARG_1.'emitnull'($S3)
.annotate 'line', 6974
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6975
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6976
__ARG_1.'emitlabel'($S7)
# }
goto __label_20
__label_19: # else
.annotate 'line', 6979
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
.annotate 'line', 6985
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6986
if_null $P2, __label_23
# {
.annotate 'line', 6988
# string regsize: $S8
$P4 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P4, __label_25
set $S8, $P4
__label_25:
.annotate 'line', 6989
getattribute $P4, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P4, "Array'], ", $S8)
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 6993
getattribute $P4, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P4, "Array']")
# }
__label_24: # endif
.annotate 'line', 6995
if_null $P1, __label_26
# {
.annotate 'line', 6996
# string itemreg: $S9
$P4 = self.'tempreg'($S4)
null $S9
if_null $P4, __label_27
set $S9, $P4
__label_27:
.annotate 'line', 6997
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6998
unless_null $P2, __label_28
# {
.annotate 'line', 6999
le $I1, 0, __label_29
# {
.annotate 'line', 7001
__ARG_1.'emitset'($S3, $I1)
# }
__label_29: # endif
# }
__label_28: # endif
.annotate 'line', 7004
# int i: $I2
null $I2
.annotate 'line', 7005
iter $P6, $P1
set $P6, 0
__label_30: # for iteration
unless $P6 goto __label_31
shift $P3, $P6
# {
.annotate 'line', 7006
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 7007
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 7008
inc $I2
# }
goto __label_30
__label_31: # endfor
# }
__label_26: # endif
# }
__label_5: # endif
# }
.annotate 'line', 7012

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7013
# Body
# {
.annotate 'line', 7015
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 7016

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6855
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6857
addattribute $P0, 'name'
.annotate 'line', 6858
addattribute $P0, 't_reg'
.annotate 'line', 6859
addattribute $P0, 't_name'
.annotate 'line', 6860
addattribute $P0, 't_array'
.annotate 'line', 6861
addattribute $P0, 'reg'
.annotate 'line', 6862
addattribute $P0, 'typearray'
.annotate 'line', 6863
addattribute $P0, 'size'
.annotate 'line', 6864
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7019
# Body
# {
.annotate 'line', 7021
# var next: $P1
null $P1
.annotate 'line', 7022
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 7023
# {
.annotate 'line', 7024
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7025
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 7026
$P1 = __ARG_3.'get'()
# }
__label_2: # continue
.annotate 'line', 7027
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 7028
'RequireOp'(';', $P1)
.annotate 'line', 7029
.return($P2)
# }
.annotate 'line', 7030

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7042
# Body
# {
.annotate 'line', 7045
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7046
box $P1, __ARG_3
setattribute self, 'type', $P1
.annotate 'line', 7047
setattribute self, 'name', __ARG_4
.annotate 'line', 7048
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7049

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 7050
# Body
# {
.annotate 'line', 7052
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 7053
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 7054
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7055
$P1 = $P1.'optimize'()
.annotate 'line', 7056
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7058
getattribute $P4, self, 'start'
.annotate 'line', 7057
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 7060
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7061
setattribute self, 'value', $P1
.annotate 'line', 7062
.return(self)
# }
.annotate 'line', 7063

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 7064
# Body
# {
.annotate 'line', 7066
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7067

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7068
# Body
# {
.annotate 'line', 7070
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7071
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
__ARG_1.'comment'($S2)
# }
.annotate 'line', 7072

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7036
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7038
addattribute $P0, 'type'
.annotate 'line', 7039
addattribute $P0, 'name'
.annotate 'line', 7040
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7075
# Body
# {
.annotate 'line', 7077
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7078
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 7079
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7080
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 7082
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 7083
# {
.annotate 'line', 7084
$P1 = __ARG_2.'get'()
.annotate 'line', 7085
# var name: $P3
set $P3, $P1
.annotate 'line', 7086
'ExpectOp'('=', __ARG_2)
.annotate 'line', 7087
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7089
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 7088
$P2 = 'addtomulti'($P2, $P5)
# }
__label_6: # continue
.annotate 'line', 7090
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_5
if $P5 goto __label_4
__label_5: # enddo
.annotate 'line', 7091
.return($P2)
# }
.annotate 'line', 7092

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 7101
# Body
# {
.annotate 'line', 7103
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7104
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7105
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 7106
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 7107
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 7109
'RequireOp'(';', $P1)
# }
.annotate 'line', 7110

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 7111
# Body
# {
.annotate 'line', 7113
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 7114
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 7115
.return(self)
# }
.annotate 'line', 7116

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 7117
# Body
# {
.annotate 'line', 7119
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7120

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7121
# Body
# {
.annotate 'line', 7123
self.'annotate'(__ARG_1)
.annotate 'line', 7124
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7125
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 7126
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7127
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
__ARG_1.'comment'($S5)
.annotate 'line', 7128
if_null $P1, __label_2
.annotate 'line', 7129
$P2 = $P1.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
.annotate 'line', 7130
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 7131
if_null $P1, __label_4
# {
.annotate 'line', 7132
# string type: $S3
$P2 = $P1.'checkresult'()
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 7133
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
.annotate 'line', 7135
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 7136
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 7138
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 7143
# string value: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_18
set $S4, $P2
__label_18:
.annotate 'line', 7144
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 7147
getattribute $P3, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P3)
__label_8: # default
.annotate 'line', 7149
getattribute $P4, self, 'name'
'SyntaxError'("Invalid var initializer", $P4)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 7153
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 7154

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7098
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 7100
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7159
# Body
# {
.annotate 'line', 7161
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7162
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7163

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7164
# Body
# {
.annotate 'line', 7166
self.'annotate'(__ARG_1)
.annotate 'line', 7167
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7168
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7169
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
__ARG_1.'comment'($S3)
.annotate 'line', 7170
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7171

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7157
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7178
# Body
# {
.annotate 'line', 7180
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7181
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 7182
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7183
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7184

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 7185
# Body
# {
.annotate 'line', 7187
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 7188
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7189

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7190
# Body
# {
.annotate 'line', 7192
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7193
self.'annotate'(__ARG_1)
.annotate 'line', 7194
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7195
# string reg: $S3
getattribute $P1, self, 'reg'
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 7196
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
__ARG_1.'comment'($S4)
.annotate 'line', 7197
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7198

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7174
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 7176
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7201
# Body
# {
.annotate 'line', 7203
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7204
'RequireIdentifier'($P1)
.annotate 'line', 7205
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7206
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7207
$P2 = __ARG_2.'get'()
.annotate 'line', 7208
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 7209
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 7211
__ARG_2.'unget'($P2)
.annotate 'line', 7212
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
.annotate 'line', 7216
__ARG_2.'unget'($P2)
.annotate 'line', 7217
new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P3, $P4
.return($P3)
# }
__label_1: # endif
# }
.annotate 'line', 7219

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7221
# Body
# {
.annotate 'line', 7223
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7224
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7225
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 7226
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7227

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7235
# Body
# {
.annotate 'line', 7237
box $P1, 'S'
setattribute self, 't_reg', $P1
.annotate 'line', 7238
box $P1, 'string'
setattribute self, 't_name', $P1
.annotate 'line', 7239
box $P1, 'String'
setattribute self, 't_array', $P1
.annotate 'line', 7240
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7241

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7242
# Body
# {
.annotate 'line', 7244
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7245

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7233
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7248
# Body
# {
.annotate 'line', 7250
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7251

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7253
# Body
# {
.annotate 'line', 7255
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 7256
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7257

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7265
# Body
# {
.annotate 'line', 7267
box $P1, 'I'
setattribute self, 't_reg', $P1
.annotate 'line', 7268
box $P1, 'int'
setattribute self, 't_name', $P1
.annotate 'line', 7269
box $P1, 'Integer'
setattribute self, 't_array', $P1
.annotate 'line', 7270
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7271

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7272
# Body
# {
.annotate 'line', 7274
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7275

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7263
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7278
# Body
# {
.annotate 'line', 7280
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7281

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7283
# Body
# {
.annotate 'line', 7285
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 7286
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7287

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7295
# Body
# {
.annotate 'line', 7297
box $P1, 'N'
setattribute self, 't_reg', $P1
.annotate 'line', 7299
box $P1, 'float'
setattribute self, 't_name', $P1
.annotate 'line', 7300
box $P1, 'Float'
setattribute self, 't_array', $P1
.annotate 'line', 7301
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7302

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7303
# Body
# {
.annotate 'line', 7305
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7306

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7293
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7309
# Body
# {
.annotate 'line', 7311
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7312

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7314
# Body
# {
.annotate 'line', 7316
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 7317
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7318

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7329
# Body
# {
.annotate 'line', 7331
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7332
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 7333
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 7334
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7335
$P1 = __ARG_2.'get'()
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 7336
__ARG_2.'unget'($P1)
.annotate 'line', 7337
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7338
unless_null $P2, __label_2
.annotate 'line', 7339
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 7340
getattribute $P3, self, 'statements'
$P3.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7342
setattribute self, 'end', $P1
# }
.annotate 'line', 7343

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7344
# Body
# {
.annotate 'line', 7346
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7347
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7348
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7349
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7350
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 7351
.return($S2)
# }
.annotate 'line', 7352

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7353
# Body
# {
.annotate 'line', 7355
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7356
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7357
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7358
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7359
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 7360
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 7361
$P1[$S1] = $S3
.annotate 'line', 7362
.return($S3)
# }
.annotate 'line', 7363

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7364
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7365
# Body
# {
.annotate 'line', 7367
__ARG_1.'comment'('{')
.annotate 'line', 7368
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 7369
$P1.'emit'(__ARG_1)
.annotate 'line', 7370
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 7372
__ARG_1.'comment'('}')
# }
.annotate 'line', 7373

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7324
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 7326
addattribute $P0, 'end'
.annotate 'line', 7327
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7386
# Body
# {
.annotate 'line', 7389
box $P3, 1
setattribute self, 'nreg', $P3
.annotate 'line', 7390
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7391
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7392
setattribute self, 'tempreg', $P1
.annotate 'line', 7393
setattribute self, 'freereg', $P2
# }
.annotate 'line', 7394

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7395
# Body
# {
.annotate 'line', 7397
box $P1, __ARG_1
setattribute self, 'type', $P1
.annotate 'line', 7398
.return(self)
# }
.annotate 'line', 7399

.end # settype


.sub 'createreg' :method

.annotate 'line', 7400
# Body
# {
.annotate 'line', 7402
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7403
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7404
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
.annotate 'line', 7405
assign $P1, $I1
.annotate 'line', 7406
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 7407
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7408
.return($S1)
# }
.annotate 'line', 7409

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7410
# Body
# {
.annotate 'line', 7412
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7413
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7414
# string reg: $S1
null $S1
.annotate 'line', 7415
# predefined elements
elements $I1, $P1
le $I1, 0, __label_0
.annotate 'line', 7416
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
.annotate 'line', 7418
$P4 = self.'createreg'()
set $S1, $P4
__label_1: # endif
.annotate 'line', 7419
$P2.'push'($S1)
.annotate 'line', 7420
.return($S1)
# }
.annotate 'line', 7421

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7422
# Body
# {
.annotate 'line', 7424
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7425
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7426
# int n: $I1
# predefined elements
elements $I1, $P2
# for loop
.annotate 'line', 7427
# int i: $I2
sub $I2, $I1, 1
__label_2: # for condition
lt $I2, 0, __label_1
# {
.annotate 'line', 7428
# string s: $S1
$S1 = $P2[$I2]
.annotate 'line', 7429
$P1.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 7427
dec $I2
goto __label_2
__label_1: # for end
.annotate 'line', 7431
assign $P2, 0
# }
.annotate 'line', 7432

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7382
addattribute $P0, 'type'
.annotate 'line', 7383
addattribute $P0, 'nreg'
.annotate 'line', 7384
addattribute $P0, 'tempreg'
.annotate 'line', 7385
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7456
# Body
# {
.annotate 'line', 7458
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7459
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
.annotate 'line', 7460
box $P1, 0
setattribute self, 'nlabel', $P1
.annotate 'line', 7461
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 7462
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 7463
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('S')
setattribute self, 'regstS', $P2
.annotate 'line', 7464
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('P')
setattribute self, 'regstP', $P2
# }
.annotate 'line', 7465

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7467
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7468
# Body
# {
.annotate 'line', 7471
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7472
unless_null $P1, __label_0
# {
.annotate 'line', 7473
$P1 = self.'generatesubid'()
.annotate 'line', 7474
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7476
.return($P1)
# }
.annotate 'line', 7477

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7479
# Body
# {
.annotate 'line', 7481
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7482
.return($I1)
# }
.annotate 'line', 7483

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7484
# Body
# {
.annotate 'line', 7486
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7487
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7488
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7489
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7490
# {
.annotate 'line', 7491
$P2 = __ARG_1.'get'()
.annotate 'line', 7492
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7493
eq $S1, '', __label_5
.annotate 'line', 7494
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
.annotate 'line', 7496
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7497
# string argname: $S2
# predefined string
$P5 = self.'getparamnum'()
set $S4, $P5
concat $S2, '__ARG_', $S4
.annotate 'line', 7498
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7500
# string varname: $S3
set $P5, $P2
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 7501
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7502
$P3['name'] = $S3
.annotate 'line', 7503
$P2 = __ARG_1.'get'()
.annotate 'line', 7504
$P5 = $P2.'isop'('[')
if_null $P5, __label_8
unless $P5 goto __label_8
# {
.annotate 'line', 7505
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7506
$P3['modifiers'] = $P4
.annotate 'line', 7507
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7509
$P1.'push'($P3)
# }
__label_3: # continue
.annotate 'line', 7510
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 7511
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_9
.annotate 'line', 7512
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7514

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7516
# Body
# {
.annotate 'line', 7518
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7519
unless_null $P1, __label_0
.annotate 'line', 7520
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7522
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 7523

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7525
# Body
# {
.annotate 'line', 7527
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7528
.return(self)
# }
.annotate 'line', 7529

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7531
# Body
# {
.annotate 'line', 7533
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7534
unless_null $P1, __label_0
# {
.annotate 'line', 7535
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7536
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7538
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7539

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7540
# Body
# {
.annotate 'line', 7542
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7543
unless_null $P1, __label_0
# {
.annotate 'line', 7544
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7545
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7547
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7548

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7549
# Body
# {
.annotate 'line', 7553
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7554
# string lexname: $S1
null $S1
.annotate 'line', 7555
if_null $P1, __label_0
.annotate 'line', 7556
set $S1, $P1
goto __label_1
__label_0: # else
# {
.annotate 'line', 7558
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7559
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7560
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7561
self.'setlex'($S1, $S2)
.annotate 'line', 7562
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7564
.return($S1)
# }
.annotate 'line', 7565

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7567
# Body
# {
.annotate 'line', 7569
# var store: $P1
null $P1
.annotate 'line', 7570
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
.annotate 'line', 7572
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7574
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7576
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7578
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7580
concat $S4, 'Invalid type in createreg: ', __ARG_1
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7582
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7583
.return($S1)
# }
.annotate 'line', 7584

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7585
# Body
# {
.annotate 'line', 7587
# var store: $P1
null $P1
.annotate 'line', 7588
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
.annotate 'line', 7590
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7592
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7594
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7596
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7598
concat $S4, "Invalid type '", __ARG_1
concat $S4, $S4, "' in tempreg"
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7600
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7601
.return($S1)
# }
.annotate 'line', 7602

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7603
# Body
# {
.annotate 'line', 7605
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
.annotate 'line', 7606
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7607

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7608
# Body
# {
.annotate 'line', 7610
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7611
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7612
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
.annotate 'line', 7613
assign $P1, $I1
.annotate 'line', 7614
.return($S1)
# }
.annotate 'line', 7615

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7616
# Body
# {
.annotate 'line', 7618
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7619

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7620
# Body
# {
.annotate 'line', 7622
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7623

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7625
# Body
# {
.annotate 'line', 7627
# string name: $S1
getattribute $P20, self, 'name'
null $S1
if_null $P20, __label_0
set $S1, $P20
__label_0:
.annotate 'line', 7628
__ARG_1.'say'()
.annotate 'line', 7629
__ARG_1.'print'(".sub ")
.annotate 'line', 7630
$P20 = self.'isanonymous'()
if_null $P20, __label_1
unless $P20 goto __label_1
.annotate 'line', 7631
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7633
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7634
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7635
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7636
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7637
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7638
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7639
if_null $P2, __label_5
.annotate 'line', 7640
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7644
$P20 = self.'ismethod'()
if_null $P20, __label_6
unless $P20 goto __label_6
.annotate 'line', 7645
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7646
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7647
if_null $P3, __label_7
# {
.annotate 'line', 7648
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7649
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7650
# int nargmods: $I1
$P20 = $P5.'numargs'()
set $I1, $P20
.annotate 'line', 7651
$P20 = $P5.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 7652
le $I1, 0, __label_11
# {
.annotate 'line', 7653
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7654
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7655
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7656
$P20 = $P6.'isstringliteral'()
isfalse $I5, $P20
unless $I5 goto __label_15
.annotate 'line', 7657
getattribute $P21, $P6, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_15: # endif
.annotate 'line', 7658
$P20 = $P6.'getPirString'()
__ARG_1.'print'($P20)
# }
__label_12: # for iteration
.annotate 'line', 7654
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7660
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
.annotate 'line', 7665
ne $S1, 'main', __label_16
.annotate 'line', 7666
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7668
__ARG_1.'say'()
.annotate 'line', 7670
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7671
# var param: $P8
null $P8
.annotate 'line', 7672
# string paramname: $S2
null $S2
.annotate 'line', 7673
# var a: $P9
null $P9
.annotate 'line', 7675
iter $P23, $P7
set $P23, 0
__label_17: # for iteration
unless $P23 goto __label_18
shift $P8, $P23
# {
.annotate 'line', 7676
$S2 = $P8['name']
.annotate 'line', 7677
$P9 = self.'getvar'($S2)
.annotate 'line', 7678
# string ptype: $S3
$P21 = $P9.'gettype'()
$P20 = 'typetopirname'($P21)
null $S3
if_null $P20, __label_19
set $S3, $P20
__label_19:
.annotate 'line', 7679
$P20 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7680
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7681
if_null $P10, __label_20
# {
.annotate 'line', 7682
# var named: $P11
null $P11
.annotate 'line', 7683
# var slurpy: $P12
null $P12
.annotate 'line', 7684
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7685
iter $P24, $P13
set $P24, 0
__label_21: # for iteration
unless $P24 goto __label_22
shift $P14, $P24
# {
.annotate 'line', 7686
# string modname: $S4
$P20 = $P14.'getname'()
null $S4
if_null $P20, __label_23
set $S4, $P20
__label_23:
.annotate 'line', 7687
set $S8, $S4
set $S9, 'named'
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
.annotate 'line', 7689
set $P11, $P14
goto __label_24 # break
__label_27: # case
.annotate 'line', 7692
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 7695
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7698
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7703
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7706
if_null $P11, __label_31
# {
.annotate 'line', 7707
# string setname: $S5
null $S5
.annotate 'line', 7708
# int nargs: $I3
$P20 = $P11.'numargs'()
set $I3, $P20
.annotate 'line', 7709
set $I5, $I3
null $I6
if $I5 == $I6 goto __label_35
set $I6, 1
if $I5 == $I6 goto __label_36
goto __label_34
# switch
__label_35: # case
.annotate 'line', 7711
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7714
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7715
$P20 = $P15.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_37
.annotate 'line', 7716
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_37: # endif
.annotate 'line', 7717
$P25 = $P15.'getPirString'()
set $S5, $P25
goto __label_33 # break
__label_34: # default
.annotate 'line', 7720
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_33: # switch end
.annotate 'line', 7722
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7724
if_null $P12, __label_38
# {
.annotate 'line', 7725
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7729
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7731
__ARG_1.'say'()
.annotate 'line', 7732
getattribute $P20, self, 'start'
__ARG_1.'annotate'($P20)
.annotate 'line', 7735
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7736
if_null $P16, __label_39
# {
.annotate 'line', 7738
iter $P27, $P16
set $P27, 0
__label_40: # for iteration
unless $P27 goto __label_41
shift $S6, $P27
.annotate 'line', 7739
$P20 = $P16[$S6]
__ARG_1.'say'(".lex '", $P20, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7742
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7743
if_null $P16, __label_42
# {
.annotate 'line', 7745
iter $P28, $P16
set $P28, 0
__label_43: # for iteration
unless $P28 goto __label_44
shift $S7, $P28
.annotate 'line', 7746
$P20 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P20, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7749
# var body: $P17
getattribute $P17, self, 'body'
.annotate 'line', 7750
$P20 = $P17.'isempty'()
if_null $P20, __label_45
unless $P20 goto __label_45
.annotate 'line', 7751
__ARG_1.'comment'('Empty body')
goto __label_46
__label_45: # else
# {
.annotate 'line', 7753
__ARG_1.'comment'('Body')
.annotate 'line', 7754
$P17.'emit'(__ARG_1)
.annotate 'line', 7755
$P20 = $P17.'getend'()
__ARG_1.'annotate'($P20)
# }
__label_46: # endif
.annotate 'line', 7757
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7760
# var localfun: $P18
getattribute $P18, self, 'localfun'
.annotate 'line', 7761
if_null $P18, __label_47
# {
# for loop
.annotate 'line', 7762
# int ifn: $I4
null $I4
__label_50: # for condition
# predefined elements
elements $I5, $P18
ge $I4, $I5, __label_49
# {
.annotate 'line', 7763
# var fn: $P19
$P19 = $P18[$I4]
.annotate 'line', 7764
$P19.'emit'(__ARG_1)
# }
__label_48: # for iteration
.annotate 'line', 7762
inc $I4
goto __label_50
__label_49: # for end
# }
__label_47: # endif
# }
.annotate 'line', 7767

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7439
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7441
addattribute $P0, 'name'
.annotate 'line', 7442
addattribute $P0, 'subid'
.annotate 'line', 7443
addattribute $P0, 'modifiers'
.annotate 'line', 7444
addattribute $P0, 'params'
.annotate 'line', 7445
addattribute $P0, 'body'
.annotate 'line', 7446
addattribute $P0, 'regstI'
.annotate 'line', 7447
addattribute $P0, 'regstN'
.annotate 'line', 7448
addattribute $P0, 'regstS'
.annotate 'line', 7449
addattribute $P0, 'regstP'
.annotate 'line', 7450
addattribute $P0, 'nlabel'
.annotate 'line', 7451
addattribute $P0, 'localfun'
.annotate 'line', 7452
addattribute $P0, 'lexicals'
.annotate 'line', 7453
addattribute $P0, 'usedlexicals'
.annotate 'line', 7454
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7779
# Body
# {
.annotate 'line', 7781
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7782
box $P1, 0
setattribute self, 'paramnum', $P1
.annotate 'line', 7783
box $P1, 0
setattribute self, 'lexnum', $P1
.annotate 'line', 7784
self.'parse'(__ARG_2)
# }
.annotate 'line', 7785

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7787
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7788
# Body
# {
.annotate 'line', 7791
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7792
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7793
assign $P1, $I1
.annotate 'line', 7794
.return($I1)
# }
.annotate 'line', 7795

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7796
# Body
# {
.annotate 'line', 7799
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7800
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7801
assign $P1, $I1
.annotate 'line', 7802
.return($I1)
# }
.annotate 'line', 7803

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7804
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7806
# Body
# {
.annotate 'line', 7808
# var name: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7809
setattribute self, 'name', $P1
.annotate 'line', 7810
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7811
$P5 = $P2.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 7812
# var modifiers: $P3
new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 7813
setattribute self, 'modifiers', $P3
.annotate 'line', 7814
$P2 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7816
'RequireOp'('(', $P2)
.annotate 'line', 7817
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7819
# var fullname: $P4
getattribute $P6, self, 'owner'
$P5 = $P6.'getpath'()
# predefined clone
clone $P4, $P5
.annotate 'line', 7820
$P5 = $P1.'getidentifier'()
$P4.'push'($P5)
.annotate 'line', 7822
new $P6, [ 'StringLiteral' ]
.annotate 'line', 7823
new $P8, [ 'TokenQuoted' ]
getattribute $P9, $P1, 'file'
getattribute $P10, $P1, 'line'
# predefined join
join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
set $P7, $P8
$P6.'StringLiteral'(self, $P7)
set $P5, $P6
.annotate 'line', 7821
self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 7826
$P2 = __ARG_1.'get'()
.annotate 'line', 7827
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 7828
'ExpectedOp'('{', $P2)
__label_1: # endif
.annotate 'line', 7829
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7830
.return(self)
# }
.annotate 'line', 7831

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7774
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7776
addattribute $P0, 'paramnum'
.annotate 'line', 7777
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7840
# Body
# {
.annotate 'line', 7842
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7843
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7844
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7845
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7846
setattribute self, 'name', $P1
.annotate 'line', 7847
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7848
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7849
'RequireOp'('{', $P2)
.annotate 'line', 7850
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
set $P4, $P5
setattribute self, 'body', $P4
.annotate 'line', 7851
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7852

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7853
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7854
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7855
# Body
# {
.annotate 'line', 7857
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7858

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7859
# Body
# {
.annotate 'line', 7862
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7863

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7864
# Body
# {
.annotate 'line', 7867
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7868

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7869
# Body
# {
.annotate 'line', 7871
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7872
unless_null $P1, __label_0
# {
.annotate 'line', 7875
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7876
unless_null $P1, __label_1
# {
.annotate 'line', 7878
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7879
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7880
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7881
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7882
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7883
# string reg: $S2
$P6 = $P1.'getreg'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 7884
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7888
$P6 = $P1.'gettype'()
set $S5, $P6
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P7 = $P1.'isconst'()
isfalse $I2, $P7
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7889
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7890
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7891
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7892
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7893
$P6 = $P4.'same_scope_as'($P5)
if_null $P6, __label_10
unless $P6 goto __label_10
# {
.annotate 'line', 7894
# string lexname: $S3
$P7 = $P3.'makelexical'($P1)
null $S3
if_null $P7, __label_11
set $S3, $P7
__label_11:
.annotate 'line', 7895
# int flags: $I1
$P6 = $P1.'isvolatile'()
if_null $P6, __label_13
unless $P6 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7896
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 7897
box $P6, $S3
setattribute $P1, 'lexname', $P6
.annotate 'line', 7898
# string reg: $S4
$P6 = $P1.'getreg'()
null $S4
if_null $P6, __label_14
set $S4, $P6
__label_14:
.annotate 'line', 7899
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
.annotate 'line', 7904
isnull $I2, $P1
not $I2
unless $I2 goto __label_16
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_16:
unless $I2 goto __label_15
.annotate 'line', 7905
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7906
.return($P1)
# }
.annotate 'line', 7907

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7838
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7916
# Body
# {
.annotate 'line', 7918
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7919

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7920
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7914
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

.annotate 'line', 7935
# Body
# {
.annotate 'line', 7937
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 7938

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7939
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7941
# Body
# {
.annotate 'line', 7943
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7944

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7933
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7950
# Body
# {
.annotate 'line', 7952
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7953
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7954

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7955
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7957
# Body
# {
.annotate 'line', 7959
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7960
__ARG_1.'print'($S1)
# }
.annotate 'line', 7961

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7947
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7949
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7968
# Body
# {
.annotate 'line', 7970
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7971
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7972
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7973
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7974
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 7975
$P3 = $P2.'rawstring'()
$P1.'push'($P3)
.annotate 'line', 7976
$P2 = __ARG_1.'get'()
.annotate 'line', 7977
$P3 = $P2.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7978
$P4 = $P2.'checkop'()
set $S1, $P4
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 7980
box $P5, 1
setattribute self, 'hll', $P5
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7984
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7986
# {
.annotate 'line', 7987
$P2 = __ARG_1.'get'()
.annotate 'line', 7988
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_9
.annotate 'line', 7989
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 7990
$P3 = $P2.'rawstring'()
$P1.'push'($P3)
# }
__label_8: # continue
.annotate 'line', 7991
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'(',')
if_null $P3, __label_7
if $P3 goto __label_6
__label_7: # enddo
.annotate 'line', 7992
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 7994
setattribute self, 'key', $P1
# }
.annotate 'line', 7995

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7996
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7997
# Body
# {
# predefined int
.annotate 'line', 7999
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 8000

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8002
# Body
# {
.annotate 'line', 8004
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 8005

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7964
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7966
addattribute $P0, 'key'
.annotate 'line', 7967
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8011
# Body
# {
.annotate 'line', 8013
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8014
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 8015
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 8016
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 8017
$P2 = __ARG_1.'get'()
.annotate 'line', 8018
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 8020
__ARG_1.'unget'($P2)
.annotate 'line', 8021
setattribute self, 'key', $P1
# }
.annotate 'line', 8022

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 8023
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 8025
# Body
# {
.annotate 'line', 8027
# var key: $P1
getattribute $P1, self, 'key'
.annotate 'line', 8028
$P2 = $P1[-1]
.return($P2)
# }
.annotate 'line', 8029

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8031
# Body
# {
.annotate 'line', 8033
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8034
unless_null $P1, __label_0
# {
.annotate 'line', 8035
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8036
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 8037
getattribute $P3, self, 'key'
$P2 = 'getparrotkey'($P3)
__ARG_1.'print'($P2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 8039
$P2 = $P1.'getclasskey'()
__ARG_1.'print'($P2)
__label_1: # endif
# }
.annotate 'line', 8040

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8008
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8010
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8043
# Body
# {
.annotate 'line', 8045
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 8046
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 8047
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 8048
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 8049
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 8050
$P2 = $P1.'isidentifier'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8051
new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_2: # endif
.annotate 'line', 8052
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8053

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8069
# Body
# {
.annotate 'line', 8071
self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8072
setattribute self, 'parent', __ARG_3
.annotate 'line', 8073
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8074
setattribute self, 'functions', $P1
.annotate 'line', 8075
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8076
setattribute self, 'members', $P2
.annotate 'line', 8077
root_new $P13, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P13
.annotate 'line', 8078
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8079
setattribute self, 'constants', $P3
.annotate 'line', 8081
# var name: $P4
$P4 = __ARG_2.'get'()
.annotate 'line', 8082
setattribute self, 'name', $P4
.annotate 'line', 8083
# var classns: $P5
$P12 = __ARG_3.'getpath'()
# predefined clone
clone $P5, $P12
.annotate 'line', 8084
getattribute $P12, self, 'name'
$P5.'push'($P12)
.annotate 'line', 8085
setattribute self, 'classns', $P5
.annotate 'line', 8087
# var t: $P6
$P6 = __ARG_2.'get'()
.annotate 'line', 8088
$P12 = $P6.'isop'(':')
if_null $P12, __label_0
unless $P12 goto __label_0
# {
.annotate 'line', 8089
# var bases: $P7
getattribute $P7, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 8090
# {
.annotate 'line', 8091
# var base: $P8
$P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8092
$P7.'push'($P8)
.annotate 'line', 8093
$P6 = __ARG_2.'get'()
.annotate 'line', 8094
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
.annotate 'line', 8097
'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8098
$P6 = __ARG_2.'get'()
__label_6: # for condition
$P12 = $P6.'isop'('}')
isfalse $I1, $P12
unless $I1 goto __label_5
# {
.annotate 'line', 8099
# string key: $S1
$P13 = $P6.'checkkeyword'()
null $S1
if_null $P13, __label_7
set $S1, $P13
__label_7:
.annotate 'line', 8100
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
.annotate 'line', 8102
# var f: $P9
new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8103
$P1.'push'($P9)
goto __label_8 # break
__label_11: # case
.annotate 'line', 8106
# var name: $P10
$P10 = __ARG_2.'get'()
.annotate 'line', 8107
$P12 = $P10.'isidentifier'()
isfalse $I1, $P12
unless $I1 goto __label_13
.annotate 'line', 8108
'Expected'("member identifier", $P10)
__label_13: # endif
.annotate 'line', 8109
$P2.'push'($P10)
.annotate 'line', 8110
$P6 = __ARG_2.'get'()
.annotate 'line', 8111
$P13 = $P6.'isop'(';')
isfalse $I2, $P13
unless $I2 goto __label_14
.annotate 'line', 8112
'Expected'("';' in member declaration", $P6)
__label_14: # endif
goto __label_8 # break
__label_12: # case
.annotate 'line', 8115
# var cst: $P11
$P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8116
$P3.'push'($P11)
goto __label_8 # break
__label_9: # default
.annotate 'line', 8119
'SyntaxError'("Unexpected item in class", $P6)
__label_8: # switch end
# }
__label_4: # for iteration
.annotate 'line', 8098
$P6 = __ARG_2.'get'()
goto __label_6
__label_5: # for end
# }
.annotate 'line', 8122

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 8123
# Body
# {
.annotate 'line', 8125
getattribute $P1, self, 'classns'
.return($P1)
# }
.annotate 'line', 8126

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 8127
# Body
# {
.annotate 'line', 8129
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8130

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8131
# Body
# {
.annotate 'line', 8133
getattribute $P1, self, 'parent'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8134

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8135
# Body
# {
.annotate 'line', 8137
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8138

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8139
# Body
# {
.annotate 'line', 8141
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8142

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8143
# Body
# {
.annotate 'line', 8145
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8146

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 8147
# Body
# {
.annotate 'line', 8149
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 8150
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 8151
.return(self)
# }
.annotate 'line', 8152

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 8153
# Body
# {
.annotate 'line', 8155
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8156

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8157
# Body
# {
.annotate 'line', 8159
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 8160
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 8161
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 8162
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 8164
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8166
$P5 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P5)
.annotate 'line', 8167
# int n: $I1
set $I1, 1
.annotate 'line', 8168
getattribute $P5, self, 'bases'
iter $P7, $P5
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8169
$P3.'annotate'(__ARG_1)
.annotate 'line', 8170
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 8171
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 8172
getattribute $P5, self, 'parent'
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8173
__ARG_1.'say'()
.annotate 'line', 8174
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 8176
getattribute $P5, self, 'members'
iter $P8, $P5
set $P8, 0
__label_4: # for iteration
unless $P8 goto __label_5
shift $P4, $P8
# {
.annotate 'line', 8177
__ARG_1.'annotate'($P4)
.annotate 'line', 8178
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 8181
__ARG_1.'say'('.end')
# }
.annotate 'line', 8182

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8059
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
get_class $P2, [ 'VarContainer' ]
addparent $P0, $P2
.annotate 'line', 8061
addattribute $P0, 'parent'
.annotate 'line', 8062
addattribute $P0, 'name'
.annotate 'line', 8063
addattribute $P0, 'bases'
.annotate 'line', 8064
addattribute $P0, 'constants'
.annotate 'line', 8065
addattribute $P0, 'functions'
.annotate 'line', 8066
addattribute $P0, 'members'
.annotate 'line', 8067
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8189
# Body
# {
.annotate 'line', 8191
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8192
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 8193
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 8194
'ExpectOp'(';', __ARG_2)
.annotate 'line', 8195
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 8196
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8201
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 8202
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 8203
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 8204
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 8205
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 8206
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_4
push_eh $P9
# try: begin
# {
.annotate 'line', 8207
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 8208
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 8206
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
.annotate 'line', 8213
$P9 = $P5.'is_closed'()
if_null $P9, __label_6
unless $P9 goto __label_6
.annotate 'line', 8214
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 8219
load_bytecode 'PGE.pbc'
.annotate 'line', 8220
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8221
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8223
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
.annotate 'line', 8224
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8225
$P8 = $P7($S4)
.annotate 'line', 8226
# predefined elements
elements $I2, $P8
le $I2, 0, __label_11
# {
.annotate 'line', 8227
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 8228
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 8229
# int ivalue: $I1
null $I1
.annotate 'line', 8230
# predefined substr
substr $S7, $S6, 0, 2
iseq $I2, $S7, '0x'
if $I2 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I2, $S8, '0X'
__label_14:
unless $I2 goto __label_12
.annotate 'line', 8231
# predefined substr
substr $S9, $S6, 2
box $P11, $S9
$P9 = $P11.'to_int'(16)
set $I1, $P9
goto __label_13
__label_12: # else
.annotate 'line', 8233
set $I1, $S6
__label_13: # endif
.annotate 'line', 8236
new $P12, [ 'TokenInteger' ]
getattribute $P13, __ARG_1, 'file'
getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
set $P11, $P12
.annotate 'line', 8235
$P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8234
__ARG_3.'createconst'($S5, 'I', $P9, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 8223
$P9 = $P5.'readline'()
set $S4, $P9
goto __label_9
__label_8: # for end
.annotate 'line', 8240
$P5.'close'()
# }
.annotate 'line', 8241

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8254
# Body
# {
.annotate 'line', 8256
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 8257
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 8258
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P2
.annotate 'line', 8259
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P2
# }
.annotate 'line', 8260

.end # init


.sub 'getpath' :method

.annotate 'line', 8261
# Body
# {
.annotate 'line', 8263
getattribute $P1, self, 'nspath'
.return($P1)
# }
.annotate 'line', 8264

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8265
# Body
# {
.annotate 'line', 8267
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 8268
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 8269
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 8270
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 8271
.return($P4)
# }
.annotate 'line', 8272

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8273
# Body
# {
.annotate 'line', 8277
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
.annotate 'line', 8279
.return($P5)
__label_3: # case
.annotate 'line', 8282
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 8287
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 8288
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 8289
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 8290
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 8291
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 8292
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8293
if_null $P4, __label_8
.annotate 'line', 8294
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 8298
.return($P5)
# }
.annotate 'line', 8299

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8300
# Body
# {
.annotate 'line', 8304
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
.annotate 'line', 8306
.return($P7)
__label_3: # case
.annotate 'line', 8308
# string name: $S1
$S1 = __ARG_1[0]
.annotate 'line', 8310
# var sym: $P1
$P1 = self.'checkclass_base'($S1)
.annotate 'line', 8311
if_null $P1, __label_4
.annotate 'line', 8312
.return($P1)
__label_4: # endif
.annotate 'line', 8313
getattribute $P8, self, 'functions'
iter $P9, $P8
set $P9, 0
__label_5: # for iteration
unless $P9 goto __label_6
shift $P2, $P9
.annotate 'line', 8314
getattribute $P10, $P2, 'name'
set $S3, $P10
ne $S3, $S1, __label_7
.annotate 'line', 8315
.return($P2)
__label_7: # endif
goto __label_5
__label_6: # endfor
null $P11
.annotate 'line', 8316
.return($P11)
__label_1: # default
.annotate 'line', 8321
# var namespaces: $P3
getattribute $P3, self, 'namespaces'
.annotate 'line', 8322
# var childkey: $P4
# predefined clone
clone $P4, __ARG_1
.annotate 'line', 8323
# string basename: $S2
$P12 = $P4.'shift'()
null $S2
if_null $P12, __label_8
set $S2, $P12
__label_8:
.annotate 'line', 8324
iter $P13, $P3
set $P13, 0
__label_9: # for iteration
unless $P13 goto __label_10
shift $P5, $P13
# {
.annotate 'line', 8325
getattribute $P14, $P5, 'name'
set $S4, $P14
ne $S4, $S2, __label_11
# {
.annotate 'line', 8326
# var found: $P6
$P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8327
if_null $P6, __label_12
.annotate 'line', 8328
.return($P6)
__label_12: # endif
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
__label_0: # switch end
null $P7
.annotate 'line', 8332
.return($P7)
# }
.annotate 'line', 8333

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8334
# Body
# {
.annotate 'line', 8336
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8337
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8338
$P1 = __ARG_2.'get'()
.annotate 'line', 8340
# var modifier: $P2
null $P2
.annotate 'line', 8341
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 8342
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 8343
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 8346
'RequireOp'('{', $P1)
.annotate 'line', 8347
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8348
getattribute $P4, self, 'namespaces'
$P4.'push'($P3)
.annotate 'line', 8349
getattribute $P4, self, 'items'
$P4.'push'($P3)
.annotate 'line', 8350
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 8351

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8352
# Body
# {
.annotate 'line', 8354
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 8355
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 8356
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 8357
# var t: $P4
null $P4
# for loop
.annotate 'line', 8358
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 8360
# string key: $S1
$P9 = $P4.'checkkeyword'()
null $S1
if_null $P9, __label_4
set $S1, $P9
__label_4:
.annotate 'line', 8361
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
.annotate 'line', 8363
self.'parsenamespace'($P4, __ARG_1)
goto __label_5 # break
__label_8: # case
.annotate 'line', 8366
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8367
$P1.'push'($P5)
goto __label_5 # break
__label_9: # case
.annotate 'line', 8370
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8371
$P2.'push'($P6)
.annotate 'line', 8372
$P1.'push'($P6)
goto __label_5 # break
__label_10: # case
.annotate 'line', 8375
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8376
$P3.'push'($P7)
.annotate 'line', 8377
$P1.'push'($P7)
goto __label_5 # break
__label_11: # case
.annotate 'line', 8380
$P4 = __ARG_1.'get'()
.annotate 'line', 8381
$P8 = $P4.'iskeyword'('extern')
isfalse $I1, $P8
unless $I1 goto __label_14
.annotate 'line', 8382
'SyntaxError'('Unsupported at nmaespace level', $P4)
__label_14: # endif
.annotate 'line', 8383
$P4 = __ARG_1.'get'()
.annotate 'line', 8384
$P9 = $P4.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_15
.annotate 'line', 8385
'Expected'('string literal', $P4)
__label_15: # endif
.annotate 'line', 8386
# string reqlib: $S2
set $P10, $P4
null $S2
if_null $P10, __label_16
set $S2, $P10
__label_16:
.annotate 'line', 8387
self.'addlib'($S2)
.annotate 'line', 8388
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_12: # case
.annotate 'line', 8391
'include_parrot'($P4, __ARG_1, self)
goto __label_5 # break
__label_13: # case
.annotate 'line', 8394
$P4 = __ARG_1.'get'()
.annotate 'line', 8395
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_17
.annotate 'line', 8396
'Expected'('string literal', $P4)
__label_17: # endif
.annotate 'line', 8397
# string reqload: $S3
set $P12, $P4
null $S3
if_null $P12, __label_18
set $S3, $P12
__label_18:
.annotate 'line', 8398
self.'addload'($S3)
.annotate 'line', 8399
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_6: # default
.annotate 'line', 8402
'SyntaxError'("Unexpected token", $P4)
__label_5: # switch end
# }
__label_0: # for iteration
.annotate 'line', 8358
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
.annotate 'line', 8405
if_null $P4, __label_19
unless $P4 goto __label_19
.annotate 'line', 8406
self.'close_ns'($P4)
goto __label_20
__label_19: # else
.annotate 'line', 8408
self.'unclosed_ns'()
__label_20: # endif
# }
.annotate 'line', 8409

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8410
# Body
# {
.annotate 'line', 8412
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 8413

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8414
# Body
# {
.annotate 'line', 8416
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 8417
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 8419
# int activate: $I1
set $I1, 1
.annotate 'line', 8420
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 8421
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 8422
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
.annotate 'line', 8423
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 8425
unless $I1 goto __label_6
# {
.annotate 'line', 8426
__ARG_1.'say'($S1)
.annotate 'line', 8427
null $I1
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 8429
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 8431

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8245
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 8247
addattribute $P0, 'nspath'
.annotate 'line', 8248
addattribute $P0, 'namespaces'
.annotate 'line', 8249
addattribute $P0, 'classes'
.annotate 'line', 8250
addattribute $P0, 'functions'
.annotate 'line', 8251
addattribute $P0, 'items'
.annotate 'line', 8252
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8446
# Body
# {
.annotate 'line', 8449
# var nspath: $P1
$P2 = __ARG_1.'getpath'()
# predefined clone
clone $P1, $P2
.annotate 'line', 8450
$P1.'push'(__ARG_3)
.annotate 'line', 8451
setattribute self, 'nspath', $P1
.annotate 'line', 8453
setattribute self, 'parent', __ARG_1
.annotate 'line', 8454
setattribute self, 'start', __ARG_2
.annotate 'line', 8455
setattribute self, 'owner', __ARG_1
.annotate 'line', 8456
box $P2, __ARG_3
setattribute self, 'name', $P2
.annotate 'line', 8457
setattribute self, 'modifier', __ARG_4
.annotate 'line', 8458
if_null __ARG_4, __label_0
# {
.annotate 'line', 8459
$P2 = __ARG_4.'pick'('HLL')
if_null $P2, __label_1
.annotate 'line', 8460
getattribute $P4, self, 'name'
setattribute self, 'hll', $P4
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8462

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 8463
# Body
# {
.annotate 'line', 8465
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8466

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8467
# Body
# {
.annotate 'line', 8469
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8470

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8471
# Body
# {
.annotate 'line', 8473
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8474

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8475
# Body
# {
.annotate 'line', 8477
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8478

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8479
# Body
# {
.annotate 'line', 8481
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8482
unless_null $P1, __label_0
.annotate 'line', 8483
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8485
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8486

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8487
# Body
# {
.annotate 'line', 8491
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8492
unless_null $P1, __label_0
.annotate 'line', 8493
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8494
.return($P1)
# }
.annotate 'line', 8495

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8496
# Body
# {
.annotate 'line', 8498
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8499

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8500
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8504
# Body
# {
.annotate 'line', 8506
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8507
if_null $P1, __label_0
# {
.annotate 'line', 8508
$P1 = $P1.'optimize'()
.annotate 'line', 8509
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8511
self.'optimize_base'()
.annotate 'line', 8512
.return(self)
# }
.annotate 'line', 8513

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8514
# Body
# {
.annotate 'line', 8516
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8517
if_null $P1, __label_0
.annotate 'line', 8518
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8520
self.'emit_base'(__ARG_1)
.annotate 'line', 8522
if_null $P1, __label_1
.annotate 'line', 8523
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8524

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8438
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8440
addattribute $P0, 'parent'
.annotate 'line', 8441
addattribute $P0, 'start'
.annotate 'line', 8442
addattribute $P0, 'name'
.annotate 'line', 8443
addattribute $P0, 'modifier'
.annotate 'line', 8444
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8539
# Body
# {
.annotate 'line', 8541
# string nspath: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8542
setattribute self, 'nspath', $P1
.annotate 'line', 8543
setattribute self, 'unit', __ARG_1
.annotate 'line', 8544
root_new $P3, ['parrot';'Hash']
setattribute self, 'predefs_used', $P3
.annotate 'line', 8545
box $P2, 0
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8546

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8547
# Body
# {
.annotate 'line', 8549
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8550
$P1[__ARG_1] = 1
# }
.annotate 'line', 8551

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8552
# Body
# {
.annotate 'line', 8554
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8555
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8556

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8558
# Body
# {
.annotate 'line', 8560
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8561
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8562
inc $I1
.annotate 'line', 8563
assign $P1, $I1
.annotate 'line', 8564
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8565
.return($S1)
# }
.annotate 'line', 8566

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8568
# Body
# {
.annotate 'line', 8570
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8571
unless_null $P1, __label_0
# {
.annotate 'line', 8572
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8573
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8575
$P1[__ARG_1] = 1
# }
.annotate 'line', 8576

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8577
# Body
# {
.annotate 'line', 8579
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8580
unless_null $P1, __label_0
# {
.annotate 'line', 8581
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8582
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8584
$P1[__ARG_1] = 1
# }
.annotate 'line', 8585

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8586
# Body
# {
.annotate 'line', 8588
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8589

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8590
# Body
# {
.annotate 'line', 8593
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8594

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8595
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8599
# Body
# {
.annotate 'line', 8601
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8602

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8603
# Body
# {
.annotate 'line', 8605
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8606

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8607
# Body
# {
.annotate 'line', 8609
self.'optimize_base'()
.annotate 'line', 8610
.return(self)
# }
.annotate 'line', 8611

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8612
# Body
# {
.annotate 'line', 8614
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8617
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8618
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8621
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
.annotate 'line', 8624
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8625
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8626
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8627
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8630
# int somelib: $I1
null $I1
.annotate 'line', 8631
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8632
if_null $P3, __label_4
# {
.annotate 'line', 8633
set $I1, 1
.annotate 'line', 8634
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8635
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8638
# int someload: $I2
null $I2
.annotate 'line', 8639
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8640
if_null $P4, __label_7
# {
.annotate 'line', 8641
set $I2, 1
.annotate 'line', 8642
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8643
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8644
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8645
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
.annotate 'line', 8647
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8648
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8650
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8651

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8531
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8533
addattribute $P0, 'unit'
.annotate 'line', 8534
addattribute $P0, 'predefs_used'
.annotate 'line', 8535
addattribute $P0, 'libs'
.annotate 'line', 8536
addattribute $P0, 'loads'
.annotate 'line', 8537
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8665
# Body
# {
.annotate 'line', 8667
box $P3, 1
setattribute self, 'warnings', $P3
.annotate 'line', 8668
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8671
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8675
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8674
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8673
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8679
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8678
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8677
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8685
new $P4, [ 'StringLiteral' ]
.annotate 'line', 8686
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
.annotate 'line', 8684
$P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8689
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8690

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8691
# Body
# {
.annotate 'line', 8693
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8694

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8695
# Body
# {
# predefined int
.annotate 'line', 8697
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8698

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8699
# Body
# {
.annotate 'line', 8701
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8702

.end # parse


.sub 'optimize' :method

.annotate 'line', 8703
# Body
# {
.annotate 'line', 8705
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8706

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8707
# Body
# {
.annotate 'line', 8709
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8710
__ARG_1.'say'('')
.annotate 'line', 8712
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8714
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8715

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8662
addattribute $P0, 'rootns'
.annotate 'line', 8663
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8722
# Body
# {
.annotate 'line', 8724
set $S2, __ARG_2
ne $S2, 'parse', __label_0
.annotate 'line', 8725
.return(__ARG_1)
__label_0: # endif
.annotate 'line', 8726
# var handleout: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8727
$P1.'open'('__eval__', 'w')
.annotate 'line', 8728
# var emit: $P2
new $P2, [ 'Emit' ]
.annotate 'line', 8729
if_null __ARG_3, __label_1
unless __ARG_3 goto __label_1
.annotate 'line', 8730
$P2.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8731
$P2.'initialize'($P1)
.annotate 'line', 8732
__ARG_1.'emit'($P2)
.annotate 'line', 8733
$P2.'close'()
.annotate 'line', 8734
$P1.'close'()
.annotate 'line', 8735
# string pircode: $S1
$P5 = $P1.'read'(0)
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 8736
# var object: $P3
null $P3
.annotate 'line', 8737
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
.annotate 'line', 8739
new $P3, [ 'String' ]
.annotate 'line', 8740
assign $P3, $S1
goto __label_3 # break
__label_6: # case
__label_7: # case
.annotate 'line', 8744
# var pircomp: $P4
# predefined compreg
compreg $P4, 'PIR'
.annotate 'line', 8745
$P3 = $P4($S1)
goto __label_3 # break
__label_4: # default
.annotate 'line', 8746
# predefined die
.annotate 'line', 8748
die 'Invalid target'
__label_3: # switch end
.annotate 'line', 8750
.return($P3)
# }
.annotate 'line', 8751

.end # __private_compile_tail


.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8752
# Body
# {
.annotate 'line', 8757
unless_null __ARG_2, __label_0
.annotate 'line', 8758
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8759
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8760
$P1.'open'('__eval__', 'w')
.annotate 'line', 8761
$P1.'puts'(__ARG_1)
.annotate 'line', 8762
$P1.'close'()
.annotate 'line', 8763
$P1.'open'('__eval__', 'r')
.annotate 'line', 8764
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8765
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8766
unless __ARG_4 goto __label_1
.annotate 'line', 8767
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8768
$P3.'parse'($P2)
.annotate 'line', 8769
$P1.'close'()
.annotate 'line', 8770
$P3.'optimize'()
.annotate 'line', 8771
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8772

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8773
# Body
# {
.annotate 'line', 8777
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8778
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8779
$P1.'encoding'('utf8')
.annotate 'line', 8780
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8781
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8782
unless __ARG_4 goto __label_0
.annotate 'line', 8783
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8784
$P3.'parse'($P2)
.annotate 'line', 8785
$P1.'close'()
.annotate 'line', 8786
$P3.'optimize'()
.annotate 'line', 8787
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8788
unless __ARG_3 goto __label_1
.annotate 'line', 8789
$P4.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8790
$P4.'initialize'(__ARG_2)
.annotate 'line', 8791
$P3.'emit'($P4)
.annotate 'line', 8792
$P4.'close'()
# }
.annotate 'line', 8793

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8794
# Body
# {
.annotate 'line', 8799
unless_null __ARG_2, __label_0
.annotate 'line', 8800
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8801
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8802
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8803
$P1.'encoding'('utf8')
.annotate 'line', 8804
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8805
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8806
unless __ARG_4 goto __label_1
.annotate 'line', 8807
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8808
$P3.'parse'($P2)
.annotate 'line', 8809
$P1.'close'()
.annotate 'line', 8810
$P3.'optimize'()
.annotate 'line', 8811
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8812

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

.annotate 'line', 8817
# Body
# {
.annotate 'line', 8819
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 8820
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 8821
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8822
$P1.'parse'(__ARG_1)
.annotate 'line', 8824
$P1.'optimize'()
.annotate 'line', 8826
# var handle: $P2
null $P2
.annotate 'line', 8827
ne __ARG_2, '-', __label_1
.annotate 'line', 8828
# predefined getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 8830
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 8831
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8832
unless __ARG_4 goto __label_3
.annotate 'line', 8833
$P3.'disable_annotations'()
__label_3: # endif
.annotate 'line', 8834
$P3.'initialize'($P2)
.annotate 'line', 8835
$P1.'emit'($P3)
.annotate 'line', 8836
$P3.'close'()
.annotate 'line', 8837
$P2.'close'()
# }
.annotate 'line', 8838

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8844
# Body
# {
.annotate 'line', 8846
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8847
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8848

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 8855
# Body
# {
.annotate 'line', 8857
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8858
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8859
$P1.'notOptStop'(1)
.annotate 'line', 8860
$P1.'push_string'('o=s')
.annotate 'line', 8861
$P1.'push_string'('e=s')
.annotate 'line', 8862
$P1.'push_string'('noan')
.annotate 'line', 8863
$P1.'push_string'('nowarn')
.annotate 'line', 8864
$P1.'notOptStop'(1)
.annotate 'line', 8865
__ARG_1.'shift'()
.annotate 'line', 8866
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8867
setattribute self, 'getopts', $P1
.annotate 'line', 8868
setattribute self, 'opts', $P2
# }
.annotate 'line', 8869

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 8870
# Body
# {
.annotate 'line', 8872
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8873
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8874
isnull $I1, $P2
not $I1
.return($I1)
# }
.annotate 'line', 8875

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 8876
# Body
# {
.annotate 'line', 8878
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8879
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8880
if_null $P2, __label_1
# predefined string
set $S1, $P2
goto __label_0
__label_1:
set $S1, __ARG_2
__label_0:
.return($S1)
# }
.annotate 'line', 8881

.end # getstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 8852
addattribute $P0, 'getopts'
.annotate 'line', 8853
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8884
# Body
# {
.annotate 'line', 8886
# var options: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 8887
# string outputfile: $S1
$P4 = $P1.'getstring'('o', '')
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8888
# string expr: $S2
$P4 = $P1.'getstring'('e')
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 8889
# int noan: $I1
$P4 = $P1.'getbool'('noan')
set $I1, $P4
.annotate 'line', 8890
# int warn: $I2
$P4 = $P1.'getbool'('nowarn')
isfalse $I2, $P4
.annotate 'line', 8892
# int argc: $I3
set $P4, __ARG_1
set $I3, $P4
.annotate 'line', 8893
# string filename: $S3
null $S3
.annotate 'line', 8894
# var file: $P2
null $P2
.annotate 'line', 8895
unless_null $S2, __label_2
# {
.annotate 'line', 8896
ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 8897
root_new $P4, ['parrot';'Exception']
$P4['message'] = 'No file'
throw $P4
__label_4: # endif
.annotate 'line', 8899
$S3 = __ARG_1[0]
.annotate 'line', 8900
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'($S3)
.annotate 'line', 8901
$P2.'encoding'('utf8')
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 8904
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8905
new $P2, [ 'StringHandle' ]
.annotate 'line', 8906
$P2.'open'('__eval__', 'w')
.annotate 'line', 8907
$P2.'puts'($S2)
.annotate 'line', 8908
$P2.'close'()
.annotate 'line', 8909
$P2.'open'('__eval__')
.annotate 'line', 8910
set $S3, '__eval__'
# }
__label_3: # endif
.annotate 'line', 8913
# var t: $P3
new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 8915
'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 8917
$P2.'close'()
# }
.annotate 'line', 8918

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 8920
# Body
# {
.annotate 'line', 8922
# int i: $I1
set $I1, 1
.annotate 'line', 8923
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 8924
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 8925
# string subname: $S1
null $S1
.annotate 'line', 8926
if_null $P2, __label_2
# {
.annotate 'line', 8927
set $S1, $P2
.annotate 'line', 8928
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 8929
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
.annotate 'line', 8931
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 8932
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 8933
eq $S3, '', __label_6
# {
.annotate 'line', 8934
# int line: $I2
$I2 = $P3['line']
.annotate 'line', 8935
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
.annotate 'line', 8938

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8940
# Body
# {
.annotate 'line', 8942
# int retval: $I1
null $I1
.annotate 'line', 8943
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 8949
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8943
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8952
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8953
# int type: $I2
$I2 = $P1['type']
.annotate 'line', 8954
set $I3, $I2
set $I4, 556
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 8957
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8958
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 8961
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8962
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
.annotate 'line', 8963
set $I1, 2
__label_2: # switch end
# }
# catch end
__label_1:
.annotate 'line', 8966
# predefined exit
exit $I1
# }
.annotate 'line', 8967

.end # main

# End generated code
