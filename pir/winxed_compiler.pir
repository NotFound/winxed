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
# predefined push
push $P1, __ARG_1
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

.annotate 'line', 915
# Body
# {
.annotate 'line', 917
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 918
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 919
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 920
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 921
'InternalError'('non void predef without {res}')
__label_2: # endif
.annotate 'line', 922
box $P1, __ARG_2
setattribute self, 'body', $P1
.annotate 'line', 923
box $P1, __ARG_1
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 924

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 925
# Body
# {
.annotate 'line', 927
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 928
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 930
# int pos: $I1
null $I1
.annotate 'line', 931
ne $S2, 'v', __label_2
# {
.annotate 'line', 932
isnull $I5, __ARG_3
not $I5
unless $I5 goto __label_5
isne $I5, __ARG_3, ''
__label_5:
unless $I5 goto __label_4
.annotate 'line', 933
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 936
isnull $I5, __ARG_3
if $I5 goto __label_7
iseq $I5, __ARG_3, ''
__label_7:
unless $I5 goto __label_6
.annotate 'line', 937
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 938
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 939
# predefined replace
replace $S1, $S1, $I1, 5, __ARG_3
goto __label_9
__label_8: # endwhile
# }
__label_3: # endif
.annotate 'line', 942
# int n: $I2
set $P1, __ARG_4
set $I2, $P1
# for loop
.annotate 'line', 943
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 944
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 945
# int l: $I4
# predefined length
length $I4, $S3
.annotate 'line', 946
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 947
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 948
# predefined replace
replace $S1, $S1, $I1, $I4, $S4
goto __label_14
__label_13: # endwhile
# }
__label_10: # for iteration
.annotate 'line', 943
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 950
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 951
__ARG_1.'say'($S1)
# }
.annotate 'line', 952

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 913
addattribute $P0, 'body'
.annotate 'line', 914
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 967
# Body
# {
.annotate 'line', 969
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 970
.return($S1)
# }
.annotate 'line', 971

.end # name


.sub 'result' :method

.annotate 'line', 972
# Body
# {
.annotate 'line', 974
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 975

.end # result


.sub 'params' :method

.annotate 'line', 976
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 977
# Body
# {
.annotate 'line', 979
# string type: $S1
null $S1
.annotate 'line', 980
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
.annotate 'line', 981
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 982
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 983
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_5: # case
.annotate 'line', 984
getattribute $P4, self, 'type3'
set $S1, $P4
goto __label_0 # break
__label_1: # default
.annotate 'line', 986
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 988
.return($S1)
# }
.annotate 'line', 989

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 990
# Body
# {
.annotate 'line', 997
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 998
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 999
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 1001
setattribute self, 'body', __ARG_2
__label_1: # endif
.annotate 'line', 1002
box $P1, __ARG_3
setattribute self, 'typeresult', $P1
.annotate 'line', 1003
# int n: $I1
null $I1
.annotate 'line', 1004
if_null __ARG_4, __label_2
# {
.annotate 'line', 1005
box $P1, __ARG_4
setattribute self, 'type0', $P1
.annotate 'line', 1006
set $S1, __ARG_4
set $S2, '*'
if $S1 == $S2 goto __label_5
set $S2, '!'
if $S1 == $S2 goto __label_6
goto __label_4
# switch
__label_5: # case
.annotate 'line', 1008
set $I1, -1
goto __label_3 # break
__label_6: # case
.annotate 'line', 1011
set $I1, -2
.annotate 'line', 1012
if_null __ARG_5, __label_7
.annotate 'line', 1013
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
.annotate 'line', 1016
set $I1, 1
.annotate 'line', 1017
if_null __ARG_5, __label_8
# {
.annotate 'line', 1018
box $P1, __ARG_5
setattribute self, 'type1', $P1
.annotate 'line', 1019
inc $I1
# }
__label_8: # endif
.annotate 'line', 1021
if_null __ARG_6, __label_9
# {
.annotate 'line', 1022
box $P1, __ARG_6
setattribute self, 'type2', $P1
.annotate 'line', 1023
inc $I1
# }
__label_9: # endif
.annotate 'line', 1025
if_null __ARG_7, __label_10
# {
.annotate 'line', 1026
box $P1, __ARG_7
setattribute self, 'type3', $P1
.annotate 'line', 1027
inc $I1
# }
__label_10: # endif
__label_3: # switch end
# }
__label_2: # endif
.annotate 'line', 1031
box $P1, $I1
setattribute self, 'nparams', $P1
.annotate 'line', 1032
.return(self)
# }
.annotate 'line', 1033

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

.annotate 'line', 1034
# Body
# {
.annotate 'line', 1043
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1044
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1045
.return(self)
# }
.annotate 'line', 1046

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1047
# Body
# {
.annotate 'line', 1049
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 1050
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1051
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1052
$P2 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P2
__label_1: # endif
.annotate 'line', 1053
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 1054
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1055

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 957
addattribute $P0, 'name'
.annotate 'line', 958
addattribute $P0, 'body'
.annotate 'line', 959
addattribute $P0, 'evalfun'
.annotate 'line', 960
addattribute $P0, 'typeresult'
.annotate 'line', 961
addattribute $P0, 'type0'
.annotate 'line', 962
addattribute $P0, 'type1'
.annotate 'line', 963
addattribute $P0, 'type2'
.annotate 'line', 964
addattribute $P0, 'type3'
.annotate 'line', 965
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1061
# Body
# {
.annotate 'line', 1063
box $P1, __ARG_1
setattribute self, 'type', $P1
# }
.annotate 'line', 1064

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1065
# Body
# {
.annotate 'line', 1067
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1068
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1069
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1070
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1071
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1072
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1073
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1075
# string arg: $S3
$P2 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 1076
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1078
ne $S3, 'null', __label_7
.annotate 'line', 1079
__ARG_1.'emitnull'(__ARG_3)
goto __label_8
__label_7: # else
.annotate 'line', 1081
__ARG_1.'emitset'(__ARG_3, $S3)
__label_8: # endif
# }
__label_4: # endif
# }
.annotate 'line', 1083

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1060
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1088
# Body
# {
.annotate 'line', 1090
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1091
# int n: $I1
# predefined int
set $I3, __ARG_4
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

.annotate 'line', 1104
# Body
# {
.annotate 'line', 1106
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1107
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1108
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1109
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1110
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1109
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1111
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1112

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

.annotate 'line', 1117
# Body
# {
.annotate 'line', 1119
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1120
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1121
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1122
$P1 = __ARG_4[$I2]
__ARG_1.'emitprint'($P1)
__label_0: # for iteration
.annotate 'line', 1121
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1123

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length' :subid('WSubId_1')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1126
# Body
# {
.annotate 'line', 1128
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1129
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1130
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1131

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1133
# Body
# {
.annotate 'line', 1135
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1136
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1137
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1138

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1140
# Body
# {
.annotate 'line', 1142
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1143
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1144
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1145

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1147
# Body
# {
.annotate 'line', 1149
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1150
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1151
# var argn: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1152
# int n: $I1
getattribute $P3, $P2, 'numval'
set $I1, $P3
.annotate 'line', 1153
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1154

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1156
# Body
# {
.annotate 'line', 1158
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1160
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1161
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1163
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1164
new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 1165

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1167
# Body
# {
.annotate 'line', 1169
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1170
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1171
# string str: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1172
# int pos: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1174
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1175
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1176

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1178
# Body
# {
.annotate 'line', 1180
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1181
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1182
# var arglen: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1183
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1184
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1185
# int len: $I2
getattribute $P5, $P3, 'numval'
set $I2, $P5
.annotate 'line', 1187
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1188
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
set $P5, $P6
.return($P5)
# }
.annotate 'line', 1189

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1191
# Body
# {
.annotate 'line', 1193
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1194
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1195
# string strfrom: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1196
# string strsearch: $S2
$P3 = $P2.'get_value'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 1197
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1198

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1200
# Body
# {
.annotate 'line', 1202
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1203
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1204
# var argpos: $P3
$P4 = __ARG_3[2]
getattribute $P3, $P4, 'arg'
.annotate 'line', 1205
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1206
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1207
# int pos: $I1
getattribute $P4, $P3, 'numval'
set $I1, $P4
.annotate 'line', 1208
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1209

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1211
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
.annotate 'line', 1223
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1224
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1225
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1224
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1223
push $P1, $P12
.annotate 'line', 1228
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1229
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1228
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1223
push $P1, $P16
.annotate 'line', 1232
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1233
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1232
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1223
push $P1, $P20
.annotate 'line', 1236
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1223
push $P1, $P24
.annotate 'line', 1240
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1223
push $P1, $P26
.annotate 'line', 1244
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1223
push $P1, $P28
.annotate 'line', 1248
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1223
push $P1, $P30
.annotate 'line', 1252
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1223
push $P1, $P32
.annotate 'line', 1256
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('getstdin', 'getstdin {res}', 'P')
.annotate 'line', 1223
push $P1, $P34
.annotate 'line', 1260
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('getstdout', 'getstdout {res}', 'P')
.annotate 'line', 1223
push $P1, $P36
.annotate 'line', 1264
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('getstderr', 'getstderr {res}', 'P')
.annotate 'line', 1223
push $P1, $P38
.annotate 'line', 1268
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1223
push $P1, $P40
.annotate 'line', 1273
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1223
push $P1, $P42
.annotate 'line', 1278
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1223
push $P1, $P44
.annotate 'line', 1283
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1223
push $P1, $P46
.annotate 'line', 1289
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1223
push $P1, $P48
.annotate 'line', 1296
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1223
push $P1, $P50
.annotate 'line', 1300
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1300
$P52 = $P53.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1223
push $P1, $P52
.annotate 'line', 1305
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1305
$P54 = $P55.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1223
push $P1, $P54
.annotate 'line', 1310
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1310
$P56 = $P57.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1223
push $P1, $P56
.annotate 'line', 1317
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1317
$P58 = $P59.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1223
push $P1, $P58
.annotate 'line', 1322
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1322
$P60 = $P61.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1223
push $P1, $P60
.annotate 'line', 1327
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1327
$P62 = $P63.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1223
push $P1, $P62
.annotate 'line', 1332
new $P65, [ 'PredefFunction' ]
.annotate 'line', 1332
$P64 = $P65.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1223
push $P1, $P64
.annotate 'line', 1337
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
.annotate 'line', 1223
push $P1, $P66
.annotate 'line', 1341
new $P69, [ 'PredefFunction' ]
.annotate 'line', 1341
$P68 = $P69.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1223
push $P1, $P68
.annotate 'line', 1346
new $P71, [ 'PredefFunction' ]
.annotate 'line', 1346
$P70 = $P71.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1223
push $P1, $P70
.annotate 'line', 1351
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1223
push $P1, $P72
.annotate 'line', 1355
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1223
push $P1, $P74
.annotate 'line', 1359
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1223
push $P1, $P76
.annotate 'line', 1363
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1223
push $P1, $P78
.annotate 'line', 1367
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1223
push $P1, $P80
.annotate 'line', 1371
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1223
push $P1, $P82
.annotate 'line', 1376
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1223
push $P1, $P84
.annotate 'line', 1381
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
.annotate 'line', 1223
push $P1, $P86
.annotate 'line', 1385
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P88
.annotate 'line', 1389
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1223
push $P1, $P90
.annotate 'line', 1393
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P92
.annotate 'line', 1397
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P94
.annotate 'line', 1401
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P96
.annotate 'line', 1405
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P98
.annotate 'line', 1409
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P100
.annotate 'line', 1413
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P102
.annotate 'line', 1417
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P104
.annotate 'line', 1421
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1223
push $P1, $P106
.annotate 'line', 1425
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1223
push $P1, $P108
.annotate 'line', 1429
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1223
push $P1, $P110
.annotate 'line', 1433
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1223
push $P1, $P112
.annotate 'line', 1437
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
.annotate 'line', 1223
push $P1, $P114
.annotate 'line', 1441
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1223
push $P1, $P116
.annotate 'line', 1445
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1223
push $P1, $P118
.annotate 'line', 1449
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1223
push $P1, $P120
.annotate 'line', 1453
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1223
push $P1, $P122
.annotate 'line', 1457
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1223
push $P1, $P124
.annotate 'line', 1461
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1223
push $P1, $P126
.annotate 'line', 1465
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1223
push $P1, $P128
.annotate 'line', 1470
new $P131, [ 'PredefFunction' ]
$P130 = $P131.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1223
push $P1, $P130
.annotate 'line', 1475
new $P133, [ 'PredefFunction' ]
$P132 = $P133.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1223
push $P1, $P132
.annotate 'line', 1479
new $P135, [ 'PredefFunction' ]
$P134 = $P135.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1223
push $P1, $P134
.annotate 'line', 1483
new $P137, [ 'PredefFunction' ]
$P136 = $P137.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1223
push $P1, $P136
.annotate 'line', 1487
new $P139, [ 'PredefFunction' ]
$P138 = $P139.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1223
push $P1, $P138
.annotate 'line', 1491
new $P141, [ 'PredefFunction' ]
$P140 = $P141.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1223
push $P1, $P140
.annotate 'line', 1495
new $P143, [ 'PredefFunction' ]
.annotate 'line', 1496
new $P144, [ 'Predef_print' ]
.annotate 'line', 1495
$P142 = $P143.'set'('print', $P144, 'v', '*')
.annotate 'line', 1223
push $P1, $P142
.annotate 'line', 1499
new $P146, [ 'PredefFunction' ]
.annotate 'line', 1500
new $P147, [ 'Predef_say' ]
.annotate 'line', 1499
$P145 = $P146.'set'('say', $P147, 'v', '*')
.annotate 'line', 1223
push $P1, $P145
.annotate 'line', 1503
new $P149, [ 'PredefFunction' ]
.annotate 'line', 1504
new $P150, [ 'Predef_cry' ]
.annotate 'line', 1503
$P148 = $P149.'set'('cry', $P150, 'v', '*')
.annotate 'line', 1223
push $P1, $P148
__label_1: # Infinite loop
.annotate 'line', 1509
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1510

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1512
# Body
# {
.annotate 'line', 1514
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1515
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1516
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1517
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1518
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1519
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1520
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1522
.return($P2)
# }
.annotate 'line', 1523

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1529
# Body
# {
.annotate 'line', 1531
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1532
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1533
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1532
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1534

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1536
# Body
# {
.annotate 'line', 1538
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1539
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 1540
$P3 = $P2.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 1541
# predefined push
push $P1, $P2
__label_2: # while
.annotate 'line', 1542
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 1543
$P2 = __ARG_1.'get'()
.annotate 'line', 1544
# predefined push
push $P1, $P2
# }
goto __label_2
__label_1: # endwhile
# }
__label_0: # endif
.annotate 'line', 1547
__ARG_1.'unget'($P2)
.annotate 'line', 1548
.return($P1)
# }
.annotate 'line', 1549

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1551
# Body
# {
.annotate 'line', 1553
# string list: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1554
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 1555
$P4 = $P2.'getidentifier'()
# predefined push
push $P1, $P4
goto __label_0
__label_1: # endfor
.annotate 'line', 1556
.return($P1)
# }
.annotate 'line', 1557

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1568
# Body
# {
.annotate 'line', 1570
setattribute self, 'start', __ARG_1
.annotate 'line', 1571
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1572

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1573
# Body
# {
.annotate 'line', 1575
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1576

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1577
# Body
# {
.annotate 'line', 1579
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1580

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1581
# Body
# {
.annotate 'line', 1583
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1584

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1585
# Body
# {
.annotate 'line', 1587
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1588

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1589
# Body
# {
.annotate 'line', 1591
getattribute $P1, self, 'owner'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1592

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1593
# Body
# {
.annotate 'line', 1595
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1596

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1597
# Body
# {
.annotate 'line', 1599
getattribute $P1, self, 'owner'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1600

.end # dowarnings

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1565
addattribute $P0, 'start'
.annotate 'line', 1566
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1613
# Body
# {
.annotate 'line', 1615
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1616

.end # init


.sub 'numargs' :method

.annotate 'line', 1618
# Body
# {
.annotate 'line', 1620
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1621

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1622
# Body
# {
.annotate 'line', 1624
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1625
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1626

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1628
# Body
# {
.annotate 'line', 1630
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1631
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1632
# {
.annotate 'line', 1633
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1634
# predefined push
push $P1, $P3
# }
__label_2: # continue
.annotate 'line', 1635
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1636
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1637

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1639
# Body
# {
.annotate 'line', 1641
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1642
if_null $P1, __label_0
.annotate 'line', 1643
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1644

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1645
# Body
# {
.annotate 'line', 1647
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1648
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1649
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1650
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1651
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1652
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1653
# predefined push
push $P2, $S1
# }
__label_0: # for iteration
.annotate 'line', 1650
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1655
.return($P2)
# }
.annotate 'line', 1656

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1657
# Body
# {
.annotate 'line', 1659
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1660
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1661

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1611
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1673
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1674
# Body
# {
.annotate 'line', 1676
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1677
.return($I1)
# }
.annotate 'line', 1678

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1679
# Body
# {
.annotate 'line', 1681
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1682
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1683
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1685
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1686

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1687
# Body
# {
.annotate 'line', 1689
box $P1, __ARG_1
setattribute self, 'name', $P1
.annotate 'line', 1690
if_null __ARG_2, __label_0
.annotate 'line', 1691
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1692

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1693
# Body
# {
.annotate 'line', 1695
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1696

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1670
addattribute $P0, 'name'
.annotate 'line', 1671
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1703
# Body
# {
.annotate 'line', 1705
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1706
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1707
# {
.annotate 'line', 1708
$P2 = __ARG_1.'get'()
.annotate 'line', 1709
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1710
$P2 = __ARG_1.'get'()
.annotate 'line', 1711
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1712
$P4 = $P2.'isop'('(')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 1713
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1714
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1716
new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
set $P4, $P5
# predefined push
push $P1, $P4
# }
__label_2: # continue
.annotate 'line', 1717
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1718
'RequireOp'(']', $P2)
.annotate 'line', 1719
setattribute self, 'list', $P1
# }
.annotate 'line', 1720

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1721
# Body
# {
.annotate 'line', 1723
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1724
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1725

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1726
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1727
# Body
# {
.annotate 'line', 1729
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1730
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1731
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1732
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1733
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1734
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1731
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1737
.return($P3)
# }
.annotate 'line', 1738

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1701
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1745
# Body
# {
.annotate 'line', 1747
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1748
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
.annotate 'line', 1749

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1751
# Body
# {
.annotate 'line', 1753
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1754
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1756
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
.annotate 'line', 1757
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1759

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1761
# Body
# {
.annotate 'line', 1763
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1764
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1765
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1766
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1767
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1769
__ARG_2.'unget'($P1)
.annotate 'line', 1770
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1772

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1774
# Body
# {
.annotate 'line', 1776
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1777
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1778
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1779
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1780
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1781
$P4 = $P1.'isop'('${')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 1782
new $P6, [ 'PiropStatement' ]
$P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 1784
# string key: $S1
$P4 = $P1.'checkkeyword'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1785
# var st: $P2
null $P2
.annotate 'line', 1786
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
.annotate 'line', 1788
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1790
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1793
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1796
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1798
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1800
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1802
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1804
new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_14: # case
.annotate 'line', 1806
new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P6, $P7
.return($P6)
__label_15: # case
.annotate 'line', 1808
new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_16: # case
.annotate 'line', 1810
new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_17: # case
.annotate 'line', 1812
new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_18: # case
.annotate 'line', 1814
new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_19: # case
.annotate 'line', 1816
new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_20: # case
.annotate 'line', 1818
new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_21: # case
.annotate 'line', 1820
new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_22: # case
.annotate 'line', 1822
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1824
new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_24: # case
.annotate 'line', 1826
new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_5: # default
.annotate 'line', 1828
$P26 = $P1.'isidentifier'()
if_null $P26, __label_25
unless $P26 goto __label_25
# {
.annotate 'line', 1829
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1830
$P4 = $P3.'isop'(':')
if_null $P4, __label_26
unless $P4 goto __label_26
.annotate 'line', 1831
new $P6, [ 'LabelStatement' ]
$P6.'LabelStatement'($P1, __ARG_2)
set $P5, $P6
.return($P5)
__label_26: # endif
.annotate 'line', 1832
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1834
__ARG_1.'unget'($P1)
.annotate 'line', 1835
new $P5, [ 'ExprStatement' ]
$P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P4, $P5
.return($P4)
__label_4: # switch end
.annotate 'line', 1837
unless_null $P2, __label_27
.annotate 'line', 1838
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1839
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1840

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1848
# Body
# {
.annotate 'line', 1850
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1851

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1852
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1853
# Body
# {
.annotate 'line', 1855
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1856

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1857
# Body
# {
.annotate 'line', 1859
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1860

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1861
# Body
# {
.annotate 'line', 1863
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1864

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1865
# Body
# {
.annotate 'line', 1867
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1868

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1869
# Body
# {
.annotate 'line', 1871
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1872

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1873
# Body
# {
.annotate 'line', 1875
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1876

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1877
# Body
# {
.annotate 'line', 1879
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1880

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1881
# Body
# {
.annotate 'line', 1883
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1884

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1885
# Body
# {
.annotate 'line', 1887
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1888

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1889
# Body
# {
.annotate 'line', 1891
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1892

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1894
# Body
# {
.annotate 'line', 1899
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1900

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1901
# Body
# {
.annotate 'line', 1903
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1904

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1905
# Body
# {
.annotate 'line', 1907
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1908

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1909
# Body
# {
.annotate 'line', 1911
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1913
.return(self)
# }
.annotate 'line', 1914

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1846
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1919
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1920
# Body
# {
.annotate 'line', 1922
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1923

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1924
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1925
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1917
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1935
# Body
# {
.annotate 'line', 1937
# var statements: $P1
getattribute $P1, self, 'statements'
.annotate 'line', 1938
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 1939
# int empty: $I2
set $I2, 1
# for loop
.annotate 'line', 1940
# int i: $I3
null $I3
__label_2: # for condition
ge $I3, $I1, __label_1
# {
.annotate 'line', 1941
# var st: $P2
$P3 = $P1[$I3]
$P2 = $P3.'optimize'()
.annotate 'line', 1942
set $I4, $I2
unless $I4 goto __label_4
$P3 = $P2.'isempty'()
isfalse $I4, $P3
__label_4:
unless $I4 goto __label_3
.annotate 'line', 1943
null $I2
__label_3: # endif
.annotate 'line', 1944
$P1[$I3] = $P2
# }
__label_0: # for iteration
.annotate 'line', 1940
inc $I3
goto __label_2
__label_1: # for end
.annotate 'line', 1946
unless $I2 goto __label_5
.annotate 'line', 1947
new $P3, [ 'EmptyStatement' ]
.return($P3)
goto __label_6
__label_5: # else
.annotate 'line', 1949
.return(self)
__label_6: # endif
# }
.annotate 'line', 1950

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1933
addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1955
# Body
# {
.annotate 'line', 1957
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
push $P1, __ARG_1
push $P1, __ARG_2
.annotate 'line', 1958
setattribute self, 'statements', $P1
# }
.annotate 'line', 1959

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1960
# Body
# {
.return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1961
# Body
# {
.annotate 'line', 1963
getattribute $P1, self, 'statements'
# predefined push
push $P1, __ARG_1
.annotate 'line', 1964
.return(self)
# }
.annotate 'line', 1965

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1966
# Body
# {
.annotate 'line', 1968
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1969
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1970

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1953
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1973
# Body
# {
.annotate 'line', 1975
unless_null __ARG_1, __label_0
.annotate 'line', 1976
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1977
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1978
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1980
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1981

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1992
# Body
# {
.annotate 'line', 1994
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1995
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1996
# int dotted: $I1
null $I1
.annotate 'line', 1997
$P4 = $P1.'isop'('.')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 1998
set $I1, 1
.annotate 'line', 1999
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 2001
# string opname: $S1
$P4 = $P1.'getidentifier'()
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 2002
unless $I1 goto __label_3
set $S3, '.'
goto __label_2
__label_3:
set $S3, ''
__label_2:
concat $S4, $S3, $S1
box $P4, $S4
setattribute self, 'opname', $P4
.annotate 'line', 2003
$P1 = __ARG_2.'get'()
.annotate 'line', 2004
$P4 = $P1.'isop'('}')
isfalse $I2, $P4
unless $I2 goto __label_4
# {
.annotate 'line', 2005
__ARG_2.'unget'($P1)
.annotate 'line', 2006
# var args: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_5: # do
.annotate 'line', 2007
# {
.annotate 'line', 2008
# var arg: $P3
null $P3
.annotate 'line', 2009
$P1 = __ARG_2.'get'()
.annotate 'line', 2010
$P4 = $P1.'isop'(':')
if_null $P4, __label_8
unless $P4 goto __label_8
# {
.annotate 'line', 2011
$P1 = __ARG_2.'get'()
.annotate 'line', 2012
# string label: $S2
$P4 = $P1.'getidentifier'()
null $S2
if_null $P4, __label_10
set $S2, $P4
__label_10:
.annotate 'line', 2013
new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
set $P3, $P4
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 2016
__ARG_2.'unget'($P1)
.annotate 'line', 2017
$P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
__label_9: # endif
.annotate 'line', 2019
# predefined push
push $P2, $P3
# }
__label_7: # continue
.annotate 'line', 2020
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_6
if $P4 goto __label_5
__label_6: # enddo
.annotate 'line', 2021
'RequireOp'('}', $P1)
.annotate 'line', 2022
setattribute self, 'args', $P2
# }
__label_4: # endif
.annotate 'line', 2024
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2025

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 2026
# Body
# {
.annotate 'line', 2028
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2029
if_null $P1, __label_0
.annotate 'line', 2030
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 2031
.return(self)
# }
.annotate 'line', 2032

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2033
# Body
# {
.annotate 'line', 2035
# string opname: $S1
getattribute $P4, self, 'opname'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2036
self.'annotate'(__ARG_1)
.annotate 'line', 2037
concat $S3, 'pirop ', $S1
__ARG_1.'comment'($S3)
.annotate 'line', 2038
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 2039
unless_null $P1, __label_1
.annotate 'line', 2040
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 2042
__ARG_1.'print'($S1, ' ')
.annotate 'line', 2043
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2044
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 2045
# int i: $I2
null $I2
__label_5: # for condition
ge $I2, $I1, __label_4
# {
.annotate 'line', 2046
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 2047
# string reg: $S2
$P4 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_6
set $S2, $P4
__label_6:
.annotate 'line', 2048
# predefined push
push $P2, $S2
# }
__label_3: # for iteration
.annotate 'line', 2045
inc $I2
goto __label_5
__label_4: # for end
.annotate 'line', 2050
# predefined join
join $S3, ', ', $P2
__ARG_1.'say'($S3)
# }
__label_2: # endif
# }
.annotate 'line', 2052

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1987
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1989
addattribute $P0, 'opname'
.annotate 'line', 1990
addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2062
# Body
# {
.annotate 'line', 2064
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2065
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2066
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2067
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2068
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2069
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
.annotate 'line', 2070
.return(self)
# }
.annotate 'line', 2071

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2072
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2073
# Body
# {
.annotate 'line', 2075
self.'annotate'(__ARG_1)
.annotate 'line', 2076
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2077

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2059
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2061
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2087
# Body
# {
.annotate 'line', 2089
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2090
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2091
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2092
box $P1, $S1
setattribute self, 'symbol', $P1
# }
.annotate 'line', 2093

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2094
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2095
# Body
# {
.annotate 'line', 2097
self.'annotate'(__ARG_1)
.annotate 'line', 2098
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2099
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2100

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2084
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2086
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2112
# Body
# {
.annotate 'line', 2114
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2115
# var path: $P1
$P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2116
# predefined elements
elements $I1, $P1
ne $I1, 0, __label_0
.annotate 'line', 2117
$P2 = __ARG_2.'get'()
'ExpectedIdentifier'($P2)
__label_0: # endif
.annotate 'line', 2118
'ExpectOp'(';', __ARG_2)
.annotate 'line', 2119
$P3 = 'toIdentifierList'($P1)
setattribute self, 'path', $P3
# }
.annotate 'line', 2120

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2121
# Body
# {
.annotate 'line', 2123
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2124
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2125
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2127
# var symbol: $P3
$P3 = self.'findsymbol'($P1)
.annotate 'line', 2128
if_null $P3, __label_0
# {
.annotate 'line', 2129
isa $I1, $P3, 'FunctionStatement'
unless $I1 goto __label_1
# {
.annotate 'line', 2130
# string subid: $S2
$P4 = $P3.'makesubid'()
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2131
box $P4, $S2
setattribute self, 'subid', $P4
# }
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2134
.return(self)
# }
.annotate 'line', 2135

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2136
# Body
# {
.annotate 'line', 2138
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 2139
# string name: $S1
$S1 = $P1[-1]
.annotate 'line', 2140
# var vdata: $P2
$P2 = self.'getvar'($S1)
.annotate 'line', 2141
getattribute $P3, self, 'subid'
if_null $P3, __label_0
# {
.annotate 'line', 2142
# string subid: $S2
getattribute $P4, self, 'subid'
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2143
$P3 = $P2.'getreg'()
__ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 2146
self.'annotate'(__ARG_1)
.annotate 'line', 2147
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 2148
$P1.'pop'()
.annotate 'line', 2149
# predefined elements
elements $I1, $P1
null $I2
if $I1 == $I2 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 2151
__ARG_1.'say'("'", $S1, "'")
goto __label_3 # break
__label_4: # default
.annotate 'line', 2154
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_3: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2157

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2107
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2109
addattribute $P0, 'path'
.annotate 'line', 2110
addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2170
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2171
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2172

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2173
# Body
# {
.annotate 'line', 2175
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2176
.return(self)
# }
.annotate 'line', 2177

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2181

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2164
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 2166
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2198
# Body
# {
.annotate 'line', 2200
setattribute self, 'type', __ARG_1
.annotate 'line', 2201
setattribute self, 'reg', __ARG_2
.annotate 'line', 2202
setattribute self, 'scope', __ARG_3
.annotate 'line', 2203
box $P1, __ARG_4
setattribute self, 'flags', $P1
.annotate 'line', 2204
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2205

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2206
# Body
# {
.annotate 'line', 2208
box $P1, __ARG_1
setattribute self, 'id', $P1
# }
.annotate 'line', 2209

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2210
# Body
# {
.annotate 'line', 2212
box $P1, __ARG_1
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2213

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2214
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2215
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2216
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2217
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2218
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2219
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2220
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2221
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
.annotate 'line', 2190
addattribute $P0, 'type'
.annotate 'line', 2191
addattribute $P0, 'reg'
.annotate 'line', 2192
addattribute $P0, 'scope'
.annotate 'line', 2193
addattribute $P0, 'flags'
.annotate 'line', 2194
addattribute $P0, 'value'
.annotate 'line', 2195
addattribute $P0, 'id'
.annotate 'line', 2196
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2227
# Body
# {
.annotate 'line', 2229
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2230

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2231
# Body
# {
.annotate 'line', 2233
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2234

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2226
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2241
# Body
# {
.annotate 'line', 2243
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2244

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2245
# Body
# {
.annotate 'line', 2247
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2248
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2249
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2250
if_null $P2, __label_1
.annotate 'line', 2251
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2252
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2253
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2254
$P1[$S1] = $P3
.annotate 'line', 2255
.return($P3)
# }
.annotate 'line', 2256

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2257
# Body
# {
.annotate 'line', 2259
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2260
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2261
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2262
if_null $P2, __label_1
.annotate 'line', 2263
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2264
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2265

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2266
# Body
# {
.annotate 'line', 2268
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2269
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2270
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2271
if_null $P2, __label_1
.annotate 'line', 2272
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2273
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2274
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2275
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2276
$P1[$S1] = $P3
# }
.annotate 'line', 2277

.end # createconst


.sub 'getvar' :method
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
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2284
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2285
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2286
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2287
.return($P2)
# }
.annotate 'line', 2288

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2289
# Body
# {
.annotate 'line', 2291
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2292
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2293
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2294
.return($P2)
# }
.annotate 'line', 2295

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2296
# Body
# {
.annotate 'line', 2298
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2299
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2300
.return($S1)
# }
.annotate 'line', 2301

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2302
# Body
# {
.annotate 'line', 2304
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2306
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2307
.return('__WLEX_self')
# }
.annotate 'line', 2308

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2240
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2317
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2327
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2328
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2329
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2330
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2331
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2332
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2333
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2334
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2335
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2336
# Body
# {
.annotate 'line', 2338
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2339

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2340
# Body
# {
.annotate 'line', 2342
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2343

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2344
# Body
# {
.annotate 'line', 2347
.return(self)
# }
.annotate 'line', 2348

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2349
# Body
# {
.return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2350
# Body
# {
.annotate 'line', 2352
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2353
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2354
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2355
.return($S2)
# }
.annotate 'line', 2356

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2357
# Body
# {
.annotate 'line', 2359
# string reg: $S1
null $S1
.annotate 'line', 2360
$P1 = self.'checkresult'()
set $S2, $P1
ne $S2, 'I', __label_0
.annotate 'line', 2361
$P2 = self.'emit_get'(__ARG_1)
set $S1, $P2
goto __label_1
__label_0: # else
# {
.annotate 'line', 2363
$P3 = self.'tempreg'('I')
set $S1, $P3
.annotate 'line', 2364
self.'emit'(__ARG_1, $S1)
# }
__label_1: # endif
.annotate 'line', 2366
.return($S1)
# }
.annotate 'line', 2367

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2368
# Body
# {
.annotate 'line', 2370
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2371

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2325
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2376
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2374
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2384
# Body
# {
.annotate 'line', 2386
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2387
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2388
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2389
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2390
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2391

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2392
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2393
# Body
# {
.annotate 'line', 2395
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2396
.return(self)
# }
.annotate 'line', 2397

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2398
# Body
# {
.annotate 'line', 2400
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2401
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2402
self.'annotate'(__ARG_1)
.annotate 'line', 2403
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2404
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2405
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2406

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2381
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2383
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2419
# Body
# {
.annotate 'line', 2421
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2422
.return(self)
# }
.annotate 'line', 2423

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2427

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2428
# Body
# {
.annotate 'line', 2430
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2431
.return(self)
# }
.annotate 'line', 2432

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2433
# Body
# {
.annotate 'line', 2435
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2436
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2437
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2439
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2440
ne $I1, 0, __label_4
.annotate 'line', 2441
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2443
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2446
.return(0)
# }
.annotate 'line', 2447

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2448
# Body
# {
.annotate 'line', 2450
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2452
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2453
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2454
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2456
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2457
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2458
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
.annotate 'line', 2461
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2464
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2467
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2470

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2471
# Body
# {
.annotate 'line', 2473
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2475
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2476
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2477
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2479
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2480
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 2481
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
.annotate 'line', 2484
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2487
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2490
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2493

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2418
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2500
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2501
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2498
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2509
# Body
# {
.annotate 'line', 2511
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2512
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2513

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2514
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2515
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2516
# Body
# {
.annotate 'line', 2518
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2519
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2520
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2521
# int need_unicode: $I2
null $I2
.annotate 'line', 2522
box $P2, $S1
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2523
le $I3, 127, __label_3
# {
.annotate 'line', 2524
set $I2, 1
goto __label_2 # break
.annotate 'line', 2525
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2528
unless $I2 goto __label_4
# {
.annotate 'line', 2529
unless $I1 goto __label_5
# {
.annotate 'line', 2530
null $I1
.annotate 'line', 2531
# string saux: $S2
set $S2, $S1
.annotate 'line', 2532
set $S1, ''
.annotate 'line', 2533
box $P2, $S2
iter $P4, $P2
set $P4, 0
__label_6: # for iteration
unless $P4 goto __label_7
shift $S3, $P4
# {
.annotate 'line', 2534
ne $S3, '\', __label_8
.annotate 'line', 2535
set $S3, '\\'
__label_8: # endif
.annotate 'line', 2536
concat $S1, $S1, $S3
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2539
# string result: $S4
set $S4, ''
.annotate 'line', 2540
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2541
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2542
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2543
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2544
le $I6, 127, __label_12
# {
.annotate 'line', 2545
# string h: $S6
box $P5, $I6
$P2 = $P5.'get_as_base'(16)
null $S6
if_null $P2, __label_14
set $S6, $P2
__label_14:
.annotate 'line', 2546
concat $S4, $S4, '\x{'
concat $S4, $S4, $S6
concat $S4, $S4, '}'
# }
goto __label_13
__label_12: # else
.annotate 'line', 2549
concat $S4, $S4, $S5
__label_13: # endif
# }
__label_9: # for iteration
.annotate 'line', 2541
inc $I5
goto __label_11
__label_10: # for end
.annotate 'line', 2551
set $S1, $S4
# }
__label_4: # endif
.annotate 'line', 2553
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
.annotate 'line', 2554
concat $S0, $S7, $S1
concat $S0, $S0, $S7
set $S1, $S0
.annotate 'line', 2555
unless $I2 goto __label_17
.annotate 'line', 2556
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2557
.return($S1)
# }
.annotate 'line', 2558

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2559
# Body
# {
.annotate 'line', 2561
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2562
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2563
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2564
# var s: $P2
box $P2, $S1
.annotate 'line', 2565
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2567
.return($S1)
# }
.annotate 'line', 2568

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2569
# Body
# {
.annotate 'line', 2571
set $S1, __ARG_2
eq $S1, '', __label_0
.annotate 'line', 2572
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2573

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2574
# Body
# {
.annotate 'line', 2576
.tailcall self.'getPirString'()
# }
.annotate 'line', 2577

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2506
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2508
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2586
# Body
# {
.annotate 'line', 2589
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2590
setattribute self, 'pos', __ARG_2
.annotate 'line', 2591
# int n: $I1
null $I1
.annotate 'line', 2592
unless __ARG_4 goto __label_0
.annotate 'line', 2593
set $I1, __ARG_3
goto __label_1
__label_0: # else
# {
.annotate 'line', 2595
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 2596
set $I1, $S1
# }
__label_1: # endif
.annotate 'line', 2598
box $P1, $I1
setattribute self, 'numval', $P1
# }
.annotate 'line', 2599

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2600
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2601
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2602
# Body
# {
.annotate 'line', 2604
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2605
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2606
.return($I1)
# }
.annotate 'line', 2607

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2608
# Body
# {
.annotate 'line', 2610
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2611
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2612
ne $I1, 0, __label_1
.annotate 'line', 2613
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2615
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2617

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2618
# Body
# {
.annotate 'line', 2620
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2621

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2582
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2584
addattribute $P0, 'pos'
.annotate 'line', 2585
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2629
# Body
# {
.annotate 'line', 2631
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2632
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2633

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2634
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2635
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2636
# Body
# {
.annotate 'line', 2638
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2639
# var n: $P1
new $P1, [ 'Float' ]
.annotate 'line', 2640
assign $P1, $S1
.annotate 'line', 2641
.return($P1)
# }
.annotate 'line', 2642

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2643
# Body
# {
.annotate 'line', 2645
set $S1, __ARG_2
eq $S1, '', __label_0
# {
.annotate 'line', 2646
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2647
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2649

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2650
# Body
# {
.annotate 'line', 2654
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2655
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
.annotate 'line', 2656
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2657
.return($S1)
# }
.annotate 'line', 2658

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2626
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2628
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2666
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2667
# Body
# {
.annotate 'line', 2669
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2670
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2671

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2672
# Body
# {
.annotate 'line', 2674
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2675

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2676
# Body
# {
.annotate 'line', 2678
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2679
if_null $P1, __label_0
.annotate 'line', 2680
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2682
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
.annotate 'line', 2685
.return('P')
__label_3: # default
.annotate 'line', 2687
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2690

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2691
# Body
# {
.annotate 'line', 2693
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2694
.return($S1)
# }
.annotate 'line', 2695

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2696
# Body
# {
.annotate 'line', 2698
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2699
unless_null $P1, __label_0
.annotate 'line', 2700
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2701
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2702
# string s: $S1
null $S1
.annotate 'line', 2703
unless_null $P2, __label_1
# {
.annotate 'line', 2704
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2705
set $S3, $S2
set $S4, 'self'
if $S3 == $S4 goto __label_6
set $S4, 'null'
if $S3 == $S4 goto __label_7
goto __label_5
# switch
__label_6: # case
.annotate 'line', 2707
set $S1, 'self'
goto __label_4 # break
__label_7: # case
.annotate 'line', 2709
set $S1, 'null'
goto __label_4 # break
__label_5: # default
.annotate 'line', 2711
set $S1, ''
__label_4: # switch end
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2715
$P3 = $P2.'getid'()
if_null $P3, __label_8
.annotate 'line', 2716
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2718
$P4 = $P2.'getreg'()
set $S1, $P4
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2720
.return($S1)
# }
.annotate 'line', 2721

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2722
# Body
# {
.annotate 'line', 2724
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2725
set $S2, $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2726
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2727
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2729
.return($P1)
# }
.annotate 'line', 2730

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2731
# Body
# {
.annotate 'line', 2733
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2734
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2735
if_null $P2, __label_0
# {
.annotate 'line', 2736
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2737
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2739
.return(self)
# }
.annotate 'line', 2740

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2741
# Body
# {
.annotate 'line', 2743
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2744
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2745
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2746
# string lexname: $S2
$P2 = $P1.'getlex'()
null $S2
if_null $P2, __label_3
set $S2, $P2
__label_3:
.annotate 'line', 2747
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2748
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2750
.return($S1)
# }
.annotate 'line', 2751

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2752
# Body
# {
.annotate 'line', 2754
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 2755
self.'annotate'(__ARG_1)
.annotate 'line', 2756
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2757
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2759

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2760
# Body
# {
.annotate 'line', 2762
self.'annotate'(__ARG_1)
.annotate 'line', 2763
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2764
.return($S1)
# }
.annotate 'line', 2765

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2766
# Body
# {
.annotate 'line', 2768
self.'annotate'(__ARG_1)
.annotate 'line', 2769
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2770
die "NO"
__label_0: # endif
.annotate 'line', 2771
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2772
# string lreg: $S2
$P2 = self.'getIdentifier'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 2773
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
# {
.annotate 'line', 2774
set $S6, $S1
set $S7, 'S'
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2777
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2780
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2783
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2784
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2786
# string typeright: $S3
$P2 = __ARG_2.'checkresult'()
null $S3
if_null $P2, __label_11
set $S3, $P2
__label_11:
.annotate 'line', 2787
ne $S3, 'v', __label_12
.annotate 'line', 2788
getattribute $P2, self, 'start'
'SyntaxError'("Can't assign from void expression", $P2)
__label_12: # endif
.annotate 'line', 2789
ne $S1, $S3, __label_13
# {
.annotate 'line', 2790
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2793
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_15
set $S4, $P2
__label_15:
.annotate 'line', 2794
self.'annotate'(__ARG_1)
.annotate 'line', 2795
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2796
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2798
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2801
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2802
$P2 = $P1.'isvolatile'()
if_null $P2, __label_19
unless $P2 goto __label_19
# {
.annotate 'line', 2803
# string lexname: $S5
$P3 = $P1.'getlex'()
null $S5
if_null $P3, __label_20
set $S5, $P3
__label_20:
.annotate 'line', 2804
isnull $I1, $S5
not $I1
unless $I1 goto __label_22
isne $I1, $S5, ''
__label_22:
unless $I1 goto __label_21
.annotate 'line', 2805
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_21: # endif
# }
__label_19: # endif
.annotate 'line', 2807
.return($S2)
# }
.annotate 'line', 2808

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2663
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2665
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2818

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2813
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2826
# Body
# {
.annotate 'line', 2828
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2829
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2830

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2831
# Body
# {
.annotate 'line', 2833
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2834

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
self.'optimizearg'()
.annotate 'line', 2838
.return(self)
# }
.annotate 'line', 2839

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2823
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2825
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2848
# Body
# {
.annotate 'line', 2850
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2851
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2852
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2853

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2854
# Body
# {
.annotate 'line', 2856
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2857
.return(self)
# }
.annotate 'line', 2858

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2859
# Body
# {
.annotate 'line', 2861
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2862

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2863
# Body
# {
.annotate 'line', 2865
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2866
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2867

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2868
# Body
# {
.annotate 'line', 2870
self.'optimizearg'()
.annotate 'line', 2871
.return(self)
# }
.annotate 'line', 2872

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2873
# Body
# {
.annotate 'line', 2875
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2876
.return($S1)
# }
.annotate 'line', 2877

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2878
# Body
# {
.annotate 'line', 2880
# string reg: $S1
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_getint'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2881
.return($S1)
# }
.annotate 'line', 2882

.end # emit_intright

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2844
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2846
addattribute $P0, 'lexpr'
.annotate 'line', 2847
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2889
# Body
# {
.annotate 'line', 2891
.return('I')
# }
.annotate 'line', 2892

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2893
# Body
# {
.annotate 'line', 2895
self.'optimizearg'()
.annotate 'line', 2896
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2897
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2898
$I3 = $P1.'isintegerliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 2899
# int li: $I1
# predefined int
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 2900
# int ri: $I2
# predefined int
getattribute $P3, $P2, 'numval'
set $I2, $P3
.annotate 'line', 2901
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
$P5 = self.'do_op'($I1, $I2)
.tailcall 'integerValue'($P3, $P4, $P5)
# }
__label_0: # endif
.annotate 'line', 2903
.return(self)
# }
.annotate 'line', 2904

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2887
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2911
# Body
# {
.annotate 'line', 2913
.return('I')
# }
.annotate 'line', 2914

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2915
# Body
# {
.annotate 'line', 2917
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2918
.return(self)
# }
.annotate 'line', 2919

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2920
# Body
# {
.annotate 'line', 2922
# var expr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2923
isa $I1, $P1, 'IndexExpr'
unless $I1 goto __label_2
$P2 = $P1.'checkresult'()
set $S1, $P2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 2924
$P1.'emit_prep'(__ARG_1)
.annotate 'line', 2925
self.'annotate'(__ARG_1)
.annotate 'line', 2926
__ARG_1.'print'('delete ')
.annotate 'line', 2927
$P1.'emit_aux'(__ARG_1)
.annotate 'line', 2928
__ARG_1.'say'()
.annotate 'line', 2929
set $S1, __ARG_2
eq $S1, '', __label_3
.annotate 'line', 2930
__ARG_1.'emitset'(__ARG_2, '1')
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 2933
getattribute $P2, self, 'start'
'SyntaxError'("delete with invalid operator", $P2)
__label_1: # endif
# }
.annotate 'line', 2934

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 2909
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2941
# Body
# {
.annotate 'line', 2943
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
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
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2954
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2955
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2956
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P3, $P5, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2959
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isfloatliteral'()
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 2960
# var numval: $P2
getattribute $P5, self, 'subexpr'
getattribute $P2, $P5, 'numval'
.annotate 'line', 2961
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2962
getattribute $P3, self, 'owner'
getattribute $P4, self, 'subexpr'
getattribute $P5, $P4, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P3, $P5, $N2)
# }
__label_1: # endif
# }
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
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2972

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2939
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2979
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2980
# Body
# {
.annotate 'line', 2982
.return('I')
# }
.annotate 'line', 2983

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2984
# Body
# {
.annotate 'line', 2986
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2987
.return(self)
# }
.annotate 'line', 2988

.end # set


.sub 'optimize' :method

.annotate 'line', 2989
# Body
# {
.annotate 'line', 2991
self.'optimizearg'()
.annotate 'line', 2992
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2993
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2994
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2995
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2996
getattribute $P3, self, 'owner'
getattribute $P4, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P3, $P4, $I2)
# }
__label_0: # endif
.annotate 'line', 2998
$P3 = $P1.'isnegable'()
if_null $P3, __label_1
unless $P3 goto __label_1
.annotate 'line', 2999
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 3000
.return(self)
# }
.annotate 'line', 3001

.end # optimize


.sub 'negated' :method

.annotate 'line', 3002
# Body
# {
.annotate 'line', 3004
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 3005

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3006
# Body
# {
.annotate 'line', 3008
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3009
self.'annotate'(__ARG_1)
.annotate 'line', 3010
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3011
set $S3, $S2
set $S4, 'I'
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 3013
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 3016
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 3019
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 3021

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2977
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3031

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3032
# Body
# {
.annotate 'line', 3034
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3035
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3036
.return(self)
# }
.annotate 'line', 3037

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3038
# Body
# {
.annotate 'line', 3040
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3041
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3042
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3043

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3044
# Body
# {
.annotate 'line', 3046
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3047
self.'annotate'(__ARG_1)
.annotate 'line', 3048
__ARG_1.'emitinc'($S1)
.annotate 'line', 3049
.return($S1)
# }
.annotate 'line', 3050

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3026
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3057
# Body
# {
.annotate 'line', 3059
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3060
.return(self)
# }
.annotate 'line', 3061

.end # set


.sub 'checkresult' :method

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3065

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3066
# Body
# {
.annotate 'line', 3068
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3069
self.'annotate'(__ARG_1)
.annotate 'line', 3070
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3071
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3072
__ARG_1.'emitinc'($S1)
.annotate 'line', 3073
.return($S1)
# }
.annotate 'line', 3074

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3055
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3081
# Body
# {
.annotate 'line', 3083
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3084

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3085
# Body
# {
.annotate 'line', 3087
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3088
.return(self)
# }
.annotate 'line', 3089

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3090
# Body
# {
.annotate 'line', 3092
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3093
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3094
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3095

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3096
# Body
# {
.annotate 'line', 3098
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3099
self.'annotate'(__ARG_1)
.annotate 'line', 3100
__ARG_1.'emitdec'($S1)
.annotate 'line', 3101
.return($S1)
# }
.annotate 'line', 3102

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3079
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3112
.return(self)
# }
.annotate 'line', 3113

.end # set


.sub 'checkresult' :method

.annotate 'line', 3114
# Body
# {
.annotate 'line', 3116
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3117

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3118
# Body
# {
.annotate 'line', 3120
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3121
self.'annotate'(__ARG_1)
.annotate 'line', 3122
set $S2, __ARG_2
eq $S2, '', __label_1
.annotate 'line', 3123
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 3124
__ARG_1.'emitdec'($S1)
.annotate 'line', 3125
.return($S1)
# }
.annotate 'line', 3126

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3107
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3135
# Body
# {
.annotate 'line', 3137
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3138
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3139
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3140
.return(self)
# }
.annotate 'line', 3141

.end # set


.sub 'checkresult' :method

.annotate 'line', 3142
# Body
# {
.annotate 'line', 3144
getattribute $P1, self, 'lexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 3145

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3146
# Body
# {
.annotate 'line', 3148
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 3149
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 3150
.return(self)
# }
.annotate 'line', 3151

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3152
# Body
# {
.annotate 'line', 3154
.tailcall self.'optimize_base'()
# }
.annotate 'line', 3155

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3156
# Body
# {
.annotate 'line', 3158
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3159
set $S2, __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 3160
self.'annotate'(__ARG_1)
.annotate 'line', 3161
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 3163

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3131
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3133
addattribute $P0, 'lexpr'
.annotate 'line', 3134
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3170
# Body
# {
.annotate 'line', 3172
self.'annotate'(__ARG_1)
.annotate 'line', 3173
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3174
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3175

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3168
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
self.'annotate'(__ARG_1)
.annotate 'line', 3185
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3186
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 3187
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3188

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3189
# Body
# {
.annotate 'line', 3191
self.'annotate'(__ARG_1)
.annotate 'line', 3192
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3193
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3194
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3195
.return($S1)
# }
.annotate 'line', 3196

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3180
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3203
# Body
# {
.annotate 'line', 3205
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3206
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3207
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3208
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3209
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3210
iseq $I1, $S1, 'S'
unless $I1 goto __label_5
isa $I1, $P2, 'ConcatString'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 3211
$P2.'emit_concat_to'(__ARG_1, $S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 3213
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_6
set $S4, $P3
__label_6:
.annotate 'line', 3214
# string aux: $S5
null $S5
.annotate 'line', 3215
self.'annotate'(__ARG_1)
.annotate 'line', 3216
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
.annotate 'line', 3218
eq $S2, 'S', __label_12
# {
.annotate 'line', 3219
$P3 = self.'tempreg'('S')
set $S5, $P3
.annotate 'line', 3220
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3221
set $S4, $S5
# }
__label_12: # endif
.annotate 'line', 3223
__ARG_1.'emitconcat1'($S3, $S4)
goto __label_7 # break
__label_10: # case
__label_11: # case
.annotate 'line', 3227
eq $S1, $S2, __label_13
# {
.annotate 'line', 3228
$P3 = self.'tempreg'($S1)
set $S5, $P3
.annotate 'line', 3229
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3230
set $S4, $S5
# }
__label_13: # endif
.annotate 'line', 3232
__ARG_1.'emitaddto'($S3, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 3235
__ARG_1.'emitaddto'($S3, $S4)
__label_7: # switch end
# }
__label_4: # endif
.annotate 'line', 3238
.return($S3)
# }
.annotate 'line', 3239

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3201
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3246
# Body
# {
.annotate 'line', 3248
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3249
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3250
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3251
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3252
# string reg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3253
# string reg2: $S4
$P3 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3254
# string aux: $S5
null $S5
.annotate 'line', 3255
self.'annotate'(__ARG_1)
.annotate 'line', 3256
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
.annotate 'line', 3258
getattribute $P3, self, 'start'
'InternalError'('-= to string must not happen', $P3)
__label_7: # case
__label_8: # case
.annotate 'line', 3261
eq $S1, $S2, __label_9
# {
.annotate 'line', 3262
$P4 = self.'tempreg'($S1)
set $S5, $P4
.annotate 'line', 3263
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3264
set $S4, $S5
# }
__label_9: # endif
.annotate 'line', 3266
__ARG_1.'emitsubto'($S3, $S4)
goto __label_4 # break
__label_5: # default
.annotate 'line', 3269
__ARG_1.'emitsubto'($S3, $S4)
__label_4: # switch end
.annotate 'line', 3271
.return($S3)
# }
.annotate 'line', 3272

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3244
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3279
# Body
# {
.annotate 'line', 3281
# string ltype: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3282
# string rtype: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3283
# string lreg: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3284
# string rreg: $S4
null $S4
.annotate 'line', 3285
set $S5, $S1
set $S6, 'S'
if $S5 == $S6 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 3287
ne $S2, 'I', __label_6
.annotate 'line', 3288
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
goto __label_7
__label_6: # else
# {
.annotate 'line', 3290
$P3 = self.'tempreg'('I')
set $S4, $P3
.annotate 'line', 3291
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S4)
# }
__label_7: # endif
.annotate 'line', 3293
self.'annotate'(__ARG_1)
.annotate 'line', 3294
__ARG_1.'say'('repeat ', $S3, ', ', $S3, ', ', $S4)
goto __label_3 # break
__label_4: # default
.annotate 'line', 3297
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
set $S4, $P1
.annotate 'line', 3298
self.'annotate'(__ARG_1)
.annotate 'line', 3299
__ARG_1.'say'('mul ', $S3, ', ', $S4)
__label_3: # switch end
.annotate 'line', 3301
.return($S3)
# }
.annotate 'line', 3302

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3277
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3309
# Body
# {
.annotate 'line', 3311
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3312
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3313
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3314
self.'annotate'(__ARG_1)
.annotate 'line', 3315
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3316
.return($S2)
# }
.annotate 'line', 3317

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3307
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3324
# Body
# {
.annotate 'line', 3326
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3327
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3328
# string reg2: $S3
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3329
self.'annotate'(__ARG_1)
.annotate 'line', 3330
__ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3331
.return($S2)
# }
.annotate 'line', 3332

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3322
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3339
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3340
# Body
# {
.annotate 'line', 3342
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3343
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3344
# string regl: $S3
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 3345
# string regr: $S4
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S4
if_null $P1, __label_3
set $S4, $P1
__label_3:
.annotate 'line', 3346
self.'annotate'(__ARG_1)
.annotate 'line', 3347
# string aux: $S5
null $S5
.annotate 'line', 3348
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3350
ne $S1, 'I', __label_7
# {
.annotate 'line', 3351
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3352
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3353
set $S3, $S5
# }
__label_7: # endif
.annotate 'line', 3355
ne $S2, 'I', __label_8
# {
.annotate 'line', 3356
$P1 = self.'tempreg'('N')
set $S5, $P1
.annotate 'line', 3357
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3358
set $S4, $S5
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3361
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3362
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3363
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3364
set $S3, $S5
# }
goto __label_10
__label_9: # else
.annotate 'line', 3366
iseq $I1, $S2, 'P'
unless $I1 goto __label_14
iseq $I1, $S1, 'I'
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3367
$P1 = self.'tempreg'('I')
set $S5, $P1
.annotate 'line', 3368
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3369
set $S4, $S5
# }
goto __label_13
__label_12: # else
.annotate 'line', 3371
iseq $I1, $S2, 'S'
unless $I1 goto __label_17
iseq $I1, $S1, 'P'
__label_17:
unless $I1 goto __label_15
# {
.annotate 'line', 3372
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3373
__ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3374
set $S3, $S5
# }
goto __label_16
__label_15: # else
.annotate 'line', 3376
iseq $I1, $S2, 'P'
unless $I1 goto __label_19
iseq $I1, $S1, 'S'
__label_19:
unless $I1 goto __label_18
# {
.annotate 'line', 3377
$P1 = self.'tempreg'('S')
set $S5, $P1
.annotate 'line', 3378
__ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3379
set $S4, $S5
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
.annotate 'line', 3382
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
.annotate 'line', 3384
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3387
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3390
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3391
# }
.annotate 'line', 3393

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3394
# Body
# {
.annotate 'line', 3396
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3397

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3398
# Body
# {
.annotate 'line', 3400
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3401

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3402
# Body
# {
.annotate 'line', 3404
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3405

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3337
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3418
# Body
# {
.annotate 'line', 3420
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3421
setattribute self, 'expr', __ARG_2
.annotate 'line', 3422
box $P1, __ARG_3
setattribute self, 'checknull', $P1
# }
.annotate 'line', 3423

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3424
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3425
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3426
# Body
# {
.annotate 'line', 3428
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
.annotate 'line', 3429
box $P1, $I1
setattribute self, 'checknull', $P1
.annotate 'line', 3430
.return(self)
# }
.annotate 'line', 3431

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3432
# Body
# {
.annotate 'line', 3434
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3435
self.'annotate'(__ARG_1)
.annotate 'line', 3436
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3437
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3438
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3439

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3440
# Body
# {
.annotate 'line', 3442
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3443
self.'annotate'(__ARG_1)
.annotate 'line', 3444
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
.annotate 'line', 3445

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3413
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3415
addattribute $P0, 'expr'
.annotate 'line', 3416
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3452
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3453
# Body
# {
.annotate 'line', 3455
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3456

.end # negated


.sub 'optimize' :method

.annotate 'line', 3457
# Body
# {
.annotate 'line', 3459
self.'optimizearg'()
.annotate 'line', 3460
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3461
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3462
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3463
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3464
unless $I1 goto __label_0
# {
.annotate 'line', 3465
unless $I2 goto __label_1
.annotate 'line', 3466
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3468
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3470
unless $I2 goto __label_3
.annotate 'line', 3471
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3472
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3473
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3474
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3475
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3476
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3477
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3478
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
iseq $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3481
.return(self)
# }
.annotate 'line', 3482

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3483
# Body
# {
.annotate 'line', 3485
__ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3486

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3487
# Body
# {
.annotate 'line', 3489
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3490

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3491
# Body
# {
.annotate 'line', 3493
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3494

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3495
# Body
# {
.annotate 'line', 3497
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3498

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3450
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3505
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3506
# Body
# {
.annotate 'line', 3508
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3509

.end # negated


.sub 'optimize' :method

.annotate 'line', 3510
# Body
# {
.annotate 'line', 3512
self.'optimizearg'()
.annotate 'line', 3513
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3514
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3515
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3516
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3517
unless $I1 goto __label_0
# {
.annotate 'line', 3518
unless $I2 goto __label_1
.annotate 'line', 3519
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3521
new $P6, [ 'NullCheckerExpr' ]
getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
set $P5, $P6
.return($P5)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3523
unless $I2 goto __label_3
.annotate 'line', 3524
new $P4, [ 'NullCheckerExpr' ]
getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
set $P3, $P4
.return($P3)
__label_3: # endif
.annotate 'line', 3525
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3526
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_6
set $S1, $P3
__label_6:
.annotate 'line', 3527
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_7
set $S2, $P3
__label_7:
.annotate 'line', 3528
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3529
# string ls: $S3
getattribute $P4, $P1, 'strval'
getattribute $P3, $P4, 'str'
null $S3
if_null $P3, __label_10
set $S3, $P3
__label_10:
.annotate 'line', 3530
# string rs: $S4
getattribute $P4, $P2, 'strval'
getattribute $P3, $P4, 'str'
null $S4
if_null $P3, __label_11
set $S4, $P3
__label_11:
.annotate 'line', 3531
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
isne $I3, $S3, $S4
.tailcall 'integerValue'($P3, $P4, $I3)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3534
.return(self)
# }
.annotate 'line', 3535

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3536
# Body
# {
.annotate 'line', 3538
__ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3539

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3540
# Body
# {
.annotate 'line', 3542
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3543

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3544
# Body
# {
.annotate 'line', 3546
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3547

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3548
# Body
# {
.annotate 'line', 3550
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3551

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3503
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

.annotate 'line', 3559
# Body
# {
.annotate 'line', 3561
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3562
box $P1, __ARG_1
setattribute self, 'positive', $P1
# }
.annotate 'line', 3563

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3564
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3565
# Body
# {
.annotate 'line', 3567
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3568
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
.annotate 'line', 3569

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3570
# Body
# {
.annotate 'line', 3572
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3573
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3574
__ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3575

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3576
# Body
# {
.annotate 'line', 3578
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3579

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3580
# Body
# {
.annotate 'line', 3582
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3583
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3584
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3585

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3586
# Body
# {
.annotate 'line', 3588
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3589
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3590
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3591

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3556
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3558
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3598
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3599
# Body
# {
.annotate 'line', 3601
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3602

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3603
# Body
# {
.annotate 'line', 3605
__ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3606

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3607
# Body
# {
.annotate 'line', 3609
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3610

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3611
# Body
# {
.annotate 'line', 3613
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3614

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3596
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3621
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3622
# Body
# {
.annotate 'line', 3624
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3625

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3626
# Body
# {
.annotate 'line', 3628
__ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3629

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3633

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3634
# Body
# {
.annotate 'line', 3636
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3637

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3619
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3644
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3645
# Body
# {
.annotate 'line', 3647
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3648

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3649
# Body
# {
.annotate 'line', 3651
__ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3652

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3653
# Body
# {
.annotate 'line', 3655
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3656

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3657
# Body
# {
.annotate 'line', 3659
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3660

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3642
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3667
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3668
# Body
# {
.annotate 'line', 3670
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3671

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3672
# Body
# {
.annotate 'line', 3674
__ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3675

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3676
# Body
# {
.annotate 'line', 3678
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3679

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3680
# Body
# {
.annotate 'line', 3682
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3683

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3665
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3690
# Body
# {
.annotate 'line', 3692
.return('I')
# }
.annotate 'line', 3693

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3688
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3700
# Body
# {
.annotate 'line', 3702
self.'optimizearg'()
.annotate 'line', 3703
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3704
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3705
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3706
eq $I1, 0, __label_1
.annotate 'line', 3707
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3709
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3711
.return(self)
# }
.annotate 'line', 3712

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3713
# Body
# {
.annotate 'line', 3715
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
.annotate 'line', 3716
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3717
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3718
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 3719
__ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3722
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_8
set $S4, $P1
__label_8:
.annotate 'line', 3723
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3724
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3725
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3726
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3728

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3698
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3735
# Body
# {
.annotate 'line', 3737
self.'optimizearg'()
.annotate 'line', 3738
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3739
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3740
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3741
ne $I1, 0, __label_1
.annotate 'line', 3742
getattribute $P2, self, 'rexpr'
.return($P2)
goto __label_2
__label_1: # else
.annotate 'line', 3744
getattribute $P3, self, 'owner'
getattribute $P4, self, 'start'
.tailcall 'integerValue'($P3, $P4, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3746
.return(self)
# }
.annotate 'line', 3747

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3748
# Body
# {
.annotate 'line', 3750
# string res: $S1
null $S1
.annotate 'line', 3751
if_null __ARG_2, __label_0
.annotate 'line', 3752
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3754
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3755
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3756
# string lreg: $S2
$P3 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3757
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_6
set $S3, $P1
__label_6:
.annotate 'line', 3758
__ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3761
# string l: $S4
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S4
if_null $P1, __label_7
set $S4, $P1
__label_7:
.annotate 'line', 3762
getattribute $P1, self, 'lexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3763
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3764
getattribute $P1, self, 'rexpr'
$P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3765
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3767

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3733
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3772
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3780
# Body
# {
.annotate 'line', 3782
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
.annotate 'line', 3783
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3784
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3785
self.'annotate'(__ARG_1)
.annotate 'line', 3786
__ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3787

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3788
# Body
# {
.annotate 'line', 3790
band $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3791

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3778
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3798
# Body
# {
.annotate 'line', 3800
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
.annotate 'line', 3801
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3802
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3803
self.'annotate'(__ARG_1)
.annotate 'line', 3804
__ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3805

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3806
# Body
# {
.annotate 'line', 3808
bor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3809

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3796
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3816
# Body
# {
.annotate 'line', 3818
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
.annotate 'line', 3819
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3820
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 3821
self.'annotate'(__ARG_1)
.annotate 'line', 3822
__ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3823

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3824
# Body
# {
.annotate 'line', 3826
bxor $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 3827

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3814
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3835
# Body
# {
.annotate 'line', 3837
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3838
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3839
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3840
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3841
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3843
getattribute $P3, self, 'values'
# predefined push
push $P3, __ARG_4
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3845
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_4
# {
.annotate 'line', 3846
getattribute $P2, __ARG_4, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3847
getattribute $P1, self, 'values'
$P1.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3850
root_new $P2, ['parrot';'ResizablePMCArray']
push $P2, __ARG_3
push $P2, __ARG_4
setattribute self, 'values', $P2
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3851

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3852
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3853
# Body
# {
.annotate 'line', 3855
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3856
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3857
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3858
# int i: $I2
null $I2
# for loop
.annotate 'line', 3859
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3860
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3859
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3861
.return($P2)
# }
.annotate 'line', 3862

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3863
# Body
# {
.annotate 'line', 3865
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3866
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3867
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3868
self.'annotate'(__ARG_1)
.annotate 'line', 3869
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3870
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3871
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3870
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3872
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3873

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3874
# Body
# {
.annotate 'line', 3876
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3877
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3878
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3879
self.'annotate'(__ARG_1)
.annotate 'line', 3880
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3881
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3882
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_1: # for iteration
.annotate 'line', 3881
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3883
.return($S1)
# }
.annotate 'line', 3884

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3885
# Body
# {
.annotate 'line', 3887
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3888
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3889
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3890
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3891
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3890
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3892

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3893
# Body
# {
.annotate 'line', 3895
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3896
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3897
self.'annotate'(__ARG_1)
.annotate 'line', 3898
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3899
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3900
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3899
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3901

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3832
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3834
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3908
# Body
# {
.annotate 'line', 3910
self.'optimizearg'()
.annotate 'line', 3911
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3912
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3913
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3914
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3915
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3916
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3917
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3918
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3919
# var t: $P5
null $P5
.annotate 'line', 3920
# string es: $S3
getattribute $P10, $P3, 'str'
null $S3
if_null $P10, __label_6
set $S3, $P10
__label_6:
.annotate 'line', 3921
# string rs: $S4
getattribute $P10, $P4, 'str'
null $S4
if_null $P10, __label_7
set $S4, $P10
__label_7:
.annotate 'line', 3922
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3923
new $P10, [ 'TokenSingleQuoted' ]
getattribute $P11, $P3, 'file'
getattribute $P12, $P3, 'line'
concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
set $P5, $P10
goto __label_9
__label_8: # else
.annotate 'line', 3925
new $P13, [ 'TokenQuoted' ]
getattribute $P14, $P3, 'file'
getattribute $P15, $P3, 'line'
concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
set $P5, $P13
__label_9: # endif
.annotate 'line', 3926
new $P11, [ 'StringLiteral' ]
getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
set $P10, $P11
.return($P10)
# }
__label_4: # endif
.annotate 'line', 3928
iseq $I3, $S1, 'I'
unless $I3 goto __label_12
iseq $I3, $S2, 'I'
__label_12:
unless $I3 goto __label_11
# {
.annotate 'line', 3929
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3930
# int ln: $I1
set $P10, $P6
set $I1, $P10
.annotate 'line', 3931
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3932
# int rn: $I2
set $P10, $P7
set $I2, $P10
.annotate 'line', 3933
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $I3, $I1, $I2
.tailcall 'integerValue'($P10, $P11, $I3)
# }
__label_11: # endif
# {
.annotate 'line', 3936
$P10 = 'floatresult'($S1, $S2)
if_null $P10, __label_13
unless $P10 goto __label_13
# {
.annotate 'line', 3937
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3938
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3939
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3940
# float rf: $N2
# predefined string
set $S5, $P9
set $N2, $S5
.annotate 'line', 3941
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3945
iseq $I3, $S1, 'S'
unless $I3 goto __label_15
iseq $I3, $S2, 'S'
__label_15:
unless $I3 goto __label_14
# {
.annotate 'line', 3946
new $P11, [ 'ConcatString' ]
getattribute $P12, self, 'owner'
getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
set $P10, $P11
.return($P10)
# }
__label_14: # endif
.annotate 'line', 3948
.return(self)
# }
.annotate 'line', 3949

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3950
# Body
# {
.annotate 'line', 3952
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3953
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3954
ne $S1, $S2, __label_2
.annotate 'line', 3955
.return($S1)
__label_2: # endif
.annotate 'line', 3956
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3957
.return('S')
__label_3: # endif
.annotate 'line', 3958
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3959
.return('S')
__label_5: # endif
.annotate 'line', 3960
$P1 = 'floatresult'($S1, $S2)
if_null $P1, __label_7
unless $P1 goto __label_7
.annotate 'line', 3961
.return('N')
__label_7: # endif
.annotate 'line', 3962
.return('I')
# }
.annotate 'line', 3963

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3964
# Body
# {
.annotate 'line', 3966
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3967
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3968
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3969
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3970
# string rtype: $S3
$P3 = $P2.'checkresult'()
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3972
# string rleft: $S4
$P3 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3973
# string rright: $S5
$P3 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_4
set $S5, $P3
__label_4:
.annotate 'line', 3974
ne $S1, 'S', __label_5
# {
.annotate 'line', 3975
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3976
# string aux: $S6
$P3 = self.'tempreg'('S')
null $S6
if_null $P3, __label_9
set $S6, $P3
__label_9:
.annotate 'line', 3977
eq $S2, 'S', __label_10
# {
.annotate 'line', 3978
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 3979
set $S4, $S6
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3982
__ARG_1.'emitset'($S6, $S5)
.annotate 'line', 3983
set $S5, $S6
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3986
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3989
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3990
# string l: $S7
null $S7
.annotate 'line', 3991
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3993
$P3 = self.'tempreg'('I')
set $S7, $P3
.annotate 'line', 3994
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3996
# string r: $S8
null $S8
.annotate 'line', 3997
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3999
$P3 = self.'tempreg'('I')
set $S8, $P3
.annotate 'line', 4000
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 4002
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 4005
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 4007

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3906
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 4014
# Body
# {
.annotate 'line', 4016
self.'optimizearg'()
.annotate 'line', 4017
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4018
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4019
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4020
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4021
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4022
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4023
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4024
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4025
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4026
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4027
getattribute $P5, self, 'owner'
getattribute $P6, self, 'start'
sub $I3, $I1, $I2
.tailcall 'integerValue'($P5, $P6, $I3)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4030
.return(self)
# }
.annotate 'line', 4031

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4032
# Body
# {
.annotate 'line', 4034
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4035
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4036
ne $S1, $S2, __label_2
.annotate 'line', 4037
.return($S1)
__label_2: # endif
.annotate 'line', 4038
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 4039
.return('N')
__label_3: # endif
.annotate 'line', 4040
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 4041
.return('N')
__label_5: # endif
.annotate 'line', 4042
.return('I')
# }
.annotate 'line', 4043

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4044
# Body
# {
.annotate 'line', 4046
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4047
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4048
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 4049

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4012
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 4056
# Body
# {
.annotate 'line', 4058
self.'optimizearg'()
.annotate 'line', 4059
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4060
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4061
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4062
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4063
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 4064
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4065
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 4066
# int ln: $I1
set $P7, $P3
set $I1, $P7
.annotate 'line', 4067
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 4068
# int rn: $I2
set $P7, $P4
set $I2, $P7
.annotate 'line', 4069
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $I3, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I3)
# }
__label_4: # endif
# {
.annotate 'line', 4072
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4073
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 4074
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 4075
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 4076
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 4077
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P7, $P8, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 4081
.return(self)
# }
.annotate 'line', 4082

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4083
# Body
# {
.annotate 'line', 4085
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4086
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4087
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4088
ne $S1, $S2, __label_2
.annotate 'line', 4089
.return($S1)
__label_2: # endif
.annotate 'line', 4090
ne $S1, 'S', __label_3
.annotate 'line', 4091
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 4093
.return('N')
__label_4: # endif
# }
.annotate 'line', 4094

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4095
# Body
# {
.annotate 'line', 4097
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4098
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4099
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 4100
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 4101
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 4102
ne $S1, 'S', __label_2
# {
.annotate 'line', 4103
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4104
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4105
# string rval: $S5
null $S5
.annotate 'line', 4106
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
.annotate 'line', 4108
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 4111
$P3 = self.'tempreg'('I')
set $S5, $P3
.annotate 'line', 4112
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 4114
self.'annotate'(__ARG_1)
.annotate 'line', 4115
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4116
.return()
# }
__label_2: # endif
.annotate 'line', 4118
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
.annotate 'line', 4119
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4120
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4121
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4122
.return()
# }
__label_6: # endif
.annotate 'line', 4127
ne $S1, 'N', __label_10
# {
.annotate 'line', 4128
$P3 = $P1.'emit_get'(__ARG_1)
set $S3, $P3
.annotate 'line', 4129
$P3 = $P2.'emit_get'(__ARG_1)
set $S4, $P3
.annotate 'line', 4130
# string rval: $S6
null $S6
.annotate 'line', 4131
set $S7, $S2
set $S8, 'I'
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 4133
$P3 = self.'tempreg'('N')
set $S6, $P3
.annotate 'line', 4134
__ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4135
set $S6, $S4
goto __label_11 # break
__label_14: # case
.annotate 'line', 4138
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 4141
$P4 = self.'tempreg'('N')
set $S6, $P4
.annotate 'line', 4142
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 4144
set $S7, __ARG_2
eq $S7, '', __label_15
# {
.annotate 'line', 4145
self.'annotate'(__ARG_1)
.annotate 'line', 4146
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
__label_15: # endif
.annotate 'line', 4148
.return()
# }
__label_10: # endif
.annotate 'line', 4151
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 4152
$P3 = $P1.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_18
$I3 = $P1.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 4153
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S3, $P4
.annotate 'line', 4154
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4157
$P3 = $P1.'getIntegerValue'()
set $I1, $P3
.annotate 'line', 4158
set $S3, $I1
# }
__label_17: # endif
.annotate 'line', 4160
$P3 = $P2.'issimple'()
isfalse $I3, $P3
if $I3 goto __label_21
$I3 = $P2.'isidentifier'()
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 4161
$P5 = self.'checkresult'()
$P4 = self.'tempreg'($P5)
set $S4, $P4
.annotate 'line', 4162
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 4165
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
.annotate 'line', 4167
$P4 = self.'checkresult'()
$P3 = self.'tempreg'($P4)
set $S4, $P3
.annotate 'line', 4168
$P2.'emit'(__ARG_1, $S4)
goto __label_22 # break
__label_25: # case
.annotate 'line', 4171
$P5 = $P2.'emit_get'(__ARG_1)
set $S4, $P5
goto __label_22 # break
__label_26: # case
__label_23: # default
.annotate 'line', 4175
$P6 = $P2.'getIntegerValue'()
set $I2, $P6
.annotate 'line', 4176
set $S4, $I2
goto __label_22 # break
__label_22: # switch end
.annotate 'line', 4177
# }
__label_20: # endif
.annotate 'line', 4180
self.'annotate'(__ARG_1)
.annotate 'line', 4181
set $S7, __ARG_2
ne $S7, '', __label_27
.annotate 'line', 4182
$P3 = self.'checkresult'()
__ARG_2 = self.'tempreg'($P3)
__label_27: # endif
.annotate 'line', 4183
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4184

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4054
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4191
# Body
# {
.annotate 'line', 4193
self.'optimizearg'()
.annotate 'line', 4194
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4195
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 4196
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 4197
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 4198
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 4199
# var lval: $P3
null $P3
.annotate 'line', 4200
# var rval: $P4
null $P4
.annotate 'line', 4201
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 4202
getattribute $P3, $P1, 'numval'
.annotate 'line', 4203
# int ln: $I1
set $P5, $P3
set $I1, $P5
.annotate 'line', 4204
getattribute $P4, $P2, 'numval'
.annotate 'line', 4205
# int rn: $I2
set $P5, $P4
set $I2, $P5
.annotate 'line', 4206
eq $I2, 0, __label_6
.annotate 'line', 4207
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
.annotate 'line', 4210
$P5 = 'floatresult'($S1, $S2)
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 4211
getattribute $P3, $P1, 'numval'
.annotate 'line', 4212
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 4213
getattribute $P4, $P2, 'numval'
.annotate 'line', 4214
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
.annotate 'line', 4215
set $N3, 0
eq $N2, $N3, __label_8
.annotate 'line', 4216
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
.annotate 'line', 4220
.return(self)
# }
.annotate 'line', 4221

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4222
# Body
# {
.annotate 'line', 4224
.return('N')
# }
.annotate 'line', 4225

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4226
# Body
# {
.annotate 'line', 4228
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4229
# var aux: $P2
null $P2
.annotate 'line', 4230
# var lreg: $P3
$P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4231
$P6 = $P1.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_0
# {
.annotate 'line', 4232
$P2 = self.'tempreg'('N')
.annotate 'line', 4233
__ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4234
set $P3, $P2
# }
__label_0: # endif
.annotate 'line', 4236
# var rexpr: $P4
getattribute $P4, self, 'rexpr'
.annotate 'line', 4237
# var rreg: $P5
$P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4238
$P6 = $P4.'checkresult'()
set $S1, $P6
eq $S1, 'N', __label_1
# {
.annotate 'line', 4239
$P2 = self.'tempreg'('N')
.annotate 'line', 4240
__ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4241
set $P5, $P2
# }
__label_1: # endif
.annotate 'line', 4243
self.'annotate'(__ARG_1)
.annotate 'line', 4244
__ARG_1.'say'('div ', __ARG_2, ', ', $P3, ', ', $P5)
# }
.annotate 'line', 4245

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4189
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4252
# Body
# {
.annotate 'line', 4254
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4255
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4256
self.'annotate'(__ARG_1)
.annotate 'line', 4257
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4258

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4259
# Body
# {
.annotate 'line', 4261
mod $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4262

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4250
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4269
# Body
# {
.annotate 'line', 4271
.return('I')
# }
.annotate 'line', 4272

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4273
# Body
# {
.annotate 'line', 4275
# string lreg: $S1
$P1 = self.'emit_intleft'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4276
# string rreg: $S2
$P1 = self.'emit_intright'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4277
self.'annotate'(__ARG_1)
.annotate 'line', 4282
__ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4283

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4267
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4290
# Body
# {
.annotate 'line', 4292
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
.annotate 'line', 4293
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4294
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4295
self.'annotate'(__ARG_1)
.annotate 'line', 4296
__ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4297

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4298
# Body
# {
.annotate 'line', 4300
shl $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4301

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4288
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4308
# Body
# {
.annotate 'line', 4310
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
.annotate 'line', 4311
# string lreg: $S2
$P1 = self.'emit_intleft'(__ARG_1)
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 4312
# string rreg: $S3
$P1 = self.'emit_intright'(__ARG_1)
null $S3
if_null $P1, __label_4
set $S3, $P1
__label_4:
.annotate 'line', 4313
self.'annotate'(__ARG_1)
.annotate 'line', 4314
__ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4315

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4316
# Body
# {
.annotate 'line', 4318
shr $I1, __ARG_1, __ARG_2
.return($I1)
# }
.annotate 'line', 4319

.end # do_op

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4306
get_class $P1, [ 'OpBinaryIntExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4328
# Body
# {
.annotate 'line', 4330
setattribute self, 'arg', __ARG_1
.annotate 'line', 4331
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4332

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4333
# Body
# {
.annotate 'line', 4335
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4336
.return(self)
# }
.annotate 'line', 4337

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4338
# Body
# {
.annotate 'line', 4340
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4341

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4326
addattribute $P0, 'arg'
.annotate 'line', 4327
addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 4351
# Body
# {
.annotate 'line', 4353
setattribute self, 'owner', __ARG_1
.annotate 'line', 4354
setattribute self, 'start', __ARG_2
.annotate 'line', 4355
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4356
# var t: $P2
$P2 = __ARG_3.'get'()
.annotate 'line', 4357
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4358
__ARG_3.'unget'($P2)
__label_1: # do
.annotate 'line', 4359
# {
.annotate 'line', 4360
# var modifier: $P3
null $P3
.annotate 'line', 4361
# var expr: $P4
$P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4362
$P2 = __ARG_3.'get'()
.annotate 'line', 4363
$P5 = $P2.'isop'(':')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4364
$P2 = __ARG_3.'get'()
.annotate 'line', 4365
$P5 = $P2.'isop'('[')
if_null $P5, __label_5
unless $P5 goto __label_5
# {
.annotate 'line', 4366
new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_3, __ARG_1)
set $P3, $P6
.annotate 'line', 4367
$P2 = __ARG_3.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4370
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4373
new $P6, [ 'Argument' ]
$P6.'Argument'($P4, $P3)
set $P5, $P6
# predefined push
push $P1, $P5
# }
__label_3: # continue
.annotate 'line', 4374
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4375
$P5 = $P2.'isop'(__ARG_4)
isfalse $I1, $P5
unless $I1 goto __label_7
.annotate 'line', 4376
'SyntaxError'("Unfinished argument list", $P2)
__label_7: # endif
.annotate 'line', 4377
# predefined elements
elements $I1, $P1
le $I1, 0, __label_8
.annotate 'line', 4378
setattribute self, 'args', $P1
__label_8: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4380

.end # ArgumentList


.sub 'numargs' :method

.annotate 'line', 4381
# Body
# {
.annotate 'line', 4383
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4384
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.return($I1)
# }
.annotate 'line', 4385

.end # numargs


.sub 'getrawargs' :method

.annotate 'line', 4386
# Body
# {
.annotate 'line', 4388
getattribute $P1, self, 'args'
.return($P1)
# }
.annotate 'line', 4389

.end # getrawargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 4390
# Body
# {
.annotate 'line', 4392
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4393
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 4394

.end # getarg


.sub 'getfreearg' :method
.param int __ARG_1

.annotate 'line', 4395
# Body
# {
.annotate 'line', 4397
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4398
$P2 = $P1[__ARG_1]
getattribute $P3, $P2, 'arg'
.return($P3)
# }
.annotate 'line', 4399

.end # getfreearg


.sub 'optimize' :method

.annotate 'line', 4400
# Body
# {
.annotate 'line', 4402
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4403
if_null $P1, __label_0
.annotate 'line', 4404
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 4405
.return(self)
# }
.annotate 'line', 4406

.end # optimize


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 4407
# Body
# {
.annotate 'line', 4409
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4410
unless_null $P1, __label_0
# {
.annotate 'line', 4411
# string regs: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4412
# string pnull: $S1
set $S1, ''
.annotate 'line', 4413
set $P1, $P2
.annotate 'line', 4414
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4415
# int nargs: $I1
# predefined elements
elements $I1, $P3
# for loop
.annotate 'line', 4416
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4417
# var a: $P4
$P5 = $P3[$I2]
getattribute $P4, $P5, 'arg'
.annotate 'line', 4418
# string reg: $S2
null $S2
.annotate 'line', 4419
$P5 = $P4.'isnull'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4421
ne $S1, '', __label_6
# {
.annotate 'line', 4422
getattribute $P7, self, 'owner'
$P6 = $P7.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4423
__ARG_1.'emitnull'($S1)
.annotate 'line', 4424
set $S2, $S1
# }
__label_6: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 4428
$P5 = $P4.'emit_get'(__ARG_1)
set $S2, $P5
__label_5: # endif
.annotate 'line', 4429
# predefined push
push $P1, $S2
# }
__label_1: # for iteration
.annotate 'line', 4416
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 4431
setattribute self, 'argregs', $P1
# }
__label_0: # endif
.annotate 'line', 4433
.return($P1)
# }
.annotate 'line', 4434

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 4435
# Body
# {
.annotate 'line', 4437
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4438
# var argreg: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4440
# string sep: $S1
set $S1, ''
.annotate 'line', 4441
# int n: $I1
$P6 = self.'numargs'()
set $I1, $P6
# for loop
.annotate 'line', 4442
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4443
# string a: $S2
$S2 = $P2[$I2]
.annotate 'line', 4444
__ARG_1.'print'($S1, $S2)
.annotate 'line', 4445
# int isflat: $I3
null $I3
# int isnamed: $I4
null $I4
.annotate 'line', 4446
# string setname: $S3
set $S3, ''
.annotate 'line', 4447
# var modifiers: $P3
$P6 = $P1[$I2]
getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4448
if_null $P3, __label_3
# {
.annotate 'line', 4449
$P6 = $P3.'getlist'()
iter $P7, $P6
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4450
# string name: $S4
$P8 = $P4.'getname'()
null $S4
if_null $P8, __label_6
set $S4, $P8
__label_6:
.annotate 'line', 4451
ne $S4, 'flat', __label_7
.annotate 'line', 4452
set $I3, 1
__label_7: # endif
.annotate 'line', 4453
ne $S4, 'named', __label_8
# {
.annotate 'line', 4454
set $I4, 1
.annotate 'line', 4455
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
.annotate 'line', 4459
# var argmod: $P5
$P5 = $P4.'getarg'(0)
.annotate 'line', 4460
$P8 = $P5.'isstringliteral'()
isfalse $I7, $P8
unless $I7 goto __label_13
.annotate 'line', 4461
getattribute $P9, self, 'start'
'SyntaxError'('Invalid modifier', $P9)
__label_13: # endif
.annotate 'line', 4462
$P10 = $P5.'getPirString'()
set $S3, $P10
goto __label_9 # break
__label_10: # default
.annotate 'line', 4465
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
.annotate 'line', 4470
and $I5, $I3, $I4
unless $I5 goto __label_14
.annotate 'line', 4471
__ARG_1.'print'(' :flat :named')
goto __label_15
__label_14: # else
.annotate 'line', 4472
unless $I3 goto __label_16
.annotate 'line', 4473
__ARG_1.'print'(' :flat')
goto __label_17
__label_16: # else
.annotate 'line', 4474
unless $I4 goto __label_18
# {
.annotate 'line', 4475
__ARG_1.'print'(' :named')
.annotate 'line', 4476
eq $S3, '', __label_19
.annotate 'line', 4477
__ARG_1.'print'("(", $S3, ")")
__label_19: # endif
# }
__label_18: # endif
__label_17: # endif
__label_15: # endif
.annotate 'line', 4479
set $S1, ', '
# }
__label_0: # for iteration
.annotate 'line', 4442
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4481

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4346
addattribute $P0, 'owner'
.annotate 'line', 4347
addattribute $P0, 'start'
.annotate 'line', 4348
addattribute $P0, 'args'
.annotate 'line', 4349
addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4484
# Body
# {
.annotate 'line', 4486
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4487
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4488
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4489
.return(1)
# }
.annotate 'line', 4490

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4499
# Body
# {
.annotate 'line', 4501
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4502
setattribute self, 'predef', __ARG_3
.annotate 'line', 4503
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4504

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4505
# Body
# {
.annotate 'line', 4507
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4508

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4509
# Body
# {
.annotate 'line', 4511
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4512
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4513
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4514
# var arg: $P4
null $P4
.annotate 'line', 4515
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
.annotate 'line', 4516
# string pnull: $S1
set $S1, ''
.annotate 'line', 4517
set $I4, $I1
set $I5, -1
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4519
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4520
# string reg: $S2
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4522
ne $S2, 'null', __label_7
# {
.annotate 'line', 4523
ne $S1, '', __label_8
# {
.annotate 'line', 4524
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4525
__ARG_1.'emitnull'($S1)
# }
__label_8: # endif
.annotate 'line', 4527
set $S2, $S1
# }
__label_7: # endif
.annotate 'line', 4529
# predefined push
push $P3, $S2
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4533
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4534
iter $P9, $P2
set $P9, 0
__label_9: # for iteration
unless $P9 goto __label_10
shift $P4, $P9
.annotate 'line', 4535
getattribute $P8, $P4, 'arg'
# predefined push
push $P5, $P8
goto __label_9
__label_10: # endfor
.annotate 'line', 4536
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4537
.return()
__label_1: # default
.annotate 'line', 4539
# int n: $I2
getattribute $P12, self, 'args'
set $I2, $P12
# for loop
.annotate 'line', 4540
# int i: $I3
null $I3
__label_13: # for condition
ge $I3, $I2, __label_12
# {
.annotate 'line', 4541
$P13 = $P2[$I3]
getattribute $P4, $P13, 'arg'
.annotate 'line', 4542
# string argtype: $S3
$P6 = $P4.'checkresult'()
null $S3
if_null $P6, __label_14
set $S3, $P6
__label_14:
.annotate 'line', 4543
# string paramtype: $S4
$P6 = $P1.'paramtype'($I3)
null $S4
if_null $P6, __label_15
set $S4, $P6
__label_15:
.annotate 'line', 4544
# string argr: $S5
null $S5
.annotate 'line', 4545
$P6 = $P4.'isnull'()
if_null $P6, __label_16
unless $P6 goto __label_16
# {
.annotate 'line', 4546
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
.annotate 'line', 4550
$P8 = self.'tempreg'($S4)
set $S5, $P8
.annotate 'line', 4551
__ARG_1.'emitnull'($S5)
__label_19: # default
.annotate 'line', 4553
ne $S1, '', __label_23
# {
.annotate 'line', 4554
$P10 = self.'tempreg'('P')
set $S1, $P10
.annotate 'line', 4555
__ARG_1.'emitnull'($S1)
# }
__label_23: # endif
.annotate 'line', 4557
set $S5, $S1
__label_18: # switch end
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 4561
iseq $I4, $S3, $S4
if $I4 goto __label_26
iseq $I4, $S4, '?'
__label_26:
unless $I4 goto __label_24
.annotate 'line', 4562
$P6 = $P4.'emit_get'(__ARG_1)
set $S5, $P6
goto __label_25
__label_24: # else
# {
.annotate 'line', 4564
# string aux: $S6
null $S6
.annotate 'line', 4565
$P6 = self.'tempreg'($S4)
set $S5, $P6
.annotate 'line', 4566
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
.annotate 'line', 4568
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
.annotate 'line', 4572
$P6 = $P4.'emit_get'(__ARG_1)
set $S6, $P6
.annotate 'line', 4573
__ARG_1.'emitbox'($S5, $S6)
goto __label_33 # break
__label_34: # default
.annotate 'line', 4576
$P4.'emit'(__ARG_1, $S5)
__label_33: # switch end
goto __label_27 # break
__label_30: # case
__label_31: # case
__label_32: # case
.annotate 'line', 4582
$P8 = $P4.'emit_get'(__ARG_1)
set $S6, $P8
.annotate 'line', 4583
__ARG_1.'emitset'($S5, $S6)
goto __label_27 # break
__label_28: # default
.annotate 'line', 4586
$P4.'emit'(__ARG_1, $S5)
__label_27: # switch end
# }
__label_25: # endif
# }
__label_17: # endif
.annotate 'line', 4590
# predefined push
push $P3, $S5
# }
__label_11: # for iteration
.annotate 'line', 4540
inc $I3
goto __label_13
__label_12: # for end
__label_0: # switch end
.annotate 'line', 4593
getattribute $P6, self, 'predef'
getattribute $P8, self, 'start'
$P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4594

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4494
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4496
addattribute $P0, 'predef'
.annotate 'line', 4497
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4604
# Body
# {
.annotate 'line', 4606
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4607
setattribute self, 'funref', __ARG_4
.annotate 'line', 4608
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4609
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 4610
__ARG_1.'unget'($P1)
.annotate 'line', 4611
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
set $P3, $P4
setattribute self, 'args', $P3
# }
__label_0: # endif
# }
.annotate 'line', 4613

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4614
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4615
# Body
# {
.annotate 'line', 4617
# var funref: $P1
getattribute $P6, self, 'funref'
$P1 = $P6.'optimize'()
.annotate 'line', 4618
setattribute self, 'funref', $P1
.annotate 'line', 4619
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4620
# int nargs: $I1
null $I1
.annotate 'line', 4621
if_null $P2, __label_0
# {
.annotate 'line', 4622
$P2 = $P2.'optimize'()
.annotate 'line', 4623
$P6 = $P2.'numargs'()
set $I1, $P6
.annotate 'line', 4624
setattribute self, 'args', $P2
# }
__label_0: # endif
.annotate 'line', 4628
$P6 = $P1.'isidentifier'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 4629
# string call: $S1
$P7 = $P1.'getName'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 4630
# var predef: $P3
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4631
if_null $P3, __label_3
# {
.annotate 'line', 4632
self.'use_predef'($S1)
.annotate 'line', 4633
# var rawargs: $P4
ne $I1, 0, __label_5
root_new $P6, ['parrot';'ResizablePMCArray']
set $P4, $P6
goto __label_4
__label_5:
$P4 = $P2.'getrawargs'()
__label_4:
.annotate 'line', 4636
# var evalfun: $P5
getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4637
if_null $P5, __label_6
# {
.annotate 'line', 4638
$P6 = 'arglist_hascompilevalue'($P4)
if_null $P6, __label_7
unless $P6 goto __label_7
.annotate 'line', 4639
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
.tailcall $P5($P7, $P8, $P4)
__label_7: # endif
# }
__label_6: # endif
.annotate 'line', 4642
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
.annotate 'line', 4646
.return(self)
# }
.annotate 'line', 4647

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4648
# Body
# {
.annotate 'line', 4650
.return(1)
# }
.annotate 'line', 4651

.end # cantailcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4652
# Body
# {
.annotate 'line', 4654
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4655
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4656
# string call: $S1
null $S1
.annotate 'line', 4657
unless $I1 goto __label_0
.annotate 'line', 4658
$P3 = $P1.'emit_left_get'(__ARG_1)
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 4660
$P4 = $P1.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4661
$P5 = $P1.'checkIdentifier'()
set $S1, $P5
.annotate 'line', 4662
ne $S1, '', __label_4
# {
.annotate 'line', 4663
# string aux: $S2
$P3 = $P1.'getName'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 4664
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
# }
__label_4: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4668
$P3 = $P1.'emit_get'(__ARG_1)
set $S1, $P3
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 4670
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4671
if_null $P2, __label_6
.annotate 'line', 4672
$P2.'getargvalues'(__ARG_1)
__label_6: # endif
.annotate 'line', 4674
self.'annotate'(__ARG_1)
.annotate 'line', 4676
isnull $I2, __ARG_2
not $I2
unless $I2 goto __label_8
set $S3, __ARG_2
isne $I2, $S3, ''
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 4677
set $S4, __ARG_2
ne $S4, '.tailcall', __label_9
.annotate 'line', 4678
__ARG_1.'print'('.tailcall ')
goto __label_10
__label_9: # else
.annotate 'line', 4680
__ARG_1.'print'(__ARG_2, ' = ')
__label_10: # endif
# }
__label_7: # endif
.annotate 'line', 4683
unless $I1 goto __label_11
.annotate 'line', 4684
$P3 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P3, "'")
goto __label_12
__label_11: # else
.annotate 'line', 4686
__ARG_1.'print'($S1)
__label_12: # endif
.annotate 'line', 4688
__ARG_1.'print'('(')
.annotate 'line', 4689
if_null $P2, __label_13
.annotate 'line', 4690
$P2.'emitargs'(__ARG_1)
__label_13: # endif
.annotate 'line', 4691
__ARG_1.'say'(')')
# }
.annotate 'line', 4692

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4599
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4601
addattribute $P0, 'funref'
.annotate 'line', 4602
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4702
# Body
# {
.annotate 'line', 4704
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4705
setattribute self, 'left', __ARG_4
.annotate 'line', 4706
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4707

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4708
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4709
# Body
# {
.annotate 'line', 4711
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4712
.return(self)
# }
.annotate 'line', 4713

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4714
# Body
# {
.annotate 'line', 4716
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4717

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4718
# Body
# {
.annotate 'line', 4720
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4721
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4722
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4723
eq $S1, 'P', __label_2
# {
.annotate 'line', 4724
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4725
$P2 = self.'tempreg'('P')
set $S2, $P2
.annotate 'line', 4726
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4728
.return($S2)
# }
.annotate 'line', 4729

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4730
# Body
# {
.annotate 'line', 4732
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4733
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4734
# string result: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4735
self.'annotate'(__ARG_1)
.annotate 'line', 4736
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4737
.return($S3)
# }
.annotate 'line', 4738

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4739
# Body
# {
.annotate 'line', 4741
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4742
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4743
self.'annotate'(__ARG_1)
.annotate 'line', 4744
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4745

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4746
# Body
# {
.annotate 'line', 4748
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4749

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4750
# Body
# {
.annotate 'line', 4752
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4753
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4754
# string value: $S3
null $S3
.annotate 'line', 4755
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4757
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4758
$P1 = self.'tempreg'('P')
set __ARG_3, $P1
.annotate 'line', 4759
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
.annotate 'line', 4761
set $S3, __ARG_3
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4764
$P1 = self.'tempreg'('P')
set $S3, $P1
.annotate 'line', 4765
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4767
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4768

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4769
# Body
# {
.annotate 'line', 4771
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4772
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4773
# string value: $S3
$P1 = self.'tempreg'('P')
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 4774
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_3
unless $P1 goto __label_3
.annotate 'line', 4775
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4777
# string rreg: $S4
$P2 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_5
set $S4, $P2
__label_5:
.annotate 'line', 4778
$P1 = __ARG_2.'checkresult'()
set $S5, $P1
eq $S5, 'P', __label_6
.annotate 'line', 4779
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
.annotate 'line', 4781
set $S3, $S4
__label_7: # endif
# }
__label_4: # endif
.annotate 'line', 4783
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4784
.return($S3)
# }
.annotate 'line', 4785

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4697
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4699
addattribute $P0, 'left'
.annotate 'line', 4700
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4796
# Body
# {
.annotate 'line', 4798
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4799
setattribute self, 'left', __ARG_4
.annotate 'line', 4800
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4801

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4802
# Body
# {
.annotate 'line', 4804
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4805
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4807
.return('P')
__label_1: # endif
# }
.annotate 'line', 4808

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4809
# Body
# {
.annotate 'line', 4811
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4812
setattribute self, 'left', $P1
.annotate 'line', 4813
self.'optimizeargs'()
.annotate 'line', 4817
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P4 = self.'numargs'()
set $I3, $P4
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4818
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4819
$P4 = $P2.'isintegerliteral'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4820
# int ival: $I1
$P5 = $P2.'getIntegerValue'()
set $I1, $P5
.annotate 'line', 4821
# string sval: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 4822
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P4, self, 'start'
getattribute $P5, $P4, 'file'
getattribute $P6, self, 'start'
getattribute $P7, $P6, 'line'
.annotate 'line', 4823
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 4824
new $P5, [ 'StringLiteral' ]
getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
set $P4, $P5
.return($P4)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4827
.return(self)
# }
.annotate 'line', 4828

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 4829
# Body
# {
.annotate 'line', 4831
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4832
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4833
isnull $I1, $P1
not $I1
if $I1 goto __label_1
isnull $I1, $P2
not $I1
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4834
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_args', $P3)
__label_0: # endif
.annotate 'line', 4835
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 4836
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_3
__label_2: # else
.annotate 'line', 4838
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_3: # endif
.annotate 'line', 4839
setattribute self, 'regleft', $P1
.annotate 'line', 4840
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4841
setattribute self, 'argregs', $P2
# }
.annotate 'line', 4842

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 4843
# Body
# {
.annotate 'line', 4845
# var regleft: $P1
getattribute $P1, self, 'regleft'
.annotate 'line', 4846
# var argregs: $P2
getattribute $P2, self, 'argregs'
.annotate 'line', 4847
isnull $I1, $P1
if $I1 goto __label_1
isnull $I1, $P2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 4848
getattribute $P3, self, 'start'
'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
__label_0: # endif
.annotate 'line', 4849
getattribute $P3, self, 'regleft'
__ARG_1.'print'($P3, '[')
.annotate 'line', 4850
getattribute $P3, self, 'argregs'
# predefined join
join $S1, '; ', $P3
__ARG_1.'print'($S1)
.annotate 'line', 4851
__ARG_1.'print'(']')
# }
.annotate 'line', 4852

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4853
# Body
# {
.annotate 'line', 4855
self.'emit_prep'(__ARG_1)
.annotate 'line', 4856
# string type: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4857
ne $S1, 'S', __label_1
# {
.annotate 'line', 4858
# var argregs: $P1
getattribute $P1, self, 'argregs'
.annotate 'line', 4859
# int nargs: $I1
getattribute $P2, self, 'argregs'
# predefined elements
elements $I1, $P2
.annotate 'line', 4860
eq $I1, 1, __label_3
.annotate 'line', 4861
getattribute $P2, self, 'start'
'SyntaxError'('Bad string index', $P2)
__label_3: # endif
.annotate 'line', 4862
set $S2, __ARG_2
ne $S2, '', __label_4
.annotate 'line', 4863
__ARG_2 = self.'tempreg'('S')
__label_4: # endif
.annotate 'line', 4864
getattribute $P2, self, 'regleft'
$P3 = $P1[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 4867
self.'annotate'(__ARG_1)
.annotate 'line', 4868
__ARG_1.'print'(__ARG_2, ' = ')
.annotate 'line', 4869
self.'emit_aux'(__ARG_1)
.annotate 'line', 4870
__ARG_1.'say'('')
# }
__label_2: # endif
# }
.annotate 'line', 4872

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4873
# Body
# {
.annotate 'line', 4875
self.'emit_prep'(__ARG_1)
.annotate 'line', 4876
self.'annotate'(__ARG_1)
.annotate 'line', 4877
self.'emit_aux'(__ARG_1)
.annotate 'line', 4878
__ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 4879

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4880
# Body
# {
.annotate 'line', 4882
self.'emit_prep'(__ARG_1)
.annotate 'line', 4883
# string rreg: $S1
null $S1
.annotate 'line', 4884
$P1 = __ARG_2.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 4885
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 4886
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4889
$P1 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P1
__label_1: # endif
.annotate 'line', 4890
self.'annotate'(__ARG_1)
.annotate 'line', 4891
self.'emit_aux'(__ARG_1)
.annotate 'line', 4892
__ARG_1.'say'(' = ', $S1)
.annotate 'line', 4893
.return($S1)
# }
.annotate 'line', 4894

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4790
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4792
addattribute $P0, 'left'
.annotate 'line', 4793
addattribute $P0, 'regleft'
.annotate 'line', 4794
addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4903
# Body
# {
.annotate 'line', 4905
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4906
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4907
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4908
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4909
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4910
# {
.annotate 'line', 4911
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4912
getattribute $P3, self, 'values'
# predefined push
push $P3, $P2
# }
__label_3: # continue
.annotate 'line', 4913
$P1 = __ARG_1.'get'()
$P3 = $P1.'isop'(',')
if_null $P3, __label_2
if $P3 goto __label_1
__label_2: # enddo
.annotate 'line', 4914
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_4
.annotate 'line', 4915
'Expected'("']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4917

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4918
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4919
# Body
# {
.annotate 'line', 4921
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4922
.return(self)
# }
.annotate 'line', 4923

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4924
# Body
# {
.annotate 'line', 4926
set $S2, __ARG_2
eq $S2, '', __label_0
# {
.annotate 'line', 4927
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4928
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4934
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4936

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4937
# Body
# {
.annotate 'line', 4939
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4940
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4941
.return($S1)
# }
.annotate 'line', 4942

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4943
# Body
# {
.annotate 'line', 4945
self.'annotate'(__ARG_1)
.annotate 'line', 4946
# string itemreg: $S1
null $S1
.annotate 'line', 4947
# string it_p: $S2
null $S2
.annotate 'line', 4948
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4949
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4950
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4952
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4953
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
.annotate 'line', 4954
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
.annotate 'line', 4956
# string aux: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
.annotate 'line', 4957
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4958
__ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 4959
set $S1, $S2
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4963
$P2 = $P1.'isnull'()
if_null $P2, __label_11
unless $P2 goto __label_11
# {
.annotate 'line', 4964
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4965
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4966
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4970
$P2 = $P1.'emit_get'(__ARG_1)
set $S1, $P2
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4972
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4973
self.'annotate'(__ARG_1)
.annotate 'line', 4974
__ARG_1.'say'('push ', __ARG_2, ", ", $S1)
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4977

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4899
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4901
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4987
# Body
# {
.annotate 'line', 4989
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4990
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4991
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4992
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4993
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_0
# {
.annotate 'line', 4994
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4995
# {
.annotate 'line', 4996
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4997
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4998
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4999
# predefined push
push $P2, $P4
.annotate 'line', 5000
# predefined push
push $P3, $P5
# }
__label_3: # continue
.annotate 'line', 5002
$P1 = __ARG_1.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 5003
$P6 = $P1.'isop'('}')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 5004
'Expected'("',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 5006
setattribute self, 'keys', $P2
.annotate 'line', 5007
setattribute self, 'values', $P3
# }
.annotate 'line', 5008

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 5009
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5010
# Body
# {
.annotate 'line', 5012
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 5013
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5014
.return(self)
# }
.annotate 'line', 5015

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5016
# Body
# {
.annotate 'line', 5018
self.'annotate'(__ARG_1)
.annotate 'line', 5023
set $S6, __ARG_2
eq $S6, '', __label_0
.annotate 'line', 5024
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 5026
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 5027
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5028
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 5029
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 5030
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 5031
# string item: $S1
null $S1
.annotate 'line', 5032
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5033
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 5034
$P5 = self.'tempreg'('P')
set $S1, $P5
.annotate 'line', 5035
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 5038
$P5 = $P3.'emit_get'(__ARG_1)
set $S1, $P5
__label_5: # endif
.annotate 'line', 5040
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 5041
# string itemreg: $S3
null $S3
.annotate 'line', 5042
$P5 = $P4.'isnull'()
if_null $P5, __label_7
unless $P5 goto __label_7
# {
.annotate 'line', 5043
set $S6, __ARG_2
eq $S6, '', __label_9
# {
.annotate 'line', 5044
$P6 = self.'tempreg'('P')
set $S3, $P6
.annotate 'line', 5045
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 5048
$P5 = $P4.'isidentifier'()
if_null $P5, __label_10
unless $P5 goto __label_10
# {
.annotate 'line', 5049
# string s: $S4
$P6 = $P4.'checkIdentifier'()
null $S4
if_null $P6, __label_12
set $S4, $P6
__label_12:
.annotate 'line', 5050
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
.annotate 'line', 5051
set $S3, $S4
goto __label_14
__label_13: # else
# {
.annotate 'line', 5053
# string id: $S5
$P5 = $P4.'getName'()
null $S5
if_null $P5, __label_16
set $S5, $P5
__label_16:
.annotate 'line', 5054
getattribute $P6, self, 'owner'
$P5 = $P6.'getvar'($S5)
unless_null $P5, __label_17
# {
.annotate 'line', 5055
$P7 = self.'tempreg'('P')
set $S3, $P7
.annotate 'line', 5056
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 5059
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 5063
$P5 = $P4.'emit_get'(__ARG_1)
set $S3, $P5
__label_11: # endif
__label_8: # endif
.annotate 'line', 5064
set $S6, __ARG_2
eq $S6, '', __label_19
.annotate 'line', 5065
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 5029
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 5067

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5068
# Body
# {
.annotate 'line', 5070
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5071
self.'emit'(__ARG_1, $S1)
.annotate 'line', 5072
.return($S1)
# }
.annotate 'line', 5073

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4982
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4984
addattribute $P0, 'keys'
.annotate 'line', 4985
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 5082
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 5083
# Body
# {
.annotate 'line', 5087
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 5088
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5089
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 5090
__ARG_1.'unget'($P2)
.annotate 'line', 5091
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 5092
# {
.annotate 'line', 5093
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5094
# predefined push
push $P3, $P4
# }
__label_3: # continue
.annotate 'line', 5095
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 5096
setattribute self, 'initializer', $P3
.annotate 'line', 5097
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 5099

.end # parseinitializer


.sub 'optimize' :method

.annotate 'line', 5100
# Body
# {
.annotate 'line', 5102
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5103
if_null $P1, __label_0
.annotate 'line', 5104
'optimize_array'($P1)
__label_0: # endif
.annotate 'line', 5105
.return(self)
# }
.annotate 'line', 5106

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5078
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5080
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5115
# Body
# {
.annotate 'line', 5117
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5119
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 5120
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 5121
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5122
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 5123
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 5124
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5125
# predefined push
push $P2, __ARG_4
__label_6: # do
.annotate 'line', 5126
# {
.annotate 'line', 5127
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 5128
'RequireIdentifier'($P3)
.annotate 'line', 5129
# predefined push
push $P2, $P3
# }
__label_8: # continue
.annotate 'line', 5130
$P1 = __ARG_1.'get'()
$P4 = $P1.'isop'('.')
if_null $P4, __label_7
if $P4 goto __label_6
__label_7: # enddo
.annotate 'line', 5131
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 5134
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 5137
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 5139
$P4 = $P1.'isop'('(')
if_null $P4, __label_9
unless $P4 goto __label_9
.annotate 'line', 5140
self.'parseinitializer'(__ARG_1)
goto __label_10
__label_9: # else
.annotate 'line', 5142
__ARG_1.'unget'($P1)
__label_10: # endif
# }
.annotate 'line', 5143

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 5144
# Body
# {
.annotate 'line', 5146
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 5147
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5150
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 5151
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 5152
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 5153
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 5154
$P1 = $P3['value']
.annotate 'line', 5155
isa $I2, $P1, 'StringLiteral'
not $I1, $I2
unless $I1 goto __label_6
.annotate 'line', 5156
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 5157
getattribute $P6, $P1, 'strval'
setattribute self, 'value', $P6
# }
goto __label_5
__label_4: # else
.annotate 'line', 5160
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 5164
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 5165
if_null $P4, __label_7
.annotate 'line', 5166
getattribute $P5, self, 'initializer'
'optimize_array'($P5)
__label_7: # endif
.annotate 'line', 5167
.return(self)
# }
.annotate 'line', 5168

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 5169
# Body
# {
.annotate 'line', 5171
self.'annotate'(__ARG_1)
.annotate 'line', 5173
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5174
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
.annotate 'line', 5177
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 5178
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 5179
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
.annotate 'line', 5181
# string reginit: $S1
set $S1, ''
.annotate 'line', 5182
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 5183
# string constructor: $S3
null $S3
.annotate 'line', 5184
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
.annotate 'line', 5188
ne $I2, 1, __label_13
# {
.annotate 'line', 5189
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 5190
$P9 = self.'tempreg'('P')
set $S2, $P9
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 5193
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5194
$P9 = $P2.'emit_get'(__ARG_1)
set $S1, $P9
.annotate 'line', 5195
concat $S0, ', ', $S1
set $S1, $S0
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 5199
isne $I3, $I2, 1
unless $I3 goto __label_17
isne $I3, $I2, 2
__label_17:
unless $I3 goto __label_16
.annotate 'line', 5200
getattribute $P9, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P9)
__label_16: # endif
.annotate 'line', 5201
not $I4, __ARG_3
unless $I4 goto __label_18
.annotate 'line', 5202
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_18: # endif
__label_9: # switch end
.annotate 'line', 5205
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
.annotate 'line', 5208
# string name: $S4
getattribute $P10, self, 'value'
$P9 = $P10.'rawstring'()
null $S4
if_null $P9, __label_24
set $S4, $P9
__label_24:
.annotate 'line', 5209
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 5210
isnull $I5, $P3
unless $I5 goto __label_26
$I5 = self.'dowarnings'()
__label_26:
unless $I5 goto __label_25
.annotate 'line', 5211
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
getattribute $P11, self, 'value'
'Warn'($S6, $P11)
__label_25: # endif
.annotate 'line', 5215
getattribute $P12, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P12, " ]", $S1)
.annotate 'line', 5216
le $I1, 1, __label_27
# {
.annotate 'line', 5217
getattribute $P13, self, 'value'
__ARG_1.'say'($S2, ".'", $P13, "'()")
# }
__label_27: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 5221
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 5222
# predefined elements
elements $I4, $P4
sub $I3, $I4, 1
$S3 = $P4[$I3]
.annotate 'line', 5223
$P9 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 5226
# var id: $P5
getattribute $P10, self, 'owner'
getattribute $P11, self, 'value'
$P5 = $P10.'getvar'($P11)
.annotate 'line', 5227
unless_null $P5, __label_28
# {
.annotate 'line', 5229
# var cl: $P6
getattribute $P12, self, 'owner'
getattribute $P13, self, 'value'
$P6 = $P12.'checkclass'($P13)
.annotate 'line', 5230
if_null $P6, __label_30
# {
.annotate 'line', 5231
$P9 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P9, $S1)
# }
goto __label_31
__label_30: # else
# {
.annotate 'line', 5234
$P9 = self.'dowarnings'()
if_null $P9, __label_32
unless $P9 goto __label_32
.annotate 'line', 5235
'Warn'('Checking: new unknown type')
__label_32: # endif
.annotate 'line', 5236
getattribute $P9, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P9, "']", $S1)
# }
__label_31: # endif
.annotate 'line', 5238
getattribute $P9, self, 'value'
set $S3, $P9
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 5242
$P9 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P9, "", $S1)
# }
__label_29: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 5246
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 5248
isgt $I3, $I1, 1
if $I3 goto __label_34
isgt $I3, $I1, 0
unless $I3 goto __label_35
iseq $I3, $I2, 1
__label_35:
__label_34:
unless $I3 goto __label_33
# {
.annotate 'line', 5249
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5250
iter $P14, $P1
set $P14, 0
__label_36: # for iteration
unless $P14 goto __label_37
shift $P8, $P14
# {
.annotate 'line', 5251
# string reg: $S5
$P9 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P9, __label_38
set $S5, $P9
__label_38:
.annotate 'line', 5252
# predefined push
push $P7, $S5
# }
goto __label_36
__label_37: # endfor
.annotate 'line', 5254
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5255
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 5256
__ARG_1.'say'(")")
.annotate 'line', 5257
not $I3, __ARG_3
unless $I3 goto __label_39
.annotate 'line', 5258
__ARG_1.'emitset'(__ARG_2, $S2)
__label_39: # endif
# }
__label_33: # endif
# }
.annotate 'line', 5260

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5261
# Body
# {
.annotate 'line', 5263
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5264

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5111
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5113
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5273
# Body
# {
.annotate 'line', 5275
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5276
setattribute self, 'owner', __ARG_2
.annotate 'line', 5277
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5278
setattribute self, 'nskey', $P1
.annotate 'line', 5279
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5280
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5281
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5283
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5284

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5285
# Body
# {
.annotate 'line', 5287
# string reginit: $S1
null $S1
.annotate 'line', 5288
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5289
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5290
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
.annotate 'line', 5294
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 5295
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 5298
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 5300
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 5301
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5302
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 5303
__ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5304
null $P4
$P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5305
if_null $S1, __label_7
.annotate 'line', 5306
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 5307
__ARG_1.'say'()
# }
.annotate 'line', 5308

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5269
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5271
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5317
# Body
# {
.annotate 'line', 5319
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 5320
setattribute self, 'owner', __ARG_2
.annotate 'line', 5321
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5322
setattribute self, 'nskey', $P1
.annotate 'line', 5323
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5324
$P3 = $P2.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 5325
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 5327
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 5328

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5329
# Body
# {
.annotate 'line', 5331
# string reginit: $S1
null $S1
.annotate 'line', 5332
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 5334
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 5335
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 5336
le $I1, 0, __label_3
.annotate 'line', 5337
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 5338
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 5339
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 5340
getattribute $P5, self, 'owner'
$P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5341
__ARG_1.'say'()
.annotate 'line', 5343
le $I1, 0, __label_4
# {
.annotate 'line', 5344
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5345
iter $P6, $P1
set $P6, 0
__label_5: # for iteration
unless $P6 goto __label_6
shift $P4, $P6
# {
.annotate 'line', 5346
# string reg: $S3
$P5 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 5347
# predefined push
push $P3, $S3
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 5349
# string constructor: $S4
$P5 = $P2.'last'()
null $S4
if_null $P5, __label_8
set $S4, $P5
__label_8:
.annotate 'line', 5350
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5351
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 5352
__ARG_1.'say'(")")
.annotate 'line', 5353
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 5355

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5313
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 5315
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5360
# Body
# {
.annotate 'line', 5362
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5364
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 5366
new $P5, [ 'CallExpr' ]
.annotate 'line', 5367
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 5366
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5369
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 5371
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 5373
$P3 = $P1.'isidentifier'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 5376
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5377
__ARG_1.'unget'($P2)
.annotate 'line', 5378
$P3 = $P2.'isop'('.')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 5380
new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P4, $P5
.return($P4)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5384
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
.annotate 'line', 5389
new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P3, $P4
.return($P3)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5391

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5400
# Body
# {
.annotate 'line', 5402
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5403
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5404
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 5405

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5406
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5407
# Body
# {
.annotate 'line', 5409
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 5410
# string checkedval: $S1
null $S1
.annotate 'line', 5411
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5412
$P3 = $P1.'getidentifier'()
set $S1, $P3
.annotate 'line', 5413
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
# }
goto __label_1
__label_0: # else
.annotate 'line', 5416
set $S1, $P1
__label_1: # endif
.annotate 'line', 5417
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 5418
self.'annotate'(__ARG_1)
.annotate 'line', 5419
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5420

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5395
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5397
addattribute $P0, 'lexpr'
.annotate 'line', 5398
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5435
# Body
# {
.annotate 'line', 5437
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5438
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5439
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5440
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5441
.return(self)
# }
.annotate 'line', 5442

.end # set


.sub 'optimize' :method

.annotate 'line', 5443
# Body
# {
.annotate 'line', 5445
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5446
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
.annotate 'line', 5448
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5450
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5452
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5453
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5454
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5456

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5457
# Body
# {
.annotate 'line', 5459
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5460

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5461
# Body
# {
.annotate 'line', 5463
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5464
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5465
getattribute $P1, self, 'condition'
$P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5466
getattribute $P1, self, 'etrue'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5467
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5468
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5469
getattribute $P1, self, 'efalse'
$P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5470
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5471

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5425
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 5431
addattribute $P0, 'condition'
.annotate 'line', 5432
addattribute $P0, 'etrue'
.annotate 'line', 5433
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

.annotate 'line', 5512
# Body
# {
.annotate 'line', 5514
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
.annotate 'line', 5515
.return(1)
__label_3: # case
.annotate 'line', 5516
.return(2)
__label_4: # case
.annotate 'line', 5517
.return(3)
__label_1: # default
.annotate 'line', 5518
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5520

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5522
# Body
# {
.annotate 'line', 5524
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
.annotate 'line', 5525
.return(8)
__label_3: # case
.annotate 'line', 5526
.return(11)
__label_4: # case
.annotate 'line', 5527
.return(9)
__label_5: # case
.annotate 'line', 5528
.return(10)
__label_1: # default
.annotate 'line', 5530
$P2 = __ARG_1.'iskeyword'('delete')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(31)
goto __label_7
__label_6: # else
.annotate 'line', 5531
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5533

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5535
# Body
# {
.annotate 'line', 5537
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
.annotate 'line', 5538
.return(19)
__label_3: # case
.annotate 'line', 5539
.return(20)
__label_4: # case
.annotate 'line', 5540
.return(21)
__label_5: # case
.annotate 'line', 5541
.return(22)
__label_1: # default
.annotate 'line', 5542
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5544

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5546
# Body
# {
.annotate 'line', 5548
$P1 = __ARG_1.'checkop'()
set $S1, $P1
set $S2, '<<'
if $S1 == $S2 goto __label_2
set $S2, '>>'
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5549
.return(28)
__label_3: # case
.annotate 'line', 5550
.return(29)
__label_1: # default
.annotate 'line', 5551
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5553

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5555
# Body
# {
.annotate 'line', 5557
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
.annotate 'line', 5558
.return(14)
__label_3: # case
.annotate 'line', 5559
.return(16)
__label_4: # case
.annotate 'line', 5560
.return(15)
__label_5: # case
.annotate 'line', 5561
.return(17)
__label_1: # default
.annotate 'line', 5563
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5564
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5566

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5568
# Body
# {
.annotate 'line', 5570
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
.annotate 'line', 5571
.return(12)
__label_3: # case
.annotate 'line', 5572
.return(13)
__label_4: # case
.annotate 'line', 5573
.return(25)
__label_5: # case
.annotate 'line', 5574
.return(26)
__label_1: # default
.annotate 'line', 5575
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5577

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5579
# Body
# {
.annotate 'line', 5581
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
.annotate 'line', 5582
.return(4)
__label_3: # case
.annotate 'line', 5583
.return(5)
__label_4: # case
.annotate 'line', 5584
.return(6)
__label_5: # case
.annotate 'line', 5585
.return(18)
__label_6: # case
.annotate 'line', 5586
.return(23)
__label_7: # case
.annotate 'line', 5587
.return(24)
__label_8: # case
.annotate 'line', 5588
.return(30)
__label_1: # default
.annotate 'line', 5589
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5591

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5593
# Body
# {
.annotate 'line', 5595
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5597
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5598
# var expr: $P2
null $P2
.annotate 'line', 5599
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5600
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5601
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5602
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5604
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5605
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5606
$P4 = $P1.'isop'('{')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 5607
new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 5608
$P4 = $P1.'iskeyword'('new')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 5609
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5610
$P4 = $P1.'isstring'()
if_null $P4, __label_4
unless $P4 goto __label_4
.annotate 'line', 5611
new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_4: # endif
.annotate 'line', 5612
$P4 = $P1.'isint'()
if_null $P4, __label_5
unless $P4 goto __label_5
.annotate 'line', 5613
new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_5: # endif
.annotate 'line', 5614
$P4 = $P1.'isfloat'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 5615
new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_6: # endif
.annotate 'line', 5616
$P4 = $P1.'iskeyword'('function')
if_null $P4, __label_7
unless $P4 goto __label_7
.annotate 'line', 5617
new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_7: # endif
.annotate 'line', 5618
$P4 = $P1.'isidentifier'()
if_null $P4, __label_8
unless $P4 goto __label_8
.annotate 'line', 5619
new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_8: # endif
.annotate 'line', 5620
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5621

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5623
# Body
# {
.annotate 'line', 5625
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5626
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5628
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5629
# var t: $P2
null $P2
.annotate 'line', 5630
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5631
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5632
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
.annotate 'line', 5634
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5637
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5640
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5643
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5646
__ARG_1.'unget'($P2)
.annotate 'line', 5647
.return($P1)
# }
.annotate 'line', 5648

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5650
# Body
# {
.annotate 'line', 5652
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5654
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5655
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5656
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5657
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5658
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5659
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5662
__ARG_1.'unget'($P2)
.annotate 'line', 5663
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5665

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5667
# Body
# {
.annotate 'line', 5669
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5670
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5671
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5673
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5674
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5675
# var subexpr: $P2
null $P2
.annotate 'line', 5676
eq $I1, 0, __label_0
# {
.annotate 'line', 5677
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5678
# var oper: $P3
null $P3
.annotate 'line', 5679
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
.annotate 'line', 5681
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5684
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5687
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5690
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5693
new $P3, [ 'OpDeleteExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5696
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5698
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5701
__ARG_1.'unget'($P1)
.annotate 'line', 5702
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5704
.return($P2)
# }
.annotate 'line', 5705

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5707
# Body
# {
.annotate 'line', 5709
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5710
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5712
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5713
# var t: $P2
null $P2
.annotate 'line', 5714
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5715
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5716
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5717
# var aux: $P4
null $P4
.annotate 'line', 5718
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
.annotate 'line', 5720
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5723
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5726
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5729
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5732
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5734
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5735
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5737
__ARG_1.'unget'($P2)
.annotate 'line', 5738
.return($P1)
# }
.annotate 'line', 5739

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5741
# Body
# {
.annotate 'line', 5743
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5745
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5746
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5747
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5748
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5749
# var expr: $P4
null $P4
.annotate 'line', 5750
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5751
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5753
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
.annotate 'line', 5754
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5756
__ARG_1.'unget'($P2)
.annotate 'line', 5757
.return($P1)
# }
.annotate 'line', 5758

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5760
# Body
# {
.annotate 'line', 5762
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5764
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5765
# var rexpr: $P2
null $P2
.annotate 'line', 5766
# var t: $P3
null $P3
.annotate 'line', 5767
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5768
$P3 = __ARG_1.'get'()
$P5 = 'getOpCode_7'($P3)
set $I1, $P5
eq $I1, 0, __label_0
# {
.annotate 'line', 5769
set $I2, $I1
set $I3, 28
if $I2 == $I3 goto __label_4
set $I3, 29
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5771
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5772
new $P6, [ 'OpShiftleftExpr' ]
$P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5775
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5776
new $P7, [ 'OpShiftrightExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5779
'InternalError'('Invalid code in parseExpr_7', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5782
__ARG_1.'unget'($P3)
.annotate 'line', 5783
.return($P1)
# }
.annotate 'line', 5784

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5786
# Body
# {
.annotate 'line', 5788
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5789
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5791
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5792
# var rexpr: $P2
null $P2
.annotate 'line', 5793
# var t: $P3
null $P3
.annotate 'line', 5794
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5795
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5796
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
.annotate 'line', 5798
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5799
new $P7, [ 'OpLessExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5802
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5803
new $P8, [ 'OpGreaterExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5806
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5807
new $P9, [ 'OpLessEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5810
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5811
new $P10, [ 'OpGreaterEqualExpr' ]
$P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_8: # case
.annotate 'line', 5814
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5817
'InternalError'('Invalid code in parseExpr_9', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5820
__ARG_1.'unget'($P3)
.annotate 'line', 5821
.return($P1)
# }
.annotate 'line', 5822

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5824
# Body
# {
.annotate 'line', 5826
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5827
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5829
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5830
# var rexpr: $P2
null $P2
.annotate 'line', 5831
# var t: $P3
null $P3
.annotate 'line', 5832
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5833
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5834
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
.annotate 'line', 5836
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5837
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5840
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5841
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5844
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5845
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5848
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5849
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_3: # default
.annotate 'line', 5852
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5855
__ARG_1.'unget'($P3)
.annotate 'line', 5856
.return($P1)
# }
.annotate 'line', 5857

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5859
# Body
# {
.annotate 'line', 5861
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5863
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5864
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5865
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5866
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5867
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5869
__ARG_1.'unget'($P2)
.annotate 'line', 5870
.return($P1)
# }
.annotate 'line', 5871

.end # parseExpr_10


.sub 'parseExpr_11'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5873
# Body
# {
.annotate 'line', 5875
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5877
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5878
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5879
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('^')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5880
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5881
new $P5, [ 'OpBinXorExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5883
__ARG_1.'unget'($P2)
.annotate 'line', 5884
.return($P1)
# }
.annotate 'line', 5885

.end # parseExpr_11


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5887
# Body
# {
.annotate 'line', 5889
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 5891
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5892
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5893
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5894
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5895
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5897
__ARG_1.'unget'($P2)
.annotate 'line', 5898
.return($P1)
# }
.annotate 'line', 5899

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5901
# Body
# {
.annotate 'line', 5903
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5905
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5906
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5907
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5908
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5909
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5911
__ARG_1.'unget'($P2)
.annotate 'line', 5912
.return($P1)
# }
.annotate 'line', 5913

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5915
# Body
# {
.annotate 'line', 5917
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5919
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5920
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5921
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5922
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5923
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5925
__ARG_1.'unget'($P2)
.annotate 'line', 5926
.return($P1)
# }
.annotate 'line', 5927

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5929
# Body
# {
.annotate 'line', 5931
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5932
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5934
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5935
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5936
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5937
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5938
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5939
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5940
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5943
__ARG_1.'unget'($P2)
.annotate 'line', 5944
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5946

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5948
# Body
# {
.annotate 'line', 5950
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5951
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5952
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5954
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5955
# var t: $P2
null $P2
.annotate 'line', 5956
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5957
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5958
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5959
# var expr: $P4
null $P4
.annotate 'line', 5960
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
.annotate 'line', 5962
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5965
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5968
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5971
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5974
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5977
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_10: # case
.annotate 'line', 5980
new $P4, [ 'OpModToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5983
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5985
$P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5986
set $P1, $P4
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5988
__ARG_1.'unget'($P2)
.annotate 'line', 5989
.return($P1)
# }
.annotate 'line', 5990

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5992
# Body
# {
.annotate 'line', 5994
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5996
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5997

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 6010
# Body
# {
.annotate 'line', 6012
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 6013
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 6014
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6015
box $P1, $S1
setattribute self, 'brlabel', $P1
.annotate 'line', 6016
.return($S1)
# }
.annotate 'line', 6017

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6018
# Body
# {
.annotate 'line', 6020
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 6021
unless_null $P1, __label_0
.annotate 'line', 6022
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 6023
.return($P1)
# }
.annotate 'line', 6024

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 6008
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 6031
# Body
# {
.annotate 'line', 6033
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 6034
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 6035
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 6036
box $P1, $S1
setattribute self, 'cntlabel', $P1
.annotate 'line', 6037
.return($S1)
# }
.annotate 'line', 6038

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6039
# Body
# {
.annotate 'line', 6041
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 6042
unless_null $P1, __label_0
.annotate 'line', 6043
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 6044
.return($P1)
# }
.annotate 'line', 6045

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 6027
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 6029
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6059
# Body
# {
.annotate 'line', 6061
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6062
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6063
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6064
__ARG_2.'unget'($P1)
.annotate 'line', 6065
new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
set $P3, $P4
setattribute self, 'values', $P3
# }
__label_0: # endif
# }
.annotate 'line', 6067

.end # parse


.sub 'optimize' :method

.annotate 'line', 6068
# Body
# {
.annotate 'line', 6070
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6071
if_null $P1, __label_0
.annotate 'line', 6072
$P1 = $P1.'optimize'()
__label_0: # endif
.annotate 'line', 6073
.return(self)
# }
.annotate 'line', 6074

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6075
# Body
# {
.annotate 'line', 6078
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 6079
# int n: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined int
$P3 = $P1.'numargs'()
set $I1, $P3
__label_0:
.annotate 'line', 6082
iseq $I2, $I1, 1
unless $I2 goto __label_3
isa $I2, self, 'ReturnStatement'
__label_3:
unless $I2 goto __label_2
# {
.annotate 'line', 6083
# var func: $P2
$P2 = $P1.'getfreearg'(0)
.annotate 'line', 6084
$P3 = $P2.'cantailcall'()
if_null $P3, __label_4
unless $P3 goto __label_4
# {
.annotate 'line', 6085
self.'annotate'(__ARG_1)
.annotate 'line', 6086
.tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
__label_4: # endif
# }
__label_2: # endif
.annotate 'line', 6090
le $I1, 0, __label_5
.annotate 'line', 6091
$P1.'getargvalues'(__ARG_1)
__label_5: # endif
.annotate 'line', 6093
self.'annotate'(__ARG_1)
.annotate 'line', 6094
self.'emitret'(__ARG_1)
.annotate 'line', 6095
le $I1, 0, __label_6
.annotate 'line', 6096
$P1.'emitargs'(__ARG_1)
__label_6: # endif
.annotate 'line', 6097
__ARG_1.'say'(')')
# }
.annotate 'line', 6098

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6055
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6057
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6103
# Body
# {
.annotate 'line', 6105
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6106

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6107
# Body
# {
.annotate 'line', 6109
__ARG_1.'print'('.return(')
# }
.annotate 'line', 6110

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6101
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6115
# Body
# {
.annotate 'line', 6117
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6118

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6119
# Body
# {
.annotate 'line', 6121
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 6122

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6113
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6133
# Body
# {
.annotate 'line', 6135
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6136
setattribute self, 'name', __ARG_1
.annotate 'line', 6137
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6138
box $P1, $S1
setattribute self, 'value', $P1
# }
.annotate 'line', 6139

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 6140
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6141
# Body
# {
.annotate 'line', 6143
self.'annotate'(__ARG_1)
.annotate 'line', 6144
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6145
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 6146
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6147

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6129
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6131
addattribute $P0, 'name'
.annotate 'line', 6132
addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6159
# Body
# {
.annotate 'line', 6161
setattribute self, 'owner', __ARG_1
.annotate 'line', 6162
box $P1, __ARG_2
setattribute self, 'label', $P1
# }
.annotate 'line', 6163

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 6164
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 6165
# Body
# {
.annotate 'line', 6167
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6168
# string value: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6169
.return($S2)
# }
.annotate 'line', 6170

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6156
addattribute $P0, 'owner'
.annotate 'line', 6157
addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6181
# Body
# {
.annotate 'line', 6183
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6184
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6185
'RequireIdentifier'($P1)
.annotate 'line', 6186
setattribute self, 'label', $P1
.annotate 'line', 6187
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6188

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 6189
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6190
# Body
# {
.annotate 'line', 6192
self.'annotate'(__ARG_1)
.annotate 'line', 6193
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6194
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6195
concat $S3, 'goto ', $S1
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6196

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6177
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6179
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 6205
# Body
# {
.annotate 'line', 6207
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 6208

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6209
# Body
# {
.annotate 'line', 6211
'ExpectOp'('(', __ARG_1)
.annotate 'line', 6212
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 6213
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6214

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6203
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

.annotate 'line', 6225
# Body
# {
.annotate 'line', 6227
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6228
self.'parsecondition'(__ARG_2)
.annotate 'line', 6229
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 6230
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6231
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 6232
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 6234
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 6235
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 6237

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6238
# Body
# {
.annotate 'line', 6240
self.'optimize_condition'()
.annotate 'line', 6241
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 6242
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 6243
getattribute $P3, self, 'falsebranch'
$P2 = $P3.'optimize'()
setattribute self, 'falsebranch', $P2
.annotate 'line', 6244
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6246
getattribute $P1, self, 'truebranch'
.return($P1)
__label_3: # case
.annotate 'line', 6248
getattribute $P2, self, 'falsebranch'
.return($P2)
__label_1: # default
__label_0: # switch end
.annotate 'line', 6250
.return(self)
# }
.annotate 'line', 6251

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6252
# Body
# {
.annotate 'line', 6254
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 6255
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 6256
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 6257
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 6258
# string elselabel: $S1
set $S1, ''
.annotate 'line', 6259
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 6260
$P3 = self.'genlabel'()
set $S1, $P3
__label_0: # endif
.annotate 'line', 6261
# string endlabel: $S2
$P3 = self.'genlabel'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6262
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 6263
self.'annotate'(__ARG_1)
.annotate 'line', 6264
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6265
$P1.'emit'(__ARG_1)
.annotate 'line', 6267
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 6268
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6269
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6270
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 6272
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6273

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6221
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 6223
addattribute $P0, 'truebranch'
.annotate 'line', 6224
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6283
# Body
# {
.annotate 'line', 6285
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 6286

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6287
# Body
# {
.annotate 'line', 6289
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6290
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6292
self.'annotate'(__ARG_1)
.annotate 'line', 6293
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6294
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6295
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6296
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6297

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6280
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 6282
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6306
# Body
# {
.annotate 'line', 6308
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6309
self.'parsecondition'(__ARG_2)
.annotate 'line', 6310
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6311

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6312
# Body
# {
.annotate 'line', 6314
self.'optimize_condition'()
.annotate 'line', 6315
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6316
.return(self)
# }
.annotate 'line', 6317

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6318
# Body
# {
.annotate 'line', 6320
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6322
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 6325
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 6328
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 6329
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 6331
self.'annotate'(__ARG_1)
.annotate 'line', 6332
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6333
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6334
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 6335
__ARG_1.'emitgoto'($S2)
.annotate 'line', 6336
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 6338

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6304
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

.annotate 'line', 6347
# Body
# {
.annotate 'line', 6349
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6350
self.'parsebody'(__ARG_2)
.annotate 'line', 6351
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6352
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6353

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6354
# Body
# {
.annotate 'line', 6356
self.'optimize_condition'()
.annotate 'line', 6357
# var body: $P1
getattribute $P2, self, 'body'
$P1 = $P2.'optimize'()
.annotate 'line', 6358
$I1 = $P1.'isempty'()
unless $I1 goto __label_1
$P2 = self.'getvalue'()
set $I2, $P2
iseq $I1, $I2, 2
__label_1:
unless $I1 goto __label_0
.annotate 'line', 6359
new $P3, [ 'EmptyStatement' ]
.return($P3)
__label_0: # endif
.annotate 'line', 6360
setattribute self, 'body', $P1
.annotate 'line', 6361
.return(self)
# }
.annotate 'line', 6362

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6363
# Body
# {
.annotate 'line', 6365
# var body: $P1
getattribute $P1, self, 'body'
.annotate 'line', 6366
# int condvalue: $I1
$P2 = self.'getvalue'()
set $I1, $P2
.annotate 'line', 6367
set $I2, $I1
set $I3, 1
if $I2 == $I3 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 6369
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 6372
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 6373
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 6374
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 6376
self.'annotate'(__ARG_1)
.annotate 'line', 6377
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6379
$P1.'emit'(__ARG_1)
.annotate 'line', 6380
__ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6381
eq $I1, 2, __label_6
.annotate 'line', 6382
self.'emit_if'(__ARG_1, $S1, $S2)
__label_6: # endif
.annotate 'line', 6383
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 6385

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6345
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

.annotate 'line', 6394
# Body
# {
.annotate 'line', 6396
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6397
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6398

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6399
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6400
# Body
# {
.annotate 'line', 6402
self.'annotate'(__ARG_1)
.annotate 'line', 6403
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6404
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6405

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6392
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6414
# Body
# {
.annotate 'line', 6416
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6417
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6418

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6419
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6420
# Body
# {
.annotate 'line', 6422
self.'annotate'(__ARG_1)
.annotate 'line', 6423
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6424
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6425

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6412
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6439
# Body
# {
.annotate 'line', 6441
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6442
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6443
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6444
'Expected'("'(' in switch", $P1)
__label_0: # endif
.annotate 'line', 6445
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 6446
$P1 = __ARG_2.'get'()
.annotate 'line', 6447
$P3 = $P1.'isop'(')')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6448
'Expected'("')' in switch", $P1)
__label_1: # endif
.annotate 'line', 6449
$P1 = __ARG_2.'get'()
.annotate 'line', 6450
$P3 = $P1.'isop'('{')
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 6451
'Expected'("'{' in switch", $P1)
__label_2: # endif
.annotate 'line', 6452
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P4
.annotate 'line', 6453
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P4
.annotate 'line', 6454
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P4
__label_4: # while
.annotate 'line', 6455
$P1 = __ARG_2.'get'()
$I1 = $P1.'iskeyword'('case')
if $I1 goto __label_5
$I1 = $P1.'iskeyword'('default')
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 6456
$P3 = $P1.'iskeyword'('case')
if_null $P3, __label_6
unless $P3 goto __label_6
# {
.annotate 'line', 6457
getattribute $P4, self, 'case_value'
$P5 = 'parseExpr'(__ARG_2, self)
# predefined push
push $P4, $P5
.annotate 'line', 6458
$P1 = __ARG_2.'get'()
.annotate 'line', 6459
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_8
.annotate 'line', 6460
'Expected'("':' in case", $P1)
__label_8: # endif
.annotate 'line', 6461
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 6462
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
.annotate 'line', 6463
__ARG_2.'unget'($P1)
.annotate 'line', 6464
$P3 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P2, $P3
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 6466
getattribute $P3, self, 'case_st'
# predefined push
push $P3, $P2
.annotate 'line', 6467
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 6470
$P1 = __ARG_2.'get'()
.annotate 'line', 6471
$P3 = $P1.'isop'(':')
isfalse $I1, $P3
unless $I1 goto __label_13
.annotate 'line', 6472
'Expected'("':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 6473
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
.annotate 'line', 6474
__ARG_2.'unget'($P1)
.annotate 'line', 6475
getattribute $P3, self, 'default_st'
$P4 = 'parseStatement'(__ARG_2, self)
# predefined push
push $P3, $P4
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 6477
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 6480

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6481
# Body
# {
.annotate 'line', 6483
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 6484
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 6485
getattribute $P2, self, 'case_st'
iter $P5, $P2
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 6486
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6487
getattribute $P2, self, 'default_st'
'optimize_array'($P2)
.annotate 'line', 6488
.return(self)
# }
.annotate 'line', 6489

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6490
# Body
# {
.annotate 'line', 6493
# string type: $S1
set $S1, ''
.annotate 'line', 6494
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 6495
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 6496
ne $S2, 'N', __label_3
.annotate 'line', 6497
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 6498
ne $S1, '', __label_4
.annotate 'line', 6499
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 6500
eq $S1, $S2, __label_6
.annotate 'line', 6501
set $S1, 'P'
__label_6: # endif
__label_5: # endif
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6504
# string reg: $S3
$P8 = self.'tempreg'($S1)
null $S3
if_null $P8, __label_7
set $S3, $P8
__label_7:
.annotate 'line', 6505
getattribute $P10, self, 'condition'
$P8 = $P10.'checkresult'()
set $S9, $P8
ne $S9, $S1, __label_8
.annotate 'line', 6506
getattribute $P11, self, 'condition'
$P11.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6508
# string regcond: $S4
getattribute $P13, self, 'condition'
$P12 = $P13.'emit_get'(__ARG_1)
null $S4
if_null $P12, __label_10
set $S4, $P12
__label_10:
.annotate 'line', 6509
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6513
self.'genbreaklabel'()
.annotate 'line', 6514
# string defaultlabel: $S5
$P8 = self.'genlabel'()
null $S5
if_null $P8, __label_11
set $S5, $P8
__label_11:
.annotate 'line', 6515
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6516
# string regval: $S6
$P8 = self.'tempreg'($S1)
null $S6
if_null $P8, __label_12
set $S6, $P8
__label_12:
.annotate 'line', 6517
getattribute $P8, self, 'case_value'
iter $P14, $P8
set $P14, 0
__label_13: # for iteration
unless $P14 goto __label_14
shift $P3, $P14
# {
.annotate 'line', 6518
# string label: $S7
$P10 = self.'genlabel'()
null $S7
if_null $P10, __label_15
set $S7, $P10
__label_15:
.annotate 'line', 6519
# predefined push
push $P2, $S7
.annotate 'line', 6520
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6521
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6523
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6526
__ARG_1.'comment'('switch')
.annotate 'line', 6527
self.'annotate'(__ARG_1)
.annotate 'line', 6528
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6529
# int n: $I1
set $P8, $P4
set $I1, $P8
# for loop
.annotate 'line', 6530
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6531
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6532
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6533
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6534
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $P6, $P15
.annotate 'line', 6535
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6530
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6538
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6539
getattribute $P8, self, 'default_st'
iter $P16, $P8
set $P16, 0
__label_21: # for iteration
unless $P16 goto __label_22
shift $P7, $P16
.annotate 'line', 6540
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6542
getattribute $P10, self, 'start'
$P8 = self.'getbreaklabel'($P10)
__ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6543

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6432
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 6434
addattribute $P0, 'condition'
.annotate 'line', 6435
addattribute $P0, 'case_value'
.annotate 'line', 6436
addattribute $P0, 'case_st'
.annotate 'line', 6437
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6555
# Body
# {
.annotate 'line', 6557
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6558
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6559
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6560
__ARG_2.'unget'($P1)
.annotate 'line', 6561
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6563
$P1 = __ARG_2.'get'()
.annotate 'line', 6564
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
# {
.annotate 'line', 6565
__ARG_2.'unget'($P1)
.annotate 'line', 6566
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6567
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6569
$P1 = __ARG_2.'get'()
.annotate 'line', 6570
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_2
# {
.annotate 'line', 6571
__ARG_2.'unget'($P1)
.annotate 'line', 6572
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P3
.annotate 'line', 6573
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6575
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6576

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6577
# Body
# {
.annotate 'line', 6579
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6580
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6581
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6582
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6583
getattribute $P1, self, 'iteration'
if_null $P1, __label_2
.annotate 'line', 6584
getattribute $P4, self, 'iteration'
$P3 = $P4.'optimize'()
setattribute self, 'iteration', $P3
__label_2: # endif
.annotate 'line', 6585
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6586
.return(self)
# }
.annotate 'line', 6587

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6588
# Body
# {
.annotate 'line', 6590
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6591
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6592
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6593
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6594
.return()
# }
__label_0: # endif
.annotate 'line', 6596
__ARG_1.'comment'('for loop')
.annotate 'line', 6597
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6598
# string breaklabel: $S2
$P1 = self.'genbreaklabel'()
null $S2
if_null $P1, __label_4
set $S2, $P1
__label_4:
.annotate 'line', 6599
# string condlabel: $S3
$P1 = self.'genlabel'()
null $S3
if_null $P1, __label_5
set $S3, $P1
__label_5:
.annotate 'line', 6600
getattribute $P1, self, 'initializer'
if_null $P1, __label_6
.annotate 'line', 6601
getattribute $P2, self, 'initializer'
$P2.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6603
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6604
getattribute $P1, self, 'condexpr'
if_null $P1, __label_7
.annotate 'line', 6605
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6607
getattribute $P1, self, 'body'
$P1.'emit'(__ARG_1)
.annotate 'line', 6608
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6609
getattribute $P1, self, 'iteration'
if_null $P1, __label_8
.annotate 'line', 6610
# string unused: $S4
getattribute $P3, self, 'iteration'
$P2 = $P3.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_9
set $S4, $P2
__label_9:
__label_8: # endif
.annotate 'line', 6611
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6613
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6614

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6550
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6552
addattribute $P0, 'initializer'
.annotate 'line', 6553
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6627
# Body
# {
.annotate 'line', 6629
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6630
# string sname: $S1
set $P1, __ARG_4
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6631
eq __ARG_5, '', __label_1
# {
.annotate 'line', 6632
# string deftype: $S2
$P1 = 'typetoregcheck'(__ARG_5)
null $S2
if_null $P1, __label_2
set $S2, $P1
__label_2:
.annotate 'line', 6633
self.'createvar'($S1, $S2)
.annotate 'line', 6634
box $P1, $S2
setattribute self, 'deftype', $P1
# }
__label_1: # endif
.annotate 'line', 6636
setattribute self, 'varname', __ARG_4
.annotate 'line', 6637
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P2
.annotate 'line', 6638
'ExpectOp'(')', __ARG_2)
.annotate 'line', 6639
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6640

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6641
# Body
# {
.annotate 'line', 6643
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6644
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6645
.return(self)
# }
.annotate 'line', 6646

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6647
# Body
# {
.annotate 'line', 6649
self.'annotate'(__ARG_1)
.annotate 'line', 6650
# string regcont: $S1
null $S1
.annotate 'line', 6651
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6652
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6653
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6654
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6657
getattribute $P3, self, 'container'
$P2 = $P3.'emit_get'(__ARG_1)
set $S1, $P2
__label_1: # endif
.annotate 'line', 6658
# var itvar: $P1
getattribute $P2, self, 'varname'
$P1 = self.'getvar'($P2)
.annotate 'line', 6659
# string iterator: $S3
$P2 = self.'createreg'('P')
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6660
# string continuelabel: $S4
$P2 = self.'gencontinuelabel'()
null $S4
if_null $P2, __label_4
set $S4, $P2
__label_4:
.annotate 'line', 6661
# string breaklabel: $S5
$P2 = self.'genbreaklabel'()
null $S5
if_null $P2, __label_5
set $S5, $P2
__label_5:
.annotate 'line', 6662
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6663
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6664
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6665
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6666
$P2 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P2, ', ', $S3)
.annotate 'line', 6667
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 6668
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6669
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6670

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6621
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6623
addattribute $P0, 'deftype'
.annotate 'line', 6624
addattribute $P0, 'varname'
.annotate 'line', 6625
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6675
# Body
# {
.annotate 'line', 6677
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6678
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6679
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6680
$P4 = $P2.'iskeyword'('in')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 6681
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
set $P5, $P6
.return($P5)
goto __label_1
__label_0: # else
# {
.annotate 'line', 6683
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6684
$P4 = $P3.'iskeyword'('in')
if_null $P4, __label_2
unless $P4 goto __label_2
.annotate 'line', 6685
new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
set $P5, $P6
.return($P5)
__label_2: # endif
.annotate 'line', 6686
__ARG_2.'unget'($P3)
.annotate 'line', 6687
__ARG_2.'unget'($P2)
.annotate 'line', 6688
__ARG_2.'unget'($P1)
# }
__label_1: # endif
.annotate 'line', 6690
new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 6691

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6701
# Body
# {
.annotate 'line', 6703
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6704
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6705

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6706
# Body
# {
.annotate 'line', 6708
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6709
.return(self)
# }
.annotate 'line', 6710

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6711
# Body
# {
.annotate 'line', 6713
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6714
self.'annotate'(__ARG_1)
.annotate 'line', 6715
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6716

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6697
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6699
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6730
# Body
# {
.annotate 'line', 6732
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6733
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6734
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6735
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6738
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6740
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6741
$P1 = __ARG_2.'get'()
.annotate 'line', 6742
$P2 = $P1.'iskeyword'('catch')
isfalse $I1, $P2
unless $I1 goto __label_2
.annotate 'line', 6743
'ExpectedOp'('catch', $P1)
__label_2: # endif
.annotate 'line', 6744
$P1 = __ARG_2.'get'()
.annotate 'line', 6745
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_3
.annotate 'line', 6746
'Expected'("'(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6747
$P1 = __ARG_2.'get'()
.annotate 'line', 6748
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_4
# {
.annotate 'line', 6749
# string exname: $S1
$P3 = $P1.'getidentifier'()
null $S1
if_null $P3, __label_5
set $S1, $P3
__label_5:
.annotate 'line', 6750
setattribute self, 'exname', $P1
.annotate 'line', 6751
self.'createvar'($S1, 'P')
.annotate 'line', 6752
$P1 = __ARG_2.'get'()
.annotate 'line', 6753
$P2 = $P1.'isop'(')')
isfalse $I1, $P2
unless $I1 goto __label_6
.annotate 'line', 6754
'Expected'("')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6756
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P3
# }
.annotate 'line', 6757

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6758
# Body
# {
.annotate 'line', 6760
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6761
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6762
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6763
getattribute $P3, self, 'scatch'
$P2 = $P3.'optimize'()
setattribute self, 'scatch', $P2
.annotate 'line', 6764
.return(self)
# }
.annotate 'line', 6765

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6766
# Body
# {
.annotate 'line', 6768
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6769
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6770
# string labelpasthandler: $S3
$P7 = self.'genlabel'()
null $S3
if_null $P7, __label_2
set $S3, $P7
__label_2:
.annotate 'line', 6771
# string exreg: $S4
null $S4
.annotate 'line', 6772
getattribute $P7, self, 'exname'
if_null $P7, __label_3
# {
.annotate 'line', 6773
# var exname: $P1
getattribute $P8, self, 'exname'
$P1 = self.'getvar'($P8)
.annotate 'line', 6774
$P7 = $P1.'getreg'()
set $S4, $P7
# }
goto __label_4
__label_3: # else
.annotate 'line', 6777
$P7 = self.'tempreg'('P')
set $S4, $P7
__label_4: # endif
.annotate 'line', 6779
self.'annotate'(__ARG_1)
.annotate 'line', 6780
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6782
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6783
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6785
getattribute $P7, self, 'modifiers'
if_null $P7, __label_5
# {
.annotate 'line', 6786
# var modiflist: $P2
getattribute $P8, self, 'modifiers'
$P2 = $P8.'getlist'()
.annotate 'line', 6787
iter $P9, $P2
set $P9, 0
__label_6: # for iteration
unless $P9 goto __label_7
shift $P3, $P9
# {
.annotate 'line', 6788
# string modifname: $S5
$P7 = $P3.'getname'()
null $S5
if_null $P7, __label_8
set $S5, $P7
__label_8:
.annotate 'line', 6789
# int nargs: $I1
$P7 = $P3.'numargs'()
set $I1, $P7
.annotate 'line', 6790
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
.annotate 'line', 6793
eq $I1, 1, __label_15
.annotate 'line', 6794
getattribute $P7, self, 'start'
'SyntaxError'('Wrong modifier args', $P7)
__label_15: # endif
.annotate 'line', 6795
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6796
# string argreg: $S6
$P8 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P8, __label_16
set $S6, $P8
__label_16:
.annotate 'line', 6797
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6801
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6802
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6803
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6804
$P7 = $P6.'emit_get'(__ARG_1)
# predefined push
push $P5, $P7
# }
__label_17: # for iteration
.annotate 'line', 6802
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6806
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6807
# string sep: $S7
set $S7, ''
.annotate 'line', 6808
iter $P10, $P5
set $P10, 0
__label_20: # for iteration
unless $P10 goto __label_21
shift $S8, $P10
# {
.annotate 'line', 6809
__ARG_1.'print'($S7, $S8)
.annotate 'line', 6810
set $S7, ', '
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6812
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6815
getattribute $P7, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P7)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6820
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6821
__ARG_1.'comment'('try: begin')
.annotate 'line', 6822
getattribute $P7, self, 'stry'
$P7.'emit'(__ARG_1)
.annotate 'line', 6823
__ARG_1.'comment'('try: end')
.annotate 'line', 6824
__ARG_1.'say'('pop_eh')
.annotate 'line', 6826
self.'annotate'(__ARG_1)
.annotate 'line', 6827
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6829
__ARG_1.'comment'('catch')
.annotate 'line', 6830
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6831
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6832
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6833
__ARG_1.'say'('pop_eh')
.annotate 'line', 6834
getattribute $P7, self, 'scatch'
$P7.'emit'(__ARG_1)
.annotate 'line', 6836
__ARG_1.'comment'('catch end')
.annotate 'line', 6837
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6838

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6723
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6725
addattribute $P0, 'stry'
.annotate 'line', 6726
addattribute $P0, 'modifiers'
.annotate 'line', 6727
addattribute $P0, 'exname'
.annotate 'line', 6728
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6849
# Body
# {
.annotate 'line', 6851
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6852
setattribute self, 'name', __ARG_3
.annotate 'line', 6853
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6854
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6855

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6845
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6847
addattribute $P0, 'name'
.annotate 'line', 6848
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6872
# Body
# {
.annotate 'line', 6874
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6875
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6876
'RequireIdentifier'($P1)
.annotate 'line', 6877
setattribute self, 'name', $P1
.annotate 'line', 6878
# var vdata: $P2
null $P2
.annotate 'line', 6879
# string reg: $S1
null $S1
.annotate 'line', 6881
$P1 = __ARG_2.'get'()
.annotate 'line', 6882
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6884
box $P5, 1
setattribute self, 'typearray', $P5
.annotate 'line', 6885
getattribute $P4, self, 'name'
$P2 = self.'createvar'($P4, 'P')
.annotate 'line', 6886
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6887
$P1 = __ARG_2.'get'()
.annotate 'line', 6888
$P4 = $P1.'isop'(']')
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 6890
$P1 = __ARG_2.'get'()
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 6893
__ARG_2.'unget'($P1)
.annotate 'line', 6894
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P5
.annotate 'line', 6895
'ExpectOp'(']', __ARG_2)
.annotate 'line', 6896
$P1 = __ARG_2.'get'()
# }
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 6901
box $P4, 0
setattribute self, 'typearray', $P4
.annotate 'line', 6902
getattribute $P4, self, 'name'
getattribute $P5, self, 't_reg'
$P2 = self.'createvar'($P4, $P5)
.annotate 'line', 6903
$P4 = $P2.'getreg'()
set $S1, $P4
.annotate 'line', 6904
$P4 = $P1.'isop'('=')
if_null $P4, __label_4
unless $P4 goto __label_4
# {
.annotate 'line', 6906
$P6 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P6
.annotate 'line', 6907
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 6911
box $P4, $S1
setattribute self, 'reg', $P4
.annotate 'line', 6912
$P4 = $P1.'isop'('=')
if_null $P4, __label_5
unless $P4 goto __label_5
# {
.annotate 'line', 6913
$P1 = __ARG_2.'get'()
.annotate 'line', 6914
$P4 = $P1.'isop'('[')
isfalse $I1, $P4
unless $I1 goto __label_6
.annotate 'line', 6915
'Expected'("array initializer", $P1)
__label_6: # endif
.annotate 'line', 6916
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P5
.annotate 'line', 6917
$P1 = __ARG_2.'get'()
.annotate 'line', 6918
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_7
# {
.annotate 'line', 6919
__ARG_2.'unget'($P1)
__label_8: # do
.annotate 'line', 6920
# {
.annotate 'line', 6921
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6922
getattribute $P4, self, 'init'
# predefined push
push $P4, $P3
# }
__label_10: # continue
.annotate 'line', 6923
$P1 = __ARG_2.'get'()
$P4 = $P1.'isop'(',')
if_null $P4, __label_9
if $P4 goto __label_8
__label_9: # enddo
.annotate 'line', 6924
$P4 = $P1.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_11
.annotate 'line', 6925
'Expected'("',' or ']'", $P1)
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 6927
$P1 = __ARG_2.'get'()
# }
__label_5: # endif
.annotate 'line', 6929
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6930

.end # parse


.sub 'optimize' :method

.annotate 'line', 6931
# Body
# {
.annotate 'line', 6933
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6934
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6935
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6936
if_null $P1, __label_1
# {
.annotate 'line', 6937
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6938
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6940
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6942
.return(self)
# }
.annotate 'line', 6943

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6944
# Body
# {
.annotate 'line', 6946
self.'annotate'(__ARG_1)
.annotate 'line', 6947
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6948
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6949
# string reg: $S3
getattribute $P4, self, 'reg'
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 6950
# string t_reg: $S4
getattribute $P4, self, 't_reg'
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 6951
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6952
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
__ARG_1.'comment'($S10)
.annotate 'line', 6954
getattribute $P4, self, 'typearray'
set $I3, $P4
ne $I3, 0, __label_4
# {
.annotate 'line', 6955
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6956
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6958
# string itype: $S5
$P5 = $P1.'checkresult'()
null $S5
if_null $P5, __label_9
set $S5, $P5
__label_9:
.annotate 'line', 6959
ne $S5, $S4, __label_10
# {
.annotate 'line', 6960
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6961
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6963
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6966
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_15
# {
.annotate 'line', 6968
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6971
# string ireg: $S6
null $S6
.annotate 'line', 6972
ne $S5, '', __label_17
.annotate 'line', 6973
$P4 = $P1.'emit_get'(__ARG_1)
set $S6, $P4
goto __label_18
__label_17: # else
# {
.annotate 'line', 6975
$P5 = self.'tempreg'($S5)
set $S6, $P5
.annotate 'line', 6976
$P1.'emit'(__ARG_1, $S6)
# }
__label_18: # endif
.annotate 'line', 6978
iseq $I3, $S4, 'S'
unless $I3 goto __label_21
iseq $I3, $S5, 'P'
__label_21:
unless $I3 goto __label_19
# {
.annotate 'line', 6979
# string auxlabel: $S7
$P4 = self.'genlabel'()
null $S7
if_null $P4, __label_22
set $S7, $P4
__label_22:
.annotate 'line', 6980
__ARG_1.'emitnull'($S3)
.annotate 'line', 6981
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6982
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6983
__ARG_1.'emitlabel'($S7)
# }
goto __label_20
__label_19: # else
.annotate 'line', 6986
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
.annotate 'line', 6992
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6993
if_null $P2, __label_23
# {
.annotate 'line', 6995
# string regsize: $S8
$P4 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P4, __label_25
set $S8, $P4
__label_25:
.annotate 'line', 6996
getattribute $P4, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P4, "Array'], ", $S8)
# }
goto __label_24
__label_23: # else
# {
.annotate 'line', 7000
getattribute $P4, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P4, "Array']")
# }
__label_24: # endif
.annotate 'line', 7002
if_null $P1, __label_26
# {
.annotate 'line', 7003
# string itemreg: $S9
$P4 = self.'tempreg'($S4)
null $S9
if_null $P4, __label_27
set $S9, $P4
__label_27:
.annotate 'line', 7004
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 7005
unless_null $P2, __label_28
# {
.annotate 'line', 7006
le $I1, 0, __label_29
# {
.annotate 'line', 7008
__ARG_1.'emitset'($S3, $I1)
# }
__label_29: # endif
# }
__label_28: # endif
.annotate 'line', 7011
# int i: $I2
null $I2
.annotate 'line', 7012
iter $P6, $P1
set $P6, 0
__label_30: # for iteration
unless $P6 goto __label_31
shift $P3, $P6
# {
.annotate 'line', 7013
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 7014
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 7015
inc $I2
# }
goto __label_30
__label_31: # endfor
# }
__label_26: # endif
# }
__label_5: # endif
# }
.annotate 'line', 7019

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7020
# Body
# {
.annotate 'line', 7022
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 7023

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6862
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6864
addattribute $P0, 'name'
.annotate 'line', 6865
addattribute $P0, 't_reg'
.annotate 'line', 6866
addattribute $P0, 't_name'
.annotate 'line', 6867
addattribute $P0, 't_array'
.annotate 'line', 6868
addattribute $P0, 'reg'
.annotate 'line', 6869
addattribute $P0, 'typearray'
.annotate 'line', 6870
addattribute $P0, 'size'
.annotate 'line', 6871
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7026
# Body
# {
.annotate 'line', 7028
# var next: $P1
null $P1
.annotate 'line', 7029
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 7030
# {
.annotate 'line', 7031
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7032
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 7033
$P1 = __ARG_3.'get'()
# }
__label_2: # continue
.annotate 'line', 7034
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 7035
'RequireOp'(';', $P1)
.annotate 'line', 7036
.return($P2)
# }
.annotate 'line', 7037

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7049
# Body
# {
.annotate 'line', 7052
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7053
box $P1, __ARG_3
setattribute self, 'type', $P1
.annotate 'line', 7054
setattribute self, 'name', __ARG_4
.annotate 'line', 7055
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7056

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 7057
# Body
# {
.annotate 'line', 7059
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 7060
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 7061
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7062
$P1 = $P1.'optimize'()
.annotate 'line', 7063
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7065
getattribute $P4, self, 'start'
.annotate 'line', 7064
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 7067
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7068
setattribute self, 'value', $P1
.annotate 'line', 7069
.return(self)
# }
.annotate 'line', 7070

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 7071
# Body
# {
.annotate 'line', 7073
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7074

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7075
# Body
# {
.annotate 'line', 7077
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7078
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
__ARG_1.'comment'($S2)
# }
.annotate 'line', 7079

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7043
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 7045
addattribute $P0, 'type'
.annotate 'line', 7046
addattribute $P0, 'name'
.annotate 'line', 7047
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7082
# Body
# {
.annotate 'line', 7084
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7085
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 7086
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7087
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 7089
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 7090
# {
.annotate 'line', 7091
$P1 = __ARG_2.'get'()
.annotate 'line', 7092
# var name: $P3
set $P3, $P1
.annotate 'line', 7093
'ExpectOp'('=', __ARG_2)
.annotate 'line', 7094
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7096
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 7095
$P2 = 'addtomulti'($P2, $P5)
# }
__label_6: # continue
.annotate 'line', 7097
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_5
if $P5 goto __label_4
__label_5: # enddo
.annotate 'line', 7098
.return($P2)
# }
.annotate 'line', 7099

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 7108
# Body
# {
.annotate 'line', 7110
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7111
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7112
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 7113
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 7114
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 7116
'RequireOp'(';', $P1)
# }
.annotate 'line', 7117

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 7118
# Body
# {
.annotate 'line', 7120
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 7121
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 7122
.return(self)
# }
.annotate 'line', 7123

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 7124
# Body
# {
.annotate 'line', 7126
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7127

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7128
# Body
# {
.annotate 'line', 7130
self.'annotate'(__ARG_1)
.annotate 'line', 7131
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7132
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 7133
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 7134
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
__ARG_1.'comment'($S5)
.annotate 'line', 7135
if_null $P1, __label_2
.annotate 'line', 7136
$P2 = $P1.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
.annotate 'line', 7137
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 7138
if_null $P1, __label_4
# {
.annotate 'line', 7139
# string type: $S3
$P2 = $P1.'checkresult'()
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 7140
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
.annotate 'line', 7142
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 7143
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 7145
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 7150
# string value: $S4
$P2 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P2, __label_18
set $S4, $P2
__label_18:
.annotate 'line', 7151
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 7154
getattribute $P3, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P3)
__label_8: # default
.annotate 'line', 7156
getattribute $P4, self, 'name'
'SyntaxError'("Invalid var initializer", $P4)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 7160
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 7161

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7105
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 7107
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7166
# Body
# {
.annotate 'line', 7168
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7169
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7170

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7171
# Body
# {
.annotate 'line', 7173
self.'annotate'(__ARG_1)
.annotate 'line', 7174
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7175
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7176
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
__ARG_1.'comment'($S3)
.annotate 'line', 7177
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7178

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7164
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7185
# Body
# {
.annotate 'line', 7187
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7188
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P2
.annotate 'line', 7189
'ExpectOp'(']', __ARG_2)
.annotate 'line', 7190
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7191

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 7192
# Body
# {
.annotate 'line', 7194
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 7195
.tailcall self.'optimize_init'()
# }
.annotate 'line', 7196

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7197
# Body
# {
.annotate 'line', 7199
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7200
self.'annotate'(__ARG_1)
.annotate 'line', 7201
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 7202
# string reg: $S3
getattribute $P1, self, 'reg'
null $S3
if_null $P1, __label_2
set $S3, $P1
__label_2:
.annotate 'line', 7203
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
__ARG_1.'comment'($S4)
.annotate 'line', 7204
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7205

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7181
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 7183
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7208
# Body
# {
.annotate 'line', 7210
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7211
'RequireIdentifier'($P1)
.annotate 'line', 7212
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7213
$P3 = $P2.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7214
$P2 = __ARG_2.'get'()
.annotate 'line', 7215
$P3 = $P2.'isop'(']')
if_null $P3, __label_2
unless $P3 goto __label_2
.annotate 'line', 7216
new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P4, $P5
.return($P4)
goto __label_3
__label_2: # else
# {
.annotate 'line', 7218
__ARG_2.'unget'($P2)
.annotate 'line', 7219
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
.annotate 'line', 7223
__ARG_2.'unget'($P2)
.annotate 'line', 7224
new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P3, $P4
.return($P3)
# }
__label_1: # endif
# }
.annotate 'line', 7226

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7228
# Body
# {
.annotate 'line', 7230
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7231
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 7232
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 7233
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7234

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7242
# Body
# {
.annotate 'line', 7244
box $P1, 'S'
setattribute self, 't_reg', $P1
.annotate 'line', 7245
box $P1, 'string'
setattribute self, 't_name', $P1
.annotate 'line', 7246
box $P1, 'String'
setattribute self, 't_array', $P1
.annotate 'line', 7247
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7248

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7249
# Body
# {
.annotate 'line', 7251
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7252

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7240
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7255
# Body
# {
.annotate 'line', 7257
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7258

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7260
# Body
# {
.annotate 'line', 7262
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 7263
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7264

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7272
# Body
# {
.annotate 'line', 7274
box $P1, 'I'
setattribute self, 't_reg', $P1
.annotate 'line', 7275
box $P1, 'int'
setattribute self, 't_name', $P1
.annotate 'line', 7276
box $P1, 'Integer'
setattribute self, 't_array', $P1
.annotate 'line', 7277
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7278

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7279
# Body
# {
.annotate 'line', 7281
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7282

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7270
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7285
# Body
# {
.annotate 'line', 7287
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7288

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7290
# Body
# {
.annotate 'line', 7292
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 7293
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7294

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7302
# Body
# {
.annotate 'line', 7304
box $P1, 'N'
setattribute self, 't_reg', $P1
.annotate 'line', 7306
box $P1, 'float'
setattribute self, 't_name', $P1
.annotate 'line', 7307
box $P1, 'Float'
setattribute self, 't_array', $P1
.annotate 'line', 7308
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7309

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 7310
# Body
# {
.annotate 'line', 7312
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 7313

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7300
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7316
# Body
# {
.annotate 'line', 7318
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 7319

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7321
# Body
# {
.annotate 'line', 7323
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 7324
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7325

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7336
# Body
# {
.annotate 'line', 7338
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7339
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 7340
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 7341
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7342
$P1 = __ARG_2.'get'()
$P3 = $P1.'isop'('}')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 7343
__ARG_2.'unget'($P1)
.annotate 'line', 7344
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7345
unless_null $P2, __label_2
.annotate 'line', 7346
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 7347
getattribute $P3, self, 'statements'
# predefined push
push $P3, $P2
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7349
setattribute self, 'end', $P1
# }
.annotate 'line', 7350

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7351
# Body
# {
.annotate 'line', 7353
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7354
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7355
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7356
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7357
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 7358
.return($S2)
# }
.annotate 'line', 7359

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7360
# Body
# {
.annotate 'line', 7362
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7363
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 7364
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 7365
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 7366
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 7367
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 7368
$P1[$S1] = $S3
.annotate 'line', 7369
.return($S3)
# }
.annotate 'line', 7370

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7371
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7372
# Body
# {
.annotate 'line', 7374
__ARG_1.'comment'('{')
.annotate 'line', 7375
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 7376
$P1.'emit'(__ARG_1)
.annotate 'line', 7377
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 7379
__ARG_1.'comment'('}')
# }
.annotate 'line', 7380

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7331
get_class $P1, [ 'MultiStatementBase' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 7333
addattribute $P0, 'end'
.annotate 'line', 7334
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7393
# Body
# {
.annotate 'line', 7396
box $P3, 1
setattribute self, 'nreg', $P3
.annotate 'line', 7397
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7398
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7399
setattribute self, 'tempreg', $P1
.annotate 'line', 7400
setattribute self, 'freereg', $P2
# }
.annotate 'line', 7401

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7402
# Body
# {
.annotate 'line', 7404
box $P1, __ARG_1
setattribute self, 'type', $P1
.annotate 'line', 7405
.return(self)
# }
.annotate 'line', 7406

.end # settype


.sub 'createreg' :method

.annotate 'line', 7407
# Body
# {
.annotate 'line', 7409
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 7410
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7411
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
.annotate 'line', 7412
assign $P1, $I1
.annotate 'line', 7413
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
.annotate 'line', 7414
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 7415
.return($S1)
# }
.annotate 'line', 7416

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7417
# Body
# {
.annotate 'line', 7419
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7420
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7421
# string reg: $S1
null $S1
.annotate 'line', 7422
# predefined elements
elements $I1, $P1
le $I1, 0, __label_0
.annotate 'line', 7423
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
.annotate 'line', 7425
$P4 = self.'createreg'()
set $S1, $P4
__label_1: # endif
.annotate 'line', 7426
# predefined push
push $P2, $S1
.annotate 'line', 7427
.return($S1)
# }
.annotate 'line', 7428

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7429
# Body
# {
.annotate 'line', 7431
# var freereg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 7432
# var tempreg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 7433
# int n: $I1
# predefined elements
elements $I1, $P2
# for loop
.annotate 'line', 7434
# int i: $I2
sub $I2, $I1, 1
__label_2: # for condition
lt $I2, 0, __label_1
# {
.annotate 'line', 7435
# string s: $S1
$S1 = $P2[$I2]
.annotate 'line', 7436
# predefined push
push $P1, $S1
# }
__label_0: # for iteration
.annotate 'line', 7434
dec $I2
goto __label_2
__label_1: # for end
.annotate 'line', 7438
assign $P2, 0
# }
.annotate 'line', 7439

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7389
addattribute $P0, 'type'
.annotate 'line', 7390
addattribute $P0, 'nreg'
.annotate 'line', 7391
addattribute $P0, 'tempreg'
.annotate 'line', 7392
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7463
# Body
# {
.annotate 'line', 7465
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 7466
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
.annotate 'line', 7467
box $P1, 0
setattribute self, 'nlabel', $P1
.annotate 'line', 7468
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 7469
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 7470
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('S')
setattribute self, 'regstS', $P2
.annotate 'line', 7471
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('P')
setattribute self, 'regstP', $P2
# }
.annotate 'line', 7472

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7474
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7475
# Body
# {
.annotate 'line', 7478
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 7479
unless_null $P1, __label_0
# {
.annotate 'line', 7480
$P1 = self.'generatesubid'()
.annotate 'line', 7481
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 7483
.return($P1)
# }
.annotate 'line', 7484

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7486
# Body
# {
.annotate 'line', 7488
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 7489
.return($I1)
# }
.annotate 'line', 7490

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7491
# Body
# {
.annotate 'line', 7493
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 7494
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7495
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7496
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7497
# {
.annotate 'line', 7498
$P2 = __ARG_1.'get'()
.annotate 'line', 7499
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7500
eq $S1, '', __label_5
.annotate 'line', 7501
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
.annotate 'line', 7503
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7504
# string argname: $S2
# predefined string
$P5 = self.'getparamnum'()
set $S4, $P5
concat $S2, '__ARG_', $S4
.annotate 'line', 7505
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7507
# string varname: $S3
set $P5, $P2
null $S3
if_null $P5, __label_7
set $S3, $P5
__label_7:
.annotate 'line', 7508
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7509
$P3['name'] = $S3
.annotate 'line', 7510
$P2 = __ARG_1.'get'()
.annotate 'line', 7511
$P5 = $P2.'isop'('[')
if_null $P5, __label_8
unless $P5 goto __label_8
# {
.annotate 'line', 7512
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7513
$P3['modifiers'] = $P4
.annotate 'line', 7514
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7516
# predefined push
push $P1, $P3
# }
__label_3: # continue
.annotate 'line', 7517
$P5 = $P2.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 7518
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_9
.annotate 'line', 7519
'Expected'("')' or ','", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7521

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7523
# Body
# {
.annotate 'line', 7525
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7526
unless_null $P1, __label_0
.annotate 'line', 7527
root_new $P3, ['parrot';'ResizablePMCArray']
push $P3, __ARG_1
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7529
# predefined push
push $P1, __ARG_1
__label_1: # endif
# }
.annotate 'line', 7530

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7532
# Body
# {
.annotate 'line', 7534
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7535
.return(self)
# }
.annotate 'line', 7536

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7538
# Body
# {
.annotate 'line', 7540
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7541
unless_null $P1, __label_0
# {
.annotate 'line', 7542
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7543
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7545
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7546

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7547
# Body
# {
.annotate 'line', 7549
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7550
unless_null $P1, __label_0
# {
.annotate 'line', 7551
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7552
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7554
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7555

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7556
# Body
# {
.annotate 'line', 7560
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7561
# string lexname: $S1
null $S1
.annotate 'line', 7562
if_null $P1, __label_0
.annotate 'line', 7563
set $S1, $P1
goto __label_1
__label_0: # else
# {
.annotate 'line', 7565
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7566
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7567
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7568
self.'setlex'($S1, $S2)
.annotate 'line', 7569
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7571
.return($S1)
# }
.annotate 'line', 7572

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7574
# Body
# {
.annotate 'line', 7576
# var store: $P1
null $P1
.annotate 'line', 7577
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
.annotate 'line', 7579
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7581
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7583
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7585
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7587
concat $S4, 'Invalid type in createreg: ', __ARG_1
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7589
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7590
.return($S1)
# }
.annotate 'line', 7591

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7592
# Body
# {
.annotate 'line', 7594
# var store: $P1
null $P1
.annotate 'line', 7595
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
.annotate 'line', 7597
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7599
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7601
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7603
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7605
concat $S4, "Invalid type '", __ARG_1
concat $S4, $S4, "' in tempreg"
'InternalError'($S4)
__label_0: # switch end
.annotate 'line', 7607
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7608
.return($S1)
# }
.annotate 'line', 7609

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7610
# Body
# {
.annotate 'line', 7612
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
.annotate 'line', 7613
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7614

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7615
# Body
# {
.annotate 'line', 7617
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7618
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7619
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
.annotate 'line', 7620
assign $P1, $I1
.annotate 'line', 7621
.return($S1)
# }
.annotate 'line', 7622

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7623
# Body
# {
.annotate 'line', 7625
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7626

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7627
# Body
# {
.annotate 'line', 7629
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7630

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7632
# Body
# {
.annotate 'line', 7634
# string name: $S1
getattribute $P20, self, 'name'
null $S1
if_null $P20, __label_0
set $S1, $P20
__label_0:
.annotate 'line', 7635
__ARG_1.'say'()
.annotate 'line', 7636
__ARG_1.'print'(".sub ")
.annotate 'line', 7637
$P20 = self.'isanonymous'()
if_null $P20, __label_1
unless $P20 goto __label_1
.annotate 'line', 7638
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7640
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7641
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7642
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7643
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7644
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7645
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7646
if_null $P2, __label_5
.annotate 'line', 7647
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7651
$P20 = self.'ismethod'()
if_null $P20, __label_6
unless $P20 goto __label_6
.annotate 'line', 7652
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7653
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7654
if_null $P3, __label_7
# {
.annotate 'line', 7655
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7656
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7657
# int nargmods: $I1
$P20 = $P5.'numargs'()
set $I1, $P20
.annotate 'line', 7658
$P20 = $P5.'getname'()
__ARG_1.'print'(' :', $P20)
.annotate 'line', 7659
le $I1, 0, __label_11
# {
.annotate 'line', 7660
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7661
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7662
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7663
$P20 = $P6.'isstringliteral'()
isfalse $I5, $P20
unless $I5 goto __label_15
.annotate 'line', 7664
getattribute $P21, $P6, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_15: # endif
.annotate 'line', 7665
$P20 = $P6.'getPirString'()
__ARG_1.'print'($P20)
# }
__label_12: # for iteration
.annotate 'line', 7661
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7667
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
.annotate 'line', 7672
ne $S1, 'main', __label_16
.annotate 'line', 7673
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7675
__ARG_1.'say'()
.annotate 'line', 7677
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7678
# var param: $P8
null $P8
.annotate 'line', 7679
# string paramname: $S2
null $S2
.annotate 'line', 7680
# var a: $P9
null $P9
.annotate 'line', 7682
iter $P23, $P7
set $P23, 0
__label_17: # for iteration
unless $P23 goto __label_18
shift $P8, $P23
# {
.annotate 'line', 7683
$S2 = $P8['name']
.annotate 'line', 7684
$P9 = self.'getvar'($S2)
.annotate 'line', 7685
# string ptype: $S3
$P21 = $P9.'gettype'()
$P20 = 'typetopirname'($P21)
null $S3
if_null $P20, __label_19
set $S3, $P20
__label_19:
.annotate 'line', 7686
$P20 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7687
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7688
if_null $P10, __label_20
# {
.annotate 'line', 7689
# var named: $P11
null $P11
.annotate 'line', 7690
# var slurpy: $P12
null $P12
.annotate 'line', 7691
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7692
iter $P24, $P13
set $P24, 0
__label_21: # for iteration
unless $P24 goto __label_22
shift $P14, $P24
# {
.annotate 'line', 7693
# string modname: $S4
$P20 = $P14.'getname'()
null $S4
if_null $P20, __label_23
set $S4, $P20
__label_23:
.annotate 'line', 7694
set $S8, $S4
set $S9, 'named'
if $S8 == $S9 goto __label_26
set $S9, 'slurpy'
if $S8 == $S9 goto __label_27
goto __label_25
# switch
__label_26: # case
.annotate 'line', 7696
set $P11, $P14
goto __label_24 # break
__label_27: # case
.annotate 'line', 7699
set $P12, $P14
goto __label_24 # break
__label_25: # default
.annotate 'line', 7702
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7705
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7710
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7713
if_null $P11, __label_31
# {
.annotate 'line', 7714
# string setname: $S5
null $S5
.annotate 'line', 7715
# int nargs: $I3
$P20 = $P11.'numargs'()
set $I3, $P20
.annotate 'line', 7716
set $I5, $I3
null $I6
if $I5 == $I6 goto __label_35
set $I6, 1
if $I5 == $I6 goto __label_36
goto __label_34
# switch
__label_35: # case
.annotate 'line', 7718
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S5, $S0
goto __label_33 # break
__label_36: # case
.annotate 'line', 7721
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7722
$P20 = $P15.'isstringliteral'()
isfalse $I7, $P20
unless $I7 goto __label_37
.annotate 'line', 7723
getattribute $P21, self, 'start'
'SyntaxError'('Invalid modifier', $P21)
__label_37: # endif
.annotate 'line', 7724
$P25 = $P15.'getPirString'()
set $S5, $P25
goto __label_33 # break
__label_34: # default
.annotate 'line', 7727
getattribute $P26, self, 'start'
'SyntaxError'('Invalid modifier', $P26)
__label_33: # switch end
.annotate 'line', 7729
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7731
if_null $P12, __label_38
# {
.annotate 'line', 7732
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7736
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7738
__ARG_1.'say'()
.annotate 'line', 7739
getattribute $P20, self, 'start'
__ARG_1.'annotate'($P20)
.annotate 'line', 7742
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7743
if_null $P16, __label_39
# {
.annotate 'line', 7745
iter $P27, $P16
set $P27, 0
__label_40: # for iteration
unless $P27 goto __label_41
shift $S6, $P27
.annotate 'line', 7746
$P20 = $P16[$S6]
__ARG_1.'say'(".lex '", $P20, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7749
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7750
if_null $P16, __label_42
# {
.annotate 'line', 7752
iter $P28, $P16
set $P28, 0
__label_43: # for iteration
unless $P28 goto __label_44
shift $S7, $P28
.annotate 'line', 7753
$P20 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P20, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7756
# var body: $P17
getattribute $P17, self, 'body'
.annotate 'line', 7757
$P20 = $P17.'isempty'()
if_null $P20, __label_45
unless $P20 goto __label_45
.annotate 'line', 7758
__ARG_1.'comment'('Empty body')
goto __label_46
__label_45: # else
# {
.annotate 'line', 7760
__ARG_1.'comment'('Body')
.annotate 'line', 7761
$P17.'emit'(__ARG_1)
.annotate 'line', 7762
$P20 = $P17.'getend'()
__ARG_1.'annotate'($P20)
# }
__label_46: # endif
.annotate 'line', 7764
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7767
# var localfun: $P18
getattribute $P18, self, 'localfun'
.annotate 'line', 7768
if_null $P18, __label_47
# {
# for loop
.annotate 'line', 7769
# int ifn: $I4
null $I4
__label_50: # for condition
# predefined elements
elements $I5, $P18
ge $I4, $I5, __label_49
# {
.annotate 'line', 7770
# var fn: $P19
$P19 = $P18[$I4]
.annotate 'line', 7771
$P19.'emit'(__ARG_1)
# }
__label_48: # for iteration
.annotate 'line', 7769
inc $I4
goto __label_50
__label_49: # for end
# }
__label_47: # endif
# }
.annotate 'line', 7774

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7446
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 7448
addattribute $P0, 'name'
.annotate 'line', 7449
addattribute $P0, 'subid'
.annotate 'line', 7450
addattribute $P0, 'modifiers'
.annotate 'line', 7451
addattribute $P0, 'params'
.annotate 'line', 7452
addattribute $P0, 'body'
.annotate 'line', 7453
addattribute $P0, 'regstI'
.annotate 'line', 7454
addattribute $P0, 'regstN'
.annotate 'line', 7455
addattribute $P0, 'regstS'
.annotate 'line', 7456
addattribute $P0, 'regstP'
.annotate 'line', 7457
addattribute $P0, 'nlabel'
.annotate 'line', 7458
addattribute $P0, 'localfun'
.annotate 'line', 7459
addattribute $P0, 'lexicals'
.annotate 'line', 7460
addattribute $P0, 'usedlexicals'
.annotate 'line', 7461
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7786
# Body
# {
.annotate 'line', 7788
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7789
box $P1, 0
setattribute self, 'paramnum', $P1
.annotate 'line', 7790
box $P1, 0
setattribute self, 'lexnum', $P1
.annotate 'line', 7791
self.'parse'(__ARG_2)
# }
.annotate 'line', 7792

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7794
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7795
# Body
# {
.annotate 'line', 7798
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7799
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7800
assign $P1, $I1
.annotate 'line', 7801
.return($I1)
# }
.annotate 'line', 7802

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7803
# Body
# {
.annotate 'line', 7806
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7807
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
.annotate 'line', 7808
assign $P1, $I1
.annotate 'line', 7809
.return($I1)
# }
.annotate 'line', 7810

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7811
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7813
# Body
# {
.annotate 'line', 7815
# var name: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7816
setattribute self, 'name', $P1
.annotate 'line', 7817
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7818
$P5 = $P2.'isop'('[')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 7819
# var modifiers: $P3
new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 7820
setattribute self, 'modifiers', $P3
.annotate 'line', 7821
$P2 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7823
'RequireOp'('(', $P2)
.annotate 'line', 7824
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7826
# var fullname: $P4
getattribute $P6, self, 'owner'
$P5 = $P6.'getpath'()
# predefined clone
clone $P4, $P5
.annotate 'line', 7827
$P5 = $P1.'getidentifier'()
# predefined push
push $P4, $P5
.annotate 'line', 7829
new $P6, [ 'StringLiteral' ]
.annotate 'line', 7830
new $P8, [ 'TokenQuoted' ]
getattribute $P9, $P1, 'file'
getattribute $P10, $P1, 'line'
# predefined join
join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
set $P7, $P8
$P6.'StringLiteral'(self, $P7)
set $P5, $P6
.annotate 'line', 7828
self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 7833
$P2 = __ARG_1.'get'()
.annotate 'line', 7834
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 7835
'ExpectedOp'('{', $P2)
__label_1: # endif
.annotate 'line', 7836
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7837
.return(self)
# }
.annotate 'line', 7838

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7781
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7783
addattribute $P0, 'paramnum'
.annotate 'line', 7784
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7847
# Body
# {
.annotate 'line', 7849
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7850
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7851
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7852
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7853
setattribute self, 'name', $P1
.annotate 'line', 7854
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7855
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7856
'RequireOp'('{', $P2)
.annotate 'line', 7857
new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
set $P4, $P5
setattribute self, 'body', $P4
.annotate 'line', 7858
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7859

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7860
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7861
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7862
# Body
# {
.annotate 'line', 7864
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7865

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7866
# Body
# {
.annotate 'line', 7869
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7870

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7871
# Body
# {
.annotate 'line', 7874
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7875

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7876
# Body
# {
.annotate 'line', 7878
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7879
unless_null $P1, __label_0
# {
.annotate 'line', 7882
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7883
unless_null $P1, __label_1
# {
.annotate 'line', 7885
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7886
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7887
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7888
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7889
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7890
# string reg: $S2
$P6 = $P1.'getreg'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 7891
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7895
$P6 = $P1.'gettype'()
set $S5, $P6
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P7 = $P1.'isconst'()
isfalse $I2, $P7
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7896
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7897
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7898
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7899
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7900
$P6 = $P4.'same_scope_as'($P5)
if_null $P6, __label_10
unless $P6 goto __label_10
# {
.annotate 'line', 7901
# string lexname: $S3
$P7 = $P3.'makelexical'($P1)
null $S3
if_null $P7, __label_11
set $S3, $P7
__label_11:
.annotate 'line', 7902
# int flags: $I1
$P6 = $P1.'isvolatile'()
if_null $P6, __label_13
unless $P6 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7903
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 7904
box $P6, $S3
setattribute $P1, 'lexname', $P6
.annotate 'line', 7905
# string reg: $S4
$P6 = $P1.'getreg'()
null $S4
if_null $P6, __label_14
set $S4, $P6
__label_14:
.annotate 'line', 7906
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
.annotate 'line', 7911
isnull $I2, $P1
not $I2
unless $I2 goto __label_16
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_16:
unless $I2 goto __label_15
.annotate 'line', 7912
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7913
.return($P1)
# }
.annotate 'line', 7914

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7845
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7923
# Body
# {
.annotate 'line', 7925
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7926

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7927
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7921
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

.annotate 'line', 7942
# Body
# {
.annotate 'line', 7944
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 7945

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7946
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7948
# Body
# {
.annotate 'line', 7950
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7951

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7940
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7957
# Body
# {
.annotate 'line', 7959
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7960
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7961

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7962
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7964
# Body
# {
.annotate 'line', 7966
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7967
__ARG_1.'print'($S1)
# }
.annotate 'line', 7968

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7954
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7956
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7975
# Body
# {
.annotate 'line', 7977
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7978
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7979
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7980
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7981
'Expected'('literal string', $P2)
__label_0: # endif
.annotate 'line', 7982
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
.annotate 'line', 7983
$P2 = __ARG_1.'get'()
.annotate 'line', 7984
$P3 = $P2.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 7985
$P4 = $P2.'checkop'()
set $S1, $P4
set $S2, ':'
if $S1 == $S2 goto __label_4
set $S2, ','
if $S1 == $S2 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 7987
box $P5, 1
setattribute self, 'hll', $P5
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7991
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7993
# {
.annotate 'line', 7994
$P2 = __ARG_1.'get'()
.annotate 'line', 7995
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_9
.annotate 'line', 7996
'Expected'('literal string', $P2)
__label_9: # endif
.annotate 'line', 7997
$P3 = $P2.'rawstring'()
# predefined push
push $P1, $P3
# }
__label_8: # continue
.annotate 'line', 7998
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'(',')
if_null $P3, __label_7
if $P3 goto __label_6
__label_7: # enddo
.annotate 'line', 7999
'RequireOp'(']', $P2)
# }
__label_1: # endif
.annotate 'line', 8001
setattribute self, 'key', $P1
# }
.annotate 'line', 8002

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 8003
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 8004
# Body
# {
# predefined int
.annotate 'line', 8006
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 8007

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8009
# Body
# {
.annotate 'line', 8011
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 8012

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7971
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7973
addattribute $P0, 'key'
.annotate 'line', 7974
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8018
# Body
# {
.annotate 'line', 8020
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8021
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
push $P1, $P3
.annotate 'line', 8022
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 8023
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 8024
$P2 = __ARG_1.'get'()
.annotate 'line', 8025
# predefined string
set $S1, $P2
# predefined push
push $P1, $S1
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 8027
__ARG_1.'unget'($P2)
.annotate 'line', 8028
setattribute self, 'key', $P1
# }
.annotate 'line', 8029

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 8030
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 8032
# Body
# {
.annotate 'line', 8034
# var key: $P1
getattribute $P1, self, 'key'
.annotate 'line', 8035
$P2 = $P1[-1]
.return($P2)
# }
.annotate 'line', 8036

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8038
# Body
# {
.annotate 'line', 8040
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8041
unless_null $P1, __label_0
# {
.annotate 'line', 8042
$P2 = self.'dowarnings'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8043
getattribute $P3, self, 'key'
# predefined join
join $S1, ".", $P3
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
__label_2: # endif
.annotate 'line', 8044
getattribute $P3, self, 'key'
$P2 = 'getparrotkey'($P3)
__ARG_1.'print'($P2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 8046
$P2 = $P1.'getclasskey'()
__ARG_1.'print'($P2)
__label_1: # endif
# }
.annotate 'line', 8047

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8015
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 8017
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8050
# Body
# {
.annotate 'line', 8052
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 8053
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 8054
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 8055
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 8056
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 8057
$P2 = $P1.'isidentifier'()
if_null $P2, __label_2
unless $P2 goto __label_2
.annotate 'line', 8058
new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_2: # endif
.annotate 'line', 8059
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8060

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8076
# Body
# {
.annotate 'line', 8078
self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8079
setattribute self, 'parent', __ARG_3
.annotate 'line', 8080
# var functions: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8081
setattribute self, 'functions', $P1
.annotate 'line', 8082
# var members: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8083
setattribute self, 'members', $P2
.annotate 'line', 8084
root_new $P13, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P13
.annotate 'line', 8085
# var constants: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8086
setattribute self, 'constants', $P3
.annotate 'line', 8088
# var name: $P4
$P4 = __ARG_2.'get'()
.annotate 'line', 8089
setattribute self, 'name', $P4
.annotate 'line', 8090
# var classns: $P5
$P12 = __ARG_3.'getpath'()
# predefined clone
clone $P5, $P12
.annotate 'line', 8091
getattribute $P12, self, 'name'
# predefined push
push $P5, $P12
.annotate 'line', 8092
setattribute self, 'classns', $P5
.annotate 'line', 8094
# var t: $P6
$P6 = __ARG_2.'get'()
.annotate 'line', 8095
$P12 = $P6.'isop'(':')
if_null $P12, __label_0
unless $P12 goto __label_0
# {
.annotate 'line', 8096
# var bases: $P7
getattribute $P7, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 8097
# {
.annotate 'line', 8098
# var base: $P8
$P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8099
# predefined push
push $P7, $P8
.annotate 'line', 8100
$P6 = __ARG_2.'get'()
.annotate 'line', 8101
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
.annotate 'line', 8104
'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8105
$P6 = __ARG_2.'get'()
__label_6: # for condition
$P12 = $P6.'isop'('}')
isfalse $I1, $P12
unless $I1 goto __label_5
# {
.annotate 'line', 8106
# string key: $S1
$P13 = $P6.'checkkeyword'()
null $S1
if_null $P13, __label_7
set $S1, $P13
__label_7:
.annotate 'line', 8107
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
.annotate 'line', 8109
# var f: $P9
new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8110
# predefined push
push $P1, $P9
goto __label_8 # break
__label_11: # case
.annotate 'line', 8113
# var name: $P10
$P10 = __ARG_2.'get'()
.annotate 'line', 8114
$P12 = $P10.'isidentifier'()
isfalse $I1, $P12
unless $I1 goto __label_13
.annotate 'line', 8115
'Expected'("member identifier", $P10)
__label_13: # endif
.annotate 'line', 8116
# predefined push
push $P2, $P10
.annotate 'line', 8117
$P6 = __ARG_2.'get'()
.annotate 'line', 8118
$P13 = $P6.'isop'(';')
isfalse $I2, $P13
unless $I2 goto __label_14
.annotate 'line', 8119
'Expected'("';' in member declaration", $P6)
__label_14: # endif
goto __label_8 # break
__label_12: # case
.annotate 'line', 8122
# var cst: $P11
$P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8123
# predefined push
push $P3, $P11
goto __label_8 # break
__label_9: # default
.annotate 'line', 8126
'SyntaxError'("Unexpected item in class", $P6)
__label_8: # switch end
# }
__label_4: # for iteration
.annotate 'line', 8105
$P6 = __ARG_2.'get'()
goto __label_6
__label_5: # for end
# }
.annotate 'line', 8129

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 8130
# Body
# {
.annotate 'line', 8132
getattribute $P1, self, 'classns'
.return($P1)
# }
.annotate 'line', 8133

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 8134
# Body
# {
.annotate 'line', 8136
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8137

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8138
# Body
# {
.annotate 'line', 8140
getattribute $P1, self, 'parent'
.tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8141

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8142
# Body
# {
.annotate 'line', 8144
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8145

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8146
# Body
# {
.annotate 'line', 8148
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8149

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8150
# Body
# {
.annotate 'line', 8152
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8153

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 8154
# Body
# {
.annotate 'line', 8156
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 8157
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 8158
.return(self)
# }
.annotate 'line', 8159

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 8160
# Body
# {
.annotate 'line', 8162
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8163

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8164
# Body
# {
.annotate 'line', 8166
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 8167
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 8168
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 8169
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 8171
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8173
$P5 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P5)
.annotate 'line', 8174
# int n: $I1
set $I1, 1
.annotate 'line', 8175
getattribute $P5, self, 'bases'
iter $P7, $P5
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8176
$P3.'annotate'(__ARG_1)
.annotate 'line', 8177
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 8178
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 8179
getattribute $P5, self, 'parent'
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8180
__ARG_1.'say'()
.annotate 'line', 8181
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 8183
getattribute $P5, self, 'members'
iter $P8, $P5
set $P8, 0
__label_4: # for iteration
unless $P8 goto __label_5
shift $P4, $P8
# {
.annotate 'line', 8184
__ARG_1.'annotate'($P4)
.annotate 'line', 8185
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 8188
__ARG_1.'say'('.end')
# }
.annotate 'line', 8189

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8066
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
get_class $P2, [ 'VarContainer' ]
addparent $P0, $P2
.annotate 'line', 8068
addattribute $P0, 'parent'
.annotate 'line', 8069
addattribute $P0, 'name'
.annotate 'line', 8070
addattribute $P0, 'bases'
.annotate 'line', 8071
addattribute $P0, 'constants'
.annotate 'line', 8072
addattribute $P0, 'functions'
.annotate 'line', 8073
addattribute $P0, 'members'
.annotate 'line', 8074
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8196
# Body
# {
.annotate 'line', 8198
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8199
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 8200
'Expected'('literal string', $P1)
__label_0: # endif
.annotate 'line', 8201
'ExpectOp'(';', __ARG_2)
.annotate 'line', 8202
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 8203
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8208
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 8209
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 8210
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 8211
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 8212
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 8213
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_4
push_eh $P9
# try: begin
# {
.annotate 'line', 8214
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 8215
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 8213
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
.annotate 'line', 8220
$P9 = $P5.'is_closed'()
if_null $P9, __label_6
unless $P9 goto __label_6
.annotate 'line', 8221
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 8226
load_bytecode 'PGE.pbc'
.annotate 'line', 8227
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8228
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8230
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
.annotate 'line', 8231
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8232
$P8 = $P7($S4)
.annotate 'line', 8233
# predefined elements
elements $I2, $P8
le $I2, 0, __label_11
# {
.annotate 'line', 8234
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 8235
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 8236
# int ivalue: $I1
null $I1
.annotate 'line', 8237
# predefined substr
substr $S7, $S6, 0, 2
iseq $I2, $S7, '0x'
if $I2 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I2, $S8, '0X'
__label_14:
unless $I2 goto __label_12
.annotate 'line', 8238
# predefined substr
substr $S9, $S6, 2
box $P11, $S9
$P9 = $P11.'to_int'(16)
set $I1, $P9
goto __label_13
__label_12: # else
.annotate 'line', 8240
set $I1, $S6
__label_13: # endif
.annotate 'line', 8243
new $P12, [ 'TokenInteger' ]
getattribute $P13, __ARG_1, 'file'
getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
set $P11, $P12
.annotate 'line', 8242
$P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8241
__ARG_3.'createconst'($S5, 'I', $P9, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 8230
$P9 = $P5.'readline'()
set $S4, $P9
goto __label_9
__label_8: # for end
.annotate 'line', 8247
$P5.'close'()
# }
.annotate 'line', 8248

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8261
# Body
# {
.annotate 'line', 8263
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 8264
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 8265
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P2
.annotate 'line', 8266
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P2
# }
.annotate 'line', 8267

.end # init


.sub 'getpath' :method

.annotate 'line', 8268
# Body
# {
.annotate 'line', 8270
getattribute $P1, self, 'nspath'
.return($P1)
# }
.annotate 'line', 8271

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8272
# Body
# {
.annotate 'line', 8274
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 8275
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 8276
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 8277
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 8278
.return($P4)
# }
.annotate 'line', 8279

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8280
# Body
# {
.annotate 'line', 8284
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
.annotate 'line', 8286
.return($P5)
__label_3: # case
.annotate 'line', 8289
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 8294
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 8295
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 8296
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 8297
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 8298
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 8299
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8300
if_null $P4, __label_8
.annotate 'line', 8301
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 8305
.return($P5)
# }
.annotate 'line', 8306

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8307
# Body
# {
.annotate 'line', 8311
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
.annotate 'line', 8313
.return($P7)
__label_3: # case
.annotate 'line', 8315
# string name: $S1
$S1 = __ARG_1[0]
.annotate 'line', 8317
# var sym: $P1
$P1 = self.'checkclass_base'($S1)
.annotate 'line', 8318
if_null $P1, __label_4
.annotate 'line', 8319
.return($P1)
__label_4: # endif
.annotate 'line', 8320
getattribute $P8, self, 'functions'
iter $P9, $P8
set $P9, 0
__label_5: # for iteration
unless $P9 goto __label_6
shift $P2, $P9
.annotate 'line', 8321
getattribute $P10, $P2, 'name'
set $S3, $P10
ne $S3, $S1, __label_7
.annotate 'line', 8322
.return($P2)
__label_7: # endif
goto __label_5
__label_6: # endfor
null $P11
.annotate 'line', 8323
.return($P11)
__label_1: # default
.annotate 'line', 8328
# var namespaces: $P3
getattribute $P3, self, 'namespaces'
.annotate 'line', 8329
# var childkey: $P4
# predefined clone
clone $P4, __ARG_1
.annotate 'line', 8330
# string basename: $S2
$P12 = $P4.'shift'()
null $S2
if_null $P12, __label_8
set $S2, $P12
__label_8:
.annotate 'line', 8331
iter $P13, $P3
set $P13, 0
__label_9: # for iteration
unless $P13 goto __label_10
shift $P5, $P13
# {
.annotate 'line', 8332
getattribute $P14, $P5, 'name'
set $S4, $P14
ne $S4, $S2, __label_11
# {
.annotate 'line', 8333
# var found: $P6
$P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8334
if_null $P6, __label_12
.annotate 'line', 8335
.return($P6)
__label_12: # endif
# }
__label_11: # endif
# }
goto __label_9
__label_10: # endfor
__label_0: # switch end
null $P7
.annotate 'line', 8339
.return($P7)
# }
.annotate 'line', 8340

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8341
# Body
# {
.annotate 'line', 8343
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 8344
# string name: $S1
set $P4, $P1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8345
$P1 = __ARG_2.'get'()
.annotate 'line', 8347
# var modifier: $P2
null $P2
.annotate 'line', 8348
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 8349
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 8350
$P1 = __ARG_2.'get'()
# }
__label_1: # endif
.annotate 'line', 8353
'RequireOp'('{', $P1)
.annotate 'line', 8354
# var child: $P3
new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8355
getattribute $P4, self, 'namespaces'
# predefined push
push $P4, $P3
.annotate 'line', 8356
getattribute $P4, self, 'items'
# predefined push
push $P4, $P3
.annotate 'line', 8357
$P3.'parse'(__ARG_2)
# }
.annotate 'line', 8358

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8359
# Body
# {
.annotate 'line', 8361
# var items: $P1
getattribute $P1, self, 'items'
.annotate 'line', 8362
# var functions: $P2
getattribute $P2, self, 'functions'
.annotate 'line', 8363
# var classes: $P3
getattribute $P3, self, 'classes'
.annotate 'line', 8364
# var t: $P4
null $P4
# for loop
.annotate 'line', 8365
$P4 = __ARG_1.'get'()
__label_2: # for condition
set $I1, $P4
unless $I1 goto __label_3
$P8 = $P4.'isop'('}')
isfalse $I1, $P8
__label_3:
unless $I1 goto __label_1
# {
.annotate 'line', 8367
# string key: $S1
$P9 = $P4.'checkkeyword'()
null $S1
if_null $P9, __label_4
set $S1, $P9
__label_4:
.annotate 'line', 8368
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
.annotate 'line', 8370
self.'parsenamespace'($P4, __ARG_1)
goto __label_5 # break
__label_8: # case
.annotate 'line', 8373
# var cst: $P5
$P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8374
# predefined push
push $P1, $P5
goto __label_5 # break
__label_9: # case
.annotate 'line', 8377
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8378
# predefined push
push $P2, $P6
.annotate 'line', 8379
# predefined push
push $P1, $P6
goto __label_5 # break
__label_10: # case
.annotate 'line', 8382
# var c: $P7
new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8383
# predefined push
push $P3, $P7
.annotate 'line', 8384
# predefined push
push $P1, $P7
goto __label_5 # break
__label_11: # case
.annotate 'line', 8387
$P4 = __ARG_1.'get'()
.annotate 'line', 8388
$P8 = $P4.'iskeyword'('extern')
isfalse $I1, $P8
unless $I1 goto __label_14
.annotate 'line', 8389
'SyntaxError'('Unsupported at nmaespace level', $P4)
__label_14: # endif
.annotate 'line', 8390
$P4 = __ARG_1.'get'()
.annotate 'line', 8391
$P9 = $P4.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_15
.annotate 'line', 8392
'Expected'('string literal', $P4)
__label_15: # endif
.annotate 'line', 8393
# string reqlib: $S2
set $P10, $P4
null $S2
if_null $P10, __label_16
set $S2, $P10
__label_16:
.annotate 'line', 8394
self.'addlib'($S2)
.annotate 'line', 8395
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_12: # case
.annotate 'line', 8398
'include_parrot'($P4, __ARG_1, self)
goto __label_5 # break
__label_13: # case
.annotate 'line', 8401
$P4 = __ARG_1.'get'()
.annotate 'line', 8402
$P11 = $P4.'isstring'()
isfalse $I3, $P11
unless $I3 goto __label_17
.annotate 'line', 8403
'Expected'('string literal', $P4)
__label_17: # endif
.annotate 'line', 8404
# string reqload: $S3
set $P12, $P4
null $S3
if_null $P12, __label_18
set $S3, $P12
__label_18:
.annotate 'line', 8405
self.'addload'($S3)
.annotate 'line', 8406
'ExpectOp'(';', __ARG_1)
goto __label_5 # break
__label_6: # default
.annotate 'line', 8409
'SyntaxError'("Unexpected token", $P4)
__label_5: # switch end
# }
__label_0: # for iteration
.annotate 'line', 8365
$P4 = __ARG_1.'get'()
goto __label_2
__label_1: # for end
.annotate 'line', 8412
if_null $P4, __label_19
unless $P4 goto __label_19
.annotate 'line', 8413
self.'close_ns'($P4)
goto __label_20
__label_19: # else
.annotate 'line', 8415
self.'unclosed_ns'()
__label_20: # endif
# }
.annotate 'line', 8416

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8417
# Body
# {
.annotate 'line', 8419
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 8420

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8421
# Body
# {
.annotate 'line', 8423
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 8424
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 8426
# int activate: $I1
set $I1, 1
.annotate 'line', 8427
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 8428
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 8429
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
.annotate 'line', 8430
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 8432
unless $I1 goto __label_6
# {
.annotate 'line', 8433
__ARG_1.'say'($S1)
.annotate 'line', 8434
null $I1
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 8436
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 8438

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8252
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 8254
addattribute $P0, 'nspath'
.annotate 'line', 8255
addattribute $P0, 'namespaces'
.annotate 'line', 8256
addattribute $P0, 'classes'
.annotate 'line', 8257
addattribute $P0, 'functions'
.annotate 'line', 8258
addattribute $P0, 'items'
.annotate 'line', 8259
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8453
# Body
# {
.annotate 'line', 8456
# var nspath: $P1
$P2 = __ARG_1.'getpath'()
# predefined clone
clone $P1, $P2
.annotate 'line', 8457
# predefined push
push $P1, __ARG_3
.annotate 'line', 8458
setattribute self, 'nspath', $P1
.annotate 'line', 8460
setattribute self, 'parent', __ARG_1
.annotate 'line', 8461
setattribute self, 'start', __ARG_2
.annotate 'line', 8462
setattribute self, 'owner', __ARG_1
.annotate 'line', 8463
box $P2, __ARG_3
setattribute self, 'name', $P2
.annotate 'line', 8464
setattribute self, 'modifier', __ARG_4
.annotate 'line', 8465
if_null __ARG_4, __label_0
# {
.annotate 'line', 8466
$P2 = __ARG_4.'pick'('HLL')
if_null $P2, __label_1
.annotate 'line', 8467
getattribute $P4, self, 'name'
setattribute self, 'hll', $P4
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 8469

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 8470
# Body
# {
.annotate 'line', 8472
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8473

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8474
# Body
# {
.annotate 'line', 8476
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8477

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8478
# Body
# {
.annotate 'line', 8480
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8481

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8482
# Body
# {
.annotate 'line', 8484
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 8485

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8486
# Body
# {
.annotate 'line', 8488
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8489
unless_null $P1, __label_0
.annotate 'line', 8490
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 8492
.return($P1)
__label_1: # endif
# }
.annotate 'line', 8493

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8494
# Body
# {
.annotate 'line', 8498
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8499
unless_null $P1, __label_0
.annotate 'line', 8500
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 8501
.return($P1)
# }
.annotate 'line', 8502

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8503
# Body
# {
.annotate 'line', 8505
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8506

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8507
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8511
# Body
# {
.annotate 'line', 8513
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 8514
if_null $P1, __label_0
# {
.annotate 'line', 8515
$P1 = $P1.'optimize'()
.annotate 'line', 8516
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 8518
self.'optimize_base'()
.annotate 'line', 8519
.return(self)
# }
.annotate 'line', 8520

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8521
# Body
# {
.annotate 'line', 8523
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 8524
if_null $P1, __label_0
.annotate 'line', 8525
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 8527
self.'emit_base'(__ARG_1)
.annotate 'line', 8529
if_null $P1, __label_1
.annotate 'line', 8530
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 8531

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8445
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8447
addattribute $P0, 'parent'
.annotate 'line', 8448
addattribute $P0, 'start'
.annotate 'line', 8449
addattribute $P0, 'name'
.annotate 'line', 8450
addattribute $P0, 'modifier'
.annotate 'line', 8451
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8546
# Body
# {
.annotate 'line', 8548
# string nspath: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8549
setattribute self, 'nspath', $P1
.annotate 'line', 8550
setattribute self, 'unit', __ARG_1
.annotate 'line', 8551
root_new $P3, ['parrot';'Hash']
setattribute self, 'predefs_used', $P3
.annotate 'line', 8552
box $P2, 0
setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8553

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8554
# Body
# {
.annotate 'line', 8556
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8557
$P1[__ARG_1] = 1
# }
.annotate 'line', 8558

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8559
# Body
# {
.annotate 'line', 8561
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8562
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8563

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8565
# Body
# {
.annotate 'line', 8567
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8568
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8569
inc $I1
.annotate 'line', 8570
assign $P1, $I1
.annotate 'line', 8571
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8572
.return($S1)
# }
.annotate 'line', 8573

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8575
# Body
# {
.annotate 'line', 8577
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8578
unless_null $P1, __label_0
# {
.annotate 'line', 8579
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8580
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8582
$P1[__ARG_1] = 1
# }
.annotate 'line', 8583

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8584
# Body
# {
.annotate 'line', 8586
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8587
unless_null $P1, __label_0
# {
.annotate 'line', 8588
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8589
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8591
$P1[__ARG_1] = 1
# }
.annotate 'line', 8592

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8593
# Body
# {
.annotate 'line', 8595
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8596

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8597
# Body
# {
.annotate 'line', 8600
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8601

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8602
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8606
# Body
# {
.annotate 'line', 8608
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8609

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8610
# Body
# {
.annotate 'line', 8612
getattribute $P1, self, 'unit'
.tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8613

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8614
# Body
# {
.annotate 'line', 8616
self.'optimize_base'()
.annotate 'line', 8617
.return(self)
# }
.annotate 'line', 8618

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8619
# Body
# {
.annotate 'line', 8621
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8624
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8625
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8628
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
.annotate 'line', 8631
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8632
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8633
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8634
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8637
# int somelib: $I1
null $I1
.annotate 'line', 8638
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8639
if_null $P3, __label_4
# {
.annotate 'line', 8640
set $I1, 1
.annotate 'line', 8641
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8642
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8645
# int someload: $I2
null $I2
.annotate 'line', 8646
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8647
if_null $P4, __label_7
# {
.annotate 'line', 8648
set $I2, 1
.annotate 'line', 8649
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8650
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8651
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8652
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
.annotate 'line', 8654
or $I3, $I1, $I2
unless $I3 goto __label_10
.annotate 'line', 8655
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8657
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8658

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8538
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 8540
addattribute $P0, 'unit'
.annotate 'line', 8541
addattribute $P0, 'predefs_used'
.annotate 'line', 8542
addattribute $P0, 'libs'
.annotate 'line', 8543
addattribute $P0, 'loads'
.annotate 'line', 8544
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8672
# Body
# {
.annotate 'line', 8674
box $P3, 1
setattribute self, 'warnings', $P3
.annotate 'line', 8675
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8678
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8682
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8681
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8680
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8686
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8685
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8684
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8692
new $P4, [ 'StringLiteral' ]
.annotate 'line', 8693
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
.annotate 'line', 8691
$P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8696
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8697

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8698
# Body
# {
.annotate 'line', 8700
getattribute $P1, self, 'warnings'
assign $P1, __ARG_1
# }
.annotate 'line', 8701

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8702
# Body
# {
# predefined int
.annotate 'line', 8704
getattribute $P1, self, 'warnings'
set $I1, $P1
.return($I1)
# }
.annotate 'line', 8705

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8706
# Body
# {
.annotate 'line', 8708
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8709

.end # parse


.sub 'optimize' :method

.annotate 'line', 8710
# Body
# {
.annotate 'line', 8712
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8713

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8714
# Body
# {
.annotate 'line', 8716
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8717
__ARG_1.'say'('')
.annotate 'line', 8719
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8721
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8722

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8669
addattribute $P0, 'rootns'
.annotate 'line', 8670
addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8729
# Body
# {
.annotate 'line', 8731
set $S2, __ARG_2
ne $S2, 'parse', __label_0
.annotate 'line', 8732
.return(__ARG_1)
__label_0: # endif
.annotate 'line', 8733
# var handleout: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8734
$P1.'open'('__eval__', 'w')
.annotate 'line', 8735
# var emit: $P2
new $P2, [ 'Emit' ]
.annotate 'line', 8736
if_null __ARG_3, __label_1
unless __ARG_3 goto __label_1
.annotate 'line', 8737
$P2.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8738
$P2.'initialize'($P1)
.annotate 'line', 8739
__ARG_1.'emit'($P2)
.annotate 'line', 8740
$P2.'close'()
.annotate 'line', 8741
$P1.'close'()
.annotate 'line', 8742
# string pircode: $S1
$P5 = $P1.'read'(0)
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 8743
# var object: $P3
null $P3
.annotate 'line', 8744
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
.annotate 'line', 8746
new $P3, [ 'String' ]
.annotate 'line', 8747
assign $P3, $S1
goto __label_3 # break
__label_6: # case
__label_7: # case
.annotate 'line', 8751
# var pircomp: $P4
# predefined compreg
compreg $P4, 'PIR'
.annotate 'line', 8752
$P3 = $P4($S1)
goto __label_3 # break
__label_4: # default
.annotate 'line', 8753
# predefined die
.annotate 'line', 8755
die 'Invalid target'
__label_3: # switch end
.annotate 'line', 8757
.return($P3)
# }
.annotate 'line', 8758

.end # __private_compile_tail


.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8759
# Body
# {
.annotate 'line', 8764
unless_null __ARG_2, __label_0
.annotate 'line', 8765
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8766
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8767
$P1.'open'('__eval__', 'w')
.annotate 'line', 8768
$P1.'puts'(__ARG_1)
.annotate 'line', 8769
$P1.'close'()
.annotate 'line', 8770
$P1.'open'('__eval__', 'r')
.annotate 'line', 8771
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8772
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8773
unless __ARG_4 goto __label_1
.annotate 'line', 8774
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8775
$P3.'parse'($P2)
.annotate 'line', 8776
$P1.'close'()
.annotate 'line', 8777
$P3.'optimize'()
.annotate 'line', 8778
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8779

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8780
# Body
# {
.annotate 'line', 8784
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8785
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8786
$P1.'encoding'('utf8')
.annotate 'line', 8787
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8788
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8789
unless __ARG_4 goto __label_0
.annotate 'line', 8790
$P3.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8791
$P3.'parse'($P2)
.annotate 'line', 8792
$P1.'close'()
.annotate 'line', 8793
$P3.'optimize'()
.annotate 'line', 8794
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8795
unless __ARG_3 goto __label_1
.annotate 'line', 8796
$P4.'disable_annotations'()
__label_1: # endif
.annotate 'line', 8797
$P4.'initialize'(__ARG_2)
.annotate 'line', 8798
$P3.'emit'($P4)
.annotate 'line', 8799
$P4.'close'()
# }
.annotate 'line', 8800

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 8801
# Body
# {
.annotate 'line', 8806
unless_null __ARG_2, __label_0
.annotate 'line', 8807
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8808
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8809
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8810
$P1.'encoding'('utf8')
.annotate 'line', 8811
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8812
# var winxed: $P3
new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 8813
unless __ARG_4 goto __label_1
.annotate 'line', 8814
$P3.'setwarnmode'(0)
__label_1: # endif
.annotate 'line', 8815
$P3.'parse'($P2)
.annotate 'line', 8816
$P1.'close'()
.annotate 'line', 8817
$P3.'optimize'()
.annotate 'line', 8818
.tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 8819

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

.annotate 'line', 8824
# Body
# {
.annotate 'line', 8826
# var winxed: $P1
new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 8827
not $I1, __ARG_3
unless $I1 goto __label_0
.annotate 'line', 8828
$P1.'setwarnmode'(0)
__label_0: # endif
.annotate 'line', 8829
$P1.'parse'(__ARG_1)
.annotate 'line', 8831
$P1.'optimize'()
.annotate 'line', 8833
# var handle: $P2
null $P2
.annotate 'line', 8834
ne __ARG_2, '-', __label_1
.annotate 'line', 8835
# predefined getstdout
getstdout $P2
goto __label_2
__label_1: # else
.annotate 'line', 8837
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_2: # endif
.annotate 'line', 8838
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8839
unless __ARG_4 goto __label_3
.annotate 'line', 8840
$P3.'disable_annotations'()
__label_3: # endif
.annotate 'line', 8841
$P3.'initialize'($P2)
.annotate 'line', 8842
$P1.'emit'($P3)
.annotate 'line', 8843
$P3.'close'()
.annotate 'line', 8844
$P2.'close'()
# }
.annotate 'line', 8845

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8851
# Body
# {
.annotate 'line', 8853
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8854
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8855

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 8862
# Body
# {
.annotate 'line', 8864
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8865
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8866
$P1.'notOptStop'(1)
.annotate 'line', 8867
$P1.'push_string'('o=s')
.annotate 'line', 8868
$P1.'push_string'('e=s')
.annotate 'line', 8869
$P1.'push_string'('noan')
.annotate 'line', 8870
$P1.'push_string'('nowarn')
.annotate 'line', 8871
$P1.'notOptStop'(1)
.annotate 'line', 8872
__ARG_1.'shift'()
.annotate 'line', 8873
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8874
setattribute self, 'getopts', $P1
.annotate 'line', 8875
setattribute self, 'opts', $P2
# }
.annotate 'line', 8876

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 8877
# Body
# {
.annotate 'line', 8879
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8880
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8881
isnull $I1, $P2
not $I1
.return($I1)
# }
.annotate 'line', 8882

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 8883
# Body
# {
.annotate 'line', 8885
# var opts: $P1
getattribute $P1, self, 'opts'
.annotate 'line', 8886
# var value: $P2
$P2 = $P1[__ARG_1]
.annotate 'line', 8887
if_null $P2, __label_1
# predefined string
set $S1, $P2
goto __label_0
__label_1:
set $S1, __ARG_2
__label_0:
.return($S1)
# }
.annotate 'line', 8888

.end # getstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Options' ]
.annotate 'line', 8859
addattribute $P0, 'getopts'
.annotate 'line', 8860
addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8891
# Body
# {
.annotate 'line', 8893
# var options: $P1
new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 8894
# string outputfile: $S1
$P4 = $P1.'getstring'('o', '')
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 8895
# string expr: $S2
$P4 = $P1.'getstring'('e')
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 8896
# int noan: $I1
$P4 = $P1.'getbool'('noan')
set $I1, $P4
.annotate 'line', 8897
# int warn: $I2
$P4 = $P1.'getbool'('nowarn')
isfalse $I2, $P4
.annotate 'line', 8899
# int argc: $I3
set $P4, __ARG_1
set $I3, $P4
.annotate 'line', 8900
# string filename: $S3
null $S3
.annotate 'line', 8901
# var file: $P2
null $P2
.annotate 'line', 8902
unless_null $S2, __label_2
# {
.annotate 'line', 8903
ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 8904
root_new $P4, ['parrot';'Exception']
$P4['message'] = 'No file'
throw $P4
__label_4: # endif
.annotate 'line', 8906
$S3 = __ARG_1[0]
.annotate 'line', 8907
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'($S3)
.annotate 'line', 8908
$P2.'encoding'('utf8')
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 8911
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8912
new $P2, [ 'StringHandle' ]
.annotate 'line', 8913
$P2.'open'('__eval__', 'w')
.annotate 'line', 8914
$P2.'puts'($S2)
.annotate 'line', 8915
$P2.'close'()
.annotate 'line', 8916
$P2.'open'('__eval__')
.annotate 'line', 8917
set $S3, '__eval__'
# }
__label_3: # endif
.annotate 'line', 8920
# var t: $P3
new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 8922
'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 8924
$P2.'close'()
# }
.annotate 'line', 8925

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 8927
# Body
# {
.annotate 'line', 8929
# int i: $I1
set $I1, 1
.annotate 'line', 8930
iter $P4, __ARG_1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P1, $P4
# {
.annotate 'line', 8931
# var sub: $P2
$P2 = $P1['sub']
.annotate 'line', 8932
# string subname: $S1
null $S1
.annotate 'line', 8933
if_null $P2, __label_2
# {
.annotate 'line', 8934
set $S1, $P2
.annotate 'line', 8935
# string ns: $S2
$P5 = $P2.'get_namespace'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 8936
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
.annotate 'line', 8938
# var ann: $P3
$P3 = $P1['annotations']
.annotate 'line', 8939
# string file: $S3
$S3 = $P3['file']
.annotate 'line', 8940
eq $S3, '', __label_6
# {
.annotate 'line', 8941
# int line: $I2
$I2 = $P3['line']
.annotate 'line', 8942
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
.annotate 'line', 8945

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8947
# Body
# {
.annotate 'line', 8949
# int retval: $I1
null $I1
.annotate 'line', 8950
# try: create handler
new $P2, 'ExceptionHandler'
set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
push_eh $P2
# try: begin
.annotate 'line', 8956
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8950
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8959
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8960
# int type: $I2
$I2 = $P1['type']
.annotate 'line', 8961
set $I3, $I2
set $I4, 556
if $I3 == $I4 goto __label_4
set $I4, 557
if $I3 == $I4 goto __label_5
goto __label_3
# switch
__label_4: # case
__label_5: # case
.annotate 'line', 8964
# predefined cry
getstderr $P0
print $P0, 'Error: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8965
set $I1, 1
goto __label_2 # break
__label_3: # default
.annotate 'line', 8968
# predefined cry
getstderr $P0
print $P0, 'INTERNAL ERROR: '
print $P0, $S1
print $P0, "\n"
.annotate 'line', 8969
$P2 = $P1.'backtrace'()
'show_backtrace'($P2)
.annotate 'line', 8970
set $I1, 2
__label_2: # switch end
# }
# catch end
__label_1:
.annotate 'line', 8973
# predefined exit
exit $I1
# }
.annotate 'line', 8974

.end # main

# End generated code
