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
concat $S3, __ARG_1, ' in '
concat $S3, $S2
concat $S3, ' line '
concat $S3, $S1
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
concat $S4, __ARG_1, ' in '
concat $S4, $S2
concat $S4, ' line '
concat $S4, $S1
concat $S4, ' near '
concat $S4, $S3
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

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 134
# Body
# {
box $P1, __ARG_1
.annotate 'line', 136
setattribute self, 'file', $P1
box $P1, __ARG_2
.annotate 'line', 137
setattribute self, 'line', $P1
# }
.annotate 'line', 138

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 139
# Body
# {
.annotate 'line', 141
.return(1)
# }
.annotate 'line', 142

.end # get_bool


.sub 'iseof' :method

.annotate 'line', 144
# Body
# {
.return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 145
# Body
# {
.return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 146
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 147
# Body
# {
.return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 148
# Body
# {
.return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 149
# Body
# {
.return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 151
# Body
# {
.annotate 'line', 153
'InternalError'('Not a literal string', self)
# }
.annotate 'line', 154

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 155
# Body
# {
.annotate 'line', 157
'Expected'('Identifier', self)
# }
.annotate 'line', 158

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 159
# Body
# {
.return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 160
# Body
# {
.return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 161
# Body
# {
.return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 162
# Body
# {
.return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 163
# Body
# {
.return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 164
# Body
# {
.annotate 'line', 166
# string r: $S1
$P1 = self.'viewable'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
# predefined string
.annotate 'line', 167
getattribute $P1, self, 'file'
set $S2, $P1
# predefined string
getattribute $P2, self, 'line'
set $S3, $P2
concat $S4, $S1, ' at '
concat $S4, $S2
concat $S4, ' line '
concat $S4, $S3
.return($S4)
# }
.annotate 'line', 168

.end # show

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Token' ]
.annotate 'line', 132
addattribute $P0, 'file'
.annotate 'line', 133
addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 173
# Body
# {
.annotate 'line', 175
self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 176

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 177
# Body
# {
.annotate 'line', 179
.return(0)
# }
.annotate 'line', 180

.end # get_bool


.sub 'iseof' :method

.annotate 'line', 181
# Body
# {
.return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 182
# Body
# {
.return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenEof' ]
.annotate 'line', 171
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 188
# Body
# {
.annotate 'line', 190
self.'Token'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 191
setattribute self, 'str', $P1
# }
.annotate 'line', 192

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 193
# Body
# {
getattribute $P1, self, 'str'
.return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 194
# Body
# {
.annotate 'line', 196
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 197

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 185
get_class $P1, [ 'Token' ]
addparent $P0, $P1
.annotate 'line', 187
addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 202
# Body
# {
.annotate 'line', 204
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 205

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 206
# Body
# {
.return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenComment' ]
.annotate 'line', 200
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 211
# Body
# {
.annotate 'line', 213
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 214

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 215
# Body
# {
.annotate 'line', 217
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 218

.end # isop


.sub 'checkop' :method

.annotate 'line', 219
# Body
# {
# predefined string
.annotate 'line', 221
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 222

.end # checkop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenOp' ]
.annotate 'line', 209
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 227
# Body
# {
.annotate 'line', 229
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 230

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 231
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 232
# Body
# {
.annotate 'line', 234
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 235

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 236
# Body
# {
# predefined string
.annotate 'line', 238
getattribute $P1, self, 'str'
set $S1, $P1
.return($S1)
# }
.annotate 'line', 239

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 240
# Body
# {
.annotate 'line', 242
getattribute $P1, self, 'str'
set $S1, $P1
iseq $I1, $S1, __ARG_1
.return($I1)
# }
.annotate 'line', 243

.end # iskeyword

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 225
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 248
# Body
# {
.return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 249
# Body
# {
.annotate 'line', 251
getattribute $P1, self, 'str'
.return($P1)
# }
.annotate 'line', 252

.end # rawstring

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenString' ]
.annotate 'line', 246
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 257
# Body
# {
.annotate 'line', 259
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 260

.end # TokenQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 261
# Body
# {
# predefined string
.annotate 'line', 263
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, '"'
.return($S2)
# }
.annotate 'line', 264

.end # get_string


.sub 'viewable' :method

.annotate 'line', 265
# Body
# {
# predefined string
.annotate 'line', 267
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, '"', $S1
concat $S2, '"'
.return($S2)
# }
.annotate 'line', 268

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 255
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 273
# Body
# {
.annotate 'line', 275
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 276

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 277
# Body
# {
# predefined string
.annotate 'line', 279
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, "'"
.return($S2)
# }
.annotate 'line', 280

.end # get_string


.sub 'viewable' :method

.annotate 'line', 281
# Body
# {
# predefined string
.annotate 'line', 283
getattribute $P1, self, 'str'
set $S1, $P1
concat $S2, "'", $S1
concat $S2, "'"
.return($S2)
# }
.annotate 'line', 284

.end # viewable

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 271
get_class $P1, [ 'TokenString' ]
addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 289
# Body
# {
.annotate 'line', 291
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 292

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 293
# Body
# {
.return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 287
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 298
# Body
# {
.annotate 'line', 300
self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 301

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 302
# Body
# {
.return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 296
get_class $P1, [ 'TokenWithVal' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 310
# Body
# {
.annotate 'line', 312
# string s: $S1
set $S1, ''
.annotate 'line', 313
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 314
eq $S2, '"', __label_1
# {
.annotate 'line', 315
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 316
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
.annotate 'line', 318
ne $S2, '\', __label_5
# {
.annotate 'line', 319
# string c2: $S3
$P1 = __ARG_1.'getchar'()
null $S3
if_null $P1, __label_7
set $S3, $P1
__label_7:
.annotate 'line', 320
iseq $I1, $S3, ''
if $I1 goto __label_9
iseq $I1, $S3, "\n"
__label_9:
unless $I1 goto __label_8
.annotate 'line', 321
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_8: # endif
concat $S1, $S2
concat $S1, $S3
.annotate 'line', 322
# }
goto __label_6
__label_5: # else
concat $S1, $S2
__label_6: # endif
.annotate 'line', 326
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 328
new $P3, [ 'TokenQuoted' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenQuoted'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 329

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 331
# Body
# {
.annotate 'line', 333
# string s: $S1
set $S1, ''
.annotate 'line', 334
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 335
eq $S2, "'", __label_1
# {
.annotate 'line', 336
iseq $I1, $S2, ''
if $I1 goto __label_4
iseq $I1, $S2, "\n"
__label_4:
unless $I1 goto __label_3
.annotate 'line', 337
'TokenError'('Unterminated string', __ARG_1, __ARG_3)
__label_3: # endif
concat $S1, $S2
.annotate 'line', 339
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 341
new $P3, [ 'TokenSingleQuoted' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 342

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 344
# Body
# {
.annotate 'line', 346
# string mark: $S1
set $S1, ''
.annotate 'line', 347
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 348
isne $I1, $S2, "\n"
unless $I1 goto __label_3
isne $I1, $S2, ''
__label_3:
unless $I1 goto __label_1
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 351
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
.annotate 'line', 360
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 362
ne $S2, '', __label_8
.annotate 'line', 363
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_8: # endif
concat $S0, $S1, ':>>'
set $S1, $S0
.annotate 'line', 366
# string content: $S3
set $S3, ''
.annotate 'line', 367
# string line: $S4
null $S4
__label_9: # do
.annotate 'line', 368
# {
set $S4, ''
.annotate 'line', 370
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_13: # while
.annotate 'line', 371
isne $I1, $S2, "\n"
unless $I1 goto __label_14
isne $I1, $S2, ''
__label_14:
unless $I1 goto __label_12
# {
set $S5, $S2
set $S6, '"'
.annotate 'line', 372
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
concat $S4, $S2
.annotate 'line', 381
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_13
__label_12: # endwhile
.annotate 'line', 383
ne $S2, '', __label_19
.annotate 'line', 384
'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
__label_19: # endif
.annotate 'line', 385
eq $S4, $S1, __label_20
concat $S3, $S4
concat $S3, '\n'
__label_20: # endif
.annotate 'line', 386
# }
.annotate 'line', 387
ne $S4, $S1, __label_9
__label_10: # enddo
.annotate 'line', 388
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_1, 'filename'
$P4.'TokenQuoted'($P5, __ARG_3, $S3)
set $P3, $P4
.return($P3)
# }
.annotate 'line', 389

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 391
# Body
# {
.annotate 'line', 393
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 394
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 395
$P1 = 'isident'($S2)
if_null $P1, __label_1
unless $P1 goto __label_1
# {
concat $S1, $S2
.annotate 'line', 397
$P2 = __ARG_1.'getchar'()
set $S2, $P2
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 399
__ARG_1.'ungetchar'($S2)
.annotate 'line', 400
new $P3, [ 'TokenIdentifier' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenIdentifier'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 401

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 403
# Body
# {
.annotate 'line', 405
# string s: $S1
null $S1
.annotate 'line', 406
# string c: $S2
set $S2, __ARG_2
__label_0: # do
.annotate 'line', 407
# {
concat $S1, $S2
.annotate 'line', 409
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
.annotate 'line', 410
$P1 = 'isdigit'($S2)
if_null $P1, __label_1
if $P1 goto __label_0
__label_1: # enddo
.annotate 'line', 411
iseq $I3, $S1, '0'
unless $I3 goto __label_4
iseq $I3, $S2, 'x'
if $I3 goto __label_5
iseq $I3, $S2, 'X'
__label_5:
__label_4:
unless $I3 goto __label_3
# {
.annotate 'line', 412
# int hexval: $I1
null $I1
# int h: $I2
null $I2
.annotate 'line', 413
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_7: # while
.annotate 'line', 414
$P2 = 'hexdigit'($S2)
set $I2, $P2
lt $I2, 0, __label_6
# {
mul $I3, $I1, 16
add $I1, $I3, $I2
concat $S1, $S2
.annotate 'line', 417
$P3 = __ARG_1.'getchar'()
set $S2, $P3
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 419
__ARG_1.'ungetchar'($S2)
set $S1, $I1
.annotate 'line', 421
new $P4, [ 'TokenInteger' ]
getattribute $P5, __ARG_1, 'filename'
$P4.'TokenInteger'($P5, __ARG_3, $S1)
set $P3, $P4
.return($P3)
# }
__label_3: # endif
.annotate 'line', 423
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 424
# {
concat $S1, $S2
.annotate 'line', 426
$P4 = __ARG_1.'getchar'()
set $S2, $P4
# }
.annotate 'line', 427
$P5 = 'isdigit'($S2)
if_null $P5, __label_11
if $P5 goto __label_10
__label_11: # enddo
.annotate 'line', 428
iseq $I4, $S2, 'e'
if $I4 goto __label_14
iseq $I4, $S2, 'E'
__label_14:
unless $I4 goto __label_13
# {
concat $S1, 'E'
.annotate 'line', 430
$P6 = __ARG_1.'getchar'()
set $S2, $P6
iseq $I4, $S2, '+'
if $I4 goto __label_16
iseq $I4, $S2, '-'
__label_16:
unless $I4 goto __label_15
# {
concat $S1, $S2
.annotate 'line', 432
$P6 = __ARG_1.'getchar'()
set $S2, $P6
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 434
$P7 = 'isdigit'($S2)
if_null $P7, __label_17
unless $P7 goto __label_17
# {
concat $S1, $S2
.annotate 'line', 436
$P7 = __ARG_1.'getchar'()
set $S2, $P7
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 439
__ARG_1.'ungetchar'($S2)
.annotate 'line', 440
new $P9, [ 'TokenFloat' ]
getattribute $P10, __ARG_1, 'filename'
$P9.'TokenFloat'($P10, __ARG_3, $S1)
set $P8, $P9
.return($P8)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 443
iseq $I5, $S2, 'e'
if $I5 goto __label_21
iseq $I5, $S2, 'E'
__label_21:
unless $I5 goto __label_19
# {
concat $S1, 'E'
.annotate 'line', 445
$P8 = __ARG_1.'getchar'()
set $S2, $P8
iseq $I5, $S2, '+'
if $I5 goto __label_23
iseq $I5, $S2, '-'
__label_23:
unless $I5 goto __label_22
# {
concat $S1, $S2
.annotate 'line', 447
$P9 = __ARG_1.'getchar'()
set $S2, $P9
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 449
$P10 = 'isdigit'($S2)
if_null $P10, __label_24
unless $P10 goto __label_24
# {
concat $S1, $S2
.annotate 'line', 451
$P11 = __ARG_1.'getchar'()
set $S2, $P11
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 453
__ARG_1.'ungetchar'($S2)
.annotate 'line', 454
new $P12, [ 'TokenFloat' ]
getattribute $P13, __ARG_1, 'filename'
$P12.'TokenFloat'($P13, __ARG_3, $S1)
set $P11, $P12
.return($P11)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 457
__ARG_1.'ungetchar'($S2)
.annotate 'line', 458
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
.annotate 'line', 461

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 463
# Body
# {
.annotate 'line', 465
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 466
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 467
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
concat $S1, $S2
.annotate 'line', 469
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 471
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 472

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 474
# Body
# {
.annotate 'line', 476
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 477
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 478
# {
__label_5: # while
.annotate 'line', 479
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
concat $S1, $S2
.annotate 'line', 480
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 481
ne $S2, '', __label_7
.annotate 'line', 482
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
concat $S1, $S2
.annotate 'line', 484
$P2 = __ARG_1.'getchar'()
set $S2, $P2
.annotate 'line', 485
ne $S2, '', __label_8
.annotate 'line', 486
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
.annotate 'line', 487
ne $S2, '/', __label_1
__label_2: # enddo
concat $S1, '/'
.annotate 'line', 489
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 490

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 492
# Body
# {
.annotate 'line', 494
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 495
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 496

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 510
# Body
# {
.annotate 'line', 512
.const 'Sub' $P2 = 'getop'
.annotate 'line', 514
setattribute self, 'h', __ARG_1
box $P3, ''
.annotate 'line', 515
setattribute self, 'pending', $P3
.annotate 'line', 516
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P5
box $P4, __ARG_2
.annotate 'line', 517
setattribute self, 'filename', $P4
box $P5, 1
.annotate 'line', 518
setattribute self, 'line', $P5
.annotate 'line', 519
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 520
root_new $P6, ['parrot';'Hash']
get_hll_global $P7, 'getident'
$P6[''] = $P7
$P6['{'] = $P2
$P1['$'] = $P6
get_hll_global $P8, 'getquoted'
$P1['"'] = $P8
get_hll_global $P9, 'getsinglequoted'
$P1["'"] = $P9
.annotate 'line', 523
root_new $P10, ['parrot';'Hash']
.annotate 'line', 524
root_new $P11, ['parrot';'Hash']
$P11[''] = $P2
$P11['='] = $P2
$P10['='] = $P11
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 527
root_new $P12, ['parrot';'Hash']
$P12['+'] = $P2
$P12['='] = $P2
$P1['+'] = $P12
.annotate 'line', 528
root_new $P13, ['parrot';'Hash']
$P13['-'] = $P2
$P13['='] = $P2
$P1['-'] = $P13
.annotate 'line', 529
root_new $P14, ['parrot';'Hash']
$P14['='] = $P2
$P1['*'] = $P14
.annotate 'line', 530
root_new $P15, ['parrot';'Hash']
$P15['|'] = $P2
$P1['|'] = $P15
.annotate 'line', 531
root_new $P16, ['parrot';'Hash']
$P16['&'] = $P2
$P1['&'] = $P16
.annotate 'line', 532
root_new $P17, ['parrot';'Hash']
.annotate 'line', 533
root_new $P18, ['parrot';'Hash']
$P18[''] = $P2
get_hll_global $P19, 'getheredoc'
$P18[':'] = $P19
$P17['<'] = $P18
$P17['='] = $P2
$P1['<'] = $P17
.annotate 'line', 536
root_new $P20, ['parrot';'Hash']
$P20['>'] = $P2
$P20['='] = $P2
$P1['>'] = $P20
.annotate 'line', 537
root_new $P21, ['parrot';'Hash']
.annotate 'line', 538
root_new $P22, ['parrot';'Hash']
$P22[''] = $P2
$P22['='] = $P2
$P21['='] = $P22
$P1['!'] = $P21
.annotate 'line', 540
root_new $P23, ['parrot';'Hash']
$P23['%'] = $P2
$P1['%'] = $P23
.annotate 'line', 541
root_new $P24, ['parrot';'Hash']
$P24['='] = $P2
get_hll_global $P25, 'getlinecomment'
$P24['/'] = $P25
get_hll_global $P26, 'getcomment'
$P24['*'] = $P26
$P1['/'] = $P24
get_hll_global $P27, 'getlinecomment'
$P1['#'] = $P27
.annotate 'line', 544
setattribute self, 'select', $P1
# }
.annotate 'line', 545

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 546
# Body
# {
.annotate 'line', 548
# var pending: $P1
getattribute $P1, self, 'pending'
.annotate 'line', 549
# string c: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 550
eq $S1, '', __label_1
assign $P1, ''
goto __label_2
__label_1: # else
.annotate 'line', 551
# {
.annotate 'line', 553
# var h: $P2
getattribute $P2, self, 'h'
.annotate 'line', 554
$P3 = $P2.'read'(1)
set $S1, $P3
.annotate 'line', 555
ne $S1, "\n", __label_3
# {
.annotate 'line', 556
# int l: $I1
getattribute $P4, self, 'line'
set $I1, $P4
.annotate 'line', 557
inc $I1
box $P4, $I1
.annotate 'line', 558
setattribute self, 'line', $P4
# }
__label_3: # endif
# }
__label_2: # endif
.annotate 'line', 561
.return($S1)
# }
.annotate 'line', 562

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 563
# Body
# {
.annotate 'line', 565
getattribute $P1, self, 'pending'
assign $P1, __ARG_1
# }
.annotate 'line', 566

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 567
# Body
# {
.annotate 'line', 569
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 570
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 571
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 572
.const 'Sub' $P7 = 'getop'
.annotate 'line', 573
.const 'Sub' $P8 = 'getident'
.annotate 'line', 574
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 576
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 577
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 578
.return($P1)
# }
__label_0: # endif
.annotate 'line', 580
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 581
$P11 = $P4($S1)
if_null $P11, __label_2
unless $P11 goto __label_2
.annotate 'line', 582
$P12 = self.'getchar'()
set $S1, $P12
goto __label_3
__label_2: # endwhile
.annotate 'line', 583
# int line: $I1
getattribute $P12, self, 'line'
set $I1, $P12
.annotate 'line', 584
ne $S1, '', __label_4
.annotate 'line', 585
new $P13, [ 'TokenEof' ]
.return($P13)
__label_4: # endif
.annotate 'line', 586
$P13 = $P5($S1)
if_null $P13, __label_5
unless $P13 goto __label_5
.annotate 'line', 587
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 588
$P14 = $P6($S1)
if_null $P14, __label_6
unless $P14 goto __label_6
.annotate 'line', 589
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 591
# string op: $S2
set $S2, $S1
.annotate 'line', 592
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 593
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 595
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 596
$P14 = self.'getchar'()
set $S1, $P14
set $P2, $P3
.annotate 'line', 598
$P3 = $P2[$S1]
.annotate 'line', 599
unless_null $P3, __label_10
# {
.annotate 'line', 600
self.'ungetchar'($S1)
.annotate 'line', 601
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
concat $S2, $S1
__label_11: # endif
.annotate 'line', 604
# }
goto __label_8
__label_7: # endwhile
if_null $P3, __label_12
unless $P3 goto __label_12
.annotate 'line', 607
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 608
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 609

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 610
# Body
# {
.annotate 'line', 612
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 613
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 614
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 615
.return($P1)
# }
.annotate 'line', 616

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 617
# Body
# {
.annotate 'line', 619
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }
.annotate 'line', 620

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 504
addattribute $P0, 'h'
.annotate 'line', 505
addattribute $P0, 'pending'
.annotate 'line', 506
addattribute $P0, 'select'
.annotate 'line', 507
addattribute $P0, 'stacked'
.annotate 'line', 508
addattribute $P0, 'filename'
.annotate 'line', 509
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

.annotate 'line', 639
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 641
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
.annotate 'line', 642
.return('I')
__label_3: # case
.annotate 'line', 643
.return('N')
__label_4: # case
.annotate 'line', 644
.return('S')
__label_5: # case
.annotate 'line', 645
.return('P')
__label_1: # default
.annotate 'line', 646
.return('')
__label_0: # switch end
# }
.annotate 'line', 648

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 650
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 652
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
.annotate 'line', 653
.return('int')
__label_3: # case
.annotate 'line', 654
.return('num')
__label_4: # case
.annotate 'line', 655
.return('string')
__label_5: # case
.annotate 'line', 656
.return('pmc')
__label_1: # default
.annotate 'line', 657
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 659

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 673
# Body
# {
.annotate 'line', 675
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 676
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 677
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 678
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 679
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 680

.end # initialize


.sub 'close' :method

.annotate 'line', 681
# Body
# {
null $P1
.annotate 'line', 683
setattribute self, 'handle', $P1
# }
.annotate 'line', 684

.end # close


.sub 'updateannot' :method

.annotate 'line', 685
# Body
# {
.annotate 'line', 687
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 688
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 689
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 690
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 691
getattribute $P3, self, 'handle'
$P3.'print'("\n")
.annotate 'line', 692
getattribute $P4, self, 'pendingf'
assign $P4, 0
# }
__label_0: # endif
.annotate 'line', 694
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 695
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 696
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 697
getattribute $P6, self, 'handle'
$P6.'print'("\n")
.annotate 'line', 698
getattribute $P7, self, 'pendingl'
assign $P7, 0
# }
__label_1: # endif
# }
.annotate 'line', 700

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 701
# Body
# {
.annotate 'line', 703
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 704
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 705

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 706
# Body
# {
.annotate 'line', 708
self.'updateannot'()
.annotate 'line', 709
self.'vprint'(__ARG_1)
# }
.annotate 'line', 710

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 711
# Body
# {
.annotate 'line', 713
self.'updateannot'()
.annotate 'line', 714
self.'vprint'(__ARG_1)
.annotate 'line', 715
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 716

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 717
# Body
# {
.annotate 'line', 719
# var file: $P1
getattribute $P1, self, 'file'
.annotate 'line', 720
# var line: $P2
getattribute $P2, self, 'line'
.annotate 'line', 721
# string tfile: $S1
getattribute $P3, __ARG_1, 'file'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 722
# int tline: $I1
getattribute $P3, __ARG_1, 'line'
set $I1, $P3
set $S2, $P1
.annotate 'line', 723
eq $S2, $S1, __label_1
# {
assign $P1, $S1
.annotate 'line', 725
getattribute $P4, self, 'pendingf'
assign $P4, 1
assign $P2, 0
.annotate 'line', 726
# }
__label_1: # endif
set $I2, $P2
.annotate 'line', 728
eq $I2, $I1, __label_2
# {
assign $P2, $I1
.annotate 'line', 730
getattribute $P4, self, 'pendingl'
assign $P4, 1
# }
__label_2: # endif
# }
.annotate 'line', 732

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 733
# Body
# {
.annotate 'line', 735
self.'updateannot'()
.annotate 'line', 736
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 737

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 738
# Body
# {
.annotate 'line', 740
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 741
$P1.'print'(__ARG_1)
.annotate 'line', 742
$P1.'print'(':')
.annotate 'line', 743
if_null __ARG_2, __label_0
# {
.annotate 'line', 744
$P1.'print'(' # ')
.annotate 'line', 745
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 747
$P1.'print'("\n")
# }
.annotate 'line', 748

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 749
# Body
# {
.annotate 'line', 751
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 752
$P1.'print'('goto ')
.annotate 'line', 753
$P1.'print'(__ARG_1)
.annotate 'line', 754
if_null __ARG_2, __label_0
# {
.annotate 'line', 755
$P1.'print'(' # ')
.annotate 'line', 756
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 758
$P1.'print'("\n")
# }
.annotate 'line', 759

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 760
# Body
# {
.annotate 'line', 762
# string ins: $S1
concat $S1, 'if ', __ARG_1
concat $S1, ' goto '
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 763
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 764

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 765
# Body
# {
.annotate 'line', 767
# string ins: $S1
concat $S1, 'unless ', __ARG_1
concat $S1, ' goto '
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 768
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 769

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 770
# Body
# {
.annotate 'line', 772
# string ins: $S1
concat $S1, 'if_null ', __ARG_1
concat $S1, ', '
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 773
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 774

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 775
# Body
# {
.annotate 'line', 777
# string ins: $S1
concat $S1, "null ", __ARG_1
concat $S1, "\n"
.annotate 'line', 778
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 779

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 780
# Body
# {
.annotate 'line', 782
# string ins: $S1
concat $S1, "set ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 783
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 784

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 785
# Body
# {
.annotate 'line', 787
# string ins: $S1
concat $S1, "assign ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 788
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 789

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 790
# Body
# {
.annotate 'line', 792
# string ins: $S1
concat $S1, "box ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 793
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 794

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 795
# Body
# {
.annotate 'line', 797
# string ins: $S1
concat $S1, "unbox ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 798
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 799

.end # emitunbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 800
# Body
# {
.annotate 'line', 802
# string ins: $S1
concat $S1, "add ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 803
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 804

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 805
# Body
# {
.annotate 'line', 807
# string ins: $S1
concat $S1, "add ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, ", "
concat $S1, __ARG_3
concat $S1, "\n"
.annotate 'line', 808
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 809

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 810
# Body
# {
.annotate 'line', 812
# string ins: $S1
concat $S1, "mul ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, ", "
concat $S1, __ARG_3
concat $S1, "\n"
.annotate 'line', 813
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 814

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 815
# Body
# {
.annotate 'line', 817
# string ins: $S1
concat $S1, "concat ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, "\n"
.annotate 'line', 818
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 819

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 820
# Body
# {
.annotate 'line', 822
# string ins: $S1
concat $S1, "concat ", __ARG_1
concat $S1, ", "
concat $S1, __ARG_2
concat $S1, ", "
concat $S1, __ARG_3
concat $S1, "\n"
.annotate 'line', 823
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 824

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 667
addattribute $P0, 'handle'
.annotate 'line', 668
addattribute $P0, 'file'
.annotate 'line', 669
addattribute $P0, 'line'
.annotate 'line', 670
addattribute $P0, 'pendingf'
.annotate 'line', 671
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 831
# Body
# {
.annotate 'line', 833
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 834

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 836
# Body
# {
.annotate 'line', 838
# var t: $P1
new $P1, [ 'TokenFloat' ]
getattribute $P2, __ARG_2, 'file'
getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 839
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 840

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 842
# Body
# {
.annotate 'line', 848
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 849
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 850
.return($I1)
# }
.annotate 'line', 851

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 872
# Body
# {
.annotate 'line', 874
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 875
.return($S1)
# }
.annotate 'line', 876

.end # name


.sub 'result' :method

.annotate 'line', 877
# Body
# {
.annotate 'line', 879
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 880

.end # result


.sub 'params' :method

.annotate 'line', 881
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 882
# Body
# {
.annotate 'line', 884
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 885
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 886
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 887
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 888
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 890
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 892
.return($S1)
# }
.annotate 'line', 893

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 894
# Body
# {
box $P1, __ARG_1
.annotate 'line', 900
setattribute self, 'name', $P1
.annotate 'line', 901
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 902
setattribute self, 'typeresult', $P2
.annotate 'line', 903
# int n: $I1
null $I1
.annotate 'line', 904
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 905
setattribute self, 'type0', $P2
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 906
if $S1 == $S2 goto __label_3
set $S2, '!'
if $S1 == $S2 goto __label_4
goto __label_2
# switch
__label_3: # case
set $I1, -1
goto __label_1 # break
__label_4: # case
set $I1, -2
.annotate 'line', 912
if_null __ARG_5, __label_5
concat $S3, "Invalid predef '", __ARG_1
concat $S3, '"'
.annotate 'line', 913
'InternalError'($S3)
__label_5: # endif
goto __label_1 # break
__label_2: # default
set $I1, 1
.annotate 'line', 917
if_null __ARG_5, __label_6
# {
box $P3, __ARG_5
.annotate 'line', 918
setattribute self, 'type1', $P3
.annotate 'line', 919
inc $I1
# }
__label_6: # endif
.annotate 'line', 921
if_null __ARG_6, __label_7
# {
box $P3, __ARG_6
.annotate 'line', 922
setattribute self, 'type2', $P3
.annotate 'line', 923
inc $I1
# }
__label_7: # endif
__label_1: # switch end
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 927
setattribute self, 'nparams', $P4
.annotate 'line', 928
.return(self)
# }
.annotate 'line', 929

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 930
# Body
# {
.annotate 'line', 938
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 939
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 940
.return(self)
# }
.annotate 'line', 941

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 942
# Body
# {
.annotate 'line', 944
# string name: $S1
getattribute $P3, self, 'name'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 945
# string typeresult: $S2
getattribute $P3, self, 'typeresult'
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 946
__ARG_1.'comment'($S6)
.annotate 'line', 948
getattribute $P4, self, 'nparams'
set $I4, $P4
ne $I4, -2, __label_2
# {
.annotate 'line', 949
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 950
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 951
.return()
# }
__label_2: # endif
.annotate 'line', 953
getattribute $P4, self, 'body'
isa $I4, $P4, 'String'
unless $I4 goto __label_3
# {
.annotate 'line', 954
# string body: $S3
getattribute $P5, self, 'body'
null $S3
if_null $P5, __label_5
set $S3, $P5
__label_5:
.annotate 'line', 955
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 956
ne $S2, 'v', __label_6
# {
.annotate 'line', 957
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_9
isne $I5, __ARG_4, ''
__label_9:
unless $I5 goto __label_8
.annotate 'line', 958
'SyntaxError'('using return value from void predef')
__label_8: # endif
.annotate 'line', 959
eq $I1, -1, __label_10
.annotate 'line', 960
'InternalError'('void predef with {res}')
__label_10: # endif
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 963
ne $I1, -1, __label_11
.annotate 'line', 964
'InternalError'('non void predef without {res}')
__label_11: # endif
.annotate 'line', 965
isne $I5, $S2, 'v'
unless $I5 goto __label_13
isnull $I5, __ARG_4
if $I5 goto __label_14
iseq $I5, __ARG_4, ''
__label_14:
__label_13:
unless $I5 goto __label_12
.annotate 'line', 966
$P5 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P5
__label_12: # endif
__label_15: # do
.annotate 'line', 967
# {
.annotate 'line', 968
# predefined substr
substr $S6, $S3, 0, $I1
add $I6, $I1, 5
# predefined substr
substr $S7, $S3, $I6
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 969
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_15
__label_16: # enddo
# }
__label_7: # endif
.annotate 'line', 972
# int n: $I2
set $P6, __ARG_5
set $I2, $P6
# for loop
.annotate 'line', 973
# int i: $I3
null $I3
__label_20: # for condition
ge $I3, $I2, __label_19
# {
.annotate 'line', 974
# string argmark: $S4
set $S8, $I3
concat $S7, '{arg', $S8
concat $S4, $S7, '}'
.annotate 'line', 975
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_22: # while
.annotate 'line', 976
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_21
.annotate 'line', 977
# predefined substr
substr $S8, $S3, 0, $I1
add $I6, $I1, 6
# predefined substr
substr $S9, $S3, $I6
concat $S0, $S8, $S5
concat $S0, $S9
set $S3, $S0
goto __label_22
__label_21: # endwhile
# }
__label_18: # for iteration
.annotate 'line', 973
inc $I3
goto __label_20
__label_19: # for end
.annotate 'line', 979
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 980
__ARG_1.'say'($S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 983
# var fun: $P2
getattribute $P2, self, 'body'
.annotate 'line', 984
$P2(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_4: # endif
# }
.annotate 'line', 986

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 863
addattribute $P0, 'name'
.annotate 'line', 864
addattribute $P0, 'body'
.annotate 'line', 865
addattribute $P0, 'evalfun'
.annotate 'line', 866
addattribute $P0, 'typeresult'
.annotate 'line', 867
addattribute $P0, 'type0'
.annotate 'line', 868
addattribute $P0, 'type1'
.annotate 'line', 869
addattribute $P0, 'type2'
.annotate 'line', 870
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 992
# Body
# {
box $P1, __ARG_1
.annotate 'line', 994
setattribute self, 'type', $P1
# }
.annotate 'line', 995

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 996
# Body
# {
.annotate 'line', 998
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 999
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1000
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1001
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1002
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1003
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1004
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1006
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 1007
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1008
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1010

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 991
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1015
# Body
# {
.annotate 'line', 1017
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1018
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1019
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1020
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 1021
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 1020
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 1022
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1025
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 1026

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

.annotate 'line', 1031
# Body
# {
.annotate 'line', 1033
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1034
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1035
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1036
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1037
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1036
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1038
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1039

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

.annotate 'line', 1044
# Body
# {
.annotate 'line', 1046
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1047
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1048
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1049
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 1048
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1050

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1053
# Body
# {
.annotate 'line', 1055
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1056
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1057
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1058

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1060
# Body
# {
.annotate 'line', 1062
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1063
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1064
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1065

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1067
# Body
# {
.annotate 'line', 1069
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1070
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1071
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1072

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1074
# Body
# {
.annotate 'line', 1076
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1077
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1078
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1079
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1080
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1081

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1083
# Body
# {
.annotate 'line', 1085
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1087
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1088
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1090
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
$P2.'TokenQuoted'($P4, $P5, $S1)
.annotate 'line', 1091
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1092

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 1094
# Body
# {
.annotate 'line', 1096
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1097
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1098
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1099
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1100
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1102
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1103
new $P9, [ 'PredefFunction' ]
.annotate 'line', 1104
new $P11, [ 'Predef_typecast' ]
$P11.'Predef_typecast'('I')
set $P10, $P11
.annotate 'line', 1103
$P8 = $P9.'set'('int', $P10, 'I', '!')
.annotate 'line', 1102
$P1.'push'($P8)
.annotate 'line', 1107
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1108
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('N')
set $P14, $P15
.annotate 'line', 1107
$P12 = $P13.'set'('float', $P14, 'N', '!')
.annotate 'line', 1102
$P1.'push'($P12)
.annotate 'line', 1111
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1112
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('S')
set $P18, $P19
.annotate 'line', 1111
$P16 = $P17.'set'('string', $P18, 'S', '!')
.annotate 'line', 1102
$P1.'push'($P16)
.annotate 'line', 1115
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1102
$P1.'push'($P20)
.annotate 'line', 1119
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1102
$P1.'push'($P22)
.annotate 'line', 1123
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('time', 'time {res}', 'I')
.annotate 'line', 1102
$P1.'push'($P24)
.annotate 'line', 1127
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1102
$P1.'push'($P26)
.annotate 'line', 1131
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1102
$P1.'push'($P28)
.annotate 'line', 1135
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P30)
.annotate 'line', 1140
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P32)
.annotate 'line', 1145
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P34)
.annotate 'line', 1150
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1102
$P1.'push'($P36)
.annotate 'line', 1156
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1102
$P1.'push'($P38)
.annotate 'line', 1163
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1102
$P1.'push'($P40)
.annotate 'line', 1167
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1102
$P1.'push'($P42)
.annotate 'line', 1172
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1102
$P1.'push'($P44)
.annotate 'line', 1177
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1102
$P1.'push'($P46)
.annotate 'line', 1184
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1102
$P1.'push'($P48)
.annotate 'line', 1189
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1102
$P1.'push'($P50)
.annotate 'line', 1194
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1102
$P1.'push'($P52)
.annotate 'line', 1198
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1102
$P1.'push'($P54)
.annotate 'line', 1202
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P56)
.annotate 'line', 1206
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1102
$P1.'push'($P58)
.annotate 'line', 1210
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1102
$P1.'push'($P60)
.annotate 'line', 1214
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P62)
.annotate 'line', 1218
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P64)
.annotate 'line', 1222
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P66)
.annotate 'line', 1226
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P68)
.annotate 'line', 1230
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P70)
.annotate 'line', 1235
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P72)
.annotate 'line', 1240
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P74)
.annotate 'line', 1244
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P76)
.annotate 'line', 1248
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P78)
.annotate 'line', 1252
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P80)
.annotate 'line', 1256
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P82)
.annotate 'line', 1260
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P84)
.annotate 'line', 1264
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P86)
.annotate 'line', 1268
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P88)
.annotate 'line', 1272
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P90)
.annotate 'line', 1276
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P92)
.annotate 'line', 1280
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1102
$P1.'push'($P94)
.annotate 'line', 1284
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1102
$P1.'push'($P96)
.annotate 'line', 1288
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P98)
.annotate 'line', 1292
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P100)
.annotate 'line', 1296
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P102)
.annotate 'line', 1300
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1102
$P1.'push'($P104)
.annotate 'line', 1304
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1102
$P1.'push'($P106)
.annotate 'line', 1308
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P108)
.annotate 'line', 1312
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1102
$P1.'push'($P110)
.annotate 'line', 1316
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P112)
.annotate 'line', 1321
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P114)
.annotate 'line', 1326
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1102
$P1.'push'($P116)
.annotate 'line', 1330
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1102
$P1.'push'($P118)
.annotate 'line', 1334
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1102
$P1.'push'($P120)
.annotate 'line', 1338
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1102
$P1.'push'($P122)
.annotate 'line', 1342
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1102
$P1.'push'($P124)
.annotate 'line', 1346
new $P127, [ 'PredefFunction' ]
.annotate 'line', 1347
new $P128, [ 'Predef_print' ]
.annotate 'line', 1346
$P126 = $P127.'set'('print', $P128, 'P', '*')
.annotate 'line', 1102
$P1.'push'($P126)
.annotate 'line', 1350
new $P130, [ 'PredefFunction' ]
.annotate 'line', 1351
new $P131, [ 'Predef_say' ]
.annotate 'line', 1350
$P129 = $P130.'set'('say', $P131, 'P', '*')
.annotate 'line', 1102
$P1.'push'($P129)
.annotate 'line', 1354
new $P133, [ 'PredefFunction' ]
.annotate 'line', 1355
new $P134, [ 'Predef_cry' ]
.annotate 'line', 1354
$P132 = $P133.'set'('cry', $P134, 'P', '*')
.annotate 'line', 1102
$P1.'push'($P132)
__label_1: # Infinite loop
.annotate 'line', 1360
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1361

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1363
# Body
# {
.annotate 'line', 1365
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1366
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1367
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1368
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1369
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1370
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1371
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1373
.return($P2)
# }
.annotate 'line', 1374

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1380
# Body
# {
.annotate 'line', 1382
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1383
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1384
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1383
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1385

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1396
# Body
# {
.annotate 'line', 1398
setattribute self, 'start', __ARG_1
.annotate 'line', 1399
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1400

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1401
# Body
# {
.annotate 'line', 1403
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1404

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1405
# Body
# {
.annotate 'line', 1407
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1408

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1409
# Body
# {
.annotate 'line', 1411
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1412

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1413
# Body
# {
.annotate 'line', 1415
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1416

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1417
# Body
# {
.annotate 'line', 1419
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1420

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1393
addattribute $P0, 'start'
.annotate 'line', 1394
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1433
# Body
# {
.annotate 'line', 1435
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1436

.end # init


.sub 'numargs' :method

.annotate 'line', 1438
# Body
# {
.annotate 'line', 1440
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1441

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1442
# Body
# {
.annotate 'line', 1444
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1445
.return($P2)
# }
.annotate 'line', 1446

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1448
# Body
# {
.annotate 'line', 1450
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1451
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1452
# {
.annotate 'line', 1453
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1454
$P1.'push'($P3)
# }
.annotate 'line', 1455
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1456
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1457

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1459
# Body
# {
.annotate 'line', 1461
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1462
if_null $P1, __label_0
.annotate 'line', 1463
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1464

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1465
# Body
# {
.annotate 'line', 1467
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1468
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1469
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1470
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1471
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1472
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1473
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1470
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1475
.return($P2)
# }
.annotate 'line', 1476

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1477
# Body
# {
.annotate 'line', 1479
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1480
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1481

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1431
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1493
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1494
# Body
# {
.annotate 'line', 1496
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1497
.return($I1)
# }
.annotate 'line', 1498

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1499
# Body
# {
.annotate 'line', 1501
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1502
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1503
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1505
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1506

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1507
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1509
setattribute self, 'name', $P1
.annotate 'line', 1510
if_null __ARG_2, __label_0
.annotate 'line', 1511
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1512

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1513
# Body
# {
.annotate 'line', 1515
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1516

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1490
addattribute $P0, 'name'
.annotate 'line', 1491
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1526
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1527
# {
.annotate 'line', 1528
$P2 = __ARG_1.'get'()
.annotate 'line', 1529
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1530
$P2 = __ARG_1.'get'()
.annotate 'line', 1531
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1532
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1533
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1534
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1536
new $P6, [ 'Modifier' ]
$P6.'Modifier'($S1, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
.annotate 'line', 1537
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1538
'RequireOp'(']', $P2)
.annotate 'line', 1539
setattribute self, 'list', $P1
# }
.annotate 'line', 1540

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1541
# Body
# {
.annotate 'line', 1543
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1544
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1545

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1546
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1547
# Body
# {
.annotate 'line', 1549
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1550
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1551
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1552
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1553
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1554
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1551
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1557
.return($P3)
# }
.annotate 'line', 1558

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1521
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1565
# Body
# {
.annotate 'line', 1567
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1568
.return($S2)
# }
.annotate 'line', 1569

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1571
# Body
# {
.annotate 'line', 1573
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1574
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1576
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1577
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1579

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1581
# Body
# {
.annotate 'line', 1583
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1584
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1585
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1586
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1587
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1589
__ARG_2.'unget'($P1)
.annotate 'line', 1590
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1592

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1594
# Body
# {
.annotate 'line', 1596
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1597
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1598
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1599
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1600
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1601
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1602
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1604
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1605
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1606
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
.annotate 'line', 1608
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1610
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1613
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1615
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1617
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1619
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1621
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_13: # case
.annotate 'line', 1623
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_14: # case
.annotate 'line', 1625
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_15: # case
.annotate 'line', 1627
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_16: # case
.annotate 'line', 1629
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_17: # case
.annotate 'line', 1631
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_18: # case
.annotate 'line', 1633
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_19: # case
.annotate 'line', 1635
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_20: # case
.annotate 'line', 1637
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_21: # case
.annotate 'line', 1639
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1641
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_23: # case
.annotate 'line', 1643
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1645
$P30 = $P1.'isidentifier'()
if_null $P30, __label_24
unless $P30 goto __label_24
# {
.annotate 'line', 1646
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1647
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1648
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_25: # endif
.annotate 'line', 1649
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1651
__ARG_1.'unget'($P1)
.annotate 'line', 1652
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1654
unless_null $P2, __label_26
.annotate 'line', 1655
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1656
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1657

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1665
# Body
# {
.annotate 'line', 1667
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1668

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1669
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1670
# Body
# {
.annotate 'line', 1672
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1673

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1674
# Body
# {
.annotate 'line', 1676
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1677

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1678
# Body
# {
.annotate 'line', 1680
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1681

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1682
# Body
# {
.annotate 'line', 1684
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1685

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1686
# Body
# {
.annotate 'line', 1688
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1689

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1690
# Body
# {
.annotate 'line', 1692
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1693

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1694
# Body
# {
.annotate 'line', 1696
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1697

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1698
# Body
# {
.annotate 'line', 1700
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1701

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1702
# Body
# {
.annotate 'line', 1704
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1705

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1706
# Body
# {
.annotate 'line', 1708
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1709

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1711
# Body
# {
.annotate 'line', 1716
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1717

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1718
# Body
# {
.annotate 'line', 1720
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1721

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1722
# Body
# {
.annotate 'line', 1724
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1725

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1726
# Body
# {
.annotate 'line', 1728
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1730
.return(self)
# }
.annotate 'line', 1731

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1663
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1736
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1737
# Body
# {
.annotate 'line', 1739
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1740

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1741
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1742
# Body
# {
# }
.annotate 'line', 1745

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1734
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1752
# Body
# {
.annotate 'line', 1754
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1755
$P1.'push'(__ARG_1)
.annotate 'line', 1756
$P1.'push'(__ARG_2)
.annotate 'line', 1757
setattribute self, 'statements', $P1
# }
.annotate 'line', 1758

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1759
# Body
# {
.annotate 'line', 1761
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1762
.return(self)
# }
.annotate 'line', 1763

.end # push


.sub 'optimize' :method

.annotate 'line', 1764
# Body
# {
.annotate 'line', 1766
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1767
.return(self)
# }
.annotate 'line', 1768

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1769
# Body
# {
.annotate 'line', 1771
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1772
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1773

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1750
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1776
# Body
# {
.annotate 'line', 1778
unless_null __ARG_1, __label_0
.annotate 'line', 1779
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1780
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1781
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1783
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1784

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1794
# Body
# {
.annotate 'line', 1796
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1797
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1798
# int dotted: $I1
null $I1
.annotate 'line', 1799
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1801
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1803
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
.annotate 'line', 1804
setattribute self, 'opname', $P3
.annotate 'line', 1805
$P1 = __ARG_2.'get'()
.annotate 'line', 1806
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1807
__ARG_2.'unget'($P1)
.annotate 'line', 1808
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1810
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1811

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1812
# Body
# {
.annotate 'line', 1814
self.'optimizeargs'()
.annotate 'line', 1815
.return(self)
# }
.annotate 'line', 1816

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1817
# Body
# {
.annotate 'line', 1819
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1820
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1821
__ARG_1.'comment'($S2)
.annotate 'line', 1822
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1823
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1825
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1826
self.'emitargs'(__ARG_1)
.annotate 'line', 1827
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1829

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1790
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1792
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1839
# Body
# {
.annotate 'line', 1841
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1842
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1843
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1844
# {
.annotate 'line', 1845
$P2 = __ARG_2.'get'()
.annotate 'line', 1846
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1847
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1848
'RequireOp'(';', $P2)
.annotate 'line', 1849
setattribute self, 'path', $P1
.annotate 'line', 1850
.return(self)
# }
.annotate 'line', 1851

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1852
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1853
# Body
# {
.annotate 'line', 1855
self.'annotate'(__ARG_1)
.annotate 'line', 1856
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1857

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1836
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1838
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1867
# Body
# {
.annotate 'line', 1869
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1870
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1871
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1872
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1873

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1874
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1875
# Body
# {
.annotate 'line', 1877
self.'annotate'(__ARG_1)
.annotate 'line', 1878
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1879
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1880

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1864
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1866
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1890
# Body
# {
.annotate 'line', 1892
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1893
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1894
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1895
# {
.annotate 'line', 1896
$P2 = __ARG_2.'get'()
.annotate 'line', 1897
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1898
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1899
'RequireOp'(';', $P2)
.annotate 'line', 1900
setattribute self, 'path', $P1
# }
.annotate 'line', 1901

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1902
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1903
# Body
# {
.annotate 'line', 1905
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1906
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1907
self.'annotate'(__ARG_1)
.annotate 'line', 1909
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 1910
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 1912
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 1913
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1915
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1918
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1920

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1887
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1889
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1930
# Body
# {
.annotate 'line', 1932
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1933
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1934
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1935

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1936
# Body
# {
.annotate 'line', 1938
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1939
.return(self)
# }
.annotate 'line', 1940

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1941
# Body
# {
.annotate 'line', 1943
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1944

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1927
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1929
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4 :optional

.annotate 'line', 1960
# Body
# {
.annotate 'line', 1962
setattribute self, 'type', __ARG_1
.annotate 'line', 1963
setattribute self, 'reg', __ARG_2
.annotate 'line', 1964
setattribute self, 'scope', __ARG_3
.annotate 'line', 1965
setattribute self, 'value', __ARG_4
# }
.annotate 'line', 1966

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 1967
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1969
setattribute self, 'id', $P1
# }
.annotate 'line', 1970

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 1971
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1973
setattribute self, 'lexname', $P1
# }
.annotate 'line', 1974

.end # setlex


.sub 'gettype' :method

.annotate 'line', 1975
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 1976
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 1977
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 1978
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 1979
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 1980
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 1981
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 1953
addattribute $P0, 'type'
.annotate 'line', 1954
addattribute $P0, 'reg'
.annotate 'line', 1955
addattribute $P0, 'scope'
.annotate 'line', 1956
addattribute $P0, 'value'
.annotate 'line', 1957
addattribute $P0, 'id'
.annotate 'line', 1958
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1987
# Body
# {
.annotate 'line', 1989
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1990

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 1991
# Body
# {
.annotate 'line', 1993
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 1994

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1986
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2001
# Body
# {
.annotate 'line', 2003
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2004

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2005
# Body
# {
.annotate 'line', 2007
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2008
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2009
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2010
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 2011
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2012
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2013
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self)
.annotate 'line', 2014
$P1[$S1] = $P3
.annotate 'line', 2015
.return($P3)
# }
.annotate 'line', 2016

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2017
# Body
# {
.annotate 'line', 2019
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2020
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2021
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2022
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 2023
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2024
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2025

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2026
# Body
# {
.annotate 'line', 2028
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2029
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2030
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2031
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 2032
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2033
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, __ARG_3)
.annotate 'line', 2034
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2035
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2036
$P1[$S1] = $P3
# }
.annotate 'line', 2037

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2038
# Body
# {
.annotate 'line', 2040
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2041
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2042
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2043
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2044
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2045
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2046
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2047
.return($P2)
# }
.annotate 'line', 2048

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2049
# Body
# {
.annotate 'line', 2051
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2052
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2053
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2054
.return($P2)
# }
.annotate 'line', 2055

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2056
# Body
# {
.annotate 'line', 2058
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2059
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2060
.return($S1)
# }
.annotate 'line', 2061

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2062
# Body
# {
.annotate 'line', 2064
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2066
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2067
.return('__WLEX_self')
# }
.annotate 'line', 2068

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2000
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2077
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2087
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2088
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2089
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2090
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2091
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2092
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2093
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2094
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2095
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2096
# Body
# {
.annotate 'line', 2098
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2099

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2100
# Body
# {
.annotate 'line', 2102
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2103

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2104
# Body
# {
.annotate 'line', 2107
.return(self)
# }
.annotate 'line', 2108

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2109
# Body
# {
.annotate 'line', 2111
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2112
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2113
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2114
.return($S2)
# }
.annotate 'line', 2115

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2116
# Body
# {
.annotate 'line', 2118
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2119

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2085
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2124
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2122
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2132
# Body
# {
.annotate 'line', 2134
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2135
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2136
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2137
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2138
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2139

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2140
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2141
# Body
# {
.annotate 'line', 2143
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2144
.return(self)
# }
.annotate 'line', 2145

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2146
# Body
# {
.annotate 'line', 2148
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2149
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2150
self.'annotate'(__ARG_1)
.annotate 'line', 2151
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
set $S2, __ARG_2
.annotate 'line', 2152
eq $S2, '', __label_1
.annotate 'line', 2153
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2154

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2129
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2131
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2170
.return(self)
# }
.annotate 'line', 2171

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2172
# Body
# {
.annotate 'line', 2174
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2175

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2176
# Body
# {
.annotate 'line', 2178
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2179
.return(self)
# }
.annotate 'line', 2180

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2181
# Body
# {
.annotate 'line', 2183
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2184
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2185
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2187
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2188
ne $I1, 0, __label_4
.annotate 'line', 2189
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2191
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2194
.return(0)
# }
.annotate 'line', 2195

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2196
# Body
# {
.annotate 'line', 2198
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2200
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2201
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2202
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2204
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2205
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2206
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
.annotate 'line', 2209
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2212
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2215
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2218

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2219
# Body
# {
.annotate 'line', 2221
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2223
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2224
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2225
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2227
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2228
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2229
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
.annotate 'line', 2232
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2235
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2238
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2241

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2166
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2248
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2249
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2246
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2257
# Body
# {
.annotate 'line', 2259
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2260
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2261

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2262
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2263
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2264
# Body
# {
.annotate 'line', 2266
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2267
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2268
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2269
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2270
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2271
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2273
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
unless $I2 goto __label_4
.annotate 'line', 2276
# {
unless $I1 goto __label_5
.annotate 'line', 2277
# {
null $I1
.annotate 'line', 2279
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2281
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2282
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2284
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2287
# string result: $S4
set $S4, ''
.annotate 'line', 2288
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2289
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2290
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2291
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2292
le $I6, 127, __label_12
# {
.annotate 'line', 2293
# string h: $S6
box $P6, $I6
$P4 = $P6.'get_as_base'(16)
null $S6
if_null $P4, __label_14
set $S6, $P4
__label_14:
concat $S4, '\x{'
concat $S4, $S6
concat $S4, '}'
.annotate 'line', 2294
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2297
# }
__label_9: # for iteration
.annotate 'line', 2289
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2299
# }
__label_4: # endif
.annotate 'line', 2301
# string q: $S7
unless $I1 goto __label_16
set $S7, "'"
goto __label_15
__label_16:
set $S7, '"'
__label_15:
concat $S0, $S7, $S1
concat $S0, $S7
set $S1, $S0
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2305
.return($S1)
# }
.annotate 'line', 2306

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2307
# Body
# {
.annotate 'line', 2309
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2310
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2311
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2312
# var s: $P2
box $P2, $S1
.annotate 'line', 2313
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2315
.return($S1)
# }
.annotate 'line', 2316

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2317
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2319
eq $S1, '', __label_0
.annotate 'line', 2320
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2321

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2322
# Body
# {
.annotate 'line', 2324
.tailcall self.'getPirString'()
# }
.annotate 'line', 2325

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2254
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2256
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2334
# Body
# {
.annotate 'line', 2337
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2338
setattribute self, 'pos', __ARG_2
.annotate 'line', 2339
# int n: $I1
null $I1
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2341
# {
.annotate 'line', 2343
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2344
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2346
setattribute self, 'numval', $P2
# }
.annotate 'line', 2347

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2348
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2349
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2350
# Body
# {
.annotate 'line', 2352
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2353
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2354
.return($I1)
# }
.annotate 'line', 2355

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2356
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2358
eq $S1, '', __label_0
# {
.annotate 'line', 2359
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2360
ne $I1, 0, __label_1
.annotate 'line', 2361
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2363
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2365

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2366
# Body
# {
.annotate 'line', 2368
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2369

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2330
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2332
addattribute $P0, 'pos'
.annotate 'line', 2333
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2377
# Body
# {
.annotate 'line', 2379
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2380
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2381

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2382
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2383
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2384
# Body
# {
.annotate 'line', 2386
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2387
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2389
.return($P1)
# }
.annotate 'line', 2390

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2391
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2393
eq $S1, '', __label_0
# {
.annotate 'line', 2394
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2395
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2397

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2398
# Body
# {
.annotate 'line', 2402
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2403
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2405
.return($S1)
# }
.annotate 'line', 2406

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2374
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2376
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2414
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2415
# Body
# {
.annotate 'line', 2417
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2418
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2419

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2420
# Body
# {
.annotate 'line', 2422
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2423

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2427
if_null $P1, __label_0
.annotate 'line', 2428
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2430
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
.annotate 'line', 2433
.return('P')
__label_3: # default
.annotate 'line', 2435
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2438

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2439
# Body
# {
.annotate 'line', 2441
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2442
.return($S1)
# }
.annotate 'line', 2443

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2444
# Body
# {
.annotate 'line', 2446
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2447
unless_null $P1, __label_0
.annotate 'line', 2448
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2449
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2450
# string s: $S1
null $S1
.annotate 'line', 2451
unless_null $P2, __label_1
# {
.annotate 'line', 2452
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2453
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
.annotate 'line', 2459
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2463
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2464
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2466
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2468
.return($S1)
# }
.annotate 'line', 2469

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2470
# Body
# {
.annotate 'line', 2472
# var value: $P1
$P1 = self.'checkIdentifier'()
set $S2, $P1
.annotate 'line', 2473
ne $S2, '', __label_0
# {
.annotate 'line', 2474
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2475
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2477
.return($P1)
# }
.annotate 'line', 2478

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2482
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2483
if_null $P2, __label_0
# {
.annotate 'line', 2484
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2485
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2487
.return(self)
# }
.annotate 'line', 2488

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2489
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2491
eq $S1, '', __label_0
# {
.annotate 'line', 2492
self.'annotate'(__ARG_1)
.annotate 'line', 2493
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2495

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2496
# Body
# {
.annotate 'line', 2498
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2499

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2500
# Body
# {
.annotate 'line', 2502
self.'annotate'(__ARG_1)
.annotate 'line', 2503
$P1 = self.'isnull'()
if_null $P1, __label_0
unless $P1 goto __label_0
# predefined die
.annotate 'line', 2504
die "NO"
__label_0: # endif
.annotate 'line', 2505
# string typeleft: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2506
# string lreg: $S2
$P2 = self.'getIdentifier'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 2507
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_3
unless $P2 goto __label_3
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2508
if $S5 == $S6 goto __label_7
set $S6, 'P'
if $S5 == $S6 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2511
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2514
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2517
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2518
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2520
# string typeright: $S3
$P3 = __ARG_2.'checkresult'()
null $S3
if_null $P3, __label_11
set $S3, $P3
__label_11:
.annotate 'line', 2521
ne $S1, $S3, __label_12
# {
.annotate 'line', 2522
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 2525
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_14
set $S4, $P4
__label_14:
.annotate 'line', 2526
self.'annotate'(__ARG_1)
.annotate 'line', 2527
iseq $I1, $S1, 'P'
unless $I1 goto __label_17
isne $I1, $S3, 'P'
__label_17:
unless $I1 goto __label_15
.annotate 'line', 2528
__ARG_1.'emitbox'($S2, $S4)
goto __label_16
__label_15: # else
.annotate 'line', 2530
__ARG_1.'emitset'($S2, $S4)
__label_16: # endif
# }
__label_13: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2533
.return($S2)
# }
.annotate 'line', 2534

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2411
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2413
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2541
# Body
# {
.annotate 'line', 2543
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2544

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2539
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2552
# Body
# {
.annotate 'line', 2554
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2555
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2556

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2557
# Body
# {
.annotate 'line', 2559
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2560

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2561
# Body
# {
.annotate 'line', 2563
self.'optimizearg'()
.annotate 'line', 2564
.return(self)
# }
.annotate 'line', 2565

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2549
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2551
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2574
# Body
# {
.annotate 'line', 2576
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2577
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2578
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2579

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2580
# Body
# {
.annotate 'line', 2582
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2583
.return(self)
# }
.annotate 'line', 2584

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2585
# Body
# {
.annotate 'line', 2587
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2588

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2589
# Body
# {
.annotate 'line', 2591
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2592
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2593

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2594
# Body
# {
.annotate 'line', 2596
self.'optimizearg'()
.annotate 'line', 2597
.return(self)
# }
.annotate 'line', 2598

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2570
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2572
addattribute $P0, 'lexpr'
.annotate 'line', 2573
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2605
# Body
# {
.annotate 'line', 2607
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2608

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2609
# Body
# {
.annotate 'line', 2611
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2612
.return(self)
# }
.annotate 'line', 2613

.end # set


.sub 'optimize' :method

.annotate 'line', 2614
# Body
# {
.annotate 'line', 2616
self.'optimizearg'()
.annotate 'line', 2617
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2618
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2619
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2620
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2623
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2624
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2625
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2626
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2629
.return(self)
# }
.annotate 'line', 2630

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2631
# Body
# {
.annotate 'line', 2633
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2634
self.'annotate'(__ARG_1)
.annotate 'line', 2635
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2636

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2603
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2643
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2644
# Body
# {
.annotate 'line', 2646
.return('I')
# }
.annotate 'line', 2647

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2648
# Body
# {
.annotate 'line', 2650
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2651
.return(self)
# }
.annotate 'line', 2652

.end # set


.sub 'optimize' :method

.annotate 'line', 2653
# Body
# {
.annotate 'line', 2655
self.'optimizearg'()
.annotate 'line', 2656
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2657
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2658
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2659
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2660
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2662
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2663
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2664
.return(self)
# }
.annotate 'line', 2665

.end # optimize


.sub 'negated' :method

.annotate 'line', 2666
# Body
# {
.annotate 'line', 2668
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2669

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2670
# Body
# {
.annotate 'line', 2672
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2673
self.'annotate'(__ARG_1)
.annotate 'line', 2674
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2675
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2677
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2680
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2683
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2685

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2641
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2692
# Body
# {
.annotate 'line', 2694
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2695

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2696
# Body
# {
.annotate 'line', 2698
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2699
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2700
.return(self)
# }
.annotate 'line', 2701

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2705
eq $S2, '', __label_1
.annotate 'line', 2706
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2707

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2708
# Body
# {
.annotate 'line', 2710
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2711
self.'annotate'(__ARG_1)
.annotate 'line', 2712
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2713
.return($S1)
# }
.annotate 'line', 2714

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2690
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2721
# Body
# {
.annotate 'line', 2723
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2724
.return(self)
# }
.annotate 'line', 2725

.end # set


.sub 'checkresult' :method

.annotate 'line', 2726
# Body
# {
.annotate 'line', 2728
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2729

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2730
# Body
# {
.annotate 'line', 2732
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2733
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2734
eq $S2, '', __label_1
.annotate 'line', 2735
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2736
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2737
.return($S1)
# }
.annotate 'line', 2738

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2719
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2745
# Body
# {
.annotate 'line', 2747
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2748

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2749
# Body
# {
.annotate 'line', 2751
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2752
.return(self)
# }
.annotate 'line', 2753

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2754
# Body
# {
.annotate 'line', 2756
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2757
eq $S2, '', __label_1
.annotate 'line', 2758
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2759

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2760
# Body
# {
.annotate 'line', 2762
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2763
self.'annotate'(__ARG_1)
.annotate 'line', 2764
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2765
.return($S1)
# }
.annotate 'line', 2766

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2743
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2773
# Body
# {
.annotate 'line', 2775
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2776
.return(self)
# }
.annotate 'line', 2777

.end # set


.sub 'checkresult' :method

.annotate 'line', 2778
# Body
# {
.annotate 'line', 2780
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2781

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2782
# Body
# {
.annotate 'line', 2784
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2785
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2786
eq $S2, '', __label_1
.annotate 'line', 2787
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2788
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2789
.return($S1)
# }
.annotate 'line', 2790

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2771
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2799
# Body
# {
.annotate 'line', 2801
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2802
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2803
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2804
.return(self)
# }
.annotate 'line', 2805

.end # set


.sub 'checkresult' :method

.annotate 'line', 2806
# Body
# {
.annotate 'line', 2808
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2809
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2811
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2812

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2813
# Body
# {
.annotate 'line', 2815
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2816
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2817
.return(self)
# }
.annotate 'line', 2818

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2819
# Body
# {
.annotate 'line', 2821
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2822

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2795
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2797
addattribute $P0, 'lexpr'
.annotate 'line', 2798
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2829
# Body
# {
.annotate 'line', 2831
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2832
eq $S2, '', __label_1
# {
.annotate 'line', 2833
self.'annotate'(__ARG_1)
.annotate 'line', 2834
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2836

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2837
# Body
# {
.annotate 'line', 2839
self.'annotate'(__ARG_1)
.annotate 'line', 2840
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2841
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2842

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2827
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2849
# Body
# {
.annotate 'line', 2851
self.'annotate'(__ARG_1)
.annotate 'line', 2852
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2853
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2854
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2855

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2856
# Body
# {
.annotate 'line', 2858
self.'annotate'(__ARG_1)
.annotate 'line', 2859
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2860
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2861
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2862
.return($S1)
# }
.annotate 'line', 2863

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2847
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2870
# Body
# {
.annotate 'line', 2872
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2873
eq $S2, '', __label_1
.annotate 'line', 2874
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2875

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2879
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2880
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2881
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2882
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2883
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2885
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2886
self.'annotate'(__ARG_1)
.annotate 'line', 2887
ne $S1, 'S', __label_6
# {
.annotate 'line', 2888
$P4 = $P2.'checkresult'()
set $S5, $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2889
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2890
__ARG_1.'emitset'($S4, $S3)
set $S3, $S4
.annotate 'line', 2891
# }
__label_8: # endif
.annotate 'line', 2893
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2896
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2898
.return($S2)
# }
.annotate 'line', 2899

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2868
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2906
# Body
# {
.annotate 'line', 2908
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2909
eq $S2, '', __label_1
.annotate 'line', 2910
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2911

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2912
# Body
# {
.annotate 'line', 2914
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2915
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2916
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2917
self.'annotate'(__ARG_1)
.annotate 'line', 2918
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2919
.return($S2)
# }
.annotate 'line', 2920

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2904
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2927
# Body
# {
.annotate 'line', 2929
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2930
eq $S2, '', __label_1
.annotate 'line', 2931
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2932

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2933
# Body
# {
.annotate 'line', 2935
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2936
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2937
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2938
self.'annotate'(__ARG_1)
.annotate 'line', 2939
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2940
.return($S2)
# }
.annotate 'line', 2941

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2925
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2948
# Body
# {
.annotate 'line', 2950
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2951
eq $S2, '', __label_1
.annotate 'line', 2952
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2953

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2954
# Body
# {
.annotate 'line', 2956
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2957
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2958
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2959
self.'annotate'(__ARG_1)
.annotate 'line', 2960
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2961
.return($S2)
# }
.annotate 'line', 2962

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2946
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2969
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2970
# Body
# {
.annotate 'line', 2972
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2973
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2974
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2975
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2976
self.'annotate'(__ARG_1)
.annotate 'line', 2977
# string aux: $S5
null $S5
.annotate 'line', 2978
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2980
ne $S1, 'I', __label_7
# {
.annotate 'line', 2981
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2982
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2983
# }
__label_7: # endif
.annotate 'line', 2985
ne $S2, 'I', __label_8
# {
.annotate 'line', 2986
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2987
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2988
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2991
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2992
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2993
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2994
# }
goto __label_10
__label_9: # else
.annotate 'line', 2996
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2997
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2998
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2999
# }
goto __label_13
__label_12: # else
.annotate 'line', 3001
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 3002
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3003
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3004
# }
goto __label_16
__label_15: # else
.annotate 'line', 3006
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 3007
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3008
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3009
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 3012
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3014
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3017
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3020
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3021
# }
.annotate 'line', 3023

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3024
# Body
# {
.annotate 'line', 3026
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3027

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3031

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3032
# Body
# {
.annotate 'line', 3034
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3035

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2967
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3048
# Body
# {
.annotate 'line', 3050
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3051
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3052
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3053

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3054
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3055
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3056
# Body
# {
.annotate 'line', 3058
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3059
setattribute self, 'checknull', $P1
.annotate 'line', 3060
.return(self)
# }
.annotate 'line', 3061

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3065
self.'annotate'(__ARG_1)
.annotate 'line', 3066
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3067
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3068
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3069

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3070
# Body
# {
.annotate 'line', 3072
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3073
self.'annotate'(__ARG_1)
.annotate 'line', 3074
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
.annotate 'line', 3075

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3043
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3045
addattribute $P0, 'expr'
.annotate 'line', 3046
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3082
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3083
# Body
# {
.annotate 'line', 3085
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3086

.end # negated


.sub 'optimize' :method

.annotate 'line', 3087
# Body
# {
.annotate 'line', 3089
self.'optimizearg'()
.annotate 'line', 3090
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3091
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3092
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3093
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3094
# {
unless $I2 goto __label_1
.annotate 'line', 3096
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3098
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3101
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3102
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3103
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3104
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3105
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3106
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3107
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3108
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3111
.return(self)
# }
.annotate 'line', 3112

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3113
# Body
# {
.annotate 'line', 3115
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3116

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3117
# Body
# {
.annotate 'line', 3119
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3120

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3121
# Body
# {
.annotate 'line', 3123
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3124

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3125
# Body
# {
.annotate 'line', 3127
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3128

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3080
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3135
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3139

.end # negated


.sub 'optimize' :method

.annotate 'line', 3140
# Body
# {
.annotate 'line', 3142
self.'optimizearg'()
.annotate 'line', 3143
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3144
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3145
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3146
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3147
# {
unless $I2 goto __label_1
.annotate 'line', 3149
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3151
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3154
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3155
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3156
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3157
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3158
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3159
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3160
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3161
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3164
.return(self)
# }
.annotate 'line', 3165

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3166
# Body
# {
.annotate 'line', 3168
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3169

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3170
# Body
# {
.annotate 'line', 3172
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3173

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3174
# Body
# {
.annotate 'line', 3176
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3177

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3178
# Body
# {
.annotate 'line', 3180
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3181

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3133
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

.annotate 'line', 3189
# Body
# {
.annotate 'line', 3191
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3192
setattribute self, 'positive', $P1
# }
.annotate 'line', 3193

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3194
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3195
# Body
# {
.annotate 'line', 3197
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3198
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
.annotate 'line', 3199

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3200
# Body
# {
.annotate 'line', 3202
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3203
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3204
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3205

.end # emitop


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


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3210
# Body
# {
.annotate 'line', 3212
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3213
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3214
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3215

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3216
# Body
# {
.annotate 'line', 3218
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3219
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3220
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3221

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3186
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3188
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3228
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3229
# Body
# {
.annotate 'line', 3231
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3232

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3236

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3237
# Body
# {
.annotate 'line', 3239
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3240

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3241
# Body
# {
.annotate 'line', 3243
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3244

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3226
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3251
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3252
# Body
# {
.annotate 'line', 3254
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3255

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3256
# Body
# {
.annotate 'line', 3258
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3259

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3260
# Body
# {
.annotate 'line', 3262
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3263

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3264
# Body
# {
.annotate 'line', 3266
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3267

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3249
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3274
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3275
# Body
# {
.annotate 'line', 3277
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3278

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3279
# Body
# {
.annotate 'line', 3281
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3282

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3283
# Body
# {
.annotate 'line', 3285
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3286

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3287
# Body
# {
.annotate 'line', 3289
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3290

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3272
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3297
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3298
# Body
# {
.annotate 'line', 3300
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3301

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3302
# Body
# {
.annotate 'line', 3304
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3305

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3306
# Body
# {
.annotate 'line', 3308
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3309

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3310
# Body
# {
.annotate 'line', 3312
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3313

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3295
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3320
# Body
# {
.annotate 'line', 3322
.return('I')
# }
.annotate 'line', 3323

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3318
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3330
# Body
# {
.annotate 'line', 3332
self.'optimizearg'()
.annotate 'line', 3333
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3334
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3335
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3336
eq $I1, 0, __label_1
.annotate 'line', 3337
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3339
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3341
.return(self)
# }
.annotate 'line', 3342

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3343
# Body
# {
.annotate 'line', 3345
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
.annotate 'line', 3346
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3347
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3348
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3349
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3350
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3351
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3354
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3355
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3356
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3357
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3358
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3360

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3328
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3367
# Body
# {
.annotate 'line', 3369
self.'optimizearg'()
.annotate 'line', 3370
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3371
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3372
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3373
ne $I1, 0, __label_1
.annotate 'line', 3374
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3376
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3378
.return(self)
# }
.annotate 'line', 3379

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3380
# Body
# {
.annotate 'line', 3382
# string res: $S1
null $S1
.annotate 'line', 3383
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3386
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3387
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3388
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3389
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3390
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3391
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3392
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3395
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3396
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3397
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3398
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3399
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3401

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3365
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3408
# Body
# {
.annotate 'line', 3410
.return('I')
# }
.annotate 'line', 3411

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3406
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3418
# Body
# {
.annotate 'line', 3420
self.'optimizearg'()
.annotate 'line', 3421
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3422
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3423
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3424
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3425
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3426
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3428
.return(self)
# }
.annotate 'line', 3429

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3430
# Body
# {
.annotate 'line', 3432
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
.annotate 'line', 3433
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3434
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3435
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3436
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3437
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3438

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3416
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3445
# Body
# {
.annotate 'line', 3447
self.'optimizearg'()
.annotate 'line', 3448
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3449
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3450
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3451
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3452
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3453
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3455
.return(self)
# }
.annotate 'line', 3456

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3457
# Body
# {
.annotate 'line', 3459
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
.annotate 'line', 3460
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3461
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3462
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3463
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3464
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3465

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3443
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3473
# Body
# {
.annotate 'line', 3475
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3476
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3477
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3478
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3479
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3481
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3483
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3484
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3485
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3488
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3489

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3490
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3491
# Body
# {
.annotate 'line', 3493
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3494
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3495
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3496
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3497
ge $I2, $I1, __label_1
.annotate 'line', 3498
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3497
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3499
.return($P2)
# }
.annotate 'line', 3500

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3501
# Body
# {
.annotate 'line', 3503
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3504
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3505
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3506
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3507
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3508
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3509
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3508
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3510
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3511

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3512
# Body
# {
.annotate 'line', 3514
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3515
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3516
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3517
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3518
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3519
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3520
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3519
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3521
.return($S1)
# }
.annotate 'line', 3522

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3523
# Body
# {
.annotate 'line', 3525
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3526
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3527
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3528
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3529
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3528
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3530

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3531
# Body
# {
.annotate 'line', 3533
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3534
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3535
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3536
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3537
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3538
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3537
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3539

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3470
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3472
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3546
# Body
# {
.annotate 'line', 3548
self.'optimizearg'()
.annotate 'line', 3549
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3550
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3551
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3552
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3553
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3554
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3555
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3556
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3557
# var t: $P5
null $P5
.annotate 'line', 3558
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3559
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3560
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3561
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3563
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3564
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3566
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3567
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3568
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3569
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3570
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3571
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3574
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3575
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3576
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3577
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3578
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3579
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3583
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3584
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3586
.return(self)
# }
.annotate 'line', 3587

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3588
# Body
# {
.annotate 'line', 3590
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3591
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3592
ne $S1, $S2, __label_2
.annotate 'line', 3593
.return($S1)
__label_2: # endif
.annotate 'line', 3594
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3595
.return('S')
__label_3: # endif
.annotate 'line', 3596
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3597
.return('S')
__label_5: # endif
.annotate 'line', 3598
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3599
.return('N')
__label_7: # endif
.annotate 'line', 3600
.return('I')
# }
.annotate 'line', 3601

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3602
# Body
# {
.annotate 'line', 3604
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3605
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3606
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3607
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3608
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3610
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3611
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3612
ne $S1, 'S', __label_5
# {
.annotate 'line', 3613
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3614
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3615
eq $S2, 'S', __label_10
# {
.annotate 'line', 3616
__ARG_1.'emitset'($S6, $S4)
set $S4, $S6
.annotate 'line', 3617
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3620
__ARG_1.'emitset'($S6, $S5)
set $S5, $S6
.annotate 'line', 3621
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3624
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3627
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3628
# string l: $S7
null $S7
.annotate 'line', 3629
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3631
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3632
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3634
# string r: $S8
null $S8
.annotate 'line', 3635
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3637
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3638
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3640
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3643
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3645

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3544
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3652
# Body
# {
.annotate 'line', 3654
self.'optimizearg'()
.annotate 'line', 3655
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3656
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3657
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3658
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3659
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3660
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3661
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3662
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3663
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3664
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3665
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3668
.return(self)
# }
.annotate 'line', 3669

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3670
# Body
# {
.annotate 'line', 3672
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3673
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3674
ne $S1, $S2, __label_2
.annotate 'line', 3675
.return($S1)
__label_2: # endif
.annotate 'line', 3676
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3677
.return('N')
__label_3: # endif
.annotate 'line', 3678
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3679
.return('N')
__label_5: # endif
.annotate 'line', 3680
.return('I')
# }
.annotate 'line', 3681

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3682
# Body
# {
.annotate 'line', 3684
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3685
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3686
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3687

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3650
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3694
# Body
# {
.annotate 'line', 3696
self.'optimizearg'()
.annotate 'line', 3697
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3698
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3699
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3700
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3701
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3702
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3703
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3704
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3705
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3706
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3707
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3710
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3711
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3712
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3713
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3714
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3715
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3719
.return(self)
# }
.annotate 'line', 3720

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3721
# Body
# {
.annotate 'line', 3723
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3724
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3725
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3726
ne $S1, $S2, __label_2
.annotate 'line', 3727
.return($S1)
__label_2: # endif
.annotate 'line', 3728
ne $S1, 'S', __label_3
.annotate 'line', 3729
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3731
.return('N')
__label_4: # endif
# }
.annotate 'line', 3732

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3733
# Body
# {
.annotate 'line', 3735
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3736
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3737
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3738
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3739
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3740
ne $S1, 'S', __label_2
# {
.annotate 'line', 3741
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3742
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3743
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3744
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3749
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3750
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3752
self.'annotate'(__ARG_1)
.annotate 'line', 3753
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3754
.return()
# }
__label_2: # endif
.annotate 'line', 3756
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
.annotate 'line', 3757
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3758
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3759
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3760
.return()
# }
__label_6: # endif
.annotate 'line', 3765
ne $S1, 'N', __label_10
# {
.annotate 'line', 3766
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3767
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3768
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3769
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3771
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3772
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3779
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3780
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3782
self.'annotate'(__ARG_1)
.annotate 'line', 3783
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3784
.return()
# }
__label_10: # endif
.annotate 'line', 3787
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3788
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3789
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3790
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3793
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3794
# }
__label_16: # endif
.annotate 'line', 3796
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3797
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3798
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3801
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3803
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3804
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3808
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3810
# }
__label_19: # endif
.annotate 'line', 3813
self.'annotate'(__ARG_1)
.annotate 'line', 3814
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3815

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3692
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3822
# Body
# {
.annotate 'line', 3824
self.'optimizearg'()
.annotate 'line', 3825
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3826
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3827
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3828
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3829
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3830
# var lval: $P3
null $P3
.annotate 'line', 3831
# var rval: $P4
null $P4
.annotate 'line', 3832
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3833
getattribute $P3, $P1, 'numval'
.annotate 'line', 3834
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3835
getattribute $P4, $P2, 'numval'
.annotate 'line', 3836
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3837
eq $I2, 0, __label_6
.annotate 'line', 3838
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
.annotate 'line', 3841
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3842
getattribute $P3, $P1, 'numval'
.annotate 'line', 3843
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3844
getattribute $P4, $P2, 'numval'
.annotate 'line', 3845
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3846
eq $N2, $N3, __label_8
.annotate 'line', 3847
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
.annotate 'line', 3851
.return(self)
# }
.annotate 'line', 3852

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3853
# Body
# {
.annotate 'line', 3855
.return('N')
# }
.annotate 'line', 3856

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3857
# Body
# {
.annotate 'line', 3859
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3860
# var lreg: $P2
null $P2
.annotate 'line', 3861
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 3862
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3864
$P2 = self.'tempreg'('N')
.annotate 'line', 3865
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3867
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3868
# var rreg: $P4
null $P4
.annotate 'line', 3869
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 3870
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3872
$P4 = self.'tempreg'('N')
.annotate 'line', 3873
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3875
self.'annotate'(__ARG_1)
.annotate 'line', 3876
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3877

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3820
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3884
# Body
# {
.annotate 'line', 3886
.return('I')
# }
.annotate 'line', 3887

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3888
# Body
# {
.annotate 'line', 3890
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3891
# var lreg: $P2
null $P2
.annotate 'line', 3892
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3893
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3895
$P2 = self.'tempreg'('I')
.annotate 'line', 3896
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3898
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3899
# var rreg: $P4
null $P4
.annotate 'line', 3900
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3901
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3903
$P4 = self.'tempreg'('I')
.annotate 'line', 3904
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3906
self.'annotate'(__ARG_1)
.annotate 'line', 3907
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3908

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3882
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3915
# Body
# {
.annotate 'line', 3917
.return('I')
# }
.annotate 'line', 3918

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3919
# Body
# {
.annotate 'line', 3921
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3922
# var lreg: $P2
null $P2
.annotate 'line', 3923
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3924
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3926
$P2 = self.'tempreg'('I')
.annotate 'line', 3927
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3929
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3930
# var rreg: $P4
null $P4
.annotate 'line', 3931
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3932
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3934
$P4 = self.'tempreg'('I')
.annotate 'line', 3935
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3937
self.'annotate'(__ARG_1)
.annotate 'line', 3942
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3943

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3913
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3952
# Body
# {
.annotate 'line', 3954
setattribute self, 'arg', __ARG_1
.annotate 'line', 3955
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3956

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3957
# Body
# {
.annotate 'line', 3959
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3960
.return(self)
# }
.annotate 'line', 3961

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3962
# Body
# {
.annotate 'line', 3964
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3965

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3950
addattribute $P0, 'arg'
.annotate 'line', 3951
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3968
# Body
# {
.annotate 'line', 3970
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3971
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3972
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3973
.return(1)
# }
.annotate 'line', 3974

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3983
# Body
# {
.annotate 'line', 3985
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3986
setattribute self, 'predef', __ARG_3
.annotate 'line', 3987
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3988

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 3989
# Body
# {
.annotate 'line', 3991
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3992

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3993
# Body
# {
.annotate 'line', 3995
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3996
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3997
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3998
# var arg: $P4
null $P4
.annotate 'line', 3999
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 4000
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4002
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4003
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4004
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4008
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4009
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4010
getattribute $P10, $P4, 'arg'
$P5.'push'($P10)
goto __label_7
__label_8: # endfor
.annotate 'line', 4011
getattribute $P11, self, 'predef'
getattribute $P12, self, 'start'
$P11.'expand'(__ARG_1, self, $P12, __ARG_2, $P5)
.annotate 'line', 4012
.return()
__label_1: # default
.annotate 'line', 4014
# int n: $I2
getattribute $P13, self, 'args'
set $I2, $P13
# for loop
.annotate 'line', 4015
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4016
$P14 = $P2[$I3]
getattribute $P4, $P14, 'arg'
.annotate 'line', 4017
# string argtype: $S2
$P10 = $P4.'checkresult'()
null $S2
if_null $P10, __label_12
set $S2, $P10
__label_12:
.annotate 'line', 4018
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 4019
# string argr: $S4
null $S4
.annotate 'line', 4020
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4021
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 4023
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 4024
ne $S3, 'P', __label_17
# {
.annotate 'line', 4025
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 4026
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
.annotate 'line', 4031
eq $S5, '', __label_23
.annotate 'line', 4032
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4034
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4036
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 4015
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4039
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4040

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3978
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3980
addattribute $P0, 'predef'
.annotate 'line', 3981
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4050
# Body
# {
.annotate 'line', 4052
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4053
setattribute self, 'funref', __ARG_4
.annotate 'line', 4054
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4055
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4056
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4057
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4058
# {
.annotate 'line', 4059
# var modifier: $P2
null $P2
.annotate 'line', 4060
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4061
$P1 = __ARG_1.'get'()
.annotate 'line', 4062
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4063
$P1 = __ARG_1.'get'()
.annotate 'line', 4064
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4065
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4066
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4069
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4072
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4073
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4074
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4075
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4077

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4078
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4079
# Body
# {
.annotate 'line', 4081
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4082
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4083
'optimize_array'($P1)
.annotate 'line', 4086
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4087
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4088
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4089
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4090
if_null $P3, __label_2
# {
.annotate 'line', 4091
self.'use_predef'($S1)
.annotate 'line', 4094
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4095
if_null $P4, __label_3
# {
.annotate 'line', 4096
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4097
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4100
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
.annotate 'line', 4104
.return(self)
# }
.annotate 'line', 4105

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4106
# Body
# {
.annotate 'line', 4108
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4109
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4110
# string call: $S1
null $S1
.annotate 'line', 4111
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4112
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4113
ne $S1, '', __label_2
# {
.annotate 'line', 4114
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4115
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
unless $I1 goto __label_5
.annotate 'line', 4119
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4121
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4122
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4123
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4124
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4125
# string reg: $S3
null $S3
.annotate 'line', 4126
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4127
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4128
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4131
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4132
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4134
self.'annotate'(__ARG_1)
.annotate 'line', 4136
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
set $S9, __ARG_2
.annotate 'line', 4137
ne $S9, '.tailcall', __label_12
.annotate 'line', 4138
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4140
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
unless $I1 goto __label_14
.annotate 'line', 4144
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4146
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4148
__ARG_1.'print'('(')
.annotate 'line', 4150
# string sep: $S4
set $S4, ''
.annotate 'line', 4151
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4152
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4153
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4154
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4155
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4156
# string setname: $S6
set $S6, ''
.annotate 'line', 4157
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4158
if_null $P6, __label_19
# {
.annotate 'line', 4159
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4160
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4161
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4163
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4165
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
.annotate 'line', 4169
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4170
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4171
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4172
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4175
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
.annotate 'line', 4180
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4181
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
unless $I4 goto __label_32
.annotate 'line', 4183
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
unless $I5 goto __label_34
.annotate 'line', 4184
# {
.annotate 'line', 4185
__ARG_1.'print'(' :named')
.annotate 'line', 4186
eq $S6, '', __label_35
.annotate 'line', 4187
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4189
# }
__label_16: # for iteration
.annotate 'line', 4152
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4191
__ARG_1.'say'(')')
# }
.annotate 'line', 4192

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4045
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4047
addattribute $P0, 'funref'
.annotate 'line', 4048
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4202
# Body
# {
.annotate 'line', 4204
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4205
setattribute self, 'left', __ARG_4
.annotate 'line', 4206
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4207

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4208
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4209
# Body
# {
.annotate 'line', 4211
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4212
.return(self)
# }
.annotate 'line', 4213

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4214
# Body
# {
.annotate 'line', 4216
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4217

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4218
# Body
# {
.annotate 'line', 4220
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4221
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4222
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4223
eq $S1, 'P', __label_2
# {
.annotate 'line', 4224
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4225
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4226
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4228
.return($S2)
# }
.annotate 'line', 4229

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4230
# Body
# {
.annotate 'line', 4232
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4233
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4234
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4235
self.'annotate'(__ARG_1)
.annotate 'line', 4236
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4237
.return($S3)
# }
.annotate 'line', 4238

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4239
# Body
# {
.annotate 'line', 4241
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4242
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4243
self.'annotate'(__ARG_1)
.annotate 'line', 4244
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4245

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4246
# Body
# {
.annotate 'line', 4248
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4249

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4250
# Body
# {
.annotate 'line', 4252
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4253
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4254
# string value: $S3
null $S3
.annotate 'line', 4255
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4257
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4258
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4259
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4261
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4264
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4265
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4267
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4268

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4269
# Body
# {
.annotate 'line', 4271
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4272
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4273
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4274
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4275
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4277
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4278
$P4 = __ARG_2.'checkresult'()
set $S5, $P4
eq $S5, 'P', __label_6
.annotate 'line', 4279
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4281
# }
__label_4: # endif
.annotate 'line', 4283
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4284
.return($S3)
# }
.annotate 'line', 4285

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4197
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4199
addattribute $P0, 'left'
.annotate 'line', 4200
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4294
# Body
# {
.annotate 'line', 4296
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4297
setattribute self, 'left', __ARG_4
.annotate 'line', 4298
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4299

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4300
# Body
# {
.annotate 'line', 4302
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4303
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4305
.return('P')
__label_1: # endif
# }
.annotate 'line', 4306

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4307
# Body
# {
.annotate 'line', 4309
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4310
self.'optimizeargs'()
.annotate 'line', 4311
.return(self)
# }
.annotate 'line', 4312

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4313
# Body
# {
.annotate 'line', 4315
# var regleft: $P1
null $P1
.annotate 'line', 4316
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4317
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4319
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4320
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4321
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4322
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4323
ne $S1, 'S', __label_3
# {
.annotate 'line', 4324
eq $I1, 1, __label_5
.annotate 'line', 4325
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4326
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4329
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4330
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4331
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4333

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4334
# Body
# {
.annotate 'line', 4336
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4337
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4338
self.'annotate'(__ARG_1)
.annotate 'line', 4339
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4340
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4341
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4342

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4343
# Body
# {
.annotate 'line', 4345
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4346
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4347
# string rreg: $S1
null $S1
.annotate 'line', 4348
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4349
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4350
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4353
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4354
self.'annotate'(__ARG_1)
.annotate 'line', 4355
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4356
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4357
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4358
.return($S1)
# }
.annotate 'line', 4359

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4290
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4292
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4368
# Body
# {
.annotate 'line', 4370
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4371
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4372
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4373
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4374
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4375
# {
.annotate 'line', 4376
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4377
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4378
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4379
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4380
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4382

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4383
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4384
# Body
# {
.annotate 'line', 4386
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4387
.return(self)
# }
.annotate 'line', 4388

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4389
# Body
# {
set $S2, __ARG_2
.annotate 'line', 4391
eq $S2, '', __label_0
# {
.annotate 'line', 4392
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4393
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4399
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4401

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4402
# Body
# {
.annotate 'line', 4404
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4405
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4406
.return($S1)
# }
.annotate 'line', 4407

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4408
# Body
# {
.annotate 'line', 4410
self.'annotate'(__ARG_1)
.annotate 'line', 4411
# string itemreg: $S1
null $S1
.annotate 'line', 4412
# string it_p: $S2
null $S2
.annotate 'line', 4413
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4414
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4415
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4417
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4418
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
set $S5, $S3
set $S6, 'I'
.annotate 'line', 4419
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
.annotate 'line', 4421
# string aux: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 4422
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4423
__ARG_1.'emitbox'($S2, $S4)
set $S1, $S2
.annotate 'line', 4424
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4428
$P5 = $P1.'isnull'()
if_null $P5, __label_11
unless $P5 goto __label_11
# {
.annotate 'line', 4429
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4430
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4431
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4435
$P5 = $P1.'emit_get'(__ARG_1)
set $S1, $P5
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4437
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4438
self.'annotate'(__ARG_1)
.annotate 'line', 4439
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4442

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4364
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4366
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4452
# Body
# {
.annotate 'line', 4454
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4455
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4456
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4457
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4458
$P7 = $P1.'isop'('}')
isfalse $I1, $P7
unless $I1 goto __label_0
# {
.annotate 'line', 4459
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4460
# {
.annotate 'line', 4461
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4462
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4463
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4464
$P2.'push'($P4)
.annotate 'line', 4465
$P3.'push'($P5)
# }
.annotate 'line', 4467
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'(',')
if_null $P7, __label_2
if $P7 goto __label_1
__label_2: # enddo
.annotate 'line', 4468
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_4
.annotate 'line', 4469
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4471
setattribute self, 'keys', $P2
.annotate 'line', 4472
setattribute self, 'values', $P3
# }
.annotate 'line', 4473

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4474
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4475
# Body
# {
.annotate 'line', 4477
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4478
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4479
.return(self)
# }
.annotate 'line', 4480

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4481
# Body
# {
.annotate 'line', 4483
self.'annotate'(__ARG_1)
set $S6, __ARG_2
.annotate 'line', 4488
eq $S6, '', __label_0
.annotate 'line', 4489
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4491
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4492
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4493
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4494
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4495
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4496
# string item: $S1
null $S1
.annotate 'line', 4497
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4498
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4499
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4500
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4503
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_5: # endif
.annotate 'line', 4505
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4506
# string itemreg: $S3
null $S3
.annotate 'line', 4507
$P7 = $P4.'isnull'()
if_null $P7, __label_7
unless $P7 goto __label_7
# {
set $S6, __ARG_2
.annotate 'line', 4508
eq $S6, '', __label_9
# {
.annotate 'line', 4509
$P8 = self.'tempreg'('P')
set $S3, $P8
.annotate 'line', 4510
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4513
$P8 = $P4.'isidentifier'()
if_null $P8, __label_10
unless $P8 goto __label_10
# {
.annotate 'line', 4514
# string s: $S4
$P9 = $P4.'checkIdentifier'()
null $S4
if_null $P9, __label_12
set $S4, $P9
__label_12:
.annotate 'line', 4515
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
set $S3, $S4
goto __label_14
__label_13: # else
.annotate 'line', 4516
# {
.annotate 'line', 4518
# string id: $S5
$P9 = $P4.'getName'()
null $S5
if_null $P9, __label_16
set $S5, $P9
__label_16:
.annotate 'line', 4519
getattribute $P11, self, 'owner'
$P10 = $P11.'getvar'($S5)
unless_null $P10, __label_17
# {
.annotate 'line', 4520
$P12 = self.'tempreg'('P')
set $S3, $P12
.annotate 'line', 4521
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4524
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4528
$P11 = $P4.'emit_get'(__ARG_1)
set $S3, $P11
__label_11: # endif
__label_8: # endif
set $S7, __ARG_2
.annotate 'line', 4529
eq $S7, '', __label_19
.annotate 'line', 4530
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 4494
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 4532

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4533
# Body
# {
.annotate 'line', 4535
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4536
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4537
.return($S1)
# }
.annotate 'line', 4538

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4447
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4449
addattribute $P0, 'keys'
.annotate 'line', 4450
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4547
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4548
# Body
# {
.annotate 'line', 4552
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4553
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4554
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4555
__ARG_1.'unget'($P2)
.annotate 'line', 4556
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4557
# {
.annotate 'line', 4558
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4559
$P3.'push'($P4)
# }
.annotate 'line', 4560
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4561
setattribute self, 'initializer', $P3
.annotate 'line', 4562
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4564

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4543
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4545
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4573
# Body
# {
.annotate 'line', 4575
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4577
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4578
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4579
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4580
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4581
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4582
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4583
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4584
# {
.annotate 'line', 4585
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4586
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4587
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4588
$P2.'push'($P3)
# }
.annotate 'line', 4589
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4590
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4593
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4596
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4598
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4599
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4601
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4602

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4603
# Body
# {
.annotate 'line', 4605
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4606
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4609
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4610
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4611
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4612
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4613
$P1 = $P3['value']
.annotate 'line', 4614
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4615
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4616
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4619
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4623
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4624
if_null $P4, __label_7
.annotate 'line', 4625
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4626
.return(self)
# }
.annotate 'line', 4627

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4628
# Body
# {
.annotate 'line', 4630
self.'annotate'(__ARG_1)
.annotate 'line', 4632
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4633
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
.annotate 'line', 4636
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4637
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4638
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
.annotate 'line', 4640
# string reginit: $S1
set $S1, ''
.annotate 'line', 4641
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4642
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4643
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4647
ne $I2, 1, __label_13
# {
.annotate 'line', 4648
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4649
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4652
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4653
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4654
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4658
isne $I4, $I2, 1
unless $I4 goto __label_17
isne $I4, $I2, 2
__label_17:
unless $I4 goto __label_16
.annotate 'line', 4659
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_16: # endif
.annotate 'line', 4660
not $I5, __ARG_3
unless $I5 goto __label_18
.annotate 'line', 4661
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_18: # endif
__label_9: # switch end
set $I6, $I2
null $I7
.annotate 'line', 4664
if $I6 == $I7 goto __label_21
set $I7, 2
if $I6 == $I7 goto __label_22
set $I7, 1
if $I6 == $I7 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 4667
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_24
set $S4, $P14
__label_24:
.annotate 'line', 4668
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4669
unless_null $P3, __label_25
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4670
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_25: # endif
.annotate 'line', 4674
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4675
le $I1, 1, __label_26
# {
.annotate 'line', 4676
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_26: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 4680
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4681
# predefined elements
elements $I7, $P4
sub $I6, $I7, 1
$S3 = $P4[$I6]
.annotate 'line', 4682
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 4685
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4686
unless_null $P5, __label_27
# {
.annotate 'line', 4688
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4689
if_null $P6, __label_29
# {
.annotate 'line', 4690
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_30
__label_29: # else
# {
.annotate 'line', 4693
'Warn'('Checking: new unknown type')
.annotate 'line', 4694
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_30: # endif
.annotate 'line', 4696
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_28
__label_27: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4700
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_28: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 4704
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 4706
isgt $I8, $I1, 1
if $I8 goto __label_32
isgt $I8, $I1, 0
unless $I8 goto __label_33
iseq $I8, $I2, 1
__label_33:
__label_32:
unless $I8 goto __label_31
# {
.annotate 'line', 4707
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4708
iter $P21, $P1
set $P21, 0
__label_34: # for iteration
unless $P21 goto __label_35
shift $P8, $P21
# {
.annotate 'line', 4709
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_36
set $S5, $P22
__label_36:
.annotate 'line', 4710
$P7.'push'($S5)
# }
goto __label_34
__label_35: # endfor
.annotate 'line', 4712
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4713
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4714
__ARG_1.'say'(")")
.annotate 'line', 4715
not $I8, __ARG_3
unless $I8 goto __label_37
.annotate 'line', 4716
__ARG_1.'emitset'(__ARG_2, $S2)
__label_37: # endif
# }
__label_31: # endif
# }
.annotate 'line', 4718

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4719
# Body
# {
.annotate 'line', 4721
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4722

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4569
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4571
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4731
# Body
# {
.annotate 'line', 4733
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4734
setattribute self, 'owner', __ARG_2
.annotate 'line', 4735
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4736
setattribute self, 'nskey', $P1
.annotate 'line', 4737
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4738
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4739
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4741
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4742

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4743
# Body
# {
.annotate 'line', 4745
# string reginit: $S1
null $S1
.annotate 'line', 4746
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4747
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
.annotate 'line', 4748
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4752
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4753
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4756
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4758
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4759
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4760
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4761
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4762
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4763
if_null $S1, __label_7
.annotate 'line', 4764
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4765
__ARG_1.'say'()
# }
.annotate 'line', 4766

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4727
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4729
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4775
# Body
# {
.annotate 'line', 4777
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4778
setattribute self, 'owner', __ARG_2
.annotate 'line', 4779
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4780
setattribute self, 'nskey', $P1
.annotate 'line', 4781
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4782
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4783
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4785
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4786

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4787
# Body
# {
.annotate 'line', 4789
# string reginit: $S1
null $S1
.annotate 'line', 4790
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4792
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4793
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4794
le $I1, 0, __label_3
.annotate 'line', 4795
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4796
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4797
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4798
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4799
__ARG_1.'say'()
.annotate 'line', 4801
le $I1, 0, __label_4
# {
.annotate 'line', 4802
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4803
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4804
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4805
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4807
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4808
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4809
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4810
__ARG_1.'say'(")")
.annotate 'line', 4811
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4813

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4771
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4773
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4818
# Body
# {
.annotate 'line', 4820
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4822
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4824
new $P5, [ 'CallExpr' ]
.annotate 'line', 4825
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4824
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4827
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4829
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4831
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4834
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4835
__ARG_1.'unget'($P2)
.annotate 'line', 4836
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4838
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4842
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
.annotate 'line', 4847
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4849

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4858
# Body
# {
.annotate 'line', 4860
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4861
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4862
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4863

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4864
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4865
# Body
# {
.annotate 'line', 4867
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4868
# string checkedval: $S1
null $S1
.annotate 'line', 4869
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4870
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4871
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4875
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4876
self.'annotate'(__ARG_1)
.annotate 'line', 4877
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4878

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4853
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4855
addattribute $P0, 'lexpr'
.annotate 'line', 4856
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4893
# Body
# {
.annotate 'line', 4895
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4896
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4897
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4898
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4899
.return(self)
# }
.annotate 'line', 4900

.end # set


.sub 'optimize' :method

.annotate 'line', 4901
# Body
# {
.annotate 'line', 4903
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4904
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
.annotate 'line', 4906
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4908
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4910
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4911
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4912
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4914

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4915
# Body
# {
.annotate 'line', 4917
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 4918

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4919
# Body
# {
.annotate 'line', 4921
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4922
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4923
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4924
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4925
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4926
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4927
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4928
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4929

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4883
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4889
addattribute $P0, 'condition'
.annotate 'line', 4890
addattribute $P0, 'etrue'
.annotate 'line', 4891
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

.annotate 'line', 4966
# Body
# {
.annotate 'line', 4968
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
.annotate 'line', 4969
.return(1)
__label_3: # case
.annotate 'line', 4970
.return(2)
__label_4: # case
.annotate 'line', 4971
.return(3)
__label_1: # default
.annotate 'line', 4972
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4974

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4976
# Body
# {
.annotate 'line', 4978
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
.annotate 'line', 4979
.return(8)
__label_3: # case
.annotate 'line', 4980
.return(11)
__label_4: # case
.annotate 'line', 4981
.return(9)
__label_5: # case
.annotate 'line', 4982
.return(10)
__label_1: # default
.annotate 'line', 4983
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4985

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4987
# Body
# {
.annotate 'line', 4989
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
.annotate 'line', 4990
.return(19)
__label_3: # case
.annotate 'line', 4991
.return(20)
__label_4: # case
.annotate 'line', 4992
.return(21)
__label_5: # case
.annotate 'line', 4993
.return(22)
__label_1: # default
.annotate 'line', 4994
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4996

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4998
# Body
# {
.annotate 'line', 5000
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
.annotate 'line', 5001
.return(12)
__label_3: # case
.annotate 'line', 5002
.return(13)
__label_4: # case
.annotate 'line', 5003
.return(25)
__label_5: # case
.annotate 'line', 5004
.return(26)
__label_1: # default
.annotate 'line', 5006
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5007
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5009

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5011
# Body
# {
.annotate 'line', 5013
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
.annotate 'line', 5014
.return(14)
__label_3: # case
.annotate 'line', 5015
.return(16)
__label_4: # case
.annotate 'line', 5016
.return(15)
__label_5: # case
.annotate 'line', 5017
.return(17)
__label_1: # default
.annotate 'line', 5018
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5020

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5022
# Body
# {
.annotate 'line', 5024
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
.annotate 'line', 5025
.return(4)
__label_3: # case
.annotate 'line', 5026
.return(5)
__label_4: # case
.annotate 'line', 5027
.return(6)
__label_5: # case
.annotate 'line', 5028
.return(18)
__label_6: # case
.annotate 'line', 5029
.return(23)
__label_7: # case
.annotate 'line', 5030
.return(24)
__label_1: # default
.annotate 'line', 5031
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5033

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5035
# Body
# {
.annotate 'line', 5037
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5039
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5040
# var expr: $P2
null $P2
.annotate 'line', 5041
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5042
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5043
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5044
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5046
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5047
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5048
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 5049
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 5050
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 5051
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5052
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 5053
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 5054
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 5055
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 5056
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 5057
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 5058
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 5059
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 5060
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 5061
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 5062
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5063

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5065
# Body
# {
.annotate 'line', 5067
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5068
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5070
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5071
# var t: $P2
null $P2
.annotate 'line', 5072
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5073
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 5074
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5076
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5079
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5082
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5085
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5088
__ARG_1.'unget'($P2)
.annotate 'line', 5089
.return($P1)
# }
.annotate 'line', 5090

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5092
# Body
# {
.annotate 'line', 5094
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5096
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5097
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5098
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5099
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5100
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5101
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5104
__ARG_1.'unget'($P2)
.annotate 'line', 5105
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5107

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5109
# Body
# {
.annotate 'line', 5111
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5112
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5113
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5115
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5116
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5117
# var subexpr: $P2
null $P2
.annotate 'line', 5118
eq $I1, 0, __label_0
# {
.annotate 'line', 5119
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5120
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5121
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
.annotate 'line', 5123
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5126
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5129
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5132
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5135
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5137
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5140
__ARG_1.'unget'($P1)
.annotate 'line', 5141
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5143
.return($P2)
# }
.annotate 'line', 5144

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5146
# Body
# {
.annotate 'line', 5148
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5149
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5151
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5152
# var t: $P2
null $P2
.annotate 'line', 5153
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5154
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5155
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5156
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5157
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
.annotate 'line', 5159
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5162
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5165
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5168
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5171
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5173
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5174
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5176
__ARG_1.'unget'($P2)
.annotate 'line', 5177
.return($P1)
# }
.annotate 'line', 5178

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5180
# Body
# {
.annotate 'line', 5182
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5184
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5185
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5186
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5187
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5188
# var expr: $P4
null $P4
.annotate 'line', 5189
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5190
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5192
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5193
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5195
__ARG_1.'unget'($P2)
.annotate 'line', 5196
.return($P1)
# }
.annotate 'line', 5197

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5199
# Body
# {
.annotate 'line', 5201
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5202
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5204
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5205
# var rexpr: $P2
null $P2
.annotate 'line', 5206
# var t: $P3
null $P3
.annotate 'line', 5207
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5208
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5209
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
.annotate 'line', 5211
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5212
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5215
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5216
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5219
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5220
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5223
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5224
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5227
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5230
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5233
__ARG_1.'unget'($P3)
.annotate 'line', 5234
.return($P1)
# }
.annotate 'line', 5235

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5237
# Body
# {
.annotate 'line', 5239
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5240
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5242
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5243
# var t: $P2
null $P2
.annotate 'line', 5244
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5245
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5246
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5247
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
.annotate 'line', 5249
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5252
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5255
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5258
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5261
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5264
__ARG_1.'unget'($P2)
.annotate 'line', 5265
.return($P1)
# }
.annotate 'line', 5266

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5268
# Body
# {
.annotate 'line', 5270
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5272
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5273
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5274
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5275
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5276
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5278
__ARG_1.'unget'($P2)
.annotate 'line', 5279
.return($P1)
# }
.annotate 'line', 5280

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5282
# Body
# {
.annotate 'line', 5284
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5286
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5287
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5288
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5289
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5290
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5292
__ARG_1.'unget'($P2)
.annotate 'line', 5293
.return($P1)
# }
.annotate 'line', 5294

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5296
# Body
# {
.annotate 'line', 5298
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5300
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5301
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5302
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5303
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5304
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5306
__ARG_1.'unget'($P2)
.annotate 'line', 5307
.return($P1)
# }
.annotate 'line', 5308

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5310
# Body
# {
.annotate 'line', 5312
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5314
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5315
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5316
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5317
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5318
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5320
__ARG_1.'unget'($P2)
.annotate 'line', 5321
.return($P1)
# }
.annotate 'line', 5322

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5324
# Body
# {
.annotate 'line', 5326
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5327
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5329
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5330
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5331
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5332
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5333
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5334
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5335
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5338
__ARG_1.'unget'($P2)
.annotate 'line', 5339
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5341

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5343
# Body
# {
.annotate 'line', 5345
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5346
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5347
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5349
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5350
# var t: $P2
null $P2
.annotate 'line', 5351
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5352
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5353
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5354
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5355
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
.annotate 'line', 5357
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5360
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5363
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5366
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5369
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5372
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5375
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5377
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5378
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5380
__ARG_1.'unget'($P2)
.annotate 'line', 5381
.return($P1)
# }
.annotate 'line', 5382

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5384
# Body
# {
.annotate 'line', 5386
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5388
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5389

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5402
# Body
# {
.annotate 'line', 5404
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5405
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5406
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5407
setattribute self, 'brlabel', $P2
.annotate 'line', 5408
.return($S1)
# }
.annotate 'line', 5409

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5410
# Body
# {
.annotate 'line', 5412
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5413
unless_null $P1, __label_0
.annotate 'line', 5414
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5415
.return($P1)
# }
.annotate 'line', 5416

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5400
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5423
# Body
# {
.annotate 'line', 5425
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5426
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5427
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5428
setattribute self, 'cntlabel', $P2
.annotate 'line', 5429
.return($S1)
# }
.annotate 'line', 5430

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5431
# Body
# {
.annotate 'line', 5433
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5434
unless_null $P1, __label_0
.annotate 'line', 5435
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5436
.return($P1)
# }
.annotate 'line', 5437

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5419
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5421
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5451
# Body
# {
.annotate 'line', 5453
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5454
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5455
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5456
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5457
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5458
# {
.annotate 'line', 5459
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5460
$P2.'push'($P3)
# }
.annotate 'line', 5461
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5463
'RequireOp'(';', $P1)
.annotate 'line', 5464
setattribute self, 'values', $P2
# }
.annotate 'line', 5465

.end # parse


.sub 'optimize' :method

.annotate 'line', 5466
# Body
# {
.annotate 'line', 5468
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5469
.return(self)
# }
.annotate 'line', 5470

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5471
# Body
# {
.annotate 'line', 5473
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5474
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5475
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5478
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5479
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5481
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5482
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5483
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5484
self.'annotate'(__ARG_1)
.annotate 'line', 5485
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5489
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5490
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5491
# string reg: $S1
null $S1
.annotate 'line', 5492
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5493
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5494
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5497
$P7 = $P5.'emit_get'(__ARG_1)
set $S1, $P7
__label_9: # endif
.annotate 'line', 5498
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5489
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5500
self.'annotate'(__ARG_1)
.annotate 'line', 5501
self.'emitret'(__ARG_1)
.annotate 'line', 5502
# string sep: $S2
set $S2, ''
.annotate 'line', 5503
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5504
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5505
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5507
__ARG_1.'say'(')')
# }
.annotate 'line', 5508

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5447
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5449
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5513
# Body
# {
.annotate 'line', 5515
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5516

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5517
# Body
# {
.annotate 'line', 5519
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5520

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5511
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5525
# Body
# {
.annotate 'line', 5527
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5528

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5529
# Body
# {
.annotate 'line', 5531
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5532

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5523
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5543
# Body
# {
.annotate 'line', 5545
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5546
setattribute self, 'name', __ARG_1
.annotate 'line', 5547
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5548
setattribute self, 'value', $P2
# }
.annotate 'line', 5549

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5550
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5551
# Body
# {
.annotate 'line', 5553
self.'annotate'(__ARG_1)
.annotate 'line', 5554
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5555
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5556
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5557

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5539
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5541
addattribute $P0, 'name'
.annotate 'line', 5542
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5568
# Body
# {
.annotate 'line', 5570
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5571
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5572
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5573
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5574
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5575
setattribute self, 'label', $P1
.annotate 'line', 5576
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5577

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5578
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5579
# Body
# {
.annotate 'line', 5581
self.'annotate'(__ARG_1)
.annotate 'line', 5582
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5583
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5584
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5585

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5564
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5566
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5594
# Body
# {
.annotate 'line', 5596
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5597

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5598
# Body
# {
.annotate 'line', 5600
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5601
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5602
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5603

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5592
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

.annotate 'line', 5614
# Body
# {
.annotate 'line', 5616
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5617
self.'parsecondition'(__ARG_2)
.annotate 'line', 5618
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5619
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5620
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5621
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5623
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5624
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5626

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5627
# Body
# {
.annotate 'line', 5629
self.'optimize_condition'()
.annotate 'line', 5630
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5631
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5632
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5633
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5635
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5637
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5639
.return(self)
# }
.annotate 'line', 5640

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5641
# Body
# {
.annotate 'line', 5643
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5644
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5645
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5646
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5647
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5648
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5649
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5650
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5651
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5652
self.'annotate'(__ARG_1)
.annotate 'line', 5653
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5654
$P1.'emit'(__ARG_1)
.annotate 'line', 5656
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5657
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5658
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5659
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5661
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5662

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5610
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5612
addattribute $P0, 'truebranch'
.annotate 'line', 5613
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5672
# Body
# {
.annotate 'line', 5674
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5675

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5676
# Body
# {
.annotate 'line', 5678
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5679
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5681
self.'annotate'(__ARG_1)
.annotate 'line', 5682
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5683
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5684
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5685
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5686

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5669
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5671
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5695
# Body
# {
.annotate 'line', 5697
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5698
self.'parsecondition'(__ARG_2)
.annotate 'line', 5699
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5700

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5701
# Body
# {
.annotate 'line', 5703
self.'optimize_condition'()
.annotate 'line', 5704
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5705
.return(self)
# }
.annotate 'line', 5706

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5707
# Body
# {
.annotate 'line', 5709
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5711
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5714
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5717
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5718
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5720
self.'annotate'(__ARG_1)
.annotate 'line', 5721
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5722
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5723
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5724
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5725
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5727

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5693
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

.annotate 'line', 5736
# Body
# {
.annotate 'line', 5738
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5739
self.'parsebody'(__ARG_2)
.annotate 'line', 5740
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5741
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5742

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5743
# Body
# {
.annotate 'line', 5745
self.'optimize_condition'()
.annotate 'line', 5746
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5747
.return(self)
# }
.annotate 'line', 5748

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5749
# Body
# {
.annotate 'line', 5751
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5753
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5756
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5757
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5758
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5760
self.'annotate'(__ARG_1)
.annotate 'line', 5761
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5763
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5764
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5765
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5767

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5734
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

.annotate 'line', 5776
# Body
# {
.annotate 'line', 5778
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5779
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5780

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5781
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5782
# Body
# {
.annotate 'line', 5784
self.'annotate'(__ARG_1)
.annotate 'line', 5785
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5786
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5787

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5774
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5796
# Body
# {
.annotate 'line', 5798
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5799
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5800

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5801
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5802
# Body
# {
.annotate 'line', 5804
self.'annotate'(__ARG_1)
.annotate 'line', 5805
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5806
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5807

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5794
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5821
# Body
# {
.annotate 'line', 5823
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5824
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5825
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5826
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5827
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5828
$P1 = __ARG_2.'get'()
.annotate 'line', 5829
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5830
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5831
$P1 = __ARG_2.'get'()
.annotate 'line', 5832
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5833
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5834
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5835
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5836
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5837
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5838
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5839
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5840
$P1 = __ARG_2.'get'()
.annotate 'line', 5841
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5842
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5843
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 5844
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
.annotate 'line', 5845
__ARG_2.'unget'($P1)
.annotate 'line', 5846
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5848
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5849
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5852
$P1 = __ARG_2.'get'()
.annotate 'line', 5853
$P13 = $P1.'isop'(':')
isfalse $I4, $P13
unless $I4 goto __label_13
.annotate 'line', 5854
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5855
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
.annotate 'line', 5856
__ARG_2.'unget'($P1)
.annotate 'line', 5857
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5859
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5862

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5863
# Body
# {
.annotate 'line', 5865
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5866
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5867
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5868
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5869
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
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
.annotate 'line', 5875
# string type: $S1
set $S1, ''
.annotate 'line', 5876
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5877
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5878
ne $S2, 'N', __label_3
.annotate 'line', 5879
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5880
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5882
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5883
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5886
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5887
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
set $S9, $P11
ne $S9, $S1, __label_8
.annotate 'line', 5888
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5890
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5891
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5895
self.'genbreaklabel'()
.annotate 'line', 5896
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5897
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5898
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5899
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5900
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5901
$P2.'push'($S7)
.annotate 'line', 5902
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5903
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5905
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5908
__ARG_1.'comment'('switch')
.annotate 'line', 5909
self.'annotate'(__ARG_1)
.annotate 'line', 5910
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5911
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5912
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5913
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5914
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5915
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5916
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5917
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5912
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5920
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5921
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5922
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5924
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5925

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5814
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5816
addattribute $P0, 'condition'
.annotate 'line', 5817
addattribute $P0, 'case_value'
.annotate 'line', 5818
addattribute $P0, 'case_st'
.annotate 'line', 5819
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5937
# Body
# {
.annotate 'line', 5939
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5940
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5941
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5942
__ARG_2.'unget'($P1)
.annotate 'line', 5943
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5945
$P1 = __ARG_2.'get'()
.annotate 'line', 5946
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5947
__ARG_2.'unget'($P1)
.annotate 'line', 5948
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5949
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5951
$P1 = __ARG_2.'get'()
.annotate 'line', 5952
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5953
__ARG_2.'unget'($P1)
.annotate 'line', 5954
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5955
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5957
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5958

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5959
# Body
# {
.annotate 'line', 5961
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5962
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5963
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5964
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5965
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5966
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5967
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5968
.return(self)
# }
.annotate 'line', 5969

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5970
# Body
# {
.annotate 'line', 5972
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5973
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5974
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5975
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5976
.return()
# }
__label_0: # endif
.annotate 'line', 5978
__ARG_1.'comment'('for loop')
.annotate 'line', 5979
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5980
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5981
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5982
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5983
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5985
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5986
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5987
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5989
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5990
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5991
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5992
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5993
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5995
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5996

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5932
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5934
addattribute $P0, 'initializer'
.annotate 'line', 5935
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6008
# Body
# {
.annotate 'line', 6010
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6011
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6012
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6013
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6014
eq $S2, '', __label_2
# {
.annotate 'line', 6015
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 6017
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 6019
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6020
setattribute self, 'varname', $P1
.annotate 'line', 6021
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 6022
$P2 = __ARG_2.'get'()
.annotate 'line', 6023
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6024
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 6025
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6026

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6027
# Body
# {
.annotate 'line', 6029
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6030
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6031
.return(self)
# }
.annotate 'line', 6032

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6033
# Body
# {
.annotate 'line', 6035
self.'annotate'(__ARG_1)
.annotate 'line', 6036
# string regcont: $S1
null $S1
.annotate 'line', 6037
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6038
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6039
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6040
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6043
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 6044
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 6045
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 6046
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 6047
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 6048
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6049
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6050
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6051
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6052
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 6053
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 6054
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6055
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6056

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6003
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6005
addattribute $P0, 'varname'
.annotate 'line', 6006
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6061
# Body
# {
.annotate 'line', 6063
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6064
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6065
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6066
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6067
__ARG_2.'unget'($P3)
.annotate 'line', 6068
__ARG_2.'unget'($P2)
.annotate 'line', 6069
__ARG_2.'unget'($P1)
.annotate 'line', 6070
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 6071
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 6073
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 6074

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6084
# Body
# {
.annotate 'line', 6086
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6087
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6088

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6089
# Body
# {
.annotate 'line', 6091
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6092
.return(self)
# }
.annotate 'line', 6093

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6094
# Body
# {
.annotate 'line', 6096
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6097
self.'annotate'(__ARG_1)
.annotate 'line', 6098
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6099

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6080
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6082
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6113
# Body
# {
.annotate 'line', 6115
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6116
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6117
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6118
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6121
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6123
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6124
$P1 = __ARG_2.'get'()
.annotate 'line', 6125
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6126
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6127
$P1 = __ARG_2.'get'()
.annotate 'line', 6128
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6129
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6130
$P1 = __ARG_2.'get'()
.annotate 'line', 6131
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6132
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6133
setattribute self, 'exname', $P1
.annotate 'line', 6134
self.'createvar'($S1, 'P')
.annotate 'line', 6135
$P1 = __ARG_2.'get'()
.annotate 'line', 6136
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6137
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6139
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6140

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6141
# Body
# {
.annotate 'line', 6143
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6144
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6145
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6146
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6147
.return(self)
# }
.annotate 'line', 6148

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6149
# Body
# {
.annotate 'line', 6151
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6152
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6153
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6154
# string exreg: $S4
null $S4
.annotate 'line', 6155
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6156
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6157
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6160
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6162
self.'annotate'(__ARG_1)
.annotate 'line', 6163
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6165
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6166
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6168
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6169
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6170
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6171
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6172
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6173
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6176
eq $I1, 1, __label_14
.annotate 'line', 6177
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6178
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6179
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6180
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6183
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6184
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6185
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6186
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_16: # for iteration
.annotate 'line', 6184
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6188
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6189
# string sep: $S7
set $S7, ''
.annotate 'line', 6190
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6191
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6192
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6194
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6197
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6202
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6203
__ARG_1.'comment'('try: begin')
.annotate 'line', 6204
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6205
__ARG_1.'comment'('try: end')
.annotate 'line', 6207
self.'annotate'(__ARG_1)
.annotate 'line', 6208
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6210
__ARG_1.'comment'('catch')
.annotate 'line', 6211
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6212
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6213
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6214
__ARG_1.'say'('pop_eh')
.annotate 'line', 6215
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6217
__ARG_1.'comment'('catch end')
.annotate 'line', 6218
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6219

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6106
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6108
addattribute $P0, 'stry'
.annotate 'line', 6109
addattribute $P0, 'modifiers'
.annotate 'line', 6110
addattribute $P0, 'exname'
.annotate 'line', 6111
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6230
# Body
# {
.annotate 'line', 6232
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6233
setattribute self, 'name', __ARG_3
.annotate 'line', 6234
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P')
.annotate 'line', 6235
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6236

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6226
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6228
addattribute $P0, 'name'
.annotate 'line', 6229
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6253
# Body
# {
.annotate 'line', 6255
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6256
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6257
$P4 = $P1.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 6258
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6259
setattribute self, 'name', $P1
.annotate 'line', 6260
# var vdata: $P2
null $P2
.annotate 'line', 6261
# string reg: $S1
null $S1
.annotate 'line', 6263
$P1 = __ARG_2.'get'()
.annotate 'line', 6264
$P5 = $P1.'isop'('[')
if_null $P5, __label_1
unless $P5 goto __label_1
# {
box $P6, 1
.annotate 'line', 6266
setattribute self, 'typearray', $P6
.annotate 'line', 6267
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6268
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6269
$P1 = __ARG_2.'get'()
.annotate 'line', 6270
$P7 = $P1.'isop'(']')
if_null $P7, __label_3
unless $P7 goto __label_3
# {
.annotate 'line', 6272
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6275
__ARG_2.'unget'($P1)
.annotate 'line', 6276
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6277
$P1 = __ARG_2.'get'()
.annotate 'line', 6278
$P8 = $P1.'isop'(']')
isfalse $I1, $P8
unless $I1 goto __label_5
.annotate 'line', 6279
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6280
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P9, 0
.annotate 'line', 6285
setattribute self, 'typearray', $P9
.annotate 'line', 6286
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P2 = self.'createvar'($P9, $P10)
.annotate 'line', 6287
$P10 = $P2.'getreg'()
set $S1, $P10
.annotate 'line', 6288
$P11 = $P1.'isop'('=')
if_null $P11, __label_6
unless $P11 goto __label_6
# {
.annotate 'line', 6290
$P13 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P13
.annotate 'line', 6291
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6295
setattribute self, 'reg', $P11
.annotate 'line', 6296
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6298
$P1 = __ARG_2.'get'()
.annotate 'line', 6299
$P13 = $P1.'isop'('[')
isfalse $I2, $P13
unless $I2 goto __label_8
.annotate 'line', 6300
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6301
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P15
.annotate 'line', 6302
$P1 = __ARG_2.'get'()
.annotate 'line', 6303
$P14 = $P1.'isop'(']')
isfalse $I2, $P14
unless $I2 goto __label_9
# {
.annotate 'line', 6304
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6305
# {
.annotate 'line', 6306
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6307
getattribute $P15, self, 'init'
$P15.'push'($P3)
# }
.annotate 'line', 6308
$P1 = __ARG_2.'get'()
$P16 = $P1.'isop'(',')
if_null $P16, __label_11
if $P16 goto __label_10
__label_11: # enddo
.annotate 'line', 6309
$P17 = $P1.'isop'(']')
isfalse $I3, $P17
unless $I3 goto __label_13
.annotate 'line', 6310
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6312
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6314
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6315

.end # parse


.sub 'optimize' :method

.annotate 'line', 6316
# Body
# {
.annotate 'line', 6318
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6319
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6320
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6321
if_null $P1, __label_1
# {
.annotate 'line', 6322
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6323
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6325
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6327
.return(self)
# }
.annotate 'line', 6328

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6329
# Body
# {
.annotate 'line', 6331
self.'annotate'(__ARG_1)
.annotate 'line', 6332
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6333
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6334
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6335
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6336
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6337
__ARG_1.'comment'($S10)
.annotate 'line', 6339
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6340
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6341
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6343
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6344
ne $S5, $S4, __label_10
# {
.annotate 'line', 6345
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6346
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6348
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6351
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_15
# {
.annotate 'line', 6353
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6356
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_17
set $S6, $P6
__label_17:
.annotate 'line', 6357
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6358
iseq $I5, $S4, 'S'
unless $I5 goto __label_20
iseq $I5, $S5, 'P'
__label_20:
unless $I5 goto __label_18
# {
.annotate 'line', 6359
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_21
set $S7, $P7
__label_21:
.annotate 'line', 6360
__ARG_1.'emitnull'($S3)
.annotate 'line', 6361
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6362
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6363
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6366
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
.annotate 'line', 6372
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6373
if_null $P2, __label_22
# {
.annotate 'line', 6375
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_24
set $S8, $P8
__label_24:
.annotate 'line', 6376
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6380
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_23: # endif
.annotate 'line', 6382
if_null $P1, __label_25
# {
.annotate 'line', 6383
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_26
set $S9, $P9
__label_26:
.annotate 'line', 6384
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6385
unless_null $P2, __label_27
# {
.annotate 'line', 6386
le $I1, 0, __label_28
# {
.annotate 'line', 6388
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6391
# int i: $I2
null $I2
.annotate 'line', 6392
iter $P10, $P1
set $P10, 0
__label_29: # for iteration
unless $P10 goto __label_30
shift $P3, $P10
# {
.annotate 'line', 6393
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6394
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6395
inc $I2
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6399

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6400
# Body
# {
.annotate 'line', 6402
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6403

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6243
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6245
addattribute $P0, 'name'
.annotate 'line', 6246
addattribute $P0, 't_reg'
.annotate 'line', 6247
addattribute $P0, 't_name'
.annotate 'line', 6248
addattribute $P0, 't_array'
.annotate 'line', 6249
addattribute $P0, 'reg'
.annotate 'line', 6250
addattribute $P0, 'typearray'
.annotate 'line', 6251
addattribute $P0, 'size'
.annotate 'line', 6252
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6406
# Body
# {
.annotate 'line', 6408
# var next: $P1
null $P1
.annotate 'line', 6409
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6410
# {
.annotate 'line', 6411
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6412
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6413
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6414
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6415
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6416
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6417
.return($P2)
# }
.annotate 'line', 6418

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6430
# Body
# {
.annotate 'line', 6433
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6434
setattribute self, 'type', $P1
.annotate 'line', 6435
setattribute self, 'name', __ARG_4
.annotate 'line', 6436
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6437

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6438
# Body
# {
.annotate 'line', 6440
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6441
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6442
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6443
$P1 = $P1.'optimize'()
.annotate 'line', 6444
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6446
getattribute $P4, self, 'start'
.annotate 'line', 6445
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6448
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6449
setattribute self, 'value', $P1
.annotate 'line', 6450
.return(self)
# }
.annotate 'line', 6451

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6452
# Body
# {
.annotate 'line', 6454
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6455

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6456
# Body
# {
.annotate 'line', 6458
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6459
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6460

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6424
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6426
addattribute $P0, 'type'
.annotate 'line', 6427
addattribute $P0, 'name'
.annotate 'line', 6428
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6463
# Body
# {
.annotate 'line', 6465
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6466
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6467
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6468
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6470
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6471
# {
.annotate 'line', 6472
$P1 = __ARG_2.'get'()
.annotate 'line', 6473
# var name: $P3
set $P3, $P1
.annotate 'line', 6474
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6475
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6477
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6476
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6478
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6479
.return($P2)
# }
.annotate 'line', 6480

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6489
# Body
# {
.annotate 'line', 6491
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6492
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6493
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6494
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6495
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6497
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6498
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6499

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6500
# Body
# {
.annotate 'line', 6502
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6503
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6504
.return(self)
# }
.annotate 'line', 6505

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6506
# Body
# {
.annotate 'line', 6508
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6509

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6510
# Body
# {
.annotate 'line', 6512
self.'annotate'(__ARG_1)
.annotate 'line', 6513
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6514
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6515
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6516
__ARG_1.'comment'($S5)
.annotate 'line', 6517
if_null $P1, __label_2
.annotate 'line', 6518
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6520
if_null $P1, __label_4
# {
.annotate 'line', 6521
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6522
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
.annotate 'line', 6524
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_16
isa $I1, $P1, 'ArrayExpr'
__label_16:
if $I1 goto __label_15
isa $I1, $P1, 'NewExpr'
__label_15:
unless $I1 goto __label_13
.annotate 'line', 6525
$P1.'emit_init'(__ARG_1, $S2)
goto __label_14
__label_13: # else
.annotate 'line', 6527
$P1.'emit'(__ARG_1, $S2)
__label_14: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6532
# string value: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_17
set $S4, $P4
__label_17:
.annotate 'line', 6533
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6536
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6540
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6541

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6486
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6488
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6546
# Body
# {
.annotate 'line', 6548
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6549
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6550
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6551
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6552

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6553
# Body
# {
.annotate 'line', 6555
self.'annotate'(__ARG_1)
.annotate 'line', 6556
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6557
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6558
__ARG_1.'comment'($S3)
.annotate 'line', 6559
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6560

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6544
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6567
# Body
# {
.annotate 'line', 6569
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6570
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6571
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6572
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6573
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6574
$P1 = __ARG_2.'get'()
.annotate 'line', 6575
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6576
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6577

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6578
# Body
# {
.annotate 'line', 6580
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6581
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6582

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6583
# Body
# {
.annotate 'line', 6585
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6586
self.'annotate'(__ARG_1)
.annotate 'line', 6587
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6588
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6589
__ARG_1.'comment'($S4)
.annotate 'line', 6590
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6591

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6563
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6565
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6594
# Body
# {
.annotate 'line', 6596
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6597
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6598
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6599
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6600
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6601
$P2 = __ARG_2.'get'()
.annotate 'line', 6602
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6603
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6605
__ARG_2.'unget'($P2)
.annotate 'line', 6606
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
.annotate 'line', 6610
__ARG_2.'unget'($P2)
.annotate 'line', 6611
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6613

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6621
# Body
# {
box $P1, 'S'
.annotate 'line', 6623
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6624
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6625
setattribute self, 't_array', $P2
.annotate 'line', 6626
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6627

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6628
# Body
# {
.annotate 'line', 6630
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6631

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6619
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6634
# Body
# {
.annotate 'line', 6636
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6637

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6639
# Body
# {
.annotate 'line', 6641
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6642
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6643

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6651
# Body
# {
box $P1, 'I'
.annotate 'line', 6653
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6654
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6655
setattribute self, 't_array', $P2
.annotate 'line', 6656
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6657

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6658
# Body
# {
.annotate 'line', 6660
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6661

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6649
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6664
# Body
# {
.annotate 'line', 6666
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6667

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6669
# Body
# {
.annotate 'line', 6671
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6672
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6673

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6681
# Body
# {
box $P1, 'N'
.annotate 'line', 6683
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6685
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6686
setattribute self, 't_array', $P2
.annotate 'line', 6687
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6688

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6689
# Body
# {
.annotate 'line', 6691
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6692

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6679
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6695
# Body
# {
.annotate 'line', 6697
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6698

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6700
# Body
# {
.annotate 'line', 6702
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6703
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6704

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6717
# Body
# {
.annotate 'line', 6719
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6720
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6721
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6722
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6723
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6724
__ARG_2.'unget'($P1)
.annotate 'line', 6725
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6726
unless_null $P2, __label_2
.annotate 'line', 6727
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 6728
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6730
setattribute self, 'end', $P1
# }
.annotate 'line', 6731

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6732
# Body
# {
.annotate 'line', 6734
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6735
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6736
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6737
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6738
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6739
.return($S2)
# }
.annotate 'line', 6740

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6741
# Body
# {
.annotate 'line', 6743
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6744
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6745
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6746
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6747
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6748
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6749
$P1[$S1] = $S3
.annotate 'line', 6750
.return($S3)
# }
.annotate 'line', 6751

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6752
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6753
# Body
# {
.annotate 'line', 6755
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6756
.return(self)
# }
.annotate 'line', 6757

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6758
# Body
# {
.annotate 'line', 6760
__ARG_1.'comment'('{')
.annotate 'line', 6761
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6762
$P1.'emit'(__ARG_1)
.annotate 'line', 6763
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6765
__ARG_1.'comment'('}')
# }
.annotate 'line', 6766

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6710
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6712
addattribute $P0, 'statements'
.annotate 'line', 6713
addattribute $P0, 'end'
.annotate 'line', 6714
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6779
# Body
# {
box $P3, 1
.annotate 'line', 6782
setattribute self, 'nreg', $P3
.annotate 'line', 6783
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6784
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6785
setattribute self, 'tempreg', $P1
.annotate 'line', 6786
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6787

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6788
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6790
setattribute self, 'type', $P1
.annotate 'line', 6791
.return(self)
# }
.annotate 'line', 6792

.end # settype


.sub 'createreg' :method

.annotate 'line', 6793
# Body
# {
.annotate 'line', 6795
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6796
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6797
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6799
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6801
.return($S1)
# }
.annotate 'line', 6802

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6803
# Body
# {
.annotate 'line', 6805
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6806
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6807
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6808
# string reg: $S1
null $S1
.annotate 'line', 6809
le $I1, 0, __label_0
.annotate 'line', 6810
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6812
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6813
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6815
.return($S1)
# }
.annotate 'line', 6816

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6817
# Body
# {
.annotate 'line', 6819
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6820
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6821
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6822
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6823

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6775
addattribute $P0, 'type'
.annotate 'line', 6776
addattribute $P0, 'nreg'
.annotate 'line', 6777
addattribute $P0, 'tempreg'
.annotate 'line', 6778
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6847
# Body
# {
.annotate 'line', 6849
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6850
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
box $P1, 0
.annotate 'line', 6851
setattribute self, 'nlabel', $P1
.annotate 'line', 6852
new $P4, [ 'RegisterStore' ]
$P3 = $P4.'settype'('I')
setattribute self, 'regstI', $P3
.annotate 'line', 6853
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('N')
setattribute self, 'regstN', $P5
.annotate 'line', 6854
new $P7, [ 'RegisterStore' ]
$P6 = $P7.'settype'('S')
setattribute self, 'regstS', $P6
.annotate 'line', 6855
new $P9, [ 'RegisterStore' ]
$P8 = $P9.'settype'('P')
setattribute self, 'regstP', $P8
# }
.annotate 'line', 6856

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 6858
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 6859
# Body
# {
.annotate 'line', 6862
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 6863
unless_null $P1, __label_0
# {
.annotate 'line', 6864
$P1 = self.'generatesubid'()
.annotate 'line', 6865
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 6867
.return($P1)
# }
.annotate 'line', 6868

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6870
# Body
# {
.annotate 'line', 6872
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6873
.return($I1)
# }
.annotate 'line', 6874

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6875
# Body
# {
.annotate 'line', 6877
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 6878
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6879
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6880
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 6881
# {
.annotate 'line', 6882
$P2 = __ARG_1.'get'()
.annotate 'line', 6883
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6884
eq $S1, '', __label_5
.annotate 'line', 6885
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6888
# string argname: $S2
# predefined string
$P6 = self.'getparamnum'()
set $S4, $P6
concat $S2, '__ARG_', $S4
.annotate 'line', 6889
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 6891
# string varname: $S3
set $P7, $P2
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6892
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6893
$P3['name'] = $S3
.annotate 'line', 6894
$P2 = __ARG_1.'get'()
.annotate 'line', 6895
$P7 = $P2.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6896
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 6897
$P3['modifiers'] = $P4
.annotate 'line', 6898
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6900
$P1.'push'($P3)
# }
.annotate 'line', 6901
$P8 = $P2.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 6902
$P8 = $P2.'isop'(')')
isfalse $I1, $P8
unless $I1 goto __label_9
.annotate 'line', 6903
'SyntaxError'("Expected ')'", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6905

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6910
unless_null $P1, __label_0
.annotate 'line', 6911
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6913
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6914

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6916
# Body
# {
.annotate 'line', 6918
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6919
.return(self)
# }
.annotate 'line', 6920

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6922
# Body
# {
.annotate 'line', 6924
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6925
unless_null $P1, __label_0
# {
.annotate 'line', 6926
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6927
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6929
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6930

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6931
# Body
# {
.annotate 'line', 6933
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6934
unless_null $P1, __label_0
# {
.annotate 'line', 6935
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6936
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6938
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6939

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 6940
# Body
# {
.annotate 'line', 6944
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 6945
# string lexname: $S1
null $S1
.annotate 'line', 6946
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 6947
# {
.annotate 'line', 6949
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 6950
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 6951
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 6952
self.'setlex'($S1, $S2)
.annotate 'line', 6953
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 6955
.return($S1)
# }
.annotate 'line', 6956

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6958
# Body
# {
.annotate 'line', 6960
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6961
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
.annotate 'line', 6963
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6965
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6967
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6969
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6971
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6973
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6974
.return($S1)
# }
.annotate 'line', 6975

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6976
# Body
# {
.annotate 'line', 6978
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6979
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
.annotate 'line', 6981
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6983
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6985
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6987
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6989
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6991
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6992
.return($S1)
# }
.annotate 'line', 6993

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6994
# Body
# {
.annotate 'line', 6996
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
.annotate 'line', 6997
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6998

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6999
# Body
# {
.annotate 'line', 7001
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7002
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7003
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 7005
.return($S1)
# }
.annotate 'line', 7006

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7007
# Body
# {
.annotate 'line', 7009
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7010

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7011
# Body
# {
.annotate 'line', 7013
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7014

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7016
# Body
# {
.annotate 'line', 7018
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 7019
__ARG_1.'say'()
.annotate 'line', 7020
__ARG_1.'print'(".sub ")
.annotate 'line', 7021
$P19 = self.'isanonymous'()
if_null $P19, __label_1
unless $P19 goto __label_1
.annotate 'line', 7022
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7024
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7025
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7026
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7027
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7028
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7029
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7030
if_null $P2, __label_5
.annotate 'line', 7031
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7035
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 7036
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7037
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7038
if_null $P3, __label_7
# {
.annotate 'line', 7039
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7040
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7041
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 7042
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 7043
le $I1, 0, __label_11
# {
.annotate 'line', 7044
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7045
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7046
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7047
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 7048
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 7049
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 7045
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7051
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
.annotate 'line', 7056
ne $S1, 'main', __label_16
.annotate 'line', 7057
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7059
__ARG_1.'say'()
.annotate 'line', 7061
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7062
# var param: $P8
null $P8
.annotate 'line', 7063
# string paramname: $S2
null $S2
.annotate 'line', 7064
# var a: $P9
null $P9
.annotate 'line', 7066
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7067
$S2 = $P8['name']
.annotate 'line', 7068
$P9 = self.'getvar'($S2)
.annotate 'line', 7069
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7070
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7071
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7072
if_null $P10, __label_20
# {
.annotate 'line', 7073
# var named: $P11
null $P11
.annotate 'line', 7074
# var slurpy: $P12
null $P12
.annotate 'line', 7075
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7076
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7077
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7078
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
.annotate 'line', 7086
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7089
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7094
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7097
if_null $P11, __label_31
# {
.annotate 'line', 7098
# string setname: $S5
null $S5
.annotate 'line', 7099
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7100
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
.annotate 'line', 7105
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7106
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7107
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7108
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7111
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7113
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7115
if_null $P12, __label_38
# {
.annotate 'line', 7116
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7120
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7122
__ARG_1.'say'()
.annotate 'line', 7123
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7126
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7127
if_null $P16, __label_39
# {
.annotate 'line', 7129
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 7130
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7133
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7134
if_null $P16, __label_42
# {
.annotate 'line', 7136
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 7137
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7140
__ARG_1.'comment'('Body')
.annotate 'line', 7141
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7143
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7144
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7147
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7148
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7150
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I6, $P17
ge $I4, $I6, __label_47
# {
.annotate 'line', 7151
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7152
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7150
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7155

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 6830
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6832
addattribute $P0, 'name'
.annotate 'line', 6833
addattribute $P0, 'subid'
.annotate 'line', 6834
addattribute $P0, 'modifiers'
.annotate 'line', 6835
addattribute $P0, 'params'
.annotate 'line', 6836
addattribute $P0, 'body'
.annotate 'line', 6837
addattribute $P0, 'regstI'
.annotate 'line', 6838
addattribute $P0, 'regstN'
.annotate 'line', 6839
addattribute $P0, 'regstS'
.annotate 'line', 6840
addattribute $P0, 'regstP'
.annotate 'line', 6841
addattribute $P0, 'nlabel'
.annotate 'line', 6842
addattribute $P0, 'localfun'
.annotate 'line', 6843
addattribute $P0, 'lexicals'
.annotate 'line', 6844
addattribute $P0, 'usedlexicals'
.annotate 'line', 6845
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7167
# Body
# {
.annotate 'line', 7169
self.'FunctionBase'(__ARG_1, __ARG_3)
box $P1, 0
.annotate 'line', 7170
setattribute self, 'paramnum', $P1
box $P1, 0
.annotate 'line', 7171
setattribute self, 'lexnum', $P1
.annotate 'line', 7172
self.'parse'(__ARG_2)
# }
.annotate 'line', 7173

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7175
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7176
# Body
# {
.annotate 'line', 7179
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7180
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7182
.return($I1)
# }
.annotate 'line', 7183

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7184
# Body
# {
.annotate 'line', 7187
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7188
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7190
.return($I1)
# }
.annotate 'line', 7191

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7192
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7194
# Body
# {
.annotate 'line', 7196
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7197
setattribute self, 'name', $P1
.annotate 'line', 7198
$P1 = __ARG_1.'get'()
.annotate 'line', 7199
$P3 = $P1.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7200
# var modifiers: $P2
new $P2, [ 'ModifierList' ]
$P2.'ModifierList'(__ARG_1, self)
.annotate 'line', 7201
setattribute self, 'modifiers', $P2
.annotate 'line', 7202
$P1 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7204
$P4 = $P1.'isop'('(')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 7205
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 7206
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7208
$P1 = __ARG_1.'get'()
.annotate 'line', 7209
$P5 = $P1.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 7210
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 7211
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P1, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7212
.return(self)
# }
.annotate 'line', 7213

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7162
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7164
addattribute $P0, 'paramnum'
.annotate 'line', 7165
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7222
# Body
# {
.annotate 'line', 7224
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7225
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7226
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7227
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7228
setattribute self, 'name', $P1
.annotate 'line', 7229
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7230
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7231
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_0
.annotate 'line', 7232
'Expected'('{', $P2)
__label_0: # endif
.annotate 'line', 7233
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_2, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7234
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7235

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7236
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7237
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7238
# Body
# {
.annotate 'line', 7240
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7241

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7242
# Body
# {
.annotate 'line', 7245
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7246

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7247
# Body
# {
.annotate 'line', 7250
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7251

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7252
# Body
# {
.annotate 'line', 7254
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7255
unless_null $P1, __label_0
# {
.annotate 'line', 7258
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7259
unless_null $P1, __label_1
# {
.annotate 'line', 7261
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7262
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7263
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7264
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7265
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7266
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7267
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7271
$P8 = $P1.'gettype'()
set $S5, $P8
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I1, $P9
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 7272
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7273
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7274
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7275
isa $I1, $P4, 'FunctionBase'
unless $I1 goto __label_9
# {
.annotate 'line', 7276
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7277
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7278
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7279
# string reg: $S4
$P10 = $P1.'getreg'()
null $S4
if_null $P10, __label_12
set $S4, $P10
__label_12:
.annotate 'line', 7280
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
.annotate 'line', 7285
isnull $I2, $P1
not $I2
unless $I2 goto __label_14
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_14:
unless $I2 goto __label_13
.annotate 'line', 7286
'InternalError'('Incorrect data for variable in LocalFunction')
__label_13: # endif
.annotate 'line', 7287
.return($P1)
# }
.annotate 'line', 7288

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7220
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7297
# Body
# {
.annotate 'line', 7299
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7300

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7301
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7295
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

.annotate 'line', 7318
# Body
# {
.annotate 'line', 7320
setattribute self, 'owner', __ARG_1
.annotate 'line', 7321
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7322

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7323
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7325
# Body
# {
.annotate 'line', 7327
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7328

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7316
addattribute $P0, 'owner'
.annotate 'line', 7317
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7334
# Body
# {
.annotate 'line', 7336
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7337
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7338

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7339
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7341
# Body
# {
.annotate 'line', 7343
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7344
__ARG_1.'print'($S1)
# }
.annotate 'line', 7345

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7331
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7333
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7352
# Body
# {
.annotate 'line', 7354
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7355
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7356
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7357
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7358
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7359
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7360
$P2 = __ARG_1.'get'()
.annotate 'line', 7361
$P4 = $P2.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 7362
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
.annotate 'line', 7364
setattribute self, 'hll', $P6
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7368
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7370
# {
.annotate 'line', 7371
$P2 = __ARG_1.'get'()
.annotate 'line', 7372
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7373
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7374
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7375
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7376
$P7 = $P2.'isop'(']')
isfalse $I2, $P7
unless $I2 goto __label_10
.annotate 'line', 7377
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7379
setattribute self, 'key', $P1
# }
.annotate 'line', 7380

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7381
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7382
# Body
# {
# predefined int
.annotate 'line', 7384
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7385

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7387
# Body
# {
.annotate 'line', 7389
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7390

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7348
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7350
addattribute $P0, 'key'
.annotate 'line', 7351
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7396
# Body
# {
.annotate 'line', 7398
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7399
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7400
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7401
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7402
$P2 = __ARG_1.'get'()
# predefined string
set $S1, $P2
.annotate 'line', 7403
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7405
__ARG_1.'unget'($P2)
.annotate 'line', 7406
setattribute self, 'key', $P1
# }
.annotate 'line', 7407

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7408
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7410
# Body
# {
.annotate 'line', 7412
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7413
.return($P2)
# }
.annotate 'line', 7414

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7416
# Body
# {
.annotate 'line', 7418
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7419
unless_null $P1, __label_0
# {
.annotate 'line', 7420
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7421
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7423
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7424

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7393
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7395
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7427
# Body
# {
.annotate 'line', 7429
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7430
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7431
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7432
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7433
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7434
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7435
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7436
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7437

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7454
# Body
# {
.annotate 'line', 7456
setattribute self, 'parent', __ARG_2
.annotate 'line', 7457
setattribute self, 'owner', __ARG_2
.annotate 'line', 7458
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7459
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7460
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7461
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7463
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7464
setattribute self, 'name', $P1
.annotate 'line', 7465
$P1 = __ARG_1.'get'()
.annotate 'line', 7466
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7467
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7468
# {
.annotate 'line', 7469
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7470
$P2.'push'($P3)
.annotate 'line', 7471
$P1 = __ARG_1.'get'()
.annotate 'line', 7472
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
.annotate 'line', 7475
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7476
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7477
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7478
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7479
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7480
# var f: $P4
new $P4, [ 'MethodStatement' ]
$P4.'MethodStatement'($P1, __ARG_1, self)
.annotate 'line', 7481
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7482
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7484
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7485
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7486
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7487
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7488
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7489
$P1 = __ARG_1.'get'()
.annotate 'line', 7490
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 7491
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7493
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7494
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7495
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7496
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7499
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7500
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7502
# var classns: $P9
getattribute $P22, self, 'parent'
$P9 = $P22.'getpath'()
.annotate 'line', 7503
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7504
setattribute self, 'classns', $P9
# }
.annotate 'line', 7505

.end # ClassStatement


.sub 'generatesubid' :method

.annotate 'line', 7506
# Body
# {
.annotate 'line', 7508
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7509

.end # generatesubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7510
# Body
# {
.annotate 'line', 7512
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7513

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7514
# Body
# {
.annotate 'line', 7516
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7517

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7518
# Body
# {
.annotate 'line', 7520
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7521

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7522
# Body
# {
.annotate 'line', 7524
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7525
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7526
.return(self)
# }
.annotate 'line', 7527

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7528
# Body
# {
.annotate 'line', 7530
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7531

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7532
# Body
# {
.annotate 'line', 7534
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7535
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7536
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7537
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7539
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7541
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7542
# int n: $I1
set $I1, 1
.annotate 'line', 7543
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7544
$P3.'annotate'(__ARG_1)
.annotate 'line', 7545
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7546
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7547
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7548
__ARG_1.'say'()
.annotate 'line', 7549
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7551
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7552
__ARG_1.'annotate'($P4)
.annotate 'line', 7553
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7556
__ARG_1.'say'('.end')
# }
.annotate 'line', 7557

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7443
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7445
addattribute $P0, 'parent'
.annotate 'line', 7446
addattribute $P0, 'owner'
.annotate 'line', 7447
addattribute $P0, 'name'
.annotate 'line', 7448
addattribute $P0, 'bases'
.annotate 'line', 7449
addattribute $P0, 'constants'
.annotate 'line', 7450
addattribute $P0, 'functions'
.annotate 'line', 7451
addattribute $P0, 'members'
.annotate 'line', 7452
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7564
# Body
# {
.annotate 'line', 7566
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7567
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7568
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7569
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7570
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7571
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7576
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7577
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7578
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7579
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7580
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7581
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7582
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7583
# }
# try: end
goto __label_5
.annotate 'line', 7581
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
.annotate 'line', 7588
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7589
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7594
load_bytecode 'PGE.pbc'
.annotate 'line', 7595
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7596
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7598
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
.annotate 'line', 7599
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7600
$P8 = $P7($S4)
.annotate 'line', 7601
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7602
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7603
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7604
# int ivalue: $I1
null $I1
.annotate 'line', 7605
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7606
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7611
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7610
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7609
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7598
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7615
$P5.'close'()
# }
.annotate 'line', 7616

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7628
# Body
# {
.annotate 'line', 7630
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7631
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7632
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7633
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7634

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7635
# Body
# {
.annotate 'line', 7637
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7638
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7639
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7640
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7641
.return($P4)
# }
.annotate 'line', 7642

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7643
# Body
# {
# predefined elements
.annotate 'line', 7647
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7649
.return($P5)
__label_3: # case
.annotate 'line', 7652
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7657
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7658
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7659
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7660
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7661
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7663
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7664
if_null $P4, __label_8
.annotate 'line', 7665
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7669
.return($P5)
# }
.annotate 'line', 7670

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7671
# Body
# {
.annotate 'line', 7673
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7674
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7675
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7677
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7679
# var start: $P2
set $P2, $P1
.annotate 'line', 7680
$P1 = __ARG_1.'get'()
.annotate 'line', 7681
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7682
$P1 = __ARG_1.'get'()
.annotate 'line', 7684
# var modifier: $P3
null $P3
.annotate 'line', 7685
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7686
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7687
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7690
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7691
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7692
# var child: $P4
new $P4, [ 'NamespaceStatement' ]
$P4.'NamespaceStatement'(self, $P2, $S1, $P3)
.annotate 'line', 7693
getattribute $P12, self, 'namespaces'
$P12.'push'($P4)
.annotate 'line', 7694
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7695
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7697
$P13 = $P1.'iskeyword'('const')
if_null $P13, __label_7
unless $P13 goto __label_7
# {
.annotate 'line', 7698
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7699
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7701
$P14 = $P1.'iskeyword'('function')
if_null $P14, __label_9
unless $P14 goto __label_9
# {
.annotate 'line', 7702
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P1, __ARG_1, self)
.annotate 'line', 7703
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7704
$P7.'push'($P6)
.annotate 'line', 7705
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7707
$P15 = $P1.'iskeyword'('class')
if_null $P15, __label_11
unless $P15 goto __label_11
# {
.annotate 'line', 7708
# var c: $P8
new $P8, [ 'ClassStatement' ]
$P8.'ClassStatement'(__ARG_1, self)
.annotate 'line', 7709
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7710
$P9.'push'($P8)
.annotate 'line', 7711
getattribute $P16, self, 'items'
$P16.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7713
$P16 = $P1.'iskeyword'('using')
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 7714
$P1 = __ARG_1.'get'()
.annotate 'line', 7715
$P17 = $P1.'iskeyword'('extern')
isfalse $I4, $P17
unless $I4 goto __label_15
.annotate 'line', 7716
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7717
$P1 = __ARG_1.'get'()
.annotate 'line', 7718
$P17 = $P1.'isstring'()
isfalse $I5, $P17
unless $I5 goto __label_16
.annotate 'line', 7719
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7720
# string reqlib: $S2
set $P18, $P1
null $S2
if_null $P18, __label_17
set $S2, $P18
__label_17:
.annotate 'line', 7721
self.'addlib'($S2)
.annotate 'line', 7722
$P1 = __ARG_1.'get'()
.annotate 'line', 7723
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7725
$P18 = $P1.'iskeyword'('$include_const')
if_null $P18, __label_18
unless $P18 goto __label_18
# {
.annotate 'line', 7726
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7728
$P19 = $P1.'iskeyword'('$load')
if_null $P19, __label_20
unless $P19 goto __label_20
# {
.annotate 'line', 7729
$P1 = __ARG_1.'get'()
.annotate 'line', 7730
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_22
.annotate 'line', 7731
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7732
# string reqload: $S3
set $P20, $P1
null $S3
if_null $P20, __label_23
set $S3, $P20
__label_23:
.annotate 'line', 7733
self.'addload'($S3)
.annotate 'line', 7734
$P1 = __ARG_1.'get'()
.annotate 'line', 7735
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7737
$P20 = $P1.'isop'('}')
if_null $P20, __label_24
unless $P20 goto __label_24
# {
.annotate 'line', 7738
self.'close_ns'($P1)
.annotate 'line', 7739
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7742
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
.annotate 'line', 7744
self.'unclosed_ns'()
# }
.annotate 'line', 7745

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7746
# Body
# {
.annotate 'line', 7748
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7749

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7750
# Body
# {
.annotate 'line', 7752
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7753
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7755
# int activate: $I1
set $I1, 1
.annotate 'line', 7756
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7757
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7758
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
unless $I1 goto __label_6
.annotate 'line', 7761
# {
.annotate 'line', 7762
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7763
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7765
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7767

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7620
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7622
addattribute $P0, 'namespaces'
.annotate 'line', 7623
addattribute $P0, 'classes'
.annotate 'line', 7624
addattribute $P0, 'functions'
.annotate 'line', 7625
addattribute $P0, 'items'
.annotate 'line', 7626
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7782
# Body
# {
.annotate 'line', 7785
setattribute self, 'parent', __ARG_1
.annotate 'line', 7786
setattribute self, 'start', __ARG_2
.annotate 'line', 7787
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7788
setattribute self, 'name', $P2
.annotate 'line', 7789
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7790
if_null __ARG_4, __label_0
# {
.annotate 'line', 7791
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7792
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7794

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 7795
# Body
# {
.annotate 'line', 7797
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7798

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7799
# Body
# {
.annotate 'line', 7801
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7802

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7803
# Body
# {
.annotate 'line', 7805
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7806
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7807
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7808
.return($P1)
# }
.annotate 'line', 7809

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7810
# Body
# {
.annotate 'line', 7812
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7813

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7814
# Body
# {
.annotate 'line', 7816
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7817

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7818
# Body
# {
.annotate 'line', 7820
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7821
unless_null $P1, __label_0
.annotate 'line', 7822
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7824
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7825

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7826
# Body
# {
.annotate 'line', 7830
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7831
unless_null $P1, __label_0
.annotate 'line', 7832
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7833
.return($P1)
# }
.annotate 'line', 7834

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7835
# Body
# {
.annotate 'line', 7837
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7838

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7839
# Body
# {
# }
.annotate 'line', 7842

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7843
# Body
# {
.annotate 'line', 7845
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7846
if_null $P1, __label_0
# {
.annotate 'line', 7847
$P1 = $P1.'optimize'()
.annotate 'line', 7848
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7850
self.'optimize_base'()
.annotate 'line', 7851
.return(self)
# }
.annotate 'line', 7852

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7853
# Body
# {
.annotate 'line', 7855
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7856
if_null $P1, __label_0
.annotate 'line', 7857
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7859
self.'emit_base'(__ARG_1)
.annotate 'line', 7861
if_null $P1, __label_1
.annotate 'line', 7862
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7863

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7774
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7776
addattribute $P0, 'parent'
.annotate 'line', 7777
addattribute $P0, 'start'
.annotate 'line', 7778
addattribute $P0, 'name'
.annotate 'line', 7779
addattribute $P0, 'modifier'
.annotate 'line', 7780
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7877
# Body
# {
.annotate 'line', 7879
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7880
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7881

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7882
# Body
# {
.annotate 'line', 7884
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7885
$P1[__ARG_1] = 1
# }
.annotate 'line', 7886

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7887
# Body
# {
.annotate 'line', 7889
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7890
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7891

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 7893
# Body
# {
.annotate 'line', 7895
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7896
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7897
inc $I1
assign $P1, $I1
.annotate 'line', 7899
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 7900
.return($S1)
# }
.annotate 'line', 7901

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7903
# Body
# {
.annotate 'line', 7905
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7906
unless_null $P1, __label_0
# {
.annotate 'line', 7907
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7908
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7910
$P1[__ARG_1] = 1
# }
.annotate 'line', 7911

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7912
# Body
# {
.annotate 'line', 7914
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7915
unless_null $P1, __label_0
# {
.annotate 'line', 7916
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7917
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7919
$P1[__ARG_1] = 1
# }
.annotate 'line', 7920

.end # addload


.sub 'getpath' :method

.annotate 'line', 7921
# Body
# {
.annotate 'line', 7923
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7924
.return($P1)
# }
.annotate 'line', 7925

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7926
# Body
# {
.annotate 'line', 7928
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7929

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7930
# Body
# {
.annotate 'line', 7933
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7934

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7935
# Body
# {
# }
.annotate 'line', 7938

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7939
# Body
# {
.annotate 'line', 7941
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7942

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7943
# Body
# {
.annotate 'line', 7945
self.'optimize_base'()
.annotate 'line', 7946
.return(self)
# }
.annotate 'line', 7947

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7948
# Body
# {
.annotate 'line', 7950
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7953
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7954
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 7957
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
.annotate 'line', 7960
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7961
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7962
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7963
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7966
# int somelib: $I1
null $I1
.annotate 'line', 7967
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7968
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7970
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7971
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7974
# int someload: $I2
null $I2
.annotate 'line', 7975
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7976
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7978
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7979
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7980
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7981
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7983
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7984
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7986
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7987

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7870
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7872
addattribute $P0, 'predefs_used'
.annotate 'line', 7873
addattribute $P0, 'libs'
.annotate 'line', 7874
addattribute $P0, 'loads'
.annotate 'line', 7875
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7999
# Body
# {
.annotate 'line', 8001
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 8004
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8008
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8007
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8006
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8012
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8011
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8010
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8018
new $P9, [ 'StringLiteral' ]
.annotate 'line', 8019
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
.annotate 'line', 8017
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 8022
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8023

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8024
# Body
# {
.annotate 'line', 8026
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8027

.end # parse


.sub 'optimize' :method

.annotate 'line', 8028
# Body
# {
.annotate 'line', 8030
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8031

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8032
# Body
# {
.annotate 'line', 8034
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8035
__ARG_1.'say'('')
.annotate 'line', 8037
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8039
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8040

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7998
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 8047
# Body
# {
.annotate 'line', 8049
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8051
$P1.'open'('__eval__', 'w')
.annotate 'line', 8052
$P1.'puts'(__ARG_1)
.annotate 'line', 8053
$P1.'close'()
.annotate 'line', 8054
$P1.'open'('__eval__', 'r')
.annotate 'line', 8055
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8056
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8057
$P3.'parse'($P2)
.annotate 'line', 8058
$P1.'close'()
.annotate 'line', 8059
$P3.'optimize'()
.annotate 'line', 8060
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8061
$P4.'open'('__eval__', 'w')
.annotate 'line', 8062
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8063
$P5.'initialize'($P4)
.annotate 'line', 8064
$P3.'emit'($P5)
.annotate 'line', 8065
$P5.'close'()
.annotate 'line', 8066
$P4.'close'()
.annotate 'line', 8067
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8068
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8069
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8070
.return($P7)
# }
.annotate 'line', 8071

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 8072
# Body
# {
.annotate 'line', 8074
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8075
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8076
$P1.'encoding'('utf8')
.annotate 'line', 8077
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8078
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8079
$P3.'parse'($P2)
.annotate 'line', 8080
$P1.'close'()
.annotate 'line', 8081
$P3.'optimize'()
.annotate 'line', 8082
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8083
$P4.'initialize'(__ARG_2)
.annotate 'line', 8084
$P3.'emit'($P4)
.annotate 'line', 8085
$P4.'close'()
# }
.annotate 'line', 8086

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 8087
# Body
# {
.annotate 'line', 8089
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8090
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8091
$P1.'encoding'('utf8')
.annotate 'line', 8092
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8093
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8094
$P3.'parse'($P2)
.annotate 'line', 8095
$P1.'close'()
.annotate 'line', 8096
$P3.'optimize'()
.annotate 'line', 8097
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8098
$P4.'open'('__eval__', 'w')
.annotate 'line', 8099
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8100
$P5.'initialize'($P4)
.annotate 'line', 8101
$P3.'emit'($P5)
.annotate 'line', 8102
$P5.'close'()
.annotate 'line', 8103
$P4.'close'()
.annotate 'line', 8104
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8105
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8106
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8107
.return($P7)
# }
.annotate 'line', 8108

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 8113
# Body
# {
.annotate 'line', 8115
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 8116
$P1.'parse'(__ARG_1)
.annotate 'line', 8118
$P1.'optimize'()
.annotate 'line', 8120
# var handle: $P2
null $P2
.annotate 'line', 8121
ne __ARG_2, '-', __label_0
.annotate 'line', 8122
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 8124
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 8125
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8126
$P3.'initialize'($P2)
.annotate 'line', 8127
$P1.'emit'($P3)
.annotate 'line', 8128
$P3.'close'()
.annotate 'line', 8129
$P2.'close'()
# }
.annotate 'line', 8130

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8136
# Body
# {
.annotate 'line', 8138
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 8139
compreg 'winxed', $P1
# }
.annotate 'line', 8140

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8142
# Body
# {
.annotate 'line', 8144
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8145
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8146
$P1.'notOptStop'(1)
.annotate 'line', 8147
$P1.'push_string'('o=s')
.annotate 'line', 8148
$P1.'push_string'('e=s')
.annotate 'line', 8149
$P1.'push_string'('c')
.annotate 'line', 8150
$P1.'push_string'('noan')
.annotate 'line', 8152
__ARG_1.'shift'()
.annotate 'line', 8153
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8154
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8155
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8156
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8157
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8159
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 8160
# string filename: $S1
null $S1
.annotate 'line', 8161
# string expr: $S2
null $S2
.annotate 'line', 8162
# var file: $P7
null $P7
.annotate 'line', 8163
unless_null $P4, __label_0
# {
.annotate 'line', 8164
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 8165
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 8167
$S1 = __ARG_1[0]
.annotate 'line', 8168
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 8169
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 8174
new $P7, [ 'StringHandle' ]
.annotate 'line', 8175
$P7.'open'('__eval__', 'w')
.annotate 'line', 8176
$P7.'puts'($S2)
.annotate 'line', 8177
$P7.'close'()
.annotate 'line', 8178
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 8181
# var t: $P8
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P7, $S1)
.annotate 'line', 8183
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8184
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 8186
'winxed_parser'($P8, $S3)
.annotate 'line', 8188
$P7.'close'()
# }
.annotate 'line', 8189

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8191
# Body
# {
.annotate 'line', 8193
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8199
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 8193
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8202
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 8203
print 'Error: '
say $S1
.annotate 'line', 8204
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8205
# int i: $I1
set $I1, 1
.annotate 'line', 8206
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8207
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8208
# string subname: $S2
null $S2
.annotate 'line', 8209
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8211
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8212
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
.annotate 'line', 8214
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8215
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8216
eq $S4, '', __label_8
# {
.annotate 'line', 8217
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 8218
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
.annotate 'line', 8222

.end # main

# End generated code
