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
$S1 = $P1
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
$S1 = $P1
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
# string pending: $S1
getattribute $P2, self, 'pending'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 549
eq $S1, '', __label_1
# {
box $P2, ''
.annotate 'line', 550
setattribute self, 'pending', $P2
.annotate 'line', 551
.return($S1)
# }
__label_1: # endif
.annotate 'line', 553
# var h: $P1
getattribute $P1, self, 'h'
.annotate 'line', 554
# string c: $S2
$P3 = $P1.'read'(1)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 555
ne $S2, "\n", __label_3
# {
.annotate 'line', 556
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 557
inc $I1
box $P4, $I1
.annotate 'line', 558
setattribute self, 'line', $P4
# }
__label_3: # endif
.annotate 'line', 560
.return($S2)
# }
.annotate 'line', 561

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 562
# Body
# {
box $P1, __ARG_1
.annotate 'line', 564
setattribute self, 'pending', $P1
# }
.annotate 'line', 565

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 566
# Body
# {
.annotate 'line', 568
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 569
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 570
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 571
.const 'Sub' $P7 = 'getop'
.annotate 'line', 572
.const 'Sub' $P8 = 'getident'
.annotate 'line', 573
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 575
getattribute $P10, self, 'stacked'
if_null $P10, __label_0
unless $P10 goto __label_0
# {
.annotate 'line', 576
# var t: $P1
getattribute $P11, self, 'stacked'
$P1 = $P11.'pop'()
.annotate 'line', 577
.return($P1)
# }
__label_0: # endif
.annotate 'line', 579
# string c: $S1
$P10 = self.'getchar'()
null $S1
if_null $P10, __label_1
set $S1, $P10
__label_1:
__label_3: # while
.annotate 'line', 580
$P11 = $P4($S1)
if_null $P11, __label_2
unless $P11 goto __label_2
.annotate 'line', 581
$P12 = self.'getchar'()
set $S1, $P12
goto __label_3
__label_2: # endwhile
.annotate 'line', 582
# int line: $I1
getattribute $P12, self, 'line'
set $I1, $P12
.annotate 'line', 583
ne $S1, '', __label_4
.annotate 'line', 584
new $P13, [ 'TokenEof' ]
.return($P13)
__label_4: # endif
.annotate 'line', 585
$P13 = $P5($S1)
if_null $P13, __label_5
unless $P13 goto __label_5
.annotate 'line', 586
.tailcall $P8(self, $S1, $I1)
__label_5: # endif
.annotate 'line', 587
$P14 = $P6($S1)
if_null $P14, __label_6
unless $P14 goto __label_6
.annotate 'line', 588
.tailcall $P9(self, $S1, $I1)
__label_6: # endif
.annotate 'line', 590
# string op: $S2
set $S2, $S1
.annotate 'line', 591
# var select: $P2
getattribute $P2, self, 'select'
.annotate 'line', 592
# var current: $P3
$P3 = $P2[$S1]
__label_8: # while
.annotate 'line', 594
isnull $I2, $P3
not $I2
unless $I2 goto __label_9
isa $I2, $P3, 'Hash'
__label_9:
unless $I2 goto __label_7
# {
.annotate 'line', 595
$P14 = self.'getchar'()
set $S1, $P14
set $P2, $P3
.annotate 'line', 597
$P3 = $P2[$S1]
.annotate 'line', 598
unless_null $P3, __label_10
# {
.annotate 'line', 599
self.'ungetchar'($S1)
.annotate 'line', 600
$P3 = $P2['']
# }
goto __label_11
__label_10: # else
concat $S2, $S1
__label_11: # endif
.annotate 'line', 603
# }
goto __label_8
__label_7: # endwhile
if_null $P3, __label_12
.annotate 'line', 605
unless $P3 goto __label_12
.annotate 'line', 606
.tailcall $P3(self, $S2, $I1)
__label_12: # endif
.annotate 'line', 607
.tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 608

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 609
# Body
# {
.annotate 'line', 611
# var t: $P1
$P1 = self.'get_token'()
__label_1: # while
.annotate 'line', 612
$P2 = $P1.'iseof'()
isfalse $I1, $P2
unless $I1 goto __label_3
not $I1, __ARG_1
__label_3:
unless $I1 goto __label_2
$I1 = $P1.'iscomment'()
__label_2:
unless $I1 goto __label_0
.annotate 'line', 613
$P1 = self.'get_token'()
goto __label_1
__label_0: # endwhile
.annotate 'line', 614
.return($P1)
# }
.annotate 'line', 615

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 616
# Body
# {
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }

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

.annotate 'line', 635
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 637
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
.annotate 'line', 638
.return('I')
__label_3: # case
.annotate 'line', 639
.return('N')
__label_4: # case
.annotate 'line', 640
.return('S')
__label_5: # case
.annotate 'line', 641
.return('P')
__label_1: # default
.annotate 'line', 642
.return('')
__label_0: # switch end
# }
.annotate 'line', 644

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 646
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 648
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
.annotate 'line', 649
.return('int')
__label_3: # case
.annotate 'line', 650
.return('num')
__label_4: # case
.annotate 'line', 651
.return('string')
__label_5: # case
.annotate 'line', 652
.return('pmc')
__label_1: # default
.annotate 'line', 653
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 655

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 669
# Body
# {
.annotate 'line', 671
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 672
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 673
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 674
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 675
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 676

.end # initialize


.sub 'close' :method

.annotate 'line', 677
# Body
# {
null $P1
.annotate 'line', 679
setattribute self, 'handle', $P1
# }
.annotate 'line', 680

.end # close


.sub 'updateannot' :method

.annotate 'line', 681
# Body
# {
.annotate 'line', 683
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 684
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 685
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 686
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 687
getattribute $P3, self, 'handle'
$P3.'print'("\n")
box $P4, 0
.annotate 'line', 688
setattribute self, 'pendingf', $P4
# }
__label_0: # endif
.annotate 'line', 690
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 691
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 692
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 693
getattribute $P6, self, 'handle'
$P6.'print'("\n")
box $P7, 0
.annotate 'line', 694
setattribute self, 'pendingl', $P7
# }
__label_1: # endif
# }
.annotate 'line', 696

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 697
# Body
# {
.annotate 'line', 699
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 700
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 701

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 702
# Body
# {
.annotate 'line', 704
self.'updateannot'()
.annotate 'line', 705
self.'vprint'(__ARG_1)
# }
.annotate 'line', 706

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 707
# Body
# {
.annotate 'line', 709
self.'updateannot'()
.annotate 'line', 710
self.'vprint'(__ARG_1)
.annotate 'line', 711
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 712

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 713
# Body
# {
.annotate 'line', 715
getattribute $P1, self, 'file'
getattribute $P2, __ARG_1, 'file'
eq $P1, $P2, __label_0
# {
.annotate 'line', 716
getattribute $P4, __ARG_1, 'file'
setattribute self, 'file', $P4
box $P1, 1
.annotate 'line', 717
setattribute self, 'pendingf', $P1
box $P2, 0
.annotate 'line', 718
setattribute self, 'line', $P2
# }
__label_0: # endif
.annotate 'line', 720
getattribute $P3, self, 'line'
getattribute $P4, __ARG_1, 'line'
eq $P3, $P4, __label_1
# {
.annotate 'line', 721
getattribute $P6, __ARG_1, 'line'
setattribute self, 'line', $P6
box $P5, 1
.annotate 'line', 722
setattribute self, 'pendingl', $P5
# }
__label_1: # endif
# }
.annotate 'line', 724

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 725
# Body
# {
.annotate 'line', 727
self.'updateannot'()
.annotate 'line', 728
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 729

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 730
# Body
# {
.annotate 'line', 732
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 733
$P1.'print'(__ARG_1)
.annotate 'line', 734
$P1.'print'(':')
.annotate 'line', 735
if_null __ARG_2, __label_0
# {
.annotate 'line', 736
$P1.'print'(' # ')
.annotate 'line', 737
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 739
$P1.'print'("\n")
# }
.annotate 'line', 740

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 741
# Body
# {
.annotate 'line', 743
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 744
$P1.'print'('goto ')
.annotate 'line', 745
$P1.'print'(__ARG_1)
.annotate 'line', 746
if_null __ARG_2, __label_0
# {
.annotate 'line', 747
$P1.'print'(' # ')
.annotate 'line', 748
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 750
$P1.'print'("\n")
# }
.annotate 'line', 751

.end # emitgoto


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 752
# Body
# {
.annotate 'line', 754
# string ins: $S1
concat $S0, 'if_null ', __ARG_1
concat $S0, ', '
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 755
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 756

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 757
# Body
# {
.annotate 'line', 759
# string ins: $S1
concat $S0, "null ", __ARG_1
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 760
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 761

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 762
# Body
# {
.annotate 'line', 764
# string ins: $S1
concat $S0, "set ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 765
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 766

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 767
# Body
# {
.annotate 'line', 769
# string ins: $S1
concat $S0, "assign ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 770
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 771

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 772
# Body
# {
.annotate 'line', 774
# string ins: $S1
concat $S0, "box ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 775
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 776

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 777
# Body
# {
.annotate 'line', 779
# string ins: $S1
concat $S0, "unbox ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 780
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 781

.end # emitunbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 782
# Body
# {
.annotate 'line', 784
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 785
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 786

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 787
# Body
# {
.annotate 'line', 789
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 790
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 791

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 792
# Body
# {
.annotate 'line', 794
# string ins: $S1
concat $S0, "mul ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 795
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 796

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 797
# Body
# {
.annotate 'line', 799
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 800
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 801

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 802
# Body
# {
.annotate 'line', 804
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 805
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 806

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 663
addattribute $P0, 'handle'
.annotate 'line', 664
addattribute $P0, 'file'
.annotate 'line', 665
addattribute $P0, 'line'
.annotate 'line', 666
addattribute $P0, 'pendingf'
.annotate 'line', 667
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 813
# Body
# {
.annotate 'line', 815
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 816

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 818
# Body
# {
.annotate 'line', 820
# var t: $P1
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenFloat'($P3, $P4, __ARG_3)
set $P1, $P2
.annotate 'line', 821
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 822

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 824
# Body
# {
.annotate 'line', 830
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 831
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 832
.return($I1)
# }
.annotate 'line', 833

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 854
# Body
# {
.annotate 'line', 856
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 857
.return($S1)
# }
.annotate 'line', 858

.end # name


.sub 'result' :method

.annotate 'line', 859
# Body
# {
.annotate 'line', 861
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 862

.end # result


.sub 'params' :method

.annotate 'line', 863
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 864
# Body
# {
.annotate 'line', 866
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 867
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 868
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 869
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 870
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 872
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 874
.return($S1)
# }
.annotate 'line', 875

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 876
# Body
# {
box $P1, __ARG_1
.annotate 'line', 882
setattribute self, 'name', $P1
.annotate 'line', 883
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 884
setattribute self, 'typeresult', $P2
.annotate 'line', 885
# int n: $I1
null $I1
.annotate 'line', 886
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 887
setattribute self, 'type0', $P2
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 888
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
.annotate 'line', 894
if_null __ARG_5, __label_5
concat $S3, "Invalid predef '", __ARG_1
concat $S3, '"'
.annotate 'line', 895
'InternalError'($S3)
__label_5: # endif
goto __label_1 # break
__label_2: # default
set $I1, 1
.annotate 'line', 899
if_null __ARG_5, __label_6
# {
box $P3, __ARG_5
.annotate 'line', 900
setattribute self, 'type1', $P3
.annotate 'line', 901
inc $I1
# }
__label_6: # endif
.annotate 'line', 903
if_null __ARG_6, __label_7
# {
box $P3, __ARG_6
.annotate 'line', 904
setattribute self, 'type2', $P3
.annotate 'line', 905
inc $I1
# }
__label_7: # endif
__label_1: # switch end
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 909
setattribute self, 'nparams', $P4
.annotate 'line', 910
.return(self)
# }
.annotate 'line', 911

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 912
# Body
# {
.annotate 'line', 920
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 921
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 922
.return(self)
# }
.annotate 'line', 923

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 924
# Body
# {
.annotate 'line', 926
# string name: $S1
getattribute $P3, self, 'name'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 927
# string typeresult: $S2
getattribute $P3, self, 'typeresult'
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 928
__ARG_1.'comment'($S6)
.annotate 'line', 930
getattribute $P4, self, 'nparams'
set $I4, $P4
ne $I4, -2, __label_2
# {
.annotate 'line', 931
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 932
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 933
.return()
# }
__label_2: # endif
.annotate 'line', 935
getattribute $P4, self, 'body'
isa $I4, $P4, 'String'
unless $I4 goto __label_3
# {
.annotate 'line', 936
# string body: $S3
getattribute $P5, self, 'body'
null $S3
if_null $P5, __label_5
set $S3, $P5
__label_5:
.annotate 'line', 937
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 938
ne $S2, 'v', __label_6
# {
.annotate 'line', 939
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_9
isne $I5, __ARG_4, ''
__label_9:
unless $I5 goto __label_8
.annotate 'line', 940
'SyntaxError'('using return value from void predef')
__label_8: # endif
.annotate 'line', 941
eq $I1, -1, __label_10
.annotate 'line', 942
'InternalError'('void predef with {res}')
__label_10: # endif
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 945
ne $I1, -1, __label_11
.annotate 'line', 946
'InternalError'('non void predef without {res}')
__label_11: # endif
.annotate 'line', 947
isne $I5, $S2, 'v'
unless $I5 goto __label_13
isnull $I5, __ARG_4
if $I5 goto __label_14
iseq $I5, __ARG_4, ''
__label_14:
__label_13:
unless $I5 goto __label_12
.annotate 'line', 948
$P5 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P5
__label_12: # endif
__label_15: # do
.annotate 'line', 949
# {
.annotate 'line', 950
# predefined substr
substr $S6, $S3, 0, $I1
add $I6, $I1, 5
# predefined substr
substr $S7, $S3, $I6
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 951
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_15
__label_16: # enddo
# }
__label_7: # endif
.annotate 'line', 954
# int n: $I2
set $P6, __ARG_5
set $I2, $P6
# for loop
.annotate 'line', 955
# int i: $I3
null $I3
__label_20: # for condition
ge $I3, $I2, __label_19
# {
.annotate 'line', 956
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S0, $S7, '}'
set $S4, $S0
.annotate 'line', 957
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_22: # while
.annotate 'line', 958
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_21
.annotate 'line', 959
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
.annotate 'line', 955
inc $I3
goto __label_20
__label_19: # for end
.annotate 'line', 961
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 962
__ARG_1.'say'($S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 965
# var fun: $P2
getattribute $P2, self, 'body'
.annotate 'line', 966
$P2(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_4: # endif
# }
.annotate 'line', 968

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 845
addattribute $P0, 'name'
.annotate 'line', 846
addattribute $P0, 'body'
.annotate 'line', 847
addattribute $P0, 'evalfun'
.annotate 'line', 848
addattribute $P0, 'typeresult'
.annotate 'line', 849
addattribute $P0, 'type0'
.annotate 'line', 850
addattribute $P0, 'type1'
.annotate 'line', 851
addattribute $P0, 'type2'
.annotate 'line', 852
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 974
# Body
# {
box $P1, __ARG_1
.annotate 'line', 976
setattribute self, 'type', $P1
# }
.annotate 'line', 977

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 978
# Body
# {
.annotate 'line', 980
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 981
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 982
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 983
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 984
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 985
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 986
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 988
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 989
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 990
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 992

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 973
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 997
# Body
# {
.annotate 'line', 999
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1000
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1001
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1002
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 1003
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 1002
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 1004
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1007
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 1008

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

.annotate 'line', 1013
# Body
# {
.annotate 'line', 1015
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1016
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1017
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1018
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1019
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1018
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1020
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1021

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

.annotate 'line', 1026
# Body
# {
.annotate 'line', 1028
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1029
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1030
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1031
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 1030
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1032

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1035
# Body
# {
.annotate 'line', 1037
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1038
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1039
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1040

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1042
# Body
# {
.annotate 'line', 1044
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1045
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1046
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1047

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1049
# Body
# {
.annotate 'line', 1051
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1052
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1053
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1054

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1056
# Body
# {
.annotate 'line', 1058
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1059
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1060
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1061
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1062
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1063

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1065
# Body
# {
.annotate 'line', 1067
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1069
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1070
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1072
# var t: $P2
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
$P4.'TokenQuoted'($P5, $P6, $S1)
set $P2, $P4
.annotate 'line', 1073
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1074

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 1076
# Body
# {
.annotate 'line', 1078
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1079
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1080
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1081
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1082
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1084
# var predefs: $P1
root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 1085
new $P10, [ 'PredefFunction' ]
.annotate 'line', 1086
new $P12, [ 'Predef_typecast' ]
$P12.'Predef_typecast'('I')
set $P11, $P12
.annotate 'line', 1085
$P9 = $P10.'set'('int', $P11, 'I', '!')
.annotate 'line', 1084
$P7.'push'($P9)
.annotate 'line', 1089
new $P14, [ 'PredefFunction' ]
.annotate 'line', 1090
new $P16, [ 'Predef_typecast' ]
$P16.'Predef_typecast'('N')
set $P15, $P16
.annotate 'line', 1089
$P13 = $P14.'set'('float', $P15, 'N', '!')
.annotate 'line', 1084
$P7.'push'($P13)
.annotate 'line', 1093
new $P18, [ 'PredefFunction' ]
.annotate 'line', 1094
new $P20, [ 'Predef_typecast' ]
$P20.'Predef_typecast'('S')
set $P19, $P20
.annotate 'line', 1093
$P17 = $P18.'set'('string', $P19, 'S', '!')
.annotate 'line', 1084
$P7.'push'($P17)
.annotate 'line', 1097
new $P22, [ 'PredefFunction' ]
$P21 = $P22.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1084
$P7.'push'($P21)
.annotate 'line', 1101
new $P24, [ 'PredefFunction' ]
$P23 = $P24.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1084
$P7.'push'($P23)
.annotate 'line', 1105
new $P26, [ 'PredefFunction' ]
$P25 = $P26.'set'('time', 'time {res}', 'I')
.annotate 'line', 1084
$P7.'push'($P25)
.annotate 'line', 1109
new $P28, [ 'PredefFunction' ]
$P27 = $P28.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1084
$P7.'push'($P27)
.annotate 'line', 1113
new $P30, [ 'PredefFunction' ]
$P29 = $P30.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1084
$P7.'push'($P29)
.annotate 'line', 1117
new $P32, [ 'PredefFunction' ]
$P31 = $P32.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P31)
.annotate 'line', 1122
new $P34, [ 'PredefFunction' ]
$P33 = $P34.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P33)
.annotate 'line', 1127
new $P36, [ 'PredefFunction' ]
$P35 = $P36.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P35)
.annotate 'line', 1132
new $P38, [ 'PredefFunction' ]
$P37 = $P38.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1084
$P7.'push'($P37)
.annotate 'line', 1138
new $P40, [ 'PredefFunction' ]
$P39 = $P40.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1084
$P7.'push'($P39)
.annotate 'line', 1145
new $P42, [ 'PredefFunction' ]
$P41 = $P42.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1084
$P7.'push'($P41)
.annotate 'line', 1149
new $P44, [ 'PredefFunction' ]
$P43 = $P44.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1084
$P7.'push'($P43)
.annotate 'line', 1154
new $P46, [ 'PredefFunction' ]
$P45 = $P46.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1084
$P7.'push'($P45)
.annotate 'line', 1159
new $P48, [ 'PredefFunction' ]
$P47 = $P48.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1084
$P7.'push'($P47)
.annotate 'line', 1166
new $P50, [ 'PredefFunction' ]
$P49 = $P50.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1084
$P7.'push'($P49)
.annotate 'line', 1171
new $P52, [ 'PredefFunction' ]
$P51 = $P52.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1084
$P7.'push'($P51)
.annotate 'line', 1176
new $P54, [ 'PredefFunction' ]
$P53 = $P54.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1084
$P7.'push'($P53)
.annotate 'line', 1180
new $P56, [ 'PredefFunction' ]
$P55 = $P56.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1084
$P7.'push'($P55)
.annotate 'line', 1184
new $P58, [ 'PredefFunction' ]
$P57 = $P58.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P57)
.annotate 'line', 1188
new $P60, [ 'PredefFunction' ]
$P59 = $P60.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1084
$P7.'push'($P59)
.annotate 'line', 1192
new $P62, [ 'PredefFunction' ]
$P61 = $P62.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1084
$P7.'push'($P61)
.annotate 'line', 1196
new $P64, [ 'PredefFunction' ]
$P63 = $P64.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P63)
.annotate 'line', 1200
new $P66, [ 'PredefFunction' ]
$P65 = $P66.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P65)
.annotate 'line', 1204
new $P68, [ 'PredefFunction' ]
$P67 = $P68.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P67)
.annotate 'line', 1208
new $P70, [ 'PredefFunction' ]
$P69 = $P70.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P69)
.annotate 'line', 1212
new $P72, [ 'PredefFunction' ]
$P71 = $P72.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P71)
.annotate 'line', 1217
new $P74, [ 'PredefFunction' ]
$P73 = $P74.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P73)
.annotate 'line', 1222
new $P76, [ 'PredefFunction' ]
$P75 = $P76.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P75)
.annotate 'line', 1226
new $P78, [ 'PredefFunction' ]
$P77 = $P78.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P77)
.annotate 'line', 1230
new $P80, [ 'PredefFunction' ]
$P79 = $P80.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P79)
.annotate 'line', 1234
new $P82, [ 'PredefFunction' ]
$P81 = $P82.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P81)
.annotate 'line', 1238
new $P84, [ 'PredefFunction' ]
$P83 = $P84.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P83)
.annotate 'line', 1242
new $P86, [ 'PredefFunction' ]
$P85 = $P86.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P85)
.annotate 'line', 1246
new $P88, [ 'PredefFunction' ]
$P87 = $P88.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P87)
.annotate 'line', 1250
new $P90, [ 'PredefFunction' ]
$P89 = $P90.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P89)
.annotate 'line', 1254
new $P92, [ 'PredefFunction' ]
$P91 = $P92.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P91)
.annotate 'line', 1258
new $P94, [ 'PredefFunction' ]
$P93 = $P94.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P93)
.annotate 'line', 1262
new $P96, [ 'PredefFunction' ]
$P95 = $P96.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1084
$P7.'push'($P95)
.annotate 'line', 1266
new $P98, [ 'PredefFunction' ]
$P97 = $P98.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1084
$P7.'push'($P97)
.annotate 'line', 1270
new $P100, [ 'PredefFunction' ]
$P99 = $P100.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P99)
.annotate 'line', 1274
new $P102, [ 'PredefFunction' ]
$P101 = $P102.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P101)
.annotate 'line', 1278
new $P104, [ 'PredefFunction' ]
$P103 = $P104.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P103)
.annotate 'line', 1282
new $P106, [ 'PredefFunction' ]
$P105 = $P106.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1084
$P7.'push'($P105)
.annotate 'line', 1286
new $P108, [ 'PredefFunction' ]
$P107 = $P108.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1084
$P7.'push'($P107)
.annotate 'line', 1290
new $P110, [ 'PredefFunction' ]
$P109 = $P110.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P109)
.annotate 'line', 1294
new $P112, [ 'PredefFunction' ]
$P111 = $P112.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1084
$P7.'push'($P111)
.annotate 'line', 1298
new $P114, [ 'PredefFunction' ]
$P113 = $P114.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P113)
.annotate 'line', 1303
new $P116, [ 'PredefFunction' ]
$P115 = $P116.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P115)
.annotate 'line', 1308
new $P118, [ 'PredefFunction' ]
$P117 = $P118.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1084
$P7.'push'($P117)
.annotate 'line', 1312
new $P120, [ 'PredefFunction' ]
$P119 = $P120.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1084
$P7.'push'($P119)
.annotate 'line', 1316
new $P122, [ 'PredefFunction' ]
$P121 = $P122.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1084
$P7.'push'($P121)
.annotate 'line', 1320
new $P124, [ 'PredefFunction' ]
$P123 = $P124.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1084
$P7.'push'($P123)
.annotate 'line', 1324
new $P126, [ 'PredefFunction' ]
$P125 = $P126.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1084
$P7.'push'($P125)
.annotate 'line', 1328
new $P128, [ 'PredefFunction' ]
.annotate 'line', 1329
new $P129, [ 'Predef_print' ]
.annotate 'line', 1328
$P127 = $P128.'set'('print', $P129, 'P', '*')
.annotate 'line', 1084
$P7.'push'($P127)
.annotate 'line', 1332
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1333
new $P132, [ 'Predef_say' ]
.annotate 'line', 1332
$P130 = $P131.'set'('say', $P132, 'P', '*')
.annotate 'line', 1084
$P7.'push'($P130)
.annotate 'line', 1336
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1337
new $P135, [ 'Predef_cry' ]
.annotate 'line', 1336
$P133 = $P134.'set'('cry', $P135, 'P', '*')
.annotate 'line', 1084
$P7.'push'($P133)
set $P1, $P7
__label_1: # Infinite loop
.annotate 'line', 1342
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1343

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1345
# Body
# {
.annotate 'line', 1347
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1348
getattribute $P4, $P1, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1349
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1350
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1351
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1352
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1353
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1355
.return($P2)
# }
.annotate 'line', 1356

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1362
# Body
# {
.annotate 'line', 1364
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1365
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1366
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1365
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1367

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1378
# Body
# {
.annotate 'line', 1380
setattribute self, 'start', __ARG_1
.annotate 'line', 1381
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1382

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1383
# Body
# {
.annotate 'line', 1385
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1386

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1387
# Body
# {
.annotate 'line', 1389
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1390

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1391
# Body
# {
.annotate 'line', 1393
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1394

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1395
# Body
# {
.annotate 'line', 1397
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1398

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1399
# Body
# {
.annotate 'line', 1401
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1402

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1375
addattribute $P0, 'start'
.annotate 'line', 1376
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1415
# Body
# {
.annotate 'line', 1417
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1418

.end # init


.sub 'numargs' :method

.annotate 'line', 1420
# Body
# {
.annotate 'line', 1422
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1423

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1424
# Body
# {
.annotate 'line', 1426
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1427
.return($P2)
# }
.annotate 'line', 1428

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1430
# Body
# {
.annotate 'line', 1432
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1433
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1434
# {
.annotate 'line', 1435
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1436
$P1.'push'($P3)
# }
.annotate 'line', 1437
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1438
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1439

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1441
# Body
# {
.annotate 'line', 1443
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1444
if_null $P1, __label_0
.annotate 'line', 1445
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1446

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1447
# Body
# {
.annotate 'line', 1449
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1450
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1451
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1452
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1453
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1454
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1455
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1452
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1457
.return($P2)
# }
.annotate 'line', 1458

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1459
# Body
# {
.annotate 'line', 1461
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1462
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1463

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1413
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1475
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1476
# Body
# {
.annotate 'line', 1478
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1479
.return($I1)
# }
.annotate 'line', 1480

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1481
# Body
# {
.annotate 'line', 1483
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1484
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1485
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1487
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1488

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1489
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1491
setattribute self, 'name', $P1
.annotate 'line', 1492
if_null __ARG_2, __label_0
.annotate 'line', 1493
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1494

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1495
# Body
# {
.annotate 'line', 1497
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1498

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1472
addattribute $P0, 'name'
.annotate 'line', 1473
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1505
# Body
# {
.annotate 'line', 1507
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1508
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1509
# {
.annotate 'line', 1510
$P2 = __ARG_1.'get'()
.annotate 'line', 1511
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1512
$P2 = __ARG_1.'get'()
.annotate 'line', 1513
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1514
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1515
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1516
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1518
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1519
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1520
'RequireOp'(']', $P2)
.annotate 'line', 1521
setattribute self, 'list', $P1
# }
.annotate 'line', 1522

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1523
# Body
# {
.annotate 'line', 1525
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1526
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1527

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1528
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1529
# Body
# {
.annotate 'line', 1531
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1532
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1533
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1534
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1535
$P3 = $P2.'getname'()
$S1 = $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1536
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1533
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1539
.return($P3)
# }
.annotate 'line', 1540

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1503
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1547
# Body
# {
.annotate 'line', 1549
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1550
.return($S2)
# }
.annotate 'line', 1551

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1553
# Body
# {
.annotate 'line', 1555
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1556
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1558
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1559
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1561

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1563
# Body
# {
.annotate 'line', 1565
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1566
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1567
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1568
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1569
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1571
__ARG_2.'unget'($P1)
.annotate 'line', 1572
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1574

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1576
# Body
# {
.annotate 'line', 1578
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1579
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1580
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1581
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1582
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1583
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1584
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1586
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1587
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1588
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
.annotate 'line', 1590
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1592
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1595
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1597
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1599
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1601
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1603
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_13: # case
.annotate 'line', 1605
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_14: # case
.annotate 'line', 1607
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_15: # case
.annotate 'line', 1609
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_16: # case
.annotate 'line', 1611
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_17: # case
.annotate 'line', 1613
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_18: # case
.annotate 'line', 1615
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_19: # case
.annotate 'line', 1617
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_20: # case
.annotate 'line', 1619
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_21: # case
.annotate 'line', 1621
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1623
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_23: # case
.annotate 'line', 1625
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1627
$P30 = $P1.'isidentifier'()
if_null $P30, __label_24
unless $P30 goto __label_24
# {
.annotate 'line', 1628
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1629
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1630
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_25: # endif
.annotate 'line', 1631
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1633
__ARG_1.'unget'($P1)
.annotate 'line', 1634
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1636
unless_null $P2, __label_26
.annotate 'line', 1637
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1638
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1639

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1647
# Body
# {
.annotate 'line', 1649
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1650

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1651
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1652
# Body
# {
.annotate 'line', 1654
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1655

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1656
# Body
# {
.annotate 'line', 1658
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1659

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1660
# Body
# {
.annotate 'line', 1662
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1663

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1664
# Body
# {
.annotate 'line', 1666
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1667

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1668
# Body
# {
.annotate 'line', 1670
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1671

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1672
# Body
# {
.annotate 'line', 1674
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1675

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1676
# Body
# {
.annotate 'line', 1678
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1679

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1680
# Body
# {
.annotate 'line', 1682
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1683

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1684
# Body
# {
.annotate 'line', 1686
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1687

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1688
# Body
# {
.annotate 'line', 1690
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1691

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1693
# Body
# {
.annotate 'line', 1698
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1699

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1700
# Body
# {
.annotate 'line', 1702
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1703

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1707

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1708
# Body
# {
.annotate 'line', 1710
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1712
.return(self)
# }
.annotate 'line', 1713

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1645
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1718
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1719
# Body
# {
.annotate 'line', 1721
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1722

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1723
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1724
# Body
# {
# }
.annotate 'line', 1727

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1716
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1734
# Body
# {
.annotate 'line', 1736
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1737
$P1.'push'(__ARG_1)
.annotate 'line', 1738
$P1.'push'(__ARG_2)
.annotate 'line', 1739
setattribute self, 'statements', $P1
# }
.annotate 'line', 1740

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1741
# Body
# {
.annotate 'line', 1743
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1744
.return(self)
# }
.annotate 'line', 1745

.end # push


.sub 'optimize' :method

.annotate 'line', 1746
# Body
# {
.annotate 'line', 1748
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1749
.return(self)
# }
.annotate 'line', 1750

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1751
# Body
# {
.annotate 'line', 1753
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1754
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1755

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1732
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1758
# Body
# {
.annotate 'line', 1760
unless_null __ARG_1, __label_0
.annotate 'line', 1761
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1762
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1763
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1765
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1766

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1776
# Body
# {
.annotate 'line', 1778
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1779
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1780
# int dotted: $I1
null $I1
.annotate 'line', 1781
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1783
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1785
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1786
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
setattribute self, 'opname', $P3
.annotate 'line', 1787
$P1 = __ARG_2.'get'()
.annotate 'line', 1788
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1789
__ARG_2.'unget'($P1)
.annotate 'line', 1790
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1792
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1793

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1794
# Body
# {
.annotate 'line', 1796
self.'optimizeargs'()
.annotate 'line', 1797
.return(self)
# }
.annotate 'line', 1798

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1799
# Body
# {
.annotate 'line', 1801
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1802
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1803
__ARG_1.'comment'($S2)
.annotate 'line', 1804
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1805
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1807
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1808
self.'emitargs'(__ARG_1)
.annotate 'line', 1809
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1811

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1772
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1774
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1821
# Body
# {
.annotate 'line', 1823
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1824
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1825
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1826
# {
.annotate 'line', 1827
$P2 = __ARG_2.'get'()
.annotate 'line', 1828
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1829
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1830
'RequireOp'(';', $P2)
.annotate 'line', 1831
setattribute self, 'path', $P1
.annotate 'line', 1832
.return(self)
# }
.annotate 'line', 1833

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1834
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1835
# Body
# {
.annotate 'line', 1837
self.'annotate'(__ARG_1)
.annotate 'line', 1838
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1839

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1818
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1820
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1849
# Body
# {
.annotate 'line', 1851
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1852
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1853
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1854
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1855

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1856
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1857
# Body
# {
.annotate 'line', 1859
self.'annotate'(__ARG_1)
.annotate 'line', 1860
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1861
getattribute $P3, self, 'symbol'
.annotate 'line', 1860
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1862

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1846
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1848
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1872
# Body
# {
.annotate 'line', 1874
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1875
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1876
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1877
# {
.annotate 'line', 1878
$P2 = __ARG_2.'get'()
.annotate 'line', 1879
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1880
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1881
'RequireOp'(';', $P2)
.annotate 'line', 1882
setattribute self, 'path', $P1
# }
.annotate 'line', 1883

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1884
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1885
# Body
# {
.annotate 'line', 1887
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1888
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1889
self.'annotate'(__ARG_1)
.annotate 'line', 1891
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1893
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1894
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1896
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1899
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1901

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1869
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1871
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1911
# Body
# {
.annotate 'line', 1913
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1914
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1915
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1916

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1917
# Body
# {
.annotate 'line', 1919
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1920
.return(self)
# }
.annotate 'line', 1921

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1922
# Body
# {
.annotate 'line', 1924
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1925

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1908
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1910
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1935
# Body
# {
.annotate 'line', 1937
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1938

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 1939
# Body
# {
# predefined Error
.annotate 'line', 1941
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1942

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1934
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1949
# Body
# {
.annotate 'line', 1951
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1952

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1953
# Body
# {
.annotate 'line', 1955
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1956
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1957
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1958
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 1959
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1960
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1961
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['scope'] = self
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1966
.return($S2)
# }
.annotate 'line', 1967

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1968
# Body
# {
.annotate 'line', 1970
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1971
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1972
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1973
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1974
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1975
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['scope'] = self
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1980

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1981
# Body
# {
.annotate 'line', 1983
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1984
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1985
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1986
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1987
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1988
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1991
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1993
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1994
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1995
$P1[$S1] = $P3
# }
.annotate 'line', 1996

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1997
# Body
# {
.annotate 'line', 1999
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2000
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2001
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2002
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2003
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2004
.return($P2)
# }
.annotate 'line', 2005

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2006
# Body
# {
.annotate 'line', 2008
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2009
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2010
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2011
.return($P2)
# }
.annotate 'line', 2012

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2013
# Body
# {
.annotate 'line', 2015
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2016
# string lexname: $S1
$P3 = __ARG_1['reg']
$P2 = $P1.'createlex'($P3)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2017
.return($S1)
# }
.annotate 'line', 2018

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2019
# Body
# {
.annotate 'line', 2021
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2023
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2024
.return('__WLEX_self')
# }
.annotate 'line', 2025

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1948
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2034
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2044
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2045
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2046
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2047
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2048
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2049
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2050
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2051
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2052
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2053
# Body
# {
.annotate 'line', 2055
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2056

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2057
# Body
# {
.annotate 'line', 2059
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2060

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2061
# Body
# {
.annotate 'line', 2064
.return(self)
# }
.annotate 'line', 2065

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2066
# Body
# {
.annotate 'line', 2068
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2069
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2070
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2071
.return($S2)
# }
.annotate 'line', 2072

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2073
# Body
# {
.annotate 'line', 2075
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2076

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2042
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2081
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2079
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2089
# Body
# {
.annotate 'line', 2091
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2092
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2093
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2094
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2095
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2096

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2097
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2098
# Body
# {
.annotate 'line', 2100
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2101
.return(self)
# }
.annotate 'line', 2102

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2103
# Body
# {
.annotate 'line', 2105
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2106
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2107
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2108
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2109
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2110

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2086
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2088
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2123
# Body
# {
.annotate 'line', 2125
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2126
.return(self)
# }
.annotate 'line', 2127

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2128
# Body
# {
.annotate 'line', 2130
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2131

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2132
# Body
# {
.annotate 'line', 2134
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2135
.return(self)
# }
.annotate 'line', 2136

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2137
# Body
# {
.annotate 'line', 2139
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2140
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2141
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2143
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2144
ne $I1, 0, __label_4
.annotate 'line', 2145
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2147
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2150
.return(0)
# }
.annotate 'line', 2151

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2152
# Body
# {
.annotate 'line', 2154
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2156
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2157
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2158
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2160
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2161
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2162
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
.annotate 'line', 2165
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2168
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2171
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2174

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2175
# Body
# {
.annotate 'line', 2177
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2179
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2180
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2181
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2183
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2184
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2185
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
.annotate 'line', 2188
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2191
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2194
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2197

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2122
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2204
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2205
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2202
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2213
# Body
# {
.annotate 'line', 2215
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2216
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2217

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2218
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2219
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2220
# Body
# {
.annotate 'line', 2222
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2223
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2224
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2225
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2226
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2227
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2229
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2232
unless $I2 goto __label_4
# {
.annotate 'line', 2233
unless $I1 goto __label_5
# {
null $I1
.annotate 'line', 2235
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2237
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2238
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2240
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2243
# string result: $S4
set $S4, ''
.annotate 'line', 2244
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2245
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2246
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2247
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2248
le $I6, 127, __label_12
# {
.annotate 'line', 2249
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
.annotate 'line', 2250
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2253
# }
__label_9: # for iteration
.annotate 'line', 2245
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2255
# }
__label_4: # endif
.annotate 'line', 2257
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
.annotate 'line', 2259
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2261
.return($S1)
# }
.annotate 'line', 2262

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2263
# Body
# {
.annotate 'line', 2265
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2266
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2267
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2268
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2269
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2271
.return($S1)
# }
.annotate 'line', 2272

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2273
# Body
# {
.annotate 'line', 2275
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2276

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2277
# Body
# {
.annotate 'line', 2279
.tailcall self.'getPirString'()
# }
.annotate 'line', 2280

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2210
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2212
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2289
# Body
# {
.annotate 'line', 2292
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2293
setattribute self, 'pos', __ARG_2
.annotate 'line', 2294
# int n: $I1
null $I1
.annotate 'line', 2295
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2296
# {
.annotate 'line', 2298
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2299
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2301
setattribute self, 'numval', $P2
# }
.annotate 'line', 2302

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2303
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2304
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2305
# Body
# {
.annotate 'line', 2307
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2308
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2309
.return($I1)
# }
.annotate 'line', 2310

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2311
# Body
# {
.annotate 'line', 2313
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2314
ne $I1, 0, __label_0
.annotate 'line', 2315
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2317
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2318

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2319
# Body
# {
.annotate 'line', 2321
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2322

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2285
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2287
addattribute $P0, 'pos'
.annotate 'line', 2288
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2330
# Body
# {
.annotate 'line', 2332
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2333
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2334

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2335
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2336
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2337
# Body
# {
.annotate 'line', 2339
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2340
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2342
.return($P1)
# }
.annotate 'line', 2343

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2344
# Body
# {
.annotate 'line', 2346
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2347
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2348

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2349
# Body
# {
.annotate 'line', 2353
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2354
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2356
.return($S1)
# }
.annotate 'line', 2357

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2327
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2329
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2365
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2366
# Body
# {
.annotate 'line', 2368
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2369
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2370

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2371
# Body
# {
.annotate 'line', 2373
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2374

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2378
if_null $P1, __label_0
$P2 = $P1['type']
.annotate 'line', 2379
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2381
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
.annotate 'line', 2384
.return('P')
__label_3: # default
.annotate 'line', 2386
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2389

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2390
# Body
# {
.annotate 'line', 2392
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2393
.return($S1)
# }
.annotate 'line', 2394

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2395
# Body
# {
.annotate 'line', 2397
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2398
unless_null $P1, __label_0
.annotate 'line', 2399
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2400
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2401
# string s: $S1
null $S1
.annotate 'line', 2402
unless_null $P2, __label_1
# {
.annotate 'line', 2403
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2404
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
.annotate 'line', 2410
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2414
$P4 = $P2['id']
if_null $P4, __label_8
$P5 = $P2['id']
.annotate 'line', 2415
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2417
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2419
.return($S1)
# }
.annotate 'line', 2420

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2421
# Body
# {
.annotate 'line', 2423
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2424
$S2 = $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2425
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2426
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2428
.return($P1)
# }
.annotate 'line', 2429

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2430
# Body
# {
.annotate 'line', 2432
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2433
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2434
if_null $P2, __label_0
# {
.annotate 'line', 2435
$I1 = $P2['const']
unless $I1 goto __label_2
$P3 = $P2['id']
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2436
.return($P4)
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2438
.return(self)
# }
.annotate 'line', 2439

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2440
# Body
# {
.annotate 'line', 2442
self.'annotate'(__ARG_1)
.annotate 'line', 2443
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2444

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2445
# Body
# {
.annotate 'line', 2447
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2448

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2449
# Body
# {
.annotate 'line', 2451
self.'annotate'(__ARG_1)
.annotate 'line', 2452
# string typeleft: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2453
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2454
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2455
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2458
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2461
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2464
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2465
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2467
# string typeright: $S3
$P2 = __ARG_2.'checkresult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2468
ne $S1, $S3, __label_11
# {
.annotate 'line', 2469
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2472
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2473
self.'annotate'(__ARG_1)
.annotate 'line', 2474
iseq $I1, $S1, 'P'
unless $I1 goto __label_16
isne $I1, $S3, 'P'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 2475
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2477
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2480
.return($S2)
# }
.annotate 'line', 2481

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2362
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2364
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2488
# Body
# {
.annotate 'line', 2490
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2491

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2486
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2499
# Body
# {
.annotate 'line', 2501
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2502
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2503

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2504
# Body
# {
.annotate 'line', 2506
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2507

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2508
# Body
# {
.annotate 'line', 2510
self.'optimizearg'()
.annotate 'line', 2511
.return(self)
# }
.annotate 'line', 2512

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2496
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2498
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2521
# Body
# {
.annotate 'line', 2523
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2524
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2525
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2526

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2527
# Body
# {
.annotate 'line', 2529
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2530
.return(self)
# }
.annotate 'line', 2531

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2532
# Body
# {
.annotate 'line', 2534
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2535

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2536
# Body
# {
.annotate 'line', 2538
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2539
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2540

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2541
# Body
# {
.annotate 'line', 2543
self.'optimizearg'()
.annotate 'line', 2544
.return(self)
# }
.annotate 'line', 2545

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2517
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2519
addattribute $P0, 'lexpr'
.annotate 'line', 2520
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2552
# Body
# {
.annotate 'line', 2554
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2555

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2556
# Body
# {
.annotate 'line', 2558
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2559
.return(self)
# }
.annotate 'line', 2560

.end # set


.sub 'optimize' :method

.annotate 'line', 2561
# Body
# {
.annotate 'line', 2563
self.'optimizearg'()
.annotate 'line', 2564
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2565
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2566
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2567
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2570
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2571
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2572
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2573
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2576
.return(self)
# }
.annotate 'line', 2577

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2578
# Body
# {
.annotate 'line', 2580
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2581
self.'annotate'(__ARG_1)
.annotate 'line', 2582
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2583

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2550
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2590
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2591
# Body
# {
.annotate 'line', 2593
.return('I')
# }
.annotate 'line', 2594

.end # checkresult


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


.sub 'optimize' :method

.annotate 'line', 2600
# Body
# {
.annotate 'line', 2602
self.'optimizearg'()
.annotate 'line', 2603
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2604
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2605
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2606
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2607
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2609
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2610
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2611
.return(self)
# }
.annotate 'line', 2612

.end # optimize


.sub 'negated' :method

.annotate 'line', 2613
# Body
# {
.annotate 'line', 2615
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2616

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2617
# Body
# {
.annotate 'line', 2619
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2620
self.'annotate'(__ARG_1)
.annotate 'line', 2621
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2622
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2624
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2627
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2630
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2632

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2588
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2639
# Body
# {
.annotate 'line', 2641
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2642

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2643
# Body
# {
.annotate 'line', 2645
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2646
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2647
.return(self)
# }
.annotate 'line', 2648

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2649
# Body
# {
.annotate 'line', 2651
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2652
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2653
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2654

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2655
# Body
# {
.annotate 'line', 2657
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2658
self.'annotate'(__ARG_1)
.annotate 'line', 2659
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2660
.return($S1)
# }
.annotate 'line', 2661

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2637
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2668
# Body
# {
.annotate 'line', 2670
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2671
.return(self)
# }
.annotate 'line', 2672

.end # set


.sub 'checkresult' :method

.annotate 'line', 2673
# Body
# {
.annotate 'line', 2675
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2676

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2677
# Body
# {
.annotate 'line', 2679
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2680
self.'annotate'(__ARG_1)
.annotate 'line', 2681
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2682
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2683
.return($S1)
# }
.annotate 'line', 2684

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2666
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2691
# Body
# {
.annotate 'line', 2693
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2694

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2695
# Body
# {
.annotate 'line', 2697
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2698
.return(self)
# }
.annotate 'line', 2699

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2700
# Body
# {
.annotate 'line', 2702
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2703
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2704
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2705

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2706
# Body
# {
.annotate 'line', 2708
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2709
self.'annotate'(__ARG_1)
.annotate 'line', 2710
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2711
.return($S1)
# }
.annotate 'line', 2712

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2689
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2719
# Body
# {
.annotate 'line', 2721
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2722
.return(self)
# }
.annotate 'line', 2723

.end # set


.sub 'checkresult' :method

.annotate 'line', 2724
# Body
# {
.annotate 'line', 2726
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2727

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2728
# Body
# {
.annotate 'line', 2730
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2731
self.'annotate'(__ARG_1)
.annotate 'line', 2732
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2733
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2734
.return($S1)
# }
.annotate 'line', 2735

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2717
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2744
# Body
# {
.annotate 'line', 2746
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2747
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2748
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2749
.return(self)
# }
.annotate 'line', 2750

.end # set


.sub 'checkresult' :method

.annotate 'line', 2751
# Body
# {
.annotate 'line', 2753
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2754
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2756
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2757

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2758
# Body
# {
.annotate 'line', 2760
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2761
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2762
.return(self)
# }
.annotate 'line', 2763

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2764
# Body
# {
.annotate 'line', 2766
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2767

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2740
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2742
addattribute $P0, 'lexpr'
.annotate 'line', 2743
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2774
# Body
# {
.annotate 'line', 2776
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2777
$S2 = __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 2778
self.'annotate'(__ARG_1)
.annotate 'line', 2779
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2781

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2782
# Body
# {
.annotate 'line', 2784
self.'annotate'(__ARG_1)
.annotate 'line', 2785
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2786
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2787

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2772
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2794
# Body
# {
.annotate 'line', 2796
self.'annotate'(__ARG_1)
.annotate 'line', 2797
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2798
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2799
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2800

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2801
# Body
# {
.annotate 'line', 2803
self.'annotate'(__ARG_1)
.annotate 'line', 2804
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2805
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2806
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2807
.return($S1)
# }
.annotate 'line', 2808

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2792
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2818
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2819
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2820

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2821
# Body
# {
.annotate 'line', 2823
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2824
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2825
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2826
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2827
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2828
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2830
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2831
self.'annotate'(__ARG_1)
.annotate 'line', 2832
ne $S1, 'S', __label_6
# {
.annotate 'line', 2833
$P4 = $P2.'checkresult'()
$S5 = $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2834
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2835
__ARG_1.'say'($S4, ' = ', $S3)
set $S3, $S4
.annotate 'line', 2836
# }
__label_8: # endif
.annotate 'line', 2838
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2841
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2843
.return($S2)
# }
.annotate 'line', 2844

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2813
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2851
# Body
# {
.annotate 'line', 2853
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2854
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2855
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2856

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2857
# Body
# {
.annotate 'line', 2859
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2860
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2861
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2862
self.'annotate'(__ARG_1)
.annotate 'line', 2863
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2864
.return($S2)
# }
.annotate 'line', 2865

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2849
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2872
# Body
# {
.annotate 'line', 2874
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2875
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2876
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2877

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2878
# Body
# {
.annotate 'line', 2880
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2881
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2882
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2883
self.'annotate'(__ARG_1)
.annotate 'line', 2884
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2885
.return($S2)
# }
.annotate 'line', 2886

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2870
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2893
# Body
# {
.annotate 'line', 2895
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2896
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2897
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2898

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2899
# Body
# {
.annotate 'line', 2901
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2902
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2903
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2904
self.'annotate'(__ARG_1)
.annotate 'line', 2905
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2906
.return($S2)
# }
.annotate 'line', 2907

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2891
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2914
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2915
# Body
# {
.annotate 'line', 2917
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2918
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2919
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2920
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2921
self.'annotate'(__ARG_1)
.annotate 'line', 2922
# string aux: $S5
null $S5
.annotate 'line', 2923
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2925
ne $S1, 'I', __label_7
# {
.annotate 'line', 2926
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2927
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2928
# }
__label_7: # endif
.annotate 'line', 2930
ne $S2, 'I', __label_8
# {
.annotate 'line', 2931
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2932
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2933
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2936
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2937
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2938
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2939
# }
goto __label_10
__label_9: # else
.annotate 'line', 2941
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2942
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2943
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2944
# }
goto __label_13
__label_12: # else
.annotate 'line', 2946
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 2947
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2948
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2949
# }
goto __label_16
__label_15: # else
.annotate 'line', 2951
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 2952
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2953
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2954
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 2957
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 2959
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 2962
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 2965
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 2966
# }
.annotate 'line', 2968

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2969
# Body
# {
.annotate 'line', 2971
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2972

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2973
# Body
# {
.annotate 'line', 2975
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 2976

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2977
# Body
# {
.annotate 'line', 2979
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 2980

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2912
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 2993
# Body
# {
.annotate 'line', 2995
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2996
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 2997
setattribute self, 'checknull', $P2
# }
.annotate 'line', 2998

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 2999
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3000
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3001
# Body
# {
.annotate 'line', 3003
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3004
setattribute self, 'checknull', $P1
.annotate 'line', 3005
.return(self)
# }
.annotate 'line', 3006

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3007
# Body
# {
.annotate 'line', 3009
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3010
self.'annotate'(__ARG_1)
.annotate 'line', 3011
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3012
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3013
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3014

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3015
# Body
# {
.annotate 'line', 3017
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3018
self.'annotate'(__ARG_1)
.annotate 'line', 3019
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
.annotate 'line', 3020

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2988
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2990
addattribute $P0, 'expr'
.annotate 'line', 2991
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

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
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3031

.end # negated


.sub 'optimize' :method

.annotate 'line', 3032
# Body
# {
.annotate 'line', 3034
self.'optimizearg'()
.annotate 'line', 3035
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3036
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3037
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3038
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3039
unless $I1 goto __label_0
# {
.annotate 'line', 3040
unless $I2 goto __label_1
.annotate 'line', 3041
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3043
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3045
unless $I2 goto __label_3
.annotate 'line', 3046
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3047
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3048
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3049
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3050
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3051
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3052
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3053
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3056
.return(self)
# }
.annotate 'line', 3057

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3061

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3065

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3066
# Body
# {
.annotate 'line', 3068
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3069

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3070
# Body
# {
.annotate 'line', 3072
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3073

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3025
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3080
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3081
# Body
# {
.annotate 'line', 3083
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3084

.end # negated


.sub 'optimize' :method

.annotate 'line', 3085
# Body
# {
.annotate 'line', 3087
self.'optimizearg'()
.annotate 'line', 3088
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3089
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3090
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3091
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3092
unless $I1 goto __label_0
# {
.annotate 'line', 3093
unless $I2 goto __label_1
.annotate 'line', 3094
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3096
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3098
unless $I2 goto __label_3
.annotate 'line', 3099
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3100
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3101
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3102
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3103
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3104
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3105
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3106
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3109
.return(self)
# }
.annotate 'line', 3110

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3111
# Body
# {
.annotate 'line', 3113
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3114

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3115
# Body
# {
.annotate 'line', 3117
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3118

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3119
# Body
# {
.annotate 'line', 3121
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3122

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3123
# Body
# {
.annotate 'line', 3125
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3126

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3078
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

.annotate 'line', 3134
# Body
# {
.annotate 'line', 3136
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3137
setattribute self, 'positive', $P1
# }
.annotate 'line', 3138

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3139
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3140
# Body
# {
.annotate 'line', 3142
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3143
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
.annotate 'line', 3144

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3145
# Body
# {
.annotate 'line', 3147
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3148
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3149
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3150

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3151
# Body
# {
.annotate 'line', 3153
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3154

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3155
# Body
# {
.annotate 'line', 3157
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3158
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3159
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3160

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3161
# Body
# {
.annotate 'line', 3163
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3164
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3165
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3166

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3131
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3133
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3173
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3174
# Body
# {
.annotate 'line', 3176
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3177

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3178
# Body
# {
.annotate 'line', 3180
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3181

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3185

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3186
# Body
# {
.annotate 'line', 3188
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3189

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3171
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3196
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3197
# Body
# {
.annotate 'line', 3199
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3200

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3201
# Body
# {
.annotate 'line', 3203
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3204

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3205
# Body
# {
.annotate 'line', 3207
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3208

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3212

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3194
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3219
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3220
# Body
# {
.annotate 'line', 3222
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3223

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3224
# Body
# {
.annotate 'line', 3226
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3227

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3228
# Body
# {
.annotate 'line', 3230
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3231

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3232
# Body
# {
.annotate 'line', 3234
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3235

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3217
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3242
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3243
# Body
# {
.annotate 'line', 3245
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3246

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3247
# Body
# {
.annotate 'line', 3249
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3250

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3251
# Body
# {
.annotate 'line', 3253
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3254

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3255
# Body
# {
.annotate 'line', 3257
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3258

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3240
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3265
# Body
# {
.annotate 'line', 3267
.return('I')
# }
.annotate 'line', 3268

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3263
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3275
# Body
# {
.annotate 'line', 3277
self.'optimizearg'()
.annotate 'line', 3278
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3279
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3280
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3281
eq $I1, 0, __label_1
.annotate 'line', 3282
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3284
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3286
.return(self)
# }
.annotate 'line', 3287

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3288
# Body
# {
.annotate 'line', 3290
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
.annotate 'line', 3291
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3292
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3293
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3294
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3295
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3296
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3299
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3300
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3301
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3302
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3303
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3305

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3273
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3312
# Body
# {
.annotate 'line', 3314
self.'optimizearg'()
.annotate 'line', 3315
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3316
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3317
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3318
ne $I1, 0, __label_1
.annotate 'line', 3319
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3321
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3323
.return(self)
# }
.annotate 'line', 3324

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3325
# Body
# {
.annotate 'line', 3327
# string res: $S1
null $S1
.annotate 'line', 3328
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3331
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3332
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3333
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3334
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3335
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3336
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3337
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3340
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3341
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3342
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3343
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3344
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3346

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3310
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3353
# Body
# {
.annotate 'line', 3355
.return('I')
# }
.annotate 'line', 3356

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3351
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3363
# Body
# {
.annotate 'line', 3365
self.'optimizearg'()
.annotate 'line', 3366
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3367
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3368
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3369
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3370
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3371
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3373
.return(self)
# }
.annotate 'line', 3374

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3375
# Body
# {
.annotate 'line', 3377
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
.annotate 'line', 3378
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3379
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3380
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3381
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3382
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3383

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3361
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3390
# Body
# {
.annotate 'line', 3392
self.'optimizearg'()
.annotate 'line', 3393
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3394
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3395
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3396
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3397
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3398
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3400
.return(self)
# }
.annotate 'line', 3401

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3402
# Body
# {
.annotate 'line', 3404
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
.annotate 'line', 3405
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3406
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3407
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3408
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3409
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3410

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3388
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3418
# Body
# {
.annotate 'line', 3420
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3421
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3422
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3423
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3424
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3426
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3428
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3429
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3430
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3433
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3434

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3435
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3436
# Body
# {
.annotate 'line', 3438
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3439
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3440
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3441
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3442
ge $I2, $I1, __label_1
.annotate 'line', 3443
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3442
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3444
.return($P2)
# }
.annotate 'line', 3445

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3446
# Body
# {
.annotate 'line', 3448
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3449
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3450
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3451
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3452
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3453
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3454
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3453
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3455
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3456

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3457
# Body
# {
.annotate 'line', 3459
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3460
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3461
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3462
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3463
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3464
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3465
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3464
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3466
.return($S1)
# }
.annotate 'line', 3467

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3468
# Body
# {
.annotate 'line', 3470
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3471
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3472
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3473
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3474
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3473
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3475

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3415
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3417
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3482
# Body
# {
.annotate 'line', 3484
self.'optimizearg'()
.annotate 'line', 3485
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3486
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3487
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3488
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3489
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3490
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3491
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3492
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3493
# var t: $P5
null $P5
.annotate 'line', 3494
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3495
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3496
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3497
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3499
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3500
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3502
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3503
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3504
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3505
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3506
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3507
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3510
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3511
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3512
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3513
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3514
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3515
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3519
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3520
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3522
.return(self)
# }
.annotate 'line', 3523

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3524
# Body
# {
.annotate 'line', 3526
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3527
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3528
ne $S1, $S2, __label_2
.annotate 'line', 3529
.return($S1)
__label_2: # endif
.annotate 'line', 3530
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3531
.return('S')
__label_3: # endif
.annotate 'line', 3532
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3533
.return('S')
__label_5: # endif
.annotate 'line', 3534
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3535
.return('N')
__label_7: # endif
.annotate 'line', 3536
.return('I')
# }
.annotate 'line', 3537

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3538
# Body
# {
.annotate 'line', 3540
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3541
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3542
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3543
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3544
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3546
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3547
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3548
ne $S1, 'S', __label_5
# {
.annotate 'line', 3549
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3550
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3551
eq $S2, 'S', __label_10
# {
.annotate 'line', 3552
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3553
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3556
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3557
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3560
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3563
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3564
# string l: $S7
null $S7
.annotate 'line', 3565
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3567
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3568
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3570
# string r: $S8
null $S8
.annotate 'line', 3571
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3573
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3574
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3576
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3579
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3581

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3480
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3588
# Body
# {
.annotate 'line', 3590
self.'optimizearg'()
.annotate 'line', 3591
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3592
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3593
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3594
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3595
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3596
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3597
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3598
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3599
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3600
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3601
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3604
.return(self)
# }
.annotate 'line', 3605

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3606
# Body
# {
.annotate 'line', 3608
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3609
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3610
ne $S1, $S2, __label_2
.annotate 'line', 3611
.return($S1)
__label_2: # endif
.annotate 'line', 3612
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3613
.return('N')
__label_3: # endif
.annotate 'line', 3614
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3615
.return('N')
__label_5: # endif
.annotate 'line', 3616
.return('I')
# }
.annotate 'line', 3617

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3618
# Body
# {
.annotate 'line', 3620
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3621
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3622
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3623

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3586
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3630
# Body
# {
.annotate 'line', 3632
self.'optimizearg'()
.annotate 'line', 3633
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3634
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3635
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3636
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3637
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3638
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3639
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3640
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3641
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3642
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3643
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3646
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3647
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3648
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3649
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3650
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3651
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3655
.return(self)
# }
.annotate 'line', 3656

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3657
# Body
# {
.annotate 'line', 3659
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3660
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3661
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3662
ne $S1, $S2, __label_2
.annotate 'line', 3663
.return($S1)
__label_2: # endif
.annotate 'line', 3664
ne $S1, 'S', __label_3
.annotate 'line', 3665
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3667
.return('N')
__label_4: # endif
# }
.annotate 'line', 3668

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3669
# Body
# {
.annotate 'line', 3671
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3672
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3673
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3674
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3675
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3676
ne $S1, 'S', __label_2
# {
.annotate 'line', 3677
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3678
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3679
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3680
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3685
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3686
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3688
self.'annotate'(__ARG_1)
.annotate 'line', 3689
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3690
.return()
# }
__label_2: # endif
.annotate 'line', 3692
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
.annotate 'line', 3693
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3694
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3695
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3696
.return()
# }
__label_6: # endif
.annotate 'line', 3701
ne $S1, 'N', __label_10
# {
.annotate 'line', 3702
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3703
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3704
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3705
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3707
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3708
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3715
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3716
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3718
self.'annotate'(__ARG_1)
.annotate 'line', 3719
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3720
.return()
# }
__label_10: # endif
.annotate 'line', 3723
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3724
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3725
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3726
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3729
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3730
# }
__label_16: # endif
.annotate 'line', 3732
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3733
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3734
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3737
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3739
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3740
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3744
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3746
# }
__label_19: # endif
.annotate 'line', 3749
self.'annotate'(__ARG_1)
.annotate 'line', 3750
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3751

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3628
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3758
# Body
# {
.annotate 'line', 3760
self.'optimizearg'()
.annotate 'line', 3761
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3762
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3763
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3764
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3765
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3766
# var lval: $P3
null $P3
.annotate 'line', 3767
# var rval: $P4
null $P4
.annotate 'line', 3768
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3769
getattribute $P3, $P1, 'numval'
.annotate 'line', 3770
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3771
getattribute $P4, $P2, 'numval'
.annotate 'line', 3772
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3773
eq $I2, 0, __label_6
.annotate 'line', 3774
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
.annotate 'line', 3777
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3778
getattribute $P3, $P1, 'numval'
.annotate 'line', 3779
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3780
getattribute $P4, $P2, 'numval'
.annotate 'line', 3781
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3782
eq $N2, $N3, __label_8
.annotate 'line', 3783
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
.annotate 'line', 3787
.return(self)
# }
.annotate 'line', 3788

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3789
# Body
# {
.annotate 'line', 3791
.return('N')
# }
.annotate 'line', 3792

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3793
# Body
# {
.annotate 'line', 3795
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3796
# var lreg: $P2
null $P2
.annotate 'line', 3797
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'N', __label_0
.annotate 'line', 3798
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3800
$P2 = self.'tempreg'('N')
.annotate 'line', 3801
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3803
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3804
# var rreg: $P4
null $P4
.annotate 'line', 3805
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'N', __label_2
.annotate 'line', 3806
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3808
$P4 = self.'tempreg'('N')
.annotate 'line', 3809
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3811
self.'annotate'(__ARG_1)
.annotate 'line', 3812
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3813

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3756
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3820
# Body
# {
.annotate 'line', 3822
.return('I')
# }
.annotate 'line', 3823

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3824
# Body
# {
.annotate 'line', 3826
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3827
# var lreg: $P2
null $P2
.annotate 'line', 3828
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3829
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3831
$P2 = self.'tempreg'('I')
.annotate 'line', 3832
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3834
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3835
# var rreg: $P4
null $P4
.annotate 'line', 3836
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3837
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3839
$P4 = self.'tempreg'('I')
.annotate 'line', 3840
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3842
self.'annotate'(__ARG_1)
.annotate 'line', 3843
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3844

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3818
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3851
# Body
# {
.annotate 'line', 3853
.return('I')
# }
.annotate 'line', 3854

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3855
# Body
# {
.annotate 'line', 3857
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3858
# var lreg: $P2
null $P2
.annotate 'line', 3859
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3860
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3862
$P2 = self.'tempreg'('I')
.annotate 'line', 3863
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3865
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3866
# var rreg: $P4
null $P4
.annotate 'line', 3867
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3868
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3870
$P4 = self.'tempreg'('I')
.annotate 'line', 3871
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3873
self.'annotate'(__ARG_1)
.annotate 'line', 3878
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3879

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3849
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3888
# Body
# {
.annotate 'line', 3890
setattribute self, 'arg', __ARG_1
.annotate 'line', 3891
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3892

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3893
# Body
# {
.annotate 'line', 3895
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3896
.return(self)
# }
.annotate 'line', 3897

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3898
# Body
# {
.annotate 'line', 3900
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3901

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3886
addattribute $P0, 'arg'
.annotate 'line', 3887
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3904
# Body
# {
.annotate 'line', 3906
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3907
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3908
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3909
.return(1)
# }
.annotate 'line', 3910

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3919
# Body
# {
.annotate 'line', 3921
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3922
setattribute self, 'predef', __ARG_3
.annotate 'line', 3923
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3924

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 3925
# Body
# {
.annotate 'line', 3927
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3928

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3929
# Body
# {
.annotate 'line', 3931
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3932
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3933
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3934
# var arg: $P4
null $P4
.annotate 'line', 3935
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 3936
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 3938
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 3939
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 3940
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 3944
# var rawargs: $P5
root_new $P8, ['parrot';'ResizablePMCArray']
set $P5, $P8
.annotate 'line', 3945
iter $P10, $P2
set $P10, 0
__label_7: # for iteration
unless $P10 goto __label_8
shift $P4, $P10
.annotate 'line', 3946
getattribute $P11, $P4, 'arg'
$P5.'push'($P11)
goto __label_7
__label_8: # endfor
.annotate 'line', 3947
getattribute $P12, self, 'predef'
getattribute $P13, self, 'start'
$P12.'expand'(__ARG_1, self, $P13, __ARG_2, $P5)
.annotate 'line', 3948
.return()
__label_1: # default
.annotate 'line', 3950
# int n: $I2
getattribute $P14, self, 'args'
set $I2, $P14
# for loop
.annotate 'line', 3951
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 3952
$P15 = $P2[$I3]
getattribute $P4, $P15, 'arg'
.annotate 'line', 3953
# string argtype: $S2
$P9 = $P4.'checkresult'()
null $S2
if_null $P9, __label_12
set $S2, $P9
__label_12:
.annotate 'line', 3954
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 3955
# string argr: $S4
null $S4
.annotate 'line', 3956
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 3957
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 3959
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 3960
ne $S3, 'P', __label_17
# {
.annotate 'line', 3961
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3962
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
.annotate 'line', 3967
eq $S5, '', __label_23
.annotate 'line', 3968
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 3970
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 3972
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 3951
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 3975
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 3976

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3914
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3916
addattribute $P0, 'predef'
.annotate 'line', 3917
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3986
# Body
# {
.annotate 'line', 3988
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3989
setattribute self, 'funref', __ARG_4
.annotate 'line', 3990
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3991
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3992
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3993
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3994
# {
.annotate 'line', 3995
# var modifier: $P2
null $P2
.annotate 'line', 3996
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3997
$P1 = __ARG_1.'get'()
.annotate 'line', 3998
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3999
$P1 = __ARG_1.'get'()
.annotate 'line', 4000
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4001
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4002
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4005
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4008
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4009
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4010
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4011
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4013

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4014
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4015
# Body
# {
.annotate 'line', 4017
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4018
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4019
'optimize_array'($P1)
.annotate 'line', 4022
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4023
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4024
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4025
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4026
if_null $P3, __label_2
# {
.annotate 'line', 4027
self.'use_predef'($S1)
.annotate 'line', 4030
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4031
if_null $P4, __label_3
# {
.annotate 'line', 4032
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4033
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4036
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
.annotate 'line', 4040
.return(self)
# }
.annotate 'line', 4041

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4042
# Body
# {
.annotate 'line', 4044
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4045
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4046
# string call: $S1
null $S1
.annotate 'line', 4047
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4048
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4049
ne $S1, '', __label_2
# {
.annotate 'line', 4050
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4051
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4055
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4057
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4058
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4059
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4060
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4061
# string reg: $S3
null $S3
.annotate 'line', 4062
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4063
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4064
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4067
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4068
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4070
self.'annotate'(__ARG_1)
.annotate 'line', 4072
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 4073
$S9 = __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 4074
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4076
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 4079
unless $I1 goto __label_14
.annotate 'line', 4080
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4082
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4084
__ARG_1.'print'('(')
.annotate 'line', 4086
# string sep: $S4
set $S4, ''
.annotate 'line', 4087
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4088
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4089
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4090
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4091
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4092
# string setname: $S6
set $S6, ''
.annotate 'line', 4093
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4094
if_null $P6, __label_19
# {
.annotate 'line', 4095
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4096
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4097
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4099
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4101
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
.annotate 'line', 4105
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4106
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4107
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4108
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4111
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
.annotate 'line', 4116
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4117
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4118
unless $I4 goto __label_32
.annotate 'line', 4119
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4120
unless $I5 goto __label_34
# {
.annotate 'line', 4121
__ARG_1.'print'(' :named')
.annotate 'line', 4122
eq $S6, '', __label_35
.annotate 'line', 4123
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4125
# }
__label_16: # for iteration
.annotate 'line', 4088
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4127
__ARG_1.'say'(')')
# }
.annotate 'line', 4128

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3981
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3983
addattribute $P0, 'funref'
.annotate 'line', 3984
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4138
# Body
# {
.annotate 'line', 4140
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4141
setattribute self, 'left', __ARG_4
.annotate 'line', 4142
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4143

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4144
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4145
# Body
# {
.annotate 'line', 4147
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4148
.return(self)
# }
.annotate 'line', 4149

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4150
# Body
# {
.annotate 'line', 4152
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4153

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4154
# Body
# {
.annotate 'line', 4156
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4157
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4158
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4159
eq $S1, 'P', __label_2
# {
.annotate 'line', 4160
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4161
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4162
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4164
.return($S2)
# }
.annotate 'line', 4165

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4166
# Body
# {
.annotate 'line', 4168
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4169
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4170
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4171
self.'annotate'(__ARG_1)
.annotate 'line', 4172
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4173
.return($S3)
# }
.annotate 'line', 4174

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4175
# Body
# {
.annotate 'line', 4177
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4178
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4179
self.'annotate'(__ARG_1)
.annotate 'line', 4180
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4181

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4182
# Body
# {
.annotate 'line', 4184
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4185
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4186
# string value: $S3
null $S3
.annotate 'line', 4187
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4189
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4190
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4191
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4193
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4196
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4197
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4199
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4200

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4201
# Body
# {
.annotate 'line', 4203
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4204
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4205
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4206
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4207
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4209
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4210
$P4 = __ARG_2.'checkresult'()
$S5 = $P4
eq $S5, 'P', __label_6
.annotate 'line', 4211
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4213
# }
__label_4: # endif
.annotate 'line', 4215
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4216
.return($S3)
# }
.annotate 'line', 4217

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4133
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4135
addattribute $P0, 'left'
.annotate 'line', 4136
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4226
# Body
# {
.annotate 'line', 4228
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4229
setattribute self, 'left', __ARG_4
.annotate 'line', 4230
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4231

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4232
# Body
# {
.annotate 'line', 4234
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
$S1 = $P1
ne $S1, 'S', __label_0
.annotate 'line', 4235
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4237
.return('P')
__label_1: # endif
# }
.annotate 'line', 4238

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4239
# Body
# {
.annotate 'line', 4241
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4242
self.'optimizeargs'()
.annotate 'line', 4243
.return(self)
# }
.annotate 'line', 4244

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4245
# Body
# {
.annotate 'line', 4247
# var regleft: $P1
null $P1
.annotate 'line', 4248
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4249
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4251
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4252
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4253
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4254
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4255
ne $S1, 'S', __label_3
# {
.annotate 'line', 4256
eq $I1, 1, __label_5
.annotate 'line', 4257
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4258
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4261
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4262
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4263
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4265

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4266
# Body
# {
.annotate 'line', 4268
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4269
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4270
self.'annotate'(__ARG_1)
.annotate 'line', 4271
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4272
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4273
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4274

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4275
# Body
# {
.annotate 'line', 4277
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4278
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4279
# string rreg: $S1
null $S1
.annotate 'line', 4280
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4281
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4282
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4285
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4286
self.'annotate'(__ARG_1)
.annotate 'line', 4287
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4288
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4289
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4290
.return($S1)
# }
.annotate 'line', 4291

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4222
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4224
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4300
# Body
# {
.annotate 'line', 4302
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4303
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4304
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4305
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4306
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4307
# {
.annotate 'line', 4308
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4309
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4310
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4311
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4312
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4314

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4315
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4316
# Body
# {
.annotate 'line', 4318
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4319
.return(self)
# }
.annotate 'line', 4320

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4321
# Body
# {
.annotate 'line', 4323
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4324
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4325

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4326
# Body
# {
.annotate 'line', 4328
self.'annotate'(__ARG_1)
.annotate 'line', 4329
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4330
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4331
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4332
# string itemreg: $S3
null $S3
.annotate 'line', 4333
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4334
# string type: $S4
$P5 = $P1.'checkresult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4335
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
.annotate 'line', 4337
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4338
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4342
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4344
self.'annotate'(__ARG_1)
.annotate 'line', 4345
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4347
.return($S1)
# }
.annotate 'line', 4348

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4296
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4298
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4358
# Body
# {
.annotate 'line', 4360
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4361
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4362
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4363
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4364
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4365
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4366
# {
.annotate 'line', 4367
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4368
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4369
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4370
$P2.'push'($P4)
.annotate 'line', 4371
$P3.'push'($P5)
# }
.annotate 'line', 4373
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4374
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4375
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4377
setattribute self, 'keys', $P2
.annotate 'line', 4378
setattribute self, 'values', $P3
# }
.annotate 'line', 4379

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4380
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4381
# Body
# {
.annotate 'line', 4383
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4384
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4385
.return(self)
# }
.annotate 'line', 4386

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4387
# Body
# {
.annotate 'line', 4389
self.'annotate'(__ARG_1)
.annotate 'line', 4390
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4391
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4392
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4393
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4394
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4395
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4396
# string item: $S1
null $S1
.annotate 'line', 4397
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4398
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4399
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4400
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4403
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4405
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4406
# string itemreg: $S3
null $S3
.annotate 'line', 4407
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4408
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4409
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4410
# {
.annotate 'line', 4412
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4413
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
unless_null $P9, __label_13
# {
.annotate 'line', 4414
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4415
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4418
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4422
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4423
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
__label_0: # for iteration
.annotate 'line', 4394
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4425

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4426
# Body
# {
.annotate 'line', 4428
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4429
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4430
.return($S1)
# }
.annotate 'line', 4431

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4353
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4355
addattribute $P0, 'keys'
.annotate 'line', 4356
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4440
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4441
# Body
# {
.annotate 'line', 4445
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4446
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4447
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4448
__ARG_1.'unget'($P2)
.annotate 'line', 4449
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4450
# {
.annotate 'line', 4451
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4452
$P3.'push'($P4)
# }
.annotate 'line', 4453
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4454
setattribute self, 'initializer', $P3
.annotate 'line', 4455
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4457

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4436
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4438
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4466
# Body
# {
.annotate 'line', 4468
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4470
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4471
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4472
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4473
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4474
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4475
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4476
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4477
# {
.annotate 'line', 4478
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4479
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4480
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4481
$P2.'push'($P3)
# }
.annotate 'line', 4482
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4483
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4486
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4489
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4491
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4492
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4494
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4495

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4496
# Body
# {
.annotate 'line', 4498
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4499
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4502
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4503
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4504
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4505
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4506
$P1 = $P3['value']
.annotate 'line', 4507
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4508
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4509
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4512
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4516
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4517
if_null $P4, __label_7
.annotate 'line', 4518
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4519
.return(self)
# }
.annotate 'line', 4520

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4521
# Body
# {
.annotate 'line', 4523
self.'annotate'(__ARG_1)
.annotate 'line', 4525
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4526
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
.annotate 'line', 4529
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4530
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4531
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
.annotate 'line', 4533
# string reginit: $S1
set $S1, ''
.annotate 'line', 4534
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4535
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4536
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4540
ne $I2, 1, __label_13
.annotate 'line', 4541
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4543
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4544
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4545
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4549
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4550
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4551
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4554
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4557
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4558
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4559
unless_null $P3, __label_23
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4560
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4564
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4565
le $I1, 1, __label_24
# {
.annotate 'line', 4566
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4570
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4571
# predefined elements
elements $I6, $P4
sub $I5, $I6, 1
$S3 = $P4[$I5]
.annotate 'line', 4572
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4575
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4576
unless_null $P5, __label_25
# {
.annotate 'line', 4578
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4579
if_null $P6, __label_27
# {
.annotate 'line', 4580
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4583
'Warn'('Checking: new unknown type')
.annotate 'line', 4584
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4586
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4590
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4594
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4596
isgt $I7, $I1, 1
if $I7 goto __label_30
isgt $I7, $I1, 0
unless $I7 goto __label_31
iseq $I7, $I2, 1
__label_31:
__label_30:
unless $I7 goto __label_29
# {
.annotate 'line', 4597
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4598
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4599
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4600
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4602
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4603
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4604
__ARG_1.'say'(")")
.annotate 'line', 4605
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4607

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4462
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4464
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4616
# Body
# {
.annotate 'line', 4618
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4619
setattribute self, 'owner', __ARG_2
.annotate 'line', 4620
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4621
setattribute self, 'nskey', $P1
.annotate 'line', 4622
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4623
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4624
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4626
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4627

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4628
# Body
# {
.annotate 'line', 4630
# string reginit: $S1
null $S1
.annotate 'line', 4631
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4632
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
.annotate 'line', 4633
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4637
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4638
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4641
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4643
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4644
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4645
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4646
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4647
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4648
if_null $S1, __label_7
.annotate 'line', 4649
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4650
__ARG_1.'say'()
# }
.annotate 'line', 4651

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4612
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4614
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4660
# Body
# {
.annotate 'line', 4662
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4663
setattribute self, 'owner', __ARG_2
.annotate 'line', 4664
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4665
setattribute self, 'nskey', $P1
.annotate 'line', 4666
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4667
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4668
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4670
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4671

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4672
# Body
# {
.annotate 'line', 4674
# string reginit: $S1
null $S1
.annotate 'line', 4675
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4677
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4678
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4679
le $I1, 0, __label_3
.annotate 'line', 4680
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4681
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4682
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4683
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4684
__ARG_1.'say'()
.annotate 'line', 4686
le $I1, 0, __label_4
# {
.annotate 'line', 4687
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4688
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4689
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4690
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4692
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4693
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4694
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4695
__ARG_1.'say'(")")
.annotate 'line', 4696
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4698

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4656
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4658
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4703
# Body
# {
.annotate 'line', 4705
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4707
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4709
new $P5, [ 'CallExpr' ]
.annotate 'line', 4710
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4709
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4712
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4714
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4716
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4719
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4720
__ARG_1.'unget'($P2)
.annotate 'line', 4721
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4723
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4727
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
.annotate 'line', 4732
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4734

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4743
# Body
# {
.annotate 'line', 4745
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4746
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4747
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4748

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4749
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4750
# Body
# {
.annotate 'line', 4752
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4753
# string checkedval: $S1
null $S1
.annotate 'line', 4754
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4755
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4756
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4760
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4761
self.'annotate'(__ARG_1)
.annotate 'line', 4762
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4763

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4738
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4740
addattribute $P0, 'lexpr'
.annotate 'line', 4741
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4778
# Body
# {
.annotate 'line', 4780
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4781
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4782
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4783
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4784
.return(self)
# }
.annotate 'line', 4785

.end # set


.sub 'optimize' :method

.annotate 'line', 4786
# Body
# {
.annotate 'line', 4788
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4789
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
.annotate 'line', 4791
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4793
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4795
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4796
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4797
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4799

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4800
# Body
# {
.annotate 'line', 4802
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 4803

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4804
# Body
# {
.annotate 'line', 4806
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4807
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4808
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4809
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4810
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4811
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4812
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4813
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4814

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4768
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4774
addattribute $P0, 'condition'
.annotate 'line', 4775
addattribute $P0, 'etrue'
.annotate 'line', 4776
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

.annotate 'line', 4851
# Body
# {
.annotate 'line', 4853
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
.annotate 'line', 4854
.return(1)
__label_3: # case
.annotate 'line', 4855
.return(2)
__label_4: # case
.annotate 'line', 4856
.return(3)
__label_1: # default
.annotate 'line', 4857
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4859

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4861
# Body
# {
.annotate 'line', 4863
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
.annotate 'line', 4864
.return(8)
__label_3: # case
.annotate 'line', 4865
.return(11)
__label_4: # case
.annotate 'line', 4866
.return(9)
__label_5: # case
.annotate 'line', 4867
.return(10)
__label_1: # default
.annotate 'line', 4868
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4870

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4872
# Body
# {
.annotate 'line', 4874
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
.annotate 'line', 4875
.return(19)
__label_3: # case
.annotate 'line', 4876
.return(20)
__label_4: # case
.annotate 'line', 4877
.return(21)
__label_5: # case
.annotate 'line', 4878
.return(22)
__label_1: # default
.annotate 'line', 4879
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4881

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4883
# Body
# {
.annotate 'line', 4885
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
.annotate 'line', 4886
.return(12)
__label_3: # case
.annotate 'line', 4887
.return(13)
__label_4: # case
.annotate 'line', 4888
.return(25)
__label_5: # case
.annotate 'line', 4889
.return(26)
__label_1: # default
.annotate 'line', 4891
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4892
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4894

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4896
# Body
# {
.annotate 'line', 4898
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
.annotate 'line', 4899
.return(14)
__label_3: # case
.annotate 'line', 4900
.return(16)
__label_4: # case
.annotate 'line', 4901
.return(15)
__label_5: # case
.annotate 'line', 4902
.return(17)
__label_1: # default
.annotate 'line', 4903
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4905

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4907
# Body
# {
.annotate 'line', 4909
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
.annotate 'line', 4910
.return(4)
__label_3: # case
.annotate 'line', 4911
.return(5)
__label_4: # case
.annotate 'line', 4912
.return(6)
__label_5: # case
.annotate 'line', 4913
.return(18)
__label_6: # case
.annotate 'line', 4914
.return(23)
__label_7: # case
.annotate 'line', 4915
.return(24)
__label_1: # default
.annotate 'line', 4916
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4918

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4920
# Body
# {
.annotate 'line', 4922
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4924
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4925
# var expr: $P2
null $P2
.annotate 'line', 4926
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4927
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4928
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4929
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4931
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4932
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4933
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4934
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4935
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4936
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4937
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4938
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4939
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4940
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4941
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4942
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4943
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4944
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4945
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4946
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 4947
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4948

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4950
# Body
# {
.annotate 'line', 4952
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4953
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4955
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4956
# var t: $P2
null $P2
.annotate 'line', 4957
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4958
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 4959
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4961
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4964
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4967
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4970
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4973
__ARG_1.'unget'($P2)
.annotate 'line', 4974
.return($P1)
# }
.annotate 'line', 4975

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4977
# Body
# {
.annotate 'line', 4979
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4981
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4982
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4983
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4984
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4985
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4986
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4989
__ARG_1.'unget'($P2)
.annotate 'line', 4990
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4992

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4994
# Body
# {
.annotate 'line', 4996
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4997
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4998
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5000
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5001
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5002
# var subexpr: $P2
null $P2
.annotate 'line', 5003
eq $I1, 0, __label_0
# {
.annotate 'line', 5004
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5005
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5006
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
.annotate 'line', 5008
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5011
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5014
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5017
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5020
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5022
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5025
__ARG_1.'unget'($P1)
.annotate 'line', 5026
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5028
.return($P2)
# }
.annotate 'line', 5029

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5031
# Body
# {
.annotate 'line', 5033
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5034
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5036
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5037
# var t: $P2
null $P2
.annotate 'line', 5038
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5039
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5040
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5041
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5042
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
.annotate 'line', 5044
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5047
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5050
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5053
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5056
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5058
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5059
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5061
__ARG_1.'unget'($P2)
.annotate 'line', 5062
.return($P1)
# }
.annotate 'line', 5063

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5065
# Body
# {
.annotate 'line', 5067
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5069
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5070
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5071
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5072
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5073
# var expr: $P4
null $P4
.annotate 'line', 5074
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5075
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5077
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5078
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5080
__ARG_1.'unget'($P2)
.annotate 'line', 5081
.return($P1)
# }
.annotate 'line', 5082

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5084
# Body
# {
.annotate 'line', 5086
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5087
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5089
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5090
# var rexpr: $P2
null $P2
.annotate 'line', 5091
# var t: $P3
null $P3
.annotate 'line', 5092
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5093
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5094
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
.annotate 'line', 5096
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5097
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5100
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5101
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5104
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5105
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5108
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5109
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5112
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5115
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5118
__ARG_1.'unget'($P3)
.annotate 'line', 5119
.return($P1)
# }
.annotate 'line', 5120

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5122
# Body
# {
.annotate 'line', 5124
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5125
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5127
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5128
# var t: $P2
null $P2
.annotate 'line', 5129
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5130
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5131
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5132
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
.annotate 'line', 5134
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5137
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5140
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5143
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5146
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5149
__ARG_1.'unget'($P2)
.annotate 'line', 5150
.return($P1)
# }
.annotate 'line', 5151

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5153
# Body
# {
.annotate 'line', 5155
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5157
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5158
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5159
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5160
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5161
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5163
__ARG_1.'unget'($P2)
.annotate 'line', 5164
.return($P1)
# }
.annotate 'line', 5165

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5167
# Body
# {
.annotate 'line', 5169
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5171
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5172
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5173
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5174
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5175
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5177
__ARG_1.'unget'($P2)
.annotate 'line', 5178
.return($P1)
# }
.annotate 'line', 5179

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5181
# Body
# {
.annotate 'line', 5183
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5185
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5186
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5187
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5188
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5189
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5191
__ARG_1.'unget'($P2)
.annotate 'line', 5192
.return($P1)
# }
.annotate 'line', 5193

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5195
# Body
# {
.annotate 'line', 5197
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5199
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5200
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5201
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5202
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5203
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5205
__ARG_1.'unget'($P2)
.annotate 'line', 5206
.return($P1)
# }
.annotate 'line', 5207

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5209
# Body
# {
.annotate 'line', 5211
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5212
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5214
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5215
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5216
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5217
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5218
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5219
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5220
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5223
__ARG_1.'unget'($P2)
.annotate 'line', 5224
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5226

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5231
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5232
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5234
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5235
# var t: $P2
null $P2
.annotate 'line', 5236
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5237
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5238
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5239
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5240
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
.annotate 'line', 5242
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5245
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5248
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5251
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5254
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5257
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5260
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5262
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5263
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5265
__ARG_1.'unget'($P2)
.annotate 'line', 5266
.return($P1)
# }
.annotate 'line', 5267

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5269
# Body
# {
.annotate 'line', 5271
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5273
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5274

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5287
# Body
# {
.annotate 'line', 5289
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5290
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5291
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5292
setattribute self, 'brlabel', $P2
.annotate 'line', 5293
.return($S1)
# }
.annotate 'line', 5294

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5295
# Body
# {
.annotate 'line', 5297
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5298
unless_null $P1, __label_0
.annotate 'line', 5299
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5300
.return($P1)
# }
.annotate 'line', 5301

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5285
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5308
# Body
# {
.annotate 'line', 5310
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5311
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5312
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5313
setattribute self, 'cntlabel', $P2
.annotate 'line', 5314
.return($S1)
# }
.annotate 'line', 5315

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5316
# Body
# {
.annotate 'line', 5318
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5319
unless_null $P1, __label_0
.annotate 'line', 5320
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5321
.return($P1)
# }
.annotate 'line', 5322

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5304
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5306
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5336
# Body
# {
.annotate 'line', 5338
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5339
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5340
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5341
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5342
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5343
# {
.annotate 'line', 5344
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5345
$P2.'push'($P3)
# }
.annotate 'line', 5346
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5348
'RequireOp'(';', $P1)
.annotate 'line', 5349
setattribute self, 'values', $P2
# }
.annotate 'line', 5350

.end # parse


.sub 'optimize' :method

.annotate 'line', 5351
# Body
# {
.annotate 'line', 5353
getattribute $P1, self, 'values'
'optimize_array'($P1)
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
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5359
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5360
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5363
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5364
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5366
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5367
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5368
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5369
self.'annotate'(__ARG_1)
.annotate 'line', 5370
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5374
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5375
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5376
# string reg: $S1
null $S1
.annotate 'line', 5377
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5378
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5379
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5382
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5383
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5374
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5385
self.'annotate'(__ARG_1)
.annotate 'line', 5386
self.'emitret'(__ARG_1)
.annotate 'line', 5387
# string sep: $S2
set $S2, ''
.annotate 'line', 5388
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5389
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5390
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5392
__ARG_1.'say'(')')
# }
.annotate 'line', 5393

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5332
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5334
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5398
# Body
# {
.annotate 'line', 5400
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5401

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5402
# Body
# {
.annotate 'line', 5404
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5405

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5396
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5410
# Body
# {
.annotate 'line', 5412
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5413

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5414
# Body
# {
.annotate 'line', 5416
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5417

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5408
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5428
# Body
# {
.annotate 'line', 5430
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5431
setattribute self, 'name', __ARG_1
.annotate 'line', 5432
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5433
setattribute self, 'value', $P2
# }
.annotate 'line', 5434

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5435
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5436
# Body
# {
.annotate 'line', 5438
self.'annotate'(__ARG_1)
.annotate 'line', 5439
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5440
# string comment: $S2
concat $S0, 'label ', $S1
set $S2, $S0
.annotate 'line', 5441
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5442

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5424
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5426
addattribute $P0, 'name'
.annotate 'line', 5427
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5453
# Body
# {
.annotate 'line', 5455
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5456
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5457
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5458
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5459
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5460
setattribute self, 'label', $P1
.annotate 'line', 5461
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5462

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5463
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5464
# Body
# {
.annotate 'line', 5466
self.'annotate'(__ARG_1)
.annotate 'line', 5467
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5468
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5469
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5470

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5449
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5451
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5479
# Body
# {
.annotate 'line', 5481
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5482

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5483
# Body
# {
.annotate 'line', 5485
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5486
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5487
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5488

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5477
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

.annotate 'line', 5499
# Body
# {
.annotate 'line', 5501
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5502
self.'parsecondition'(__ARG_2)
.annotate 'line', 5503
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5504
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5505
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5506
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5508
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5509
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5511

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5512
# Body
# {
.annotate 'line', 5514
self.'optimize_condition'()
.annotate 'line', 5515
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5516
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5517
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5518
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5520
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5522
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5524
.return(self)
# }
.annotate 'line', 5525

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5526
# Body
# {
.annotate 'line', 5528
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5529
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5530
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5531
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5532
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5533
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5534
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5535
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5536
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5537
self.'annotate'(__ARG_1)
.annotate 'line', 5538
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5539
$P1.'emit'(__ARG_1)
.annotate 'line', 5541
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5542
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5543
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5544
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5546
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5547

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5495
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5497
addattribute $P0, 'truebranch'
.annotate 'line', 5498
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5557
# Body
# {
.annotate 'line', 5559
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5560

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5561
# Body
# {
.annotate 'line', 5563
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5564
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5566
self.'annotate'(__ARG_1)
.annotate 'line', 5567
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5568
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5569
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5570
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5571

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5554
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5556
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5580
# Body
# {
.annotate 'line', 5582
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5583
self.'parsecondition'(__ARG_2)
.annotate 'line', 5584
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5585

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5586
# Body
# {
.annotate 'line', 5588
self.'optimize_condition'()
.annotate 'line', 5589
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5590
.return(self)
# }
.annotate 'line', 5591

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5592
# Body
# {
.annotate 'line', 5594
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5596
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5599
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5602
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5603
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5605
self.'annotate'(__ARG_1)
.annotate 'line', 5606
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5607
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5608
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5609
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5610
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5612

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5578
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

.annotate 'line', 5621
# Body
# {
.annotate 'line', 5623
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5624
self.'parsebody'(__ARG_2)
.annotate 'line', 5625
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5626
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5627

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5628
# Body
# {
.annotate 'line', 5630
self.'optimize_condition'()
.annotate 'line', 5631
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5632
.return(self)
# }
.annotate 'line', 5633

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5634
# Body
# {
.annotate 'line', 5636
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5638
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5641
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5642
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5643
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5645
self.'annotate'(__ARG_1)
.annotate 'line', 5646
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5648
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5649
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5650
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5652

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5619
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

.annotate 'line', 5661
# Body
# {
.annotate 'line', 5663
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5664
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5665

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5666
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5667
# Body
# {
.annotate 'line', 5669
self.'annotate'(__ARG_1)
.annotate 'line', 5670
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5671
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5672

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5659
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5681
# Body
# {
.annotate 'line', 5683
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5684
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5685

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5686
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5687
# Body
# {
.annotate 'line', 5689
self.'annotate'(__ARG_1)
.annotate 'line', 5690
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5691
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5692

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5679
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5706
# Body
# {
.annotate 'line', 5708
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5709
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5710
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5711
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5712
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5713
$P1 = __ARG_2.'get'()
.annotate 'line', 5714
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5715
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5716
$P1 = __ARG_2.'get'()
.annotate 'line', 5717
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5718
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5719
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5720
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5721
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5722
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5723
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5724
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5725
$P1 = __ARG_2.'get'()
.annotate 'line', 5726
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5727
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5728
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5729
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
.annotate 'line', 5730
__ARG_2.'unget'($P1)
.annotate 'line', 5731
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5733
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5734
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5737
$P1 = __ARG_2.'get'()
.annotate 'line', 5738
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5739
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5740
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
.annotate 'line', 5741
__ARG_2.'unget'($P1)
.annotate 'line', 5742
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5744
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5747

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5748
# Body
# {
.annotate 'line', 5750
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5751
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5752
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5753
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5754
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5755
.return(self)
# }
.annotate 'line', 5756

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5757
# Body
# {
.annotate 'line', 5760
# string type: $S1
set $S1, ''
.annotate 'line', 5761
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5762
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5763
ne $S2, 'N', __label_3
.annotate 'line', 5764
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5765
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5767
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5768
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5771
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5772
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
$S9 = $P11
ne $S9, $S1, __label_8
.annotate 'line', 5773
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5775
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5776
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5780
self.'genbreaklabel'()
.annotate 'line', 5781
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5782
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5783
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5784
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5785
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5786
$P2.'push'($S7)
.annotate 'line', 5787
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5788
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5790
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5793
__ARG_1.'comment'('switch')
.annotate 'line', 5794
self.'annotate'(__ARG_1)
.annotate 'line', 5795
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5796
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5797
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5798
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5799
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5800
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5801
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5802
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5797
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5805
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5806
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5807
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5809
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5810

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5699
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5701
addattribute $P0, 'condition'
.annotate 'line', 5702
addattribute $P0, 'case_value'
.annotate 'line', 5703
addattribute $P0, 'case_st'
.annotate 'line', 5704
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5822
# Body
# {
.annotate 'line', 5824
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5825
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5826
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5827
__ARG_2.'unget'($P1)
.annotate 'line', 5828
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5830
$P1 = __ARG_2.'get'()
.annotate 'line', 5831
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5832
__ARG_2.'unget'($P1)
.annotate 'line', 5833
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5834
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5836
$P1 = __ARG_2.'get'()
.annotate 'line', 5837
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5838
__ARG_2.'unget'($P1)
.annotate 'line', 5839
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5840
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5842
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5843

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5844
# Body
# {
.annotate 'line', 5846
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5847
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5848
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5849
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5850
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5851
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5852
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5853
.return(self)
# }
.annotate 'line', 5854

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5855
# Body
# {
.annotate 'line', 5857
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5858
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5859
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5860
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5861
.return()
# }
__label_0: # endif
.annotate 'line', 5863
__ARG_1.'comment'('for loop')
.annotate 'line', 5864
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5865
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5866
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5867
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5868
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5870
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5871
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5872
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5874
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5875
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5876
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5877
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5878
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5880
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5881

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5817
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5819
addattribute $P0, 'initializer'
.annotate 'line', 5820
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5893
# Body
# {
.annotate 'line', 5895
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5896
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5897
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5898
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5899
eq $S2, '', __label_2
# {
.annotate 'line', 5900
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5902
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5904
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5905
setattribute self, 'varname', $P1
.annotate 'line', 5906
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5907
$P2 = __ARG_2.'get'()
.annotate 'line', 5908
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5909
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5910
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5911

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5912
# Body
# {
.annotate 'line', 5914
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5915
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5916
.return(self)
# }
.annotate 'line', 5917

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5918
# Body
# {
.annotate 'line', 5920
self.'annotate'(__ARG_1)
.annotate 'line', 5921
# string regcont: $S1
null $S1
.annotate 'line', 5922
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
$S6 = $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 5923
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5924
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5925
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5928
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5929
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5930
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5931
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5932
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5933
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5934
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5935
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5936
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5937
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5938
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5939
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5940
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5941

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5888
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5890
addattribute $P0, 'varname'
.annotate 'line', 5891
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5946
# Body
# {
.annotate 'line', 5948
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5949
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5950
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5951
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5952
__ARG_2.'unget'($P3)
.annotate 'line', 5953
__ARG_2.'unget'($P2)
.annotate 'line', 5954
__ARG_2.'unget'($P1)
.annotate 'line', 5955
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5956
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5958
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5959

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5969
# Body
# {
.annotate 'line', 5971
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5972
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5973

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5974
# Body
# {
.annotate 'line', 5976
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5977
.return(self)
# }
.annotate 'line', 5978

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5979
# Body
# {
.annotate 'line', 5981
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5982
self.'annotate'(__ARG_1)
.annotate 'line', 5983
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5984

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5965
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5967
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5998
# Body
# {
.annotate 'line', 6000
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6001
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6002
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6003
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6006
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6008
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6009
$P1 = __ARG_2.'get'()
.annotate 'line', 6010
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6011
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6012
$P1 = __ARG_2.'get'()
.annotate 'line', 6013
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6014
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6015
$P1 = __ARG_2.'get'()
.annotate 'line', 6016
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6017
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6018
setattribute self, 'exname', $P1
.annotate 'line', 6019
self.'createvar'($S1, 'P')
.annotate 'line', 6020
$P1 = __ARG_2.'get'()
.annotate 'line', 6021
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6022
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6024
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6025

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6026
# Body
# {
.annotate 'line', 6028
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6029
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6030
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6031
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6032
.return(self)
# }
.annotate 'line', 6033

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6034
# Body
# {
.annotate 'line', 6036
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6037
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6038
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6039
# string exreg: $S4
null $S4
.annotate 'line', 6040
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6041
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6042
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 6045
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 6047
self.'annotate'(__ARG_1)
.annotate 'line', 6048
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6050
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6051
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6053
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6054
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6055
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6056
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 6057
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6058
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6061
eq $I1, 1, __label_14
.annotate 'line', 6062
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6063
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6064
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6065
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6068
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6069
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6070
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6071
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
__label_16: # for iteration
.annotate 'line', 6069
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6073
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6074
# string sep: $S7
set $S7, ''
.annotate 'line', 6075
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6076
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6077
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6079
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6082
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6087
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6088
__ARG_1.'comment'('try: begin')
.annotate 'line', 6089
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6090
__ARG_1.'comment'('try: end')
.annotate 'line', 6092
self.'annotate'(__ARG_1)
.annotate 'line', 6093
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6095
__ARG_1.'comment'('catch')
.annotate 'line', 6096
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6097
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6098
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6099
__ARG_1.'say'('pop_eh')
.annotate 'line', 6100
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 6102
__ARG_1.'comment'('catch end')
.annotate 'line', 6103
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6104

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5991
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5993
addattribute $P0, 'stry'
.annotate 'line', 5994
addattribute $P0, 'modifiers'
.annotate 'line', 5995
addattribute $P0, 'exname'
.annotate 'line', 5996
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6115
# Body
# {
.annotate 'line', 6117
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6118
setattribute self, 'name', __ARG_3
.annotate 'line', 6119
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 6120
setattribute self, 'reg', $P2
# }
.annotate 'line', 6121

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6111
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6113
addattribute $P0, 'name'
.annotate 'line', 6114
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6138
# Body
# {
.annotate 'line', 6140
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6141
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6142
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6143
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6144
setattribute self, 'name', $P1
.annotate 'line', 6145
# string reg: $S1
null $S1
.annotate 'line', 6147
$P1 = __ARG_2.'get'()
.annotate 'line', 6148
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 6150
setattribute self, 'typearray', $P5
.annotate 'line', 6151
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 6152
$P1 = __ARG_2.'get'()
.annotate 'line', 6153
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 6155
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6158
__ARG_2.'unget'($P1)
.annotate 'line', 6159
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 6160
$P1 = __ARG_2.'get'()
.annotate 'line', 6161
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 6162
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6163
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 6168
setattribute self, 'typearray', $P8
.annotate 'line', 6169
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 6170
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 6172
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 6173
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6177
setattribute self, 'reg', $P11
.annotate 'line', 6178
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6180
$P1 = __ARG_2.'get'()
.annotate 'line', 6181
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 6182
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6183
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 6184
$P1 = __ARG_2.'get'()
.annotate 'line', 6185
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 6186
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6187
# {
.annotate 'line', 6188
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6189
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 6190
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 6191
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 6192
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6194
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6196
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6197

.end # parse


.sub 'optimize' :method

.annotate 'line', 6198
# Body
# {
.annotate 'line', 6200
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6201
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6202
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6203
if_null $P1, __label_1
# {
.annotate 'line', 6204
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6205
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6207
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6209
.return(self)
# }
.annotate 'line', 6210

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6211
# Body
# {
.annotate 'line', 6213
self.'annotate'(__ARG_1)
.annotate 'line', 6214
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6215
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6216
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6217
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6218
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6219
__ARG_1.'comment'($S10)
.annotate 'line', 6221
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6222
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6223
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6225
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6226
ne $S5, $S4, __label_10
# {
.annotate 'line', 6227
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6230
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_12
# {
.annotate 'line', 6232
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 6235
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 6236
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6237
iseq $I4, $S4, 'S'
unless $I4 goto __label_17
iseq $I4, $S5, 'P'
__label_17:
unless $I4 goto __label_15
# {
.annotate 'line', 6238
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 6239
__ARG_1.'emitnull'($S3)
.annotate 'line', 6240
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6241
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6242
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 6245
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
.annotate 'line', 6251
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6252
if_null $P2, __label_19
# {
.annotate 'line', 6254
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 6255
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 6259
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 6261
if_null $P1, __label_22
# {
.annotate 'line', 6262
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 6263
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6264
unless_null $P2, __label_24
# {
.annotate 'line', 6265
le $I1, 0, __label_25
# {
.annotate 'line', 6267
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6270
# int i: $I2
null $I2
.annotate 'line', 6271
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6272
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6273
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6274
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6278

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6279
# Body
# {
.annotate 'line', 6281
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6282

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6128
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6130
addattribute $P0, 'name'
.annotate 'line', 6131
addattribute $P0, 't_reg'
.annotate 'line', 6132
addattribute $P0, 't_name'
.annotate 'line', 6133
addattribute $P0, 't_array'
.annotate 'line', 6134
addattribute $P0, 'reg'
.annotate 'line', 6135
addattribute $P0, 'typearray'
.annotate 'line', 6136
addattribute $P0, 'size'
.annotate 'line', 6137
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6285
# Body
# {
.annotate 'line', 6287
# var next: $P1
null $P1
.annotate 'line', 6288
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6289
# {
.annotate 'line', 6290
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6291
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6292
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6293
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6294
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6295
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6296
.return($P2)
# }
.annotate 'line', 6297

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6309
# Body
# {
.annotate 'line', 6312
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6313
setattribute self, 'type', $P1
.annotate 'line', 6314
setattribute self, 'name', __ARG_4
.annotate 'line', 6315
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6316

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6317
# Body
# {
.annotate 'line', 6319
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6320
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6321
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6322
$P1 = $P1.'optimize'()
.annotate 'line', 6323
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6325
getattribute $P4, self, 'start'
.annotate 'line', 6324
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6327
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6328
setattribute self, 'value', $P1
.annotate 'line', 6329
.return(self)
# }
.annotate 'line', 6330

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6331
# Body
# {
.annotate 'line', 6333
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6334

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6335
# Body
# {
.annotate 'line', 6337
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6338
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6339

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6303
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6305
addattribute $P0, 'type'
.annotate 'line', 6306
addattribute $P0, 'name'
.annotate 'line', 6307
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6342
# Body
# {
.annotate 'line', 6344
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6345
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6346
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6347
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6349
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6350
# {
.annotate 'line', 6351
$P1 = __ARG_2.'get'()
.annotate 'line', 6352
# var name: $P3
set $P3, $P1
.annotate 'line', 6353
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6354
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6356
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6355
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6357
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6358
.return($P2)
# }
.annotate 'line', 6359

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6368
# Body
# {
.annotate 'line', 6370
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6371
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6372
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6373
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6374
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6376
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6377
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6378

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6379
# Body
# {
.annotate 'line', 6381
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6382
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6383
.return(self)
# }
.annotate 'line', 6384

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6385
# Body
# {
.annotate 'line', 6387
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6388

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6389
# Body
# {
.annotate 'line', 6391
self.'annotate'(__ARG_1)
.annotate 'line', 6392
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6393
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6394
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6395
__ARG_1.'comment'($S5)
.annotate 'line', 6396
if_null $P1, __label_2
.annotate 'line', 6397
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6399
if_null $P1, __label_4
# {
.annotate 'line', 6400
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6401
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
.annotate 'line', 6403
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6408
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6409
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6410
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6413
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6417
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6418

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6365
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6367
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6423
# Body
# {
.annotate 'line', 6425
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6426
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6427
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6428
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6429

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6430
# Body
# {
.annotate 'line', 6432
self.'annotate'(__ARG_1)
.annotate 'line', 6433
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6434
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6435
__ARG_1.'comment'($S3)
.annotate 'line', 6436
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6437

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6421
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6444
# Body
# {
.annotate 'line', 6446
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6447
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6448
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6449
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6450
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6451
$P1 = __ARG_2.'get'()
.annotate 'line', 6452
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6453
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6454

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6455
# Body
# {
.annotate 'line', 6457
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6458
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6459

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6460
# Body
# {
.annotate 'line', 6462
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6463
self.'annotate'(__ARG_1)
.annotate 'line', 6464
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6465
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6466
__ARG_1.'comment'($S4)
.annotate 'line', 6467
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6468

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6440
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6442
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6471
# Body
# {
.annotate 'line', 6473
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6474
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6475
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6476
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6477
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6478
$P2 = __ARG_2.'get'()
.annotate 'line', 6479
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6480
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6482
__ARG_2.'unget'($P2)
.annotate 'line', 6483
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
.annotate 'line', 6487
__ARG_2.'unget'($P2)
.annotate 'line', 6488
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6490

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6498
# Body
# {
box $P1, 'S'
.annotate 'line', 6500
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6501
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6502
setattribute self, 't_array', $P2
.annotate 'line', 6503
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6504

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6505
# Body
# {
.annotate 'line', 6507
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6508

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6496
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6511
# Body
# {
.annotate 'line', 6513
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6514

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6516
# Body
# {
.annotate 'line', 6518
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6519
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6520

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6528
# Body
# {
box $P1, 'I'
.annotate 'line', 6530
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6531
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6532
setattribute self, 't_array', $P2
.annotate 'line', 6533
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6534

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6535
# Body
# {
.annotate 'line', 6537
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6538

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6526
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6541
# Body
# {
.annotate 'line', 6543
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6544

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6546
# Body
# {
.annotate 'line', 6548
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6549
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6550

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6558
# Body
# {
box $P1, 'N'
.annotate 'line', 6560
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6562
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6563
setattribute self, 't_array', $P2
.annotate 'line', 6564
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6565

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6566
# Body
# {
.annotate 'line', 6568
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6569

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6556
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6572
# Body
# {
.annotate 'line', 6574
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6575

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6577
# Body
# {
.annotate 'line', 6579
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6580
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6581

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6594
# Body
# {
.annotate 'line', 6596
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6597
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6598
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6599
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6600
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6601
__ARG_2.'unget'($P1)
.annotate 'line', 6602
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6603
unless_null $P2, __label_2
.annotate 'line', 6604
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6605
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6607
setattribute self, 'end', $P1
# }
.annotate 'line', 6608

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6609
# Body
# {
.annotate 'line', 6611
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6612
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6613
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6614
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6615
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6616
.return($S2)
# }
.annotate 'line', 6617

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6618
# Body
# {
.annotate 'line', 6620
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6621
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6622
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6623
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6624
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6625
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6626
$P1[$S1] = $S3
.annotate 'line', 6627
.return($S3)
# }
.annotate 'line', 6628

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6629
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6630
# Body
# {
.annotate 'line', 6632
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6633
.return(self)
# }
.annotate 'line', 6634

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6635
# Body
# {
.annotate 'line', 6637
__ARG_1.'comment'('{')
.annotate 'line', 6638
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6639
$P1.'emit'(__ARG_1)
.annotate 'line', 6640
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6642
__ARG_1.'comment'('}')
# }
.annotate 'line', 6643

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6587
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6589
addattribute $P0, 'statements'
.annotate 'line', 6590
addattribute $P0, 'end'
.annotate 'line', 6591
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6656
# Body
# {
box $P3, 1
.annotate 'line', 6659
setattribute self, 'nreg', $P3
.annotate 'line', 6660
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6661
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6662
setattribute self, 'tempreg', $P1
.annotate 'line', 6663
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6664

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6665
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6667
setattribute self, 'type', $P1
.annotate 'line', 6668
.return(self)
# }
.annotate 'line', 6669

.end # settype


.sub 'createreg' :method

.annotate 'line', 6670
# Body
# {
.annotate 'line', 6672
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6673
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6674
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6676
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6678
.return($S1)
# }
.annotate 'line', 6679

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6680
# Body
# {
.annotate 'line', 6682
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6683
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6684
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6685
# string reg: $S1
null $S1
.annotate 'line', 6686
le $I1, 0, __label_0
.annotate 'line', 6687
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6689
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6690
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6692
.return($S1)
# }
.annotate 'line', 6693

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6694
# Body
# {
.annotate 'line', 6696
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6697
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6698
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6699
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6700

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6652
addattribute $P0, 'type'
.annotate 'line', 6653
addattribute $P0, 'nreg'
.annotate 'line', 6654
addattribute $P0, 'tempreg'
.annotate 'line', 6655
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6725
# Body
# {
.annotate 'line', 6727
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6728
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6729
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6730
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6731
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6732

.end # init


.sub 'getouter' :method

.annotate 'line', 6734
# Body
# {
.return(self)
# }

.end # getouter


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6735
# Body
# {
.annotate 'line', 6737
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6738
.return($I1)
# }
.annotate 'line', 6739

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6740
# Body
# {
.annotate 'line', 6742
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6743
unless_null $P1, __label_0
# {
.annotate 'line', 6744
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6745
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6747
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6748

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6749
# Body
# {
.annotate 'line', 6751
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6752
unless_null $P1, __label_0
# {
.annotate 'line', 6753
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6754
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6756
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6757

.end # setusedlex


.sub 'createlex' :method
.param string __ARG_1

.annotate 'line', 6758
# Body
# {
.annotate 'line', 6760
# string lexname: $S1
# predefined substr
substr $S2, __ARG_1, 1
concat $S0, '__WLEX_', $S2
set $S1, $S0
.annotate 'line', 6761
self.'setlex'($S1, __ARG_1)
.annotate 'line', 6762
.return($S1)
# }
.annotate 'line', 6763

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6765
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6766
# Body
# {
.annotate 'line', 6768
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6769
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
.annotate 'line', 6771
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6773
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6775
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6777
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6779
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6781
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6782
.return($S1)
# }
.annotate 'line', 6783

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6784
# Body
# {
.annotate 'line', 6786
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6787
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
.annotate 'line', 6789
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6791
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6793
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6795
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6797
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6799
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6800
.return($S1)
# }
.annotate 'line', 6801

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6802
# Body
# {
.annotate 'line', 6804
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
.annotate 'line', 6805
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6806

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6807
# Body
# {
.annotate 'line', 6809
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6810
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6811
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6813
.return($S1)
# }
.annotate 'line', 6814

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6815
# Body
# {
.annotate 'line', 6817
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6818
unless_null $P1, __label_0
.annotate 'line', 6819
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6821
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6822

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6824
# Body
# {
.annotate 'line', 6826
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6827
.return(self)
# }
.annotate 'line', 6828

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6830
# Body
# {
.annotate 'line', 6832
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6833
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6834
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6835
__ARG_1.'unget'($P1)
.annotate 'line', 6836
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6837
# {
.annotate 'line', 6838
$P1 = __ARG_1.'get'()
.annotate 'line', 6839
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6840
eq $S1, '', __label_5
.annotate 'line', 6841
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6844
# string argname: $S2
# predefined string
inc $I1
set $S4, $I1
concat $S0, '__ARG_', $S4
set $S2, $S0
.annotate 'line', 6845
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6847
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6848
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6849
$P2['name'] = $S3
.annotate 'line', 6850
$P1 = __ARG_1.'get'()
.annotate 'line', 6851
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6852
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6853
$P2['modifiers'] = $P3
.annotate 'line', 6854
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6856
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6857
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6858
$P9 = $P1.'isop'(')')
isfalse $I2, $P9
unless $I2 goto __label_9
.annotate 'line', 6859
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6861

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6863
# Body
# {
.annotate 'line', 6865
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6866
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6867
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6868
setattribute self, 'isanon', $P3
.annotate 'line', 6869
$P1 = __ARG_2.'get'()
.annotate 'line', 6870
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6871
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6872
setattribute self, 'modifiers', $P2
.annotate 'line', 6873
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6875
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6876
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6877
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6879
$P1 = __ARG_2.'get'()
.annotate 'line', 6880
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6881
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6882
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6883
.return(self)
# }
.annotate 'line', 6884

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6885
# Body
# {
.annotate 'line', 6887
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6888
__ARG_1.'say'()
.annotate 'line', 6889
__ARG_1.'print'(".sub ")
.annotate 'line', 6890
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6891
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6893
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6894
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 6895
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6896
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 6897
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6898
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6899
if_null $P2, __label_5
.annotate 'line', 6900
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6904
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6905
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6906
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6907
if_null $P3, __label_7
# {
.annotate 'line', 6908
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6909
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6910
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6911
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6912
le $I1, 0, __label_11
# {
.annotate 'line', 6913
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6914
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 6915
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6916
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 6917
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6918
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 6914
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 6920
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
.annotate 'line', 6925
ne $S1, 'main', __label_16
.annotate 'line', 6926
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6928
__ARG_1.'say'()
.annotate 'line', 6930
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6931
# var arg: $P8
null $P8
.annotate 'line', 6932
# string argname: $S2
null $S2
.annotate 'line', 6933
# var a: $P9
null $P9
.annotate 'line', 6935
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 6936
$S2 = $P8['name']
.annotate 'line', 6937
$P9 = self.'getvar'($S2)
.annotate 'line', 6938
# string ptype: $S3
$P27 = $P9['type']
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
$P27 = $P9['reg']
.annotate 'line', 6939
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 6940
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 6941
if_null $P10, __label_20
# {
.annotate 'line', 6942
# var named: $P11
null $P11
.annotate 'line', 6943
# var slurpy: $P12
null $P12
.annotate 'line', 6944
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 6945
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 6946
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 6947
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
.annotate 'line', 6955
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 6958
isnull $I6, $P11
not $I6
unless $I6 goto __label_30
isnull $I6, $P12
not $I6
__label_30:
unless $I6 goto __label_28
# {
.annotate 'line', 6963
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 6966
if_null $P11, __label_31
# {
.annotate 'line', 6967
# string setname: $S5
null $S5
.annotate 'line', 6968
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 6969
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
.annotate 'line', 6974
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 6975
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 6976
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 6977
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 6980
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 6982
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 6984
if_null $P12, __label_38
# {
.annotate 'line', 6985
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 6989
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 6991
__ARG_1.'say'()
.annotate 'line', 6992
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 6995
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 6996
if_null $P16, __label_39
# {
.annotate 'line', 6998
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 6999
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7002
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7003
if_null $P16, __label_42
# {
.annotate 'line', 7005
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 7006
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7009
__ARG_1.'comment'('Body')
.annotate 'line', 7010
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7012
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7013
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7016
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7017
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7019
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I7, $P17
ge $I4, $I7, __label_47
# {
.annotate 'line', 7020
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7021
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7019
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7024

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7025
# Body
# {
.annotate 'line', 7027
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7028

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7029
# Body
# {
.annotate 'line', 7031
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7032

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6707
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6709
addattribute $P0, 'name'
.annotate 'line', 6710
addattribute $P0, 'subid'
.annotate 'line', 6711
addattribute $P0, 'isanon'
.annotate 'line', 6712
addattribute $P0, 'modifiers'
.annotate 'line', 6713
addattribute $P0, 'args'
.annotate 'line', 6714
addattribute $P0, 'body'
.annotate 'line', 6715
addattribute $P0, 'regstI'
.annotate 'line', 6716
addattribute $P0, 'regstN'
.annotate 'line', 6717
addattribute $P0, 'regstS'
.annotate 'line', 6718
addattribute $P0, 'regstP'
.annotate 'line', 6719
addattribute $P0, 'nlabel'
.annotate 'line', 6720
addattribute $P0, 'localfun'
.annotate 'line', 6721
addattribute $P0, 'lexicals'
.annotate 'line', 6722
addattribute $P0, 'usedlexicals'
.annotate 'line', 6723
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7041
# Body
# {
.annotate 'line', 7043
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7044
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 7045
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7046
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 7047
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 7048
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 7049
setattribute self, 'isanon', $P6
.annotate 'line', 7050
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7051
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7052
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 7053
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 7054
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 7055
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7056

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 7057
# Body
# {
.annotate 'line', 7059
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7060

.end # getsubid


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7061
# Body
# {
.annotate 'line', 7063
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7064
unless_null $P1, __label_0
# {
.annotate 'line', 7067
getattribute $P8, self, 'owner'
$P1 = $P8.'getvar'(__ARG_1)
.annotate 'line', 7068
unless_null $P1, __label_1
# {
.annotate 'line', 7070
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7071
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7072
getattribute $P9, self, 'outer'
$P8 = $P9.'ismethod'()
if_null $P8, __label_4
unless $P8 goto __label_4
# {
.annotate 'line', 7073
# string lexself: $S1
$P10 = $P2.'makelexicalself'()
null $S1
if_null $P10, __label_5
set $S1, $P10
__label_5:
.annotate 'line', 7074
# var r2: $P3
$P3 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7075
# string reg: $S2
set $P9, $P3
null $S2
if_null $P9, __label_6
set $S2, $P9
__label_6:
.annotate 'line', 7076
self.'setusedlex'($S1, $S2)
set $P1, $P3
.annotate 'line', 7077
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7081
$P10 = $P1['type']
$S5 = $P10
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P11 = $P1['const']
isfalse $I1, $P11
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 7082
# var scope: $P4
$P4 = $P1['scope']
.annotate 'line', 7083
# var ownerscope: $P5
$P5 = $P4.'getouter'()
.annotate 'line', 7084
# var outer: $P6
getattribute $P6, self, 'outer'
.annotate 'line', 7085
isa $I1, $P5, 'FunctionStatement'
unless $I1 goto __label_9
# {
.annotate 'line', 7086
$P11 = $P5.'same_scope_as'($P6)
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 7087
# string lexname: $S3
$P12 = $P4.'makelexical'($P1)
null $S3
if_null $P12, __label_11
set $S3, $P12
__label_11:
.annotate 'line', 7088
# var r2: $P7
$P7 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7089
# string reg: $S4
set $P12, $P7
null $S4
if_null $P12, __label_12
set $S4, $P12
__label_12:
.annotate 'line', 7090
self.'setusedlex'($S3, $S4)
set $P1, $P7
.annotate 'line', 7091
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 7096
.return($P1)
# }
.annotate 'line', 7097

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7039
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 7106
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7104
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

.annotate 'line', 7123
# Body
# {
.annotate 'line', 7125
setattribute self, 'owner', __ARG_1
.annotate 'line', 7126
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7127

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7128
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7130
# Body
# {
.annotate 'line', 7132
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7133

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7121
addattribute $P0, 'owner'
.annotate 'line', 7122
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7139
# Body
# {
.annotate 'line', 7141
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7142
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7143

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7144
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7146
# Body
# {
.annotate 'line', 7148
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7149
__ARG_1.'print'($S1)
# }
.annotate 'line', 7150

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7136
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7138
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7157
# Body
# {
.annotate 'line', 7159
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7160
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 7161
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7162
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7163
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7164
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7165
$P2 = __ARG_1.'get'()
.annotate 'line', 7166
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 7167
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
.annotate 'line', 7169
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7173
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7175
# {
.annotate 'line', 7176
$P2 = __ARG_1.'get'()
.annotate 'line', 7177
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7178
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7179
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7180
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7181
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 7182
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7184
setattribute self, 'key', $P1
# }
.annotate 'line', 7185

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7186
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7187
# Body
# {
# predefined int
.annotate 'line', 7189
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7190

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7192
# Body
# {
.annotate 'line', 7194
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7195

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7153
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7155
addattribute $P0, 'key'
.annotate 'line', 7156
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7201
# Body
# {
.annotate 'line', 7203
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7204
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 7205
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7206
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7207
$P2 = __ARG_1.'get'()
# predefined string
set $S1, $P2
.annotate 'line', 7208
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7210
__ARG_1.'unget'($P2)
.annotate 'line', 7211
setattribute self, 'key', $P1
# }
.annotate 'line', 7212

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7213
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7215
# Body
# {
.annotate 'line', 7217
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7218
.return($P2)
# }
.annotate 'line', 7219

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7221
# Body
# {
.annotate 'line', 7223
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7224
unless_null $P1, __label_0
# {
.annotate 'line', 7225
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7226
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7228
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7229

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7198
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7200
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7232
# Body
# {
.annotate 'line', 7234
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7235
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7236
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7237
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7238
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7239
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7240
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7241
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7242

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7259
# Body
# {
.annotate 'line', 7261
setattribute self, 'parent', __ARG_2
.annotate 'line', 7262
setattribute self, 'owner', __ARG_2
.annotate 'line', 7263
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7264
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7265
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7266
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7268
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7269
setattribute self, 'name', $P1
.annotate 'line', 7270
$P1 = __ARG_1.'get'()
.annotate 'line', 7271
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7272
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7273
# {
.annotate 'line', 7274
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7275
$P2.'push'($P3)
.annotate 'line', 7276
$P1 = __ARG_1.'get'()
.annotate 'line', 7277
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
.annotate 'line', 7280
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7281
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7282
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7283
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7284
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7285
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 7286
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7287
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7289
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7290
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7291
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7292
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7293
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7294
$P1 = __ARG_1.'get'()
.annotate 'line', 7295
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 7296
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7298
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7299
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7300
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7301
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7304
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7305
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7307
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 7308
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7309
setattribute self, 'classns', $P9
# }
.annotate 'line', 7310

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 7311
# Body
# {
.annotate 'line', 7313
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7314

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7315
# Body
# {
.annotate 'line', 7317
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7318

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7319
# Body
# {
.annotate 'line', 7321
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7322

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7323
# Body
# {
.annotate 'line', 7325
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7326

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7327
# Body
# {
.annotate 'line', 7329
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7330
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7331
.return(self)
# }
.annotate 'line', 7332

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7333
# Body
# {
.annotate 'line', 7335
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7336

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7337
# Body
# {
.annotate 'line', 7339
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7340
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7341
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7342
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7344
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7346
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7347
# int n: $I1
set $I1, 1
.annotate 'line', 7348
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7349
$P3.'annotate'(__ARG_1)
.annotate 'line', 7350
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7351
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7352
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7353
__ARG_1.'say'()
.annotate 'line', 7354
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7356
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7357
__ARG_1.'annotate'($P4)
.annotate 'line', 7358
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7361
__ARG_1.'say'('.end')
# }
.annotate 'line', 7362

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7248
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7250
addattribute $P0, 'parent'
.annotate 'line', 7251
addattribute $P0, 'owner'
.annotate 'line', 7252
addattribute $P0, 'name'
.annotate 'line', 7253
addattribute $P0, 'bases'
.annotate 'line', 7254
addattribute $P0, 'constants'
.annotate 'line', 7255
addattribute $P0, 'functions'
.annotate 'line', 7256
addattribute $P0, 'members'
.annotate 'line', 7257
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7369
# Body
# {
.annotate 'line', 7371
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7372
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7373
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7374
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7375
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7376
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7381
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7382
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7383
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7384
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7385
# string filepath: $S3
concat $S0, $S2, $S1
set $S3, $S0
.annotate 'line', 7386
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7387
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7388
# }
# try: end
goto __label_5
.annotate 'line', 7386
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
.annotate 'line', 7393
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7394
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7399
load_bytecode 'PGE.pbc'
.annotate 'line', 7400
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7401
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7403
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
.annotate 'line', 7404
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7405
$P8 = $P7($S4)
.annotate 'line', 7406
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7407
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7408
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7409
# int ivalue: $I1
null $I1
.annotate 'line', 7410
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7411
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7416
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7415
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7414
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7403
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7420
$P5.'close'()
# }
.annotate 'line', 7421

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7433
# Body
# {
.annotate 'line', 7435
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7436
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7437
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7438
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7439

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7440
# Body
# {
.annotate 'line', 7442
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7443
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7444
getattribute $P4, $P2, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7445
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7446
.return($P4)
# }
.annotate 'line', 7447

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7448
# Body
# {
# predefined elements
.annotate 'line', 7452
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7454
.return($P5)
__label_3: # case
.annotate 'line', 7457
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7462
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7463
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7464
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7465
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7466
getattribute $P9, $P3, 'name'
$S2 = $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7468
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7469
if_null $P4, __label_8
.annotate 'line', 7470
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7474
.return($P5)
# }
.annotate 'line', 7475

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7476
# Body
# {
.annotate 'line', 7478
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7479
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7480
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7482
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7484
# var start: $P2
set $P2, $P1
.annotate 'line', 7485
$P1 = __ARG_1.'get'()
.annotate 'line', 7486
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7487
$P1 = __ARG_1.'get'()
.annotate 'line', 7489
# var modifier: $P3
null $P3
.annotate 'line', 7490
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7491
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7492
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7495
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7496
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7497
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7498
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7499
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7500
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7502
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7503
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7504
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7506
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7507
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7508
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7509
$P7.'push'($P6)
.annotate 'line', 7510
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7512
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7513
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7514
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7515
$P9.'push'($P8)
.annotate 'line', 7516
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7518
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7519
$P1 = __ARG_1.'get'()
.annotate 'line', 7520
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7521
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7522
$P1 = __ARG_1.'get'()
.annotate 'line', 7523
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7524
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7525
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7526
self.'addlib'($S2)
.annotate 'line', 7527
$P1 = __ARG_1.'get'()
.annotate 'line', 7528
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7530
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7531
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7533
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7534
$P1 = __ARG_1.'get'()
.annotate 'line', 7535
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7536
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7537
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7538
self.'addload'($S3)
.annotate 'line', 7539
$P1 = __ARG_1.'get'()
.annotate 'line', 7540
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7542
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7543
self.'close_ns'($P1)
.annotate 'line', 7544
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7547
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
.annotate 'line', 7549
self.'unclosed_ns'()
# }
.annotate 'line', 7550

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7551
# Body
# {
.annotate 'line', 7553
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7554

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7555
# Body
# {
.annotate 'line', 7557
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7558
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7560
# int activate: $I1
set $I1, 1
.annotate 'line', 7561
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7562
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7563
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7566
unless $I1 goto __label_6
# {
.annotate 'line', 7567
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7568
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7570
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7572

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7425
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7427
addattribute $P0, 'namespaces'
.annotate 'line', 7428
addattribute $P0, 'classes'
.annotate 'line', 7429
addattribute $P0, 'functions'
.annotate 'line', 7430
addattribute $P0, 'items'
.annotate 'line', 7431
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7587
# Body
# {
.annotate 'line', 7590
setattribute self, 'parent', __ARG_1
.annotate 'line', 7591
setattribute self, 'start', __ARG_2
.annotate 'line', 7592
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7593
setattribute self, 'name', $P2
.annotate 'line', 7594
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7595
if_null __ARG_4, __label_0
# {
.annotate 'line', 7596
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7597
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7599

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7600
# Body
# {
.annotate 'line', 7602
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7603

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7604
# Body
# {
.annotate 'line', 7606
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7607

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7608
# Body
# {
.annotate 'line', 7610
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7611
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7612
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7613
.return($P1)
# }
.annotate 'line', 7614

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7615
# Body
# {
.annotate 'line', 7617
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7618

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7619
# Body
# {
.annotate 'line', 7621
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7622

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7623
# Body
# {
.annotate 'line', 7625
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7626
unless_null $P1, __label_0
.annotate 'line', 7627
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7629
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7630

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7631
# Body
# {
.annotate 'line', 7635
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7636
unless_null $P1, __label_0
.annotate 'line', 7637
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7638
.return($P1)
# }
.annotate 'line', 7639

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7640
# Body
# {
.annotate 'line', 7642
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7643

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7644
# Body
# {
# }
.annotate 'line', 7647

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7648
# Body
# {
.annotate 'line', 7650
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7651
if_null $P1, __label_0
# {
.annotate 'line', 7652
$P1 = $P1.'optimize'()
.annotate 'line', 7653
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7655
self.'optimize_base'()
.annotate 'line', 7656
.return(self)
# }
.annotate 'line', 7657

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7658
# Body
# {
.annotate 'line', 7660
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7661
if_null $P1, __label_0
.annotate 'line', 7662
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7664
self.'emit_base'(__ARG_1)
.annotate 'line', 7666
if_null $P1, __label_1
.annotate 'line', 7667
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7668

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7579
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7581
addattribute $P0, 'parent'
.annotate 'line', 7582
addattribute $P0, 'start'
.annotate 'line', 7583
addattribute $P0, 'name'
.annotate 'line', 7584
addattribute $P0, 'modifier'
.annotate 'line', 7585
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7682
# Body
# {
.annotate 'line', 7684
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7685
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7686

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7687
# Body
# {
.annotate 'line', 7689
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7690
$P1[__ARG_1] = 1
# }
.annotate 'line', 7691

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7692
# Body
# {
.annotate 'line', 7694
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7695
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7696

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7698
# Body
# {
.annotate 'line', 7700
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7701
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7702
inc $I1
assign $P1, $I1
.annotate 'line', 7704
# string id: $S1
# predefined string
set $S2, $I1
concat $S0, 'WSubId_', $S2
set $S1, $S0
.annotate 'line', 7705
.return($S1)
# }
.annotate 'line', 7706

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7708
# Body
# {
.annotate 'line', 7710
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7711
unless_null $P1, __label_0
# {
.annotate 'line', 7712
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7713
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7715
$P1[__ARG_1] = 1
# }
.annotate 'line', 7716

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7717
# Body
# {
.annotate 'line', 7719
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7720
unless_null $P1, __label_0
# {
.annotate 'line', 7721
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7722
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7724
$P1[__ARG_1] = 1
# }
.annotate 'line', 7725

.end # addload


.sub 'getpath' :method

.annotate 'line', 7726
# Body
# {
.annotate 'line', 7728
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7729
.return($P1)
# }
.annotate 'line', 7730

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7731
# Body
# {
.annotate 'line', 7733
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7734

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7735
# Body
# {
.annotate 'line', 7738
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7739

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7740
# Body
# {
# }
.annotate 'line', 7743

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7744
# Body
# {
.annotate 'line', 7746
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7747

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7748
# Body
# {
.annotate 'line', 7750
self.'optimize_base'()
.annotate 'line', 7751
.return(self)
# }
.annotate 'line', 7752

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7753
# Body
# {
.annotate 'line', 7755
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7758
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7759
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7762
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
.annotate 'line', 7765
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7766
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7767
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7768
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7771
# int somelib: $I1
null $I1
.annotate 'line', 7772
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7773
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7775
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7776
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7779
# int someload: $I2
null $I2
.annotate 'line', 7780
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7781
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7783
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7784
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7785
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7786
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7788
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7789
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7791
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7792

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7675
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7677
addattribute $P0, 'predefs_used'
.annotate 'line', 7678
addattribute $P0, 'libs'
.annotate 'line', 7679
addattribute $P0, 'loads'
.annotate 'line', 7680
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7804
# Body
# {
.annotate 'line', 7806
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7809
# var taux: $P2
new $P3, [ 'TokenIdentifier' ]
$P3.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
set $P2, $P3
.annotate 'line', 7813
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 7812
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7811
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7817
new $P6, [ 'TokenInteger' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
$P6.'TokenInteger'($P7, $P8, 'false')
set $P5, $P6
.annotate 'line', 7816
$P4 = 'integerValue'($P1, $P5, 1)
.annotate 'line', 7815
$P1.'createconst'('true', 'I', $P4, '')
.annotate 'line', 7823
new $P9, [ 'StringLiteral' ]
.annotate 'line', 7824
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
.annotate 'line', 7822
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 7827
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7828

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7829
# Body
# {
.annotate 'line', 7831
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7832

.end # parse


.sub 'optimize' :method

.annotate 'line', 7833
# Body
# {
.annotate 'line', 7835
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7836

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7837
# Body
# {
.annotate 'line', 7839
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7840
__ARG_1.'say'('')
.annotate 'line', 7842
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7844
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7845

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7803
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7852
# Body
# {
.annotate 'line', 7854
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7856
$P1.'open'('__eval__', 'w')
.annotate 'line', 7857
$P1.'puts'(__ARG_1)
.annotate 'line', 7858
$P1.'close'()
.annotate 'line', 7859
$P1.'open'('__eval__', 'r')
.annotate 'line', 7860
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7861
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7862
$P3.'parse'($P2)
.annotate 'line', 7863
$P1.'close'()
.annotate 'line', 7864
$P3.'optimize'()
.annotate 'line', 7865
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7866
$P4.'open'('__eval__', 'w')
.annotate 'line', 7867
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7868
$P5.'initialize'($P4)
.annotate 'line', 7869
$P3.'emit'($P5)
.annotate 'line', 7870
$P5.'close'()
.annotate 'line', 7871
$P4.'close'()
.annotate 'line', 7872
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7873
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7874
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7875
.return($P7)
# }
.annotate 'line', 7876

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7877
# Body
# {
.annotate 'line', 7879
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7880
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7881
$P1.'encoding'('utf8')
.annotate 'line', 7882
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7883
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7884
$P3.'parse'($P2)
.annotate 'line', 7885
$P1.'close'()
.annotate 'line', 7886
$P3.'optimize'()
.annotate 'line', 7887
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7888
$P4.'initialize'(__ARG_2)
.annotate 'line', 7889
$P3.'emit'($P4)
.annotate 'line', 7890
$P4.'close'()
# }
.annotate 'line', 7891

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7892
# Body
# {
.annotate 'line', 7894
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7895
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7896
$P1.'encoding'('utf8')
.annotate 'line', 7897
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7898
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7899
$P3.'parse'($P2)
.annotate 'line', 7900
$P1.'close'()
.annotate 'line', 7901
$P3.'optimize'()
.annotate 'line', 7902
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7903
$P4.'open'('__eval__', 'w')
.annotate 'line', 7904
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7905
$P5.'initialize'($P4)
.annotate 'line', 7906
$P3.'emit'($P5)
.annotate 'line', 7907
$P5.'close'()
.annotate 'line', 7908
$P4.'close'()
.annotate 'line', 7909
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7910
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7911
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7912
.return($P7)
# }
.annotate 'line', 7913

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7918
# Body
# {
.annotate 'line', 7920
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7921
$P1.'parse'(__ARG_1)
.annotate 'line', 7923
$P1.'optimize'()
.annotate 'line', 7925
# var handle: $P2
null $P2
.annotate 'line', 7926
ne __ARG_2, '-', __label_0
.annotate 'line', 7927
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7929
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7930
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7931
$P3.'initialize'($P2)
.annotate 'line', 7932
$P1.'emit'($P3)
.annotate 'line', 7933
$P3.'close'()
.annotate 'line', 7934
$P2.'close'()
# }
.annotate 'line', 7935

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7941
# Body
# {
.annotate 'line', 7943
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7944
compreg 'winxed', $P1
# }
.annotate 'line', 7945

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7947
# Body
# {
.annotate 'line', 7949
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7950
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7951
$P1.'notOptStop'(1)
.annotate 'line', 7952
$P1.'push_string'('o=s')
.annotate 'line', 7953
$P1.'push_string'('e=s')
.annotate 'line', 7954
$P1.'push_string'('c')
.annotate 'line', 7955
$P1.'push_string'('noan')
.annotate 'line', 7957
__ARG_1.'shift'()
.annotate 'line', 7958
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7959
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7960
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7961
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7962
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7964
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7965
# string filename: $S1
null $S1
.annotate 'line', 7966
# string expr: $S2
null $S2
.annotate 'line', 7967
# var file: $P7
null $P7
.annotate 'line', 7968
unless_null $P4, __label_0
# {
.annotate 'line', 7969
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 7970
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7972
$S1 = __ARG_1[0]
.annotate 'line', 7973
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7974
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 7979
new $P7, [ 'StringHandle' ]
.annotate 'line', 7980
$P7.'open'('__eval__', 'w')
.annotate 'line', 7981
$P7.'puts'($S2)
.annotate 'line', 7982
$P7.'close'()
.annotate 'line', 7983
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7986
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7988
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7989
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7991
'winxed_parser'($P8, $S3)
.annotate 'line', 7993
$P7.'close'()
# }
.annotate 'line', 7994

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7996
# Body
# {
.annotate 'line', 7998
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8004
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7998
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8007
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 8008
print 'Error: '
say $S1
.annotate 'line', 8009
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8010
# int i: $I1
set $I1, 1
.annotate 'line', 8011
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8012
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8013
# string subname: $S2
null $S2
.annotate 'line', 8014
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8016
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8017
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
.annotate 'line', 8019
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8020
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8021
eq $S4, '', __label_8
# {
.annotate 'line', 8022
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 8023
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
.annotate 'line', 8027

.end # main

# End generated code
