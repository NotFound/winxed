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
.annotate 'line', 606
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
.annotate 'line', 723
$S2 = $P1
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


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 760
# Body
# {
.annotate 'line', 762
# string ins: $S1
concat $S0, 'if_null ', __ARG_1
concat $S0, ', '
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 763
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 764

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 765
# Body
# {
.annotate 'line', 767
# string ins: $S1
concat $S0, "null ", __ARG_1
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 768
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 769

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 770
# Body
# {
.annotate 'line', 772
# string ins: $S1
concat $S0, "set ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 773
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 774

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 775
# Body
# {
.annotate 'line', 777
# string ins: $S1
concat $S0, "assign ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 778
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 779

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 780
# Body
# {
.annotate 'line', 782
# string ins: $S1
concat $S0, "box ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 783
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 784

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 785
# Body
# {
.annotate 'line', 787
# string ins: $S1
concat $S0, "unbox ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 788
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 789

.end # emitunbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 790
# Body
# {
.annotate 'line', 792
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 793
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 794

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 795
# Body
# {
.annotate 'line', 797
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 798
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 799

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 800
# Body
# {
.annotate 'line', 802
# string ins: $S1
concat $S0, "mul ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 803
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 804

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 805
# Body
# {
.annotate 'line', 807
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 808
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 809

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 810
# Body
# {
.annotate 'line', 812
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 813
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 814

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

.annotate 'line', 821
# Body
# {
.annotate 'line', 823
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 824

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 826
# Body
# {
.annotate 'line', 828
# var t: $P1
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenFloat'($P3, $P4, __ARG_3)
set $P1, $P2
.annotate 'line', 829
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 830

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 832
# Body
# {
.annotate 'line', 838
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 839
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 840
.return($I1)
# }
.annotate 'line', 841

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 862
# Body
# {
.annotate 'line', 864
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 865
.return($S1)
# }
.annotate 'line', 866

.end # name


.sub 'result' :method

.annotate 'line', 867
# Body
# {
.annotate 'line', 869
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 870

.end # result


.sub 'params' :method

.annotate 'line', 871
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 872
# Body
# {
.annotate 'line', 874
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 875
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 876
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 877
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 878
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 880
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 882
.return($S1)
# }
.annotate 'line', 883

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 884
# Body
# {
box $P1, __ARG_1
.annotate 'line', 890
setattribute self, 'name', $P1
.annotate 'line', 891
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 892
setattribute self, 'typeresult', $P2
.annotate 'line', 893
# int n: $I1
null $I1
.annotate 'line', 894
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 895
setattribute self, 'type0', $P2
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 896
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
.annotate 'line', 902
if_null __ARG_5, __label_5
concat $S3, "Invalid predef '", __ARG_1
concat $S3, '"'
.annotate 'line', 903
'InternalError'($S3)
__label_5: # endif
goto __label_1 # break
__label_2: # default
set $I1, 1
.annotate 'line', 907
if_null __ARG_5, __label_6
# {
box $P3, __ARG_5
.annotate 'line', 908
setattribute self, 'type1', $P3
.annotate 'line', 909
inc $I1
# }
__label_6: # endif
.annotate 'line', 911
if_null __ARG_6, __label_7
# {
box $P3, __ARG_6
.annotate 'line', 912
setattribute self, 'type2', $P3
.annotate 'line', 913
inc $I1
# }
__label_7: # endif
__label_1: # switch end
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 917
setattribute self, 'nparams', $P4
.annotate 'line', 918
.return(self)
# }
.annotate 'line', 919

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 920
# Body
# {
.annotate 'line', 928
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 929
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 930
.return(self)
# }
.annotate 'line', 931

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 932
# Body
# {
.annotate 'line', 934
# string name: $S1
getattribute $P3, self, 'name'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 935
# string typeresult: $S2
getattribute $P3, self, 'typeresult'
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 936
__ARG_1.'comment'($S6)
.annotate 'line', 938
getattribute $P4, self, 'nparams'
set $I4, $P4
ne $I4, -2, __label_2
# {
.annotate 'line', 939
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 940
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 941
.return()
# }
__label_2: # endif
.annotate 'line', 943
getattribute $P4, self, 'body'
isa $I4, $P4, 'String'
unless $I4 goto __label_3
# {
.annotate 'line', 944
# string body: $S3
getattribute $P5, self, 'body'
null $S3
if_null $P5, __label_5
set $S3, $P5
__label_5:
.annotate 'line', 945
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 946
ne $S2, 'v', __label_6
# {
.annotate 'line', 947
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_9
isne $I5, __ARG_4, ''
__label_9:
unless $I5 goto __label_8
.annotate 'line', 948
'SyntaxError'('using return value from void predef')
__label_8: # endif
.annotate 'line', 949
eq $I1, -1, __label_10
.annotate 'line', 950
'InternalError'('void predef with {res}')
__label_10: # endif
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 953
ne $I1, -1, __label_11
.annotate 'line', 954
'InternalError'('non void predef without {res}')
__label_11: # endif
.annotate 'line', 955
isne $I5, $S2, 'v'
unless $I5 goto __label_13
isnull $I5, __ARG_4
if $I5 goto __label_14
iseq $I5, __ARG_4, ''
__label_14:
__label_13:
unless $I5 goto __label_12
.annotate 'line', 956
$P5 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P5
__label_12: # endif
__label_15: # do
.annotate 'line', 957
# {
.annotate 'line', 958
# predefined substr
substr $S6, $S3, 0, $I1
add $I6, $I1, 5
# predefined substr
substr $S7, $S3, $I6
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 959
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_15
__label_16: # enddo
# }
__label_7: # endif
.annotate 'line', 962
# int n: $I2
set $P6, __ARG_5
set $I2, $P6
# for loop
.annotate 'line', 963
# int i: $I3
null $I3
__label_20: # for condition
ge $I3, $I2, __label_19
# {
.annotate 'line', 964
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S0, $S7, '}'
set $S4, $S0
.annotate 'line', 965
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_22: # while
.annotate 'line', 966
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_21
.annotate 'line', 967
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
.annotate 'line', 963
inc $I3
goto __label_20
__label_19: # for end
.annotate 'line', 969
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 970
__ARG_1.'say'($S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 973
# var fun: $P2
getattribute $P2, self, 'body'
.annotate 'line', 974
$P2(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_4: # endif
# }
.annotate 'line', 976

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 853
addattribute $P0, 'name'
.annotate 'line', 854
addattribute $P0, 'body'
.annotate 'line', 855
addattribute $P0, 'evalfun'
.annotate 'line', 856
addattribute $P0, 'typeresult'
.annotate 'line', 857
addattribute $P0, 'type0'
.annotate 'line', 858
addattribute $P0, 'type1'
.annotate 'line', 859
addattribute $P0, 'type2'
.annotate 'line', 860
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 982
# Body
# {
box $P1, __ARG_1
.annotate 'line', 984
setattribute self, 'type', $P1
# }
.annotate 'line', 985

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 986
# Body
# {
.annotate 'line', 988
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 989
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 990
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 991
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 992
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 993
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 994
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 996
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 997
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 998
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1000

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 981
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1005
# Body
# {
.annotate 'line', 1007
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1008
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1009
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1010
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 1011
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 1010
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 1012
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1015
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 1016

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

.annotate 'line', 1021
# Body
# {
.annotate 'line', 1023
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1024
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1025
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1026
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1027
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1026
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1028
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1029

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

.annotate 'line', 1034
# Body
# {
.annotate 'line', 1036
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1037
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1038
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 1039
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 1038
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1040

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1043
# Body
# {
.annotate 'line', 1045
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1046
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1047
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1048

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1050
# Body
# {
.annotate 'line', 1052
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1053
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1054
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1055

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1057
# Body
# {
.annotate 'line', 1059
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1060
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1061
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1062

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1064
# Body
# {
.annotate 'line', 1066
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1067
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1068
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1069
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1070
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1071

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1073
# Body
# {
.annotate 'line', 1075
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1077
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1078
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1080
# var t: $P2
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
$P4.'TokenQuoted'($P5, $P6, $S1)
set $P2, $P4
.annotate 'line', 1081
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1082

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 1084
# Body
# {
.annotate 'line', 1086
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1087
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1088
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1089
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1090
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1092
# var predefs: $P1
root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 1093
new $P10, [ 'PredefFunction' ]
.annotate 'line', 1094
new $P12, [ 'Predef_typecast' ]
$P12.'Predef_typecast'('I')
set $P11, $P12
.annotate 'line', 1093
$P9 = $P10.'set'('int', $P11, 'I', '!')
.annotate 'line', 1092
$P7.'push'($P9)
.annotate 'line', 1097
new $P14, [ 'PredefFunction' ]
.annotate 'line', 1098
new $P16, [ 'Predef_typecast' ]
$P16.'Predef_typecast'('N')
set $P15, $P16
.annotate 'line', 1097
$P13 = $P14.'set'('float', $P15, 'N', '!')
.annotate 'line', 1092
$P7.'push'($P13)
.annotate 'line', 1101
new $P18, [ 'PredefFunction' ]
.annotate 'line', 1102
new $P20, [ 'Predef_typecast' ]
$P20.'Predef_typecast'('S')
set $P19, $P20
.annotate 'line', 1101
$P17 = $P18.'set'('string', $P19, 'S', '!')
.annotate 'line', 1092
$P7.'push'($P17)
.annotate 'line', 1105
new $P22, [ 'PredefFunction' ]
$P21 = $P22.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1092
$P7.'push'($P21)
.annotate 'line', 1109
new $P24, [ 'PredefFunction' ]
$P23 = $P24.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1092
$P7.'push'($P23)
.annotate 'line', 1113
new $P26, [ 'PredefFunction' ]
$P25 = $P26.'set'('time', 'time {res}', 'I')
.annotate 'line', 1092
$P7.'push'($P25)
.annotate 'line', 1117
new $P28, [ 'PredefFunction' ]
$P27 = $P28.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1092
$P7.'push'($P27)
.annotate 'line', 1121
new $P30, [ 'PredefFunction' ]
$P29 = $P30.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1092
$P7.'push'($P29)
.annotate 'line', 1125
new $P32, [ 'PredefFunction' ]
$P31 = $P32.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P31)
.annotate 'line', 1130
new $P34, [ 'PredefFunction' ]
$P33 = $P34.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P33)
.annotate 'line', 1135
new $P36, [ 'PredefFunction' ]
$P35 = $P36.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P35)
.annotate 'line', 1140
new $P38, [ 'PredefFunction' ]
$P37 = $P38.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1092
$P7.'push'($P37)
.annotate 'line', 1146
new $P40, [ 'PredefFunction' ]
$P39 = $P40.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1092
$P7.'push'($P39)
.annotate 'line', 1153
new $P42, [ 'PredefFunction' ]
$P41 = $P42.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1092
$P7.'push'($P41)
.annotate 'line', 1157
new $P44, [ 'PredefFunction' ]
$P43 = $P44.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1092
$P7.'push'($P43)
.annotate 'line', 1162
new $P46, [ 'PredefFunction' ]
$P45 = $P46.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1092
$P7.'push'($P45)
.annotate 'line', 1167
new $P48, [ 'PredefFunction' ]
$P47 = $P48.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1092
$P7.'push'($P47)
.annotate 'line', 1174
new $P50, [ 'PredefFunction' ]
$P49 = $P50.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1092
$P7.'push'($P49)
.annotate 'line', 1179
new $P52, [ 'PredefFunction' ]
$P51 = $P52.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1092
$P7.'push'($P51)
.annotate 'line', 1184
new $P54, [ 'PredefFunction' ]
$P53 = $P54.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1092
$P7.'push'($P53)
.annotate 'line', 1188
new $P56, [ 'PredefFunction' ]
$P55 = $P56.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1092
$P7.'push'($P55)
.annotate 'line', 1192
new $P58, [ 'PredefFunction' ]
$P57 = $P58.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P57)
.annotate 'line', 1196
new $P60, [ 'PredefFunction' ]
$P59 = $P60.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1092
$P7.'push'($P59)
.annotate 'line', 1200
new $P62, [ 'PredefFunction' ]
$P61 = $P62.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1092
$P7.'push'($P61)
.annotate 'line', 1204
new $P64, [ 'PredefFunction' ]
$P63 = $P64.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P63)
.annotate 'line', 1208
new $P66, [ 'PredefFunction' ]
$P65 = $P66.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P65)
.annotate 'line', 1212
new $P68, [ 'PredefFunction' ]
$P67 = $P68.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P67)
.annotate 'line', 1216
new $P70, [ 'PredefFunction' ]
$P69 = $P70.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P69)
.annotate 'line', 1220
new $P72, [ 'PredefFunction' ]
$P71 = $P72.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P71)
.annotate 'line', 1225
new $P74, [ 'PredefFunction' ]
$P73 = $P74.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P73)
.annotate 'line', 1230
new $P76, [ 'PredefFunction' ]
$P75 = $P76.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P75)
.annotate 'line', 1234
new $P78, [ 'PredefFunction' ]
$P77 = $P78.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P77)
.annotate 'line', 1238
new $P80, [ 'PredefFunction' ]
$P79 = $P80.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P79)
.annotate 'line', 1242
new $P82, [ 'PredefFunction' ]
$P81 = $P82.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P81)
.annotate 'line', 1246
new $P84, [ 'PredefFunction' ]
$P83 = $P84.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P83)
.annotate 'line', 1250
new $P86, [ 'PredefFunction' ]
$P85 = $P86.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P85)
.annotate 'line', 1254
new $P88, [ 'PredefFunction' ]
$P87 = $P88.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P87)
.annotate 'line', 1258
new $P90, [ 'PredefFunction' ]
$P89 = $P90.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P89)
.annotate 'line', 1262
new $P92, [ 'PredefFunction' ]
$P91 = $P92.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P91)
.annotate 'line', 1266
new $P94, [ 'PredefFunction' ]
$P93 = $P94.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P93)
.annotate 'line', 1270
new $P96, [ 'PredefFunction' ]
$P95 = $P96.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1092
$P7.'push'($P95)
.annotate 'line', 1274
new $P98, [ 'PredefFunction' ]
$P97 = $P98.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1092
$P7.'push'($P97)
.annotate 'line', 1278
new $P100, [ 'PredefFunction' ]
$P99 = $P100.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P99)
.annotate 'line', 1282
new $P102, [ 'PredefFunction' ]
$P101 = $P102.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P101)
.annotate 'line', 1286
new $P104, [ 'PredefFunction' ]
$P103 = $P104.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P103)
.annotate 'line', 1290
new $P106, [ 'PredefFunction' ]
$P105 = $P106.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1092
$P7.'push'($P105)
.annotate 'line', 1294
new $P108, [ 'PredefFunction' ]
$P107 = $P108.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1092
$P7.'push'($P107)
.annotate 'line', 1298
new $P110, [ 'PredefFunction' ]
$P109 = $P110.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P109)
.annotate 'line', 1302
new $P112, [ 'PredefFunction' ]
$P111 = $P112.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1092
$P7.'push'($P111)
.annotate 'line', 1306
new $P114, [ 'PredefFunction' ]
$P113 = $P114.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P113)
.annotate 'line', 1311
new $P116, [ 'PredefFunction' ]
$P115 = $P116.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P115)
.annotate 'line', 1316
new $P118, [ 'PredefFunction' ]
$P117 = $P118.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1092
$P7.'push'($P117)
.annotate 'line', 1320
new $P120, [ 'PredefFunction' ]
$P119 = $P120.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1092
$P7.'push'($P119)
.annotate 'line', 1324
new $P122, [ 'PredefFunction' ]
$P121 = $P122.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1092
$P7.'push'($P121)
.annotate 'line', 1328
new $P124, [ 'PredefFunction' ]
$P123 = $P124.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1092
$P7.'push'($P123)
.annotate 'line', 1332
new $P126, [ 'PredefFunction' ]
$P125 = $P126.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1092
$P7.'push'($P125)
.annotate 'line', 1336
new $P128, [ 'PredefFunction' ]
.annotate 'line', 1337
new $P129, [ 'Predef_print' ]
.annotate 'line', 1336
$P127 = $P128.'set'('print', $P129, 'P', '*')
.annotate 'line', 1092
$P7.'push'($P127)
.annotate 'line', 1340
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1341
new $P132, [ 'Predef_say' ]
.annotate 'line', 1340
$P130 = $P131.'set'('say', $P132, 'P', '*')
.annotate 'line', 1092
$P7.'push'($P130)
.annotate 'line', 1344
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1345
new $P135, [ 'Predef_cry' ]
.annotate 'line', 1344
$P133 = $P134.'set'('cry', $P135, 'P', '*')
.annotate 'line', 1092
$P7.'push'($P133)
set $P1, $P7
__label_1: # Infinite loop
.annotate 'line', 1350
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1351

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1353
# Body
# {
.annotate 'line', 1355
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1356
getattribute $P4, $P1, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1357
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1358
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1359
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1360
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1361
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1363
.return($P2)
# }
.annotate 'line', 1364

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1370
# Body
# {
.annotate 'line', 1372
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1373
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1374
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1373
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1375

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1386
# Body
# {
.annotate 'line', 1388
setattribute self, 'start', __ARG_1
.annotate 'line', 1389
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1390

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1391
# Body
# {
.annotate 'line', 1393
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1394

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1395
# Body
# {
.annotate 'line', 1397
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1398

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1399
# Body
# {
.annotate 'line', 1401
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1402

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1403
# Body
# {
.annotate 'line', 1405
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1406

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1407
# Body
# {
.annotate 'line', 1409
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1410

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1383
addattribute $P0, 'start'
.annotate 'line', 1384
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1423
# Body
# {
.annotate 'line', 1425
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1426

.end # init


.sub 'numargs' :method

.annotate 'line', 1428
# Body
# {
.annotate 'line', 1430
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1431

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1432
# Body
# {
.annotate 'line', 1434
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1435
.return($P2)
# }
.annotate 'line', 1436

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1438
# Body
# {
.annotate 'line', 1440
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1441
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1442
# {
.annotate 'line', 1443
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1444
$P1.'push'($P3)
# }
.annotate 'line', 1445
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1446
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1447

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1449
# Body
# {
.annotate 'line', 1451
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1452
if_null $P1, __label_0
.annotate 'line', 1453
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1454

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1455
# Body
# {
.annotate 'line', 1457
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1458
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1459
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1460
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1461
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1462
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1463
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1460
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1465
.return($P2)
# }
.annotate 'line', 1466

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1467
# Body
# {
.annotate 'line', 1469
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1470
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1471

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1421
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1483
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1484
# Body
# {
.annotate 'line', 1486
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1487
.return($I1)
# }
.annotate 'line', 1488

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1489
# Body
# {
.annotate 'line', 1491
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1492
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1493
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1495
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1496

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1497
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1499
setattribute self, 'name', $P1
.annotate 'line', 1500
if_null __ARG_2, __label_0
.annotate 'line', 1501
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1502

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1503
# Body
# {
.annotate 'line', 1505
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1506

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1480
addattribute $P0, 'name'
.annotate 'line', 1481
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1513
# Body
# {
.annotate 'line', 1515
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1516
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1517
# {
.annotate 'line', 1518
$P2 = __ARG_1.'get'()
.annotate 'line', 1519
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1520
$P2 = __ARG_1.'get'()
.annotate 'line', 1521
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1522
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1523
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1524
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1526
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1527
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1528
'RequireOp'(']', $P2)
.annotate 'line', 1529
setattribute self, 'list', $P1
# }
.annotate 'line', 1530

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1531
# Body
# {
.annotate 'line', 1533
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1534
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1535

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1536
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1537
# Body
# {
.annotate 'line', 1539
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1540
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1541
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1542
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1543
$P3 = $P2.'getname'()
$S1 = $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1544
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1541
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1547
.return($P3)
# }
.annotate 'line', 1548

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1511
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1555
# Body
# {
.annotate 'line', 1557
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1558
.return($S2)
# }
.annotate 'line', 1559

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1561
# Body
# {
.annotate 'line', 1563
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1564
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1566
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1567
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1569

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1571
# Body
# {
.annotate 'line', 1573
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1574
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1575
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1576
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1577
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1579
__ARG_2.'unget'($P1)
.annotate 'line', 1580
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1582

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1584
# Body
# {
.annotate 'line', 1586
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1587
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1588
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1589
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1590
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1591
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1592
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1594
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1595
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1596
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
.annotate 'line', 1598
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1600
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1603
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1605
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1607
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1609
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1611
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_13: # case
.annotate 'line', 1613
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_14: # case
.annotate 'line', 1615
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_15: # case
.annotate 'line', 1617
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_16: # case
.annotate 'line', 1619
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_17: # case
.annotate 'line', 1621
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_18: # case
.annotate 'line', 1623
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_19: # case
.annotate 'line', 1625
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_20: # case
.annotate 'line', 1627
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_21: # case
.annotate 'line', 1629
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1631
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_23: # case
.annotate 'line', 1633
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1635
$P30 = $P1.'isidentifier'()
if_null $P30, __label_24
unless $P30 goto __label_24
# {
.annotate 'line', 1636
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1637
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1638
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_25: # endif
.annotate 'line', 1639
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1641
__ARG_1.'unget'($P1)
.annotate 'line', 1642
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1644
unless_null $P2, __label_26
.annotate 'line', 1645
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1646
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1647

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1655
# Body
# {
.annotate 'line', 1657
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1658

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1659
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1660
# Body
# {
.annotate 'line', 1662
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1663

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1664
# Body
# {
.annotate 'line', 1666
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1667

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1668
# Body
# {
.annotate 'line', 1670
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1671

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1672
# Body
# {
.annotate 'line', 1674
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1675

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1676
# Body
# {
.annotate 'line', 1678
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1679

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1680
# Body
# {
.annotate 'line', 1682
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1683

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1684
# Body
# {
.annotate 'line', 1686
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1687

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1688
# Body
# {
.annotate 'line', 1690
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1691

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1692
# Body
# {
.annotate 'line', 1694
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1695

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1696
# Body
# {
.annotate 'line', 1698
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1699

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1701
# Body
# {
.annotate 'line', 1706
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1707

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1708
# Body
# {
.annotate 'line', 1710
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1711

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1712
# Body
# {
.annotate 'line', 1714
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1715

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1716
# Body
# {
.annotate 'line', 1718
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1720
.return(self)
# }
.annotate 'line', 1721

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1653
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1726
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1727
# Body
# {
.annotate 'line', 1729
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1730

.end # annotate


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
# }
.annotate 'line', 1735

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1724
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1742
# Body
# {
.annotate 'line', 1744
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1745
$P1.'push'(__ARG_1)
.annotate 'line', 1746
$P1.'push'(__ARG_2)
.annotate 'line', 1747
setattribute self, 'statements', $P1
# }
.annotate 'line', 1748

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1749
# Body
# {
.annotate 'line', 1751
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1752
.return(self)
# }
.annotate 'line', 1753

.end # push


.sub 'optimize' :method

.annotate 'line', 1754
# Body
# {
.annotate 'line', 1756
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1757
.return(self)
# }
.annotate 'line', 1758

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1759
# Body
# {
.annotate 'line', 1761
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1762
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1763

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1740
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1766
# Body
# {
.annotate 'line', 1768
unless_null __ARG_1, __label_0
.annotate 'line', 1769
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1770
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1771
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1773
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1774

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1784
# Body
# {
.annotate 'line', 1786
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1787
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1788
# int dotted: $I1
null $I1
.annotate 'line', 1789
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1791
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1793
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1794
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
setattribute self, 'opname', $P3
.annotate 'line', 1795
$P1 = __ARG_2.'get'()
.annotate 'line', 1796
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1797
__ARG_2.'unget'($P1)
.annotate 'line', 1798
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1800
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1801

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1802
# Body
# {
.annotate 'line', 1804
self.'optimizeargs'()
.annotate 'line', 1805
.return(self)
# }
.annotate 'line', 1806

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1807
# Body
# {
.annotate 'line', 1809
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1810
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1811
__ARG_1.'comment'($S2)
.annotate 'line', 1812
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1813
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1815
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1816
self.'emitargs'(__ARG_1)
.annotate 'line', 1817
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1819

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1780
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1782
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1829
# Body
# {
.annotate 'line', 1831
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1832
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1833
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1834
# {
.annotate 'line', 1835
$P2 = __ARG_2.'get'()
.annotate 'line', 1836
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1837
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1838
'RequireOp'(';', $P2)
.annotate 'line', 1839
setattribute self, 'path', $P1
.annotate 'line', 1840
.return(self)
# }
.annotate 'line', 1841

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1842
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1843
# Body
# {
.annotate 'line', 1845
self.'annotate'(__ARG_1)
.annotate 'line', 1846
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1847

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1826
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1828
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1857
# Body
# {
.annotate 'line', 1859
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1860
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1861
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1862
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1863

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1864
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1865
# Body
# {
.annotate 'line', 1867
self.'annotate'(__ARG_1)
.annotate 'line', 1868
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1869
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1870

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1854
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1856
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1880
# Body
# {
.annotate 'line', 1882
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1883
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1884
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1885
# {
.annotate 'line', 1886
$P2 = __ARG_2.'get'()
.annotate 'line', 1887
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1888
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1889
'RequireOp'(';', $P2)
.annotate 'line', 1890
setattribute self, 'path', $P1
# }
.annotate 'line', 1891

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1892
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1893
# Body
# {
.annotate 'line', 1895
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1896
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1897
self.'annotate'(__ARG_1)
.annotate 'line', 1899
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 1900
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 1902
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 1903
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1905
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1908
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1910

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1877
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1879
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1920
# Body
# {
.annotate 'line', 1922
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1923
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1924
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1925

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1926
# Body
# {
.annotate 'line', 1928
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1929
.return(self)
# }
.annotate 'line', 1930

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1931
# Body
# {
.annotate 'line', 1933
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1934

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1917
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1919
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4 :optional

.annotate 'line', 1950
# Body
# {
.annotate 'line', 1952
setattribute self, 'type', __ARG_1
.annotate 'line', 1953
setattribute self, 'reg', __ARG_2
.annotate 'line', 1954
setattribute self, 'scope', __ARG_3
.annotate 'line', 1955
setattribute self, 'value', __ARG_4
# }
.annotate 'line', 1956

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 1957
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1959
setattribute self, 'id', $P1
# }
.annotate 'line', 1960

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 1961
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1963
setattribute self, 'lexname', $P1
# }
.annotate 'line', 1964

.end # setlex


.sub 'gettype' :method

.annotate 'line', 1965
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 1966
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 1967
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 1968
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 1969
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 1970
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 1971
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 1943
addattribute $P0, 'type'
.annotate 'line', 1944
addattribute $P0, 'reg'
.annotate 'line', 1945
addattribute $P0, 'scope'
.annotate 'line', 1946
addattribute $P0, 'value'
.annotate 'line', 1947
addattribute $P0, 'id'
.annotate 'line', 1948
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1977
# Body
# {
.annotate 'line', 1979
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1980

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 1981
# Body
# {
# predefined Error
.annotate 'line', 1983
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1984

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1976
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1991
# Body
# {
.annotate 'line', 1993
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1994

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1995
# Body
# {
.annotate 'line', 1997
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1998
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1999
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2000
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 2001
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2002
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2003
# var data: $P3
new $P5, [ 'VarData' ]
$P5.'VarData'(__ARG_2, $S2, self)
set $P3, $P5
.annotate 'line', 2004
$P1[$S1] = $P3
.annotate 'line', 2005
.return($P3)
# }
.annotate 'line', 2006

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2007
# Body
# {
.annotate 'line', 2009
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2010
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2011
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2012
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 2013
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2014
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2015

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2016
# Body
# {
.annotate 'line', 2018
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2019
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2020
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2021
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 2022
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2023
# var data: $P3
new $P4, [ 'VarData' ]
new $P6, [ 'ConstantInternalFail' ]
$P6.'ConstantInternalFail'(__ARG_1)
set $P5, $P6
$P4.'VarData'(__ARG_2, $P5, self, __ARG_3)
set $P3, $P4
.annotate 'line', 2024
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2025
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2026
$P1[$S1] = $P3
# }
.annotate 'line', 2027

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2028
# Body
# {
.annotate 'line', 2030
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2031
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2032
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2033
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2034
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2035
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2036
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2037
.return($P2)
# }
.annotate 'line', 2038

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2039
# Body
# {
.annotate 'line', 2041
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2042
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2043
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2044
.return($P2)
# }
.annotate 'line', 2045

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2046
# Body
# {
.annotate 'line', 2048
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2049
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2050
.return($S1)
# }
.annotate 'line', 2051

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2052
# Body
# {
.annotate 'line', 2054
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2056
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2057
.return('__WLEX_self')
# }
.annotate 'line', 2058

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1990
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2067
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2077
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2078
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2079
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2080
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2081
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2082
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2083
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2084
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2085
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2086
# Body
# {
.annotate 'line', 2088
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2089

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2090
# Body
# {
.annotate 'line', 2092
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2093

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2094
# Body
# {
.annotate 'line', 2097
.return(self)
# }
.annotate 'line', 2098

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2099
# Body
# {
.annotate 'line', 2101
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2102
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2103
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2104
.return($S2)
# }
.annotate 'line', 2105

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2106
# Body
# {
.annotate 'line', 2108
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2109

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2075
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2114
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2112
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2122
# Body
# {
.annotate 'line', 2124
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2125
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2126
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2127
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2128
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2129

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2130
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2131
# Body
# {
.annotate 'line', 2133
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2134
.return(self)
# }
.annotate 'line', 2135

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2136
# Body
# {
.annotate 'line', 2138
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2139
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2140
self.'annotate'(__ARG_1)
.annotate 'line', 2141
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2142
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2143
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2144

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2119
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2121
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2157
# Body
# {
.annotate 'line', 2159
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2160
.return(self)
# }
.annotate 'line', 2161

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2162
# Body
# {
.annotate 'line', 2164
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2165

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2166
# Body
# {
.annotate 'line', 2168
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2169
.return(self)
# }
.annotate 'line', 2170

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2174
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2175
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2177
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2178
ne $I1, 0, __label_4
.annotate 'line', 2179
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2181
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2184
.return(0)
# }
.annotate 'line', 2185

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2186
# Body
# {
.annotate 'line', 2188
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2190
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2191
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2192
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2194
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2195
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2196
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
.annotate 'line', 2199
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2202
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2205
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2208

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2209
# Body
# {
.annotate 'line', 2211
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2213
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2214
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2215
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2217
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2218
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2219
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
.annotate 'line', 2222
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2225
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2228
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2231

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2156
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2238
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2239
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2236
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2247
# Body
# {
.annotate 'line', 2249
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2250
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2251

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2252
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2253
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2254
# Body
# {
.annotate 'line', 2256
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2257
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2258
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2259
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2260
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2261
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2263
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2266
unless $I2 goto __label_4
# {
.annotate 'line', 2267
unless $I1 goto __label_5
# {
null $I1
.annotate 'line', 2269
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2271
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2272
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2274
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2277
# string result: $S4
set $S4, ''
.annotate 'line', 2278
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2279
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2280
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2281
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2282
le $I6, 127, __label_12
# {
.annotate 'line', 2283
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
.annotate 'line', 2284
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2287
# }
__label_9: # for iteration
.annotate 'line', 2279
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2289
# }
__label_4: # endif
.annotate 'line', 2291
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
.annotate 'line', 2293
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2295
.return($S1)
# }
.annotate 'line', 2296

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2297
# Body
# {
.annotate 'line', 2299
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2300
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2301
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2302
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2303
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2305
.return($S1)
# }
.annotate 'line', 2306

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2307
# Body
# {
.annotate 'line', 2309
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2310

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2311
# Body
# {
.annotate 'line', 2313
.tailcall self.'getPirString'()
# }
.annotate 'line', 2314

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2244
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2246
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2323
# Body
# {
.annotate 'line', 2326
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2327
setattribute self, 'pos', __ARG_2
.annotate 'line', 2328
# int n: $I1
null $I1
.annotate 'line', 2329
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2330
# {
.annotate 'line', 2332
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2333
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2335
setattribute self, 'numval', $P2
# }
.annotate 'line', 2336

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2337
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2338
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2339
# Body
# {
.annotate 'line', 2341
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2342
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2343
.return($I1)
# }
.annotate 'line', 2344

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2345
# Body
# {
.annotate 'line', 2347
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2348
ne $I1, 0, __label_0
.annotate 'line', 2349
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2351
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2352

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2353
# Body
# {
.annotate 'line', 2355
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2356

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2319
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2321
addattribute $P0, 'pos'
.annotate 'line', 2322
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2364
# Body
# {
.annotate 'line', 2366
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2367
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2368

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2369
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2370
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2371
# Body
# {
.annotate 'line', 2373
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2374
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2376
.return($P1)
# }
.annotate 'line', 2377

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2378
# Body
# {
.annotate 'line', 2380
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2381
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2382

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2383
# Body
# {
.annotate 'line', 2387
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2388
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2390
.return($S1)
# }
.annotate 'line', 2391

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2361
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2363
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2399
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2400
# Body
# {
.annotate 'line', 2402
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2403
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2404

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2405
# Body
# {
.annotate 'line', 2407
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2408

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2412
if_null $P1, __label_0
.annotate 'line', 2413
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2415
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
.annotate 'line', 2418
.return('P')
__label_3: # default
.annotate 'line', 2420
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2423

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2427
.return($S1)
# }
.annotate 'line', 2428

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2429
# Body
# {
.annotate 'line', 2431
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2432
unless_null $P1, __label_0
.annotate 'line', 2433
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2434
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2435
# string s: $S1
null $S1
.annotate 'line', 2436
unless_null $P2, __label_1
# {
.annotate 'line', 2437
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2438
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
.annotate 'line', 2444
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2448
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2449
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2451
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2453
.return($S1)
# }
.annotate 'line', 2454

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2455
# Body
# {
.annotate 'line', 2457
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2458
$S2 = $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2459
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2460
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2462
.return($P1)
# }
.annotate 'line', 2463

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2464
# Body
# {
.annotate 'line', 2466
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2467
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2468
if_null $P2, __label_0
# {
.annotate 'line', 2469
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2470
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2472
.return(self)
# }
.annotate 'line', 2473

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2474
# Body
# {
.annotate 'line', 2476
self.'annotate'(__ARG_1)
.annotate 'line', 2477
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2478

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2482

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2483
# Body
# {
.annotate 'line', 2485
self.'annotate'(__ARG_1)
.annotate 'line', 2486
# string typeleft: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2487
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2488
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2489
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2492
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2495
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2498
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2499
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2501
# string typeright: $S3
$P2 = __ARG_2.'checkresult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2502
ne $S1, $S3, __label_11
# {
.annotate 'line', 2503
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2506
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2507
self.'annotate'(__ARG_1)
.annotate 'line', 2508
iseq $I1, $S1, 'P'
unless $I1 goto __label_16
isne $I1, $S3, 'P'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 2509
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2511
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2514
.return($S2)
# }
.annotate 'line', 2515

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2396
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2398
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2522
# Body
# {
.annotate 'line', 2524
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2525

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2520
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2533
# Body
# {
.annotate 'line', 2535
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2536
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2537

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2538
# Body
# {
.annotate 'line', 2540
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2541

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2542
# Body
# {
.annotate 'line', 2544
self.'optimizearg'()
.annotate 'line', 2545
.return(self)
# }
.annotate 'line', 2546

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2530
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2532
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2555
# Body
# {
.annotate 'line', 2557
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2558
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2559
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2560

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2561
# Body
# {
.annotate 'line', 2563
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2564
.return(self)
# }
.annotate 'line', 2565

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2566
# Body
# {
.annotate 'line', 2568
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2569

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2570
# Body
# {
.annotate 'line', 2572
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2573
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2574

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2575
# Body
# {
.annotate 'line', 2577
self.'optimizearg'()
.annotate 'line', 2578
.return(self)
# }
.annotate 'line', 2579

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2551
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2553
addattribute $P0, 'lexpr'
.annotate 'line', 2554
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2586
# Body
# {
.annotate 'line', 2588
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2589

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2590
# Body
# {
.annotate 'line', 2592
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2593
.return(self)
# }
.annotate 'line', 2594

.end # set


.sub 'optimize' :method

.annotate 'line', 2595
# Body
# {
.annotate 'line', 2597
self.'optimizearg'()
.annotate 'line', 2598
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2599
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2600
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2601
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2604
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2605
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2606
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2607
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2610
.return(self)
# }
.annotate 'line', 2611

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2612
# Body
# {
.annotate 'line', 2614
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2615
self.'annotate'(__ARG_1)
.annotate 'line', 2616
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2617

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2584
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2624
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2625
# Body
# {
.annotate 'line', 2627
.return('I')
# }
.annotate 'line', 2628

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2629
# Body
# {
.annotate 'line', 2631
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2632
.return(self)
# }
.annotate 'line', 2633

.end # set


.sub 'optimize' :method

.annotate 'line', 2634
# Body
# {
.annotate 'line', 2636
self.'optimizearg'()
.annotate 'line', 2637
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2638
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2639
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2640
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2641
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2643
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2644
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2645
.return(self)
# }
.annotate 'line', 2646

.end # optimize


.sub 'negated' :method

.annotate 'line', 2647
# Body
# {
.annotate 'line', 2649
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2650

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2651
# Body
# {
.annotate 'line', 2653
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2654
self.'annotate'(__ARG_1)
.annotate 'line', 2655
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2656
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2658
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2661
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2664
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2666

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2622
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

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


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2677
# Body
# {
.annotate 'line', 2679
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2680
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2681
.return(self)
# }
.annotate 'line', 2682

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2683
# Body
# {
.annotate 'line', 2685
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2686
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2687
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2688

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2689
# Body
# {
.annotate 'line', 2691
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2692
self.'annotate'(__ARG_1)
.annotate 'line', 2693
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2694
.return($S1)
# }
.annotate 'line', 2695

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2671
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2705
.return(self)
# }
.annotate 'line', 2706

.end # set


.sub 'checkresult' :method

.annotate 'line', 2707
# Body
# {
.annotate 'line', 2709
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2710

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2711
# Body
# {
.annotate 'line', 2713
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2714
self.'annotate'(__ARG_1)
.annotate 'line', 2715
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2716
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2717
.return($S1)
# }
.annotate 'line', 2718

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2700
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2725
# Body
# {
.annotate 'line', 2727
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2728

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2729
# Body
# {
.annotate 'line', 2731
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2732
.return(self)
# }
.annotate 'line', 2733

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2734
# Body
# {
.annotate 'line', 2736
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2737
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2738
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2739

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2740
# Body
# {
.annotate 'line', 2742
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2743
self.'annotate'(__ARG_1)
.annotate 'line', 2744
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2745
.return($S1)
# }
.annotate 'line', 2746

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2723
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2753
# Body
# {
.annotate 'line', 2755
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2756
.return(self)
# }
.annotate 'line', 2757

.end # set


.sub 'checkresult' :method

.annotate 'line', 2758
# Body
# {
.annotate 'line', 2760
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2761

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2762
# Body
# {
.annotate 'line', 2764
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2765
self.'annotate'(__ARG_1)
.annotate 'line', 2766
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2767
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2768
.return($S1)
# }
.annotate 'line', 2769

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2751
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2778
# Body
# {
.annotate 'line', 2780
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2781
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2782
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2783
.return(self)
# }
.annotate 'line', 2784

.end # set


.sub 'checkresult' :method

.annotate 'line', 2785
# Body
# {
.annotate 'line', 2787
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2788
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2790
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2791

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2792
# Body
# {
.annotate 'line', 2794
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2795
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2796
.return(self)
# }
.annotate 'line', 2797

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2798
# Body
# {
.annotate 'line', 2800
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2801

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2774
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2776
addattribute $P0, 'lexpr'
.annotate 'line', 2777
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2808
# Body
# {
.annotate 'line', 2810
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2811
$S2 = __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 2812
self.'annotate'(__ARG_1)
.annotate 'line', 2813
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2815

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2816
# Body
# {
.annotate 'line', 2818
self.'annotate'(__ARG_1)
.annotate 'line', 2819
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2820
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2821

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2806
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2828
# Body
# {
.annotate 'line', 2830
self.'annotate'(__ARG_1)
.annotate 'line', 2831
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2832
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2833
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2834

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
self.'annotate'(__ARG_1)
.annotate 'line', 2838
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2839
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2840
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2841
.return($S1)
# }
.annotate 'line', 2842

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2826
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2849
# Body
# {
.annotate 'line', 2851
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2852
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2853
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2854

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2855
# Body
# {
.annotate 'line', 2857
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2858
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2859
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2860
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2861
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2862
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2864
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2865
self.'annotate'(__ARG_1)
.annotate 'line', 2866
ne $S1, 'S', __label_6
# {
.annotate 'line', 2867
$P4 = $P2.'checkresult'()
$S5 = $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2868
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2869
__ARG_1.'say'($S4, ' = ', $S3)
set $S3, $S4
.annotate 'line', 2870
# }
__label_8: # endif
.annotate 'line', 2872
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2875
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2877
.return($S2)
# }
.annotate 'line', 2878

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2847
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2885
# Body
# {
.annotate 'line', 2887
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2888
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2889
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2890

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2891
# Body
# {
.annotate 'line', 2893
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2894
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2895
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2896
self.'annotate'(__ARG_1)
.annotate 'line', 2897
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2898
.return($S2)
# }
.annotate 'line', 2899

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2883
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

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
.annotate 'line', 2909
$S2 = __ARG_2
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
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2919
.return($S2)
# }
.annotate 'line', 2920

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2904
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

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
.annotate 'line', 2930
$S2 = __ARG_2
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
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2940
.return($S2)
# }
.annotate 'line', 2941

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2925
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2948
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2949
# Body
# {
.annotate 'line', 2951
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2952
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2953
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2954
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2955
self.'annotate'(__ARG_1)
.annotate 'line', 2956
# string aux: $S5
null $S5
.annotate 'line', 2957
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2959
ne $S1, 'I', __label_7
# {
.annotate 'line', 2960
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2961
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2962
# }
__label_7: # endif
.annotate 'line', 2964
ne $S2, 'I', __label_8
# {
.annotate 'line', 2965
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2966
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2967
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2970
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2971
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2972
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2973
# }
goto __label_10
__label_9: # else
.annotate 'line', 2975
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2976
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2977
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2978
# }
goto __label_13
__label_12: # else
.annotate 'line', 2980
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 2981
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2982
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2983
# }
goto __label_16
__label_15: # else
.annotate 'line', 2985
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 2986
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2987
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2988
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 2991
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 2993
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 2996
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 2999
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3000
# }
.annotate 'line', 3002

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3003
# Body
# {
.annotate 'line', 3005
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3006

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3007
# Body
# {
.annotate 'line', 3009
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3010

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3011
# Body
# {
.annotate 'line', 3013
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3014

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2946
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3027
# Body
# {
.annotate 'line', 3029
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3030
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3031
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3032

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3033
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3034
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3035
# Body
# {
.annotate 'line', 3037
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3038
setattribute self, 'checknull', $P1
.annotate 'line', 3039
.return(self)
# }
.annotate 'line', 3040

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3041
# Body
# {
.annotate 'line', 3043
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3044
self.'annotate'(__ARG_1)
.annotate 'line', 3045
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3046
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3047
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3048

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3049
# Body
# {
.annotate 'line', 3051
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3052
self.'annotate'(__ARG_1)
.annotate 'line', 3053
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
.annotate 'line', 3054

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3022
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3024
addattribute $P0, 'expr'
.annotate 'line', 3025
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3061
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3062
# Body
# {
.annotate 'line', 3064
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3065

.end # negated


.sub 'optimize' :method

.annotate 'line', 3066
# Body
# {
.annotate 'line', 3068
self.'optimizearg'()
.annotate 'line', 3069
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3070
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3071
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3072
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3073
unless $I1 goto __label_0
# {
.annotate 'line', 3074
unless $I2 goto __label_1
.annotate 'line', 3075
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3077
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3079
unless $I2 goto __label_3
.annotate 'line', 3080
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3081
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3082
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3083
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3084
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3085
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3086
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3087
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3090
.return(self)
# }
.annotate 'line', 3091

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3092
# Body
# {
.annotate 'line', 3094
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3095

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3096
# Body
# {
.annotate 'line', 3098
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3099

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3100
# Body
# {
.annotate 'line', 3102
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3103

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3104
# Body
# {
.annotate 'line', 3106
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3107

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3059
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3114
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3115
# Body
# {
.annotate 'line', 3117
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3118

.end # negated


.sub 'optimize' :method

.annotate 'line', 3119
# Body
# {
.annotate 'line', 3121
self.'optimizearg'()
.annotate 'line', 3122
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3123
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3124
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3125
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3126
unless $I1 goto __label_0
# {
.annotate 'line', 3127
unless $I2 goto __label_1
.annotate 'line', 3128
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3130
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3132
unless $I2 goto __label_3
.annotate 'line', 3133
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3134
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3135
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3136
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3137
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3138
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3139
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3140
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3143
.return(self)
# }
.annotate 'line', 3144

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3145
# Body
# {
.annotate 'line', 3147
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3148

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3149
# Body
# {
.annotate 'line', 3151
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3152

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3153
# Body
# {
.annotate 'line', 3155
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3156

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3157
# Body
# {
.annotate 'line', 3159
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3160

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3112
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

.annotate 'line', 3168
# Body
# {
.annotate 'line', 3170
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3171
setattribute self, 'positive', $P1
# }
.annotate 'line', 3172

.end # OpSameExpr


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
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3177
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
.annotate 'line', 3178

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3179
# Body
# {
.annotate 'line', 3181
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3182
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3183
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3184

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3185
# Body
# {
.annotate 'line', 3187
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3188

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3189
# Body
# {
.annotate 'line', 3191
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3192
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3193
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3194

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3195
# Body
# {
.annotate 'line', 3197
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3198
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3199
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3200

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3165
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3167
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3207
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3208
# Body
# {
.annotate 'line', 3210
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3211

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3212
# Body
# {
.annotate 'line', 3214
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3215

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3216
# Body
# {
.annotate 'line', 3218
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3219

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3220
# Body
# {
.annotate 'line', 3222
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3223

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3205
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3230
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3231
# Body
# {
.annotate 'line', 3233
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3234

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3235
# Body
# {
.annotate 'line', 3237
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3238

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3239
# Body
# {
.annotate 'line', 3241
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3242

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3243
# Body
# {
.annotate 'line', 3245
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3246

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3228
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3253
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3254
# Body
# {
.annotate 'line', 3256
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3257

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3258
# Body
# {
.annotate 'line', 3260
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3261

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3262
# Body
# {
.annotate 'line', 3264
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3265

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3269

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3251
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3276
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3277
# Body
# {
.annotate 'line', 3279
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3280

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3281
# Body
# {
.annotate 'line', 3283
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3284

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3285
# Body
# {
.annotate 'line', 3287
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3288

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3289
# Body
# {
.annotate 'line', 3291
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3292

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3274
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3299
# Body
# {
.annotate 'line', 3301
.return('I')
# }
.annotate 'line', 3302

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3297
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3309
# Body
# {
.annotate 'line', 3311
self.'optimizearg'()
.annotate 'line', 3312
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3313
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3314
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3315
eq $I1, 0, __label_1
.annotate 'line', 3316
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3318
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3320
.return(self)
# }
.annotate 'line', 3321

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3322
# Body
# {
.annotate 'line', 3324
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
.annotate 'line', 3325
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3326
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3327
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3328
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3329
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3330
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3333
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3334
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3335
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3336
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3337
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3339

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3307
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3346
# Body
# {
.annotate 'line', 3348
self.'optimizearg'()
.annotate 'line', 3349
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3350
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3351
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3352
ne $I1, 0, __label_1
.annotate 'line', 3353
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3355
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3357
.return(self)
# }
.annotate 'line', 3358

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3359
# Body
# {
.annotate 'line', 3361
# string res: $S1
null $S1
.annotate 'line', 3362
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3365
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3366
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3367
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3368
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3369
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3370
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3371
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3374
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3375
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3376
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3377
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3378
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3380

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3344
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3387
# Body
# {
.annotate 'line', 3389
.return('I')
# }
.annotate 'line', 3390

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3385
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3397
# Body
# {
.annotate 'line', 3399
self.'optimizearg'()
.annotate 'line', 3400
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3401
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3402
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3403
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3404
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3405
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3407
.return(self)
# }
.annotate 'line', 3408

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3409
# Body
# {
.annotate 'line', 3411
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
.annotate 'line', 3412
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3413
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3414
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3415
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3416
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3417

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3395
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3424
# Body
# {
.annotate 'line', 3426
self.'optimizearg'()
.annotate 'line', 3427
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3428
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3429
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3430
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3431
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3432
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3434
.return(self)
# }
.annotate 'line', 3435

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3436
# Body
# {
.annotate 'line', 3438
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
.annotate 'line', 3439
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3440
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3441
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3442
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3443
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3444

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3422
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3452
# Body
# {
.annotate 'line', 3454
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3455
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3456
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3457
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3458
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3460
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3462
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3463
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3464
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3467
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3468

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3469
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3470
# Body
# {
.annotate 'line', 3472
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3473
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3474
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3475
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3476
ge $I2, $I1, __label_1
.annotate 'line', 3477
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3476
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3478
.return($P2)
# }
.annotate 'line', 3479

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3480
# Body
# {
.annotate 'line', 3482
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3483
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3484
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3485
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3486
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3487
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3488
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3487
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3489
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3490

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3491
# Body
# {
.annotate 'line', 3493
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3494
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3495
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3496
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3497
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3498
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3499
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3498
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3500
.return($S1)
# }
.annotate 'line', 3501

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3502
# Body
# {
.annotate 'line', 3504
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3505
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3506
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3507
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3508
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3507
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3509

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3449
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3451
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3516
# Body
# {
.annotate 'line', 3518
self.'optimizearg'()
.annotate 'line', 3519
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3520
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3521
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3522
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3523
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3524
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3525
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3526
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3527
# var t: $P5
null $P5
.annotate 'line', 3528
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3529
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3530
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3531
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3533
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3534
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3536
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3537
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3538
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3539
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3540
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3541
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3544
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3545
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3546
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3547
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3548
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3549
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3553
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3554
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3556
.return(self)
# }
.annotate 'line', 3557

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3558
# Body
# {
.annotate 'line', 3560
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3561
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3562
ne $S1, $S2, __label_2
.annotate 'line', 3563
.return($S1)
__label_2: # endif
.annotate 'line', 3564
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3565
.return('S')
__label_3: # endif
.annotate 'line', 3566
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3567
.return('S')
__label_5: # endif
.annotate 'line', 3568
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3569
.return('N')
__label_7: # endif
.annotate 'line', 3570
.return('I')
# }
.annotate 'line', 3571

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3572
# Body
# {
.annotate 'line', 3574
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3575
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3576
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3577
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3578
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3580
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3581
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3582
ne $S1, 'S', __label_5
# {
.annotate 'line', 3583
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3584
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3585
eq $S2, 'S', __label_10
# {
.annotate 'line', 3586
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3587
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3590
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3591
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3594
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3597
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3598
# string l: $S7
null $S7
.annotate 'line', 3599
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3601
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3602
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3604
# string r: $S8
null $S8
.annotate 'line', 3605
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3607
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3608
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3610
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3613
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3615

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3514
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3622
# Body
# {
.annotate 'line', 3624
self.'optimizearg'()
.annotate 'line', 3625
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3626
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3627
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3628
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3629
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3630
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3631
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3632
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3633
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3634
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3635
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3638
.return(self)
# }
.annotate 'line', 3639

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3640
# Body
# {
.annotate 'line', 3642
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3643
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3644
ne $S1, $S2, __label_2
.annotate 'line', 3645
.return($S1)
__label_2: # endif
.annotate 'line', 3646
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3647
.return('N')
__label_3: # endif
.annotate 'line', 3648
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3649
.return('N')
__label_5: # endif
.annotate 'line', 3650
.return('I')
# }
.annotate 'line', 3651

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3652
# Body
# {
.annotate 'line', 3654
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3655
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3656
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3657

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3620
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3664
# Body
# {
.annotate 'line', 3666
self.'optimizearg'()
.annotate 'line', 3667
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3668
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3669
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3670
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3671
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3672
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3673
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3674
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3675
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3676
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3677
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3680
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3681
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3682
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3683
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3684
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3685
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3689
.return(self)
# }
.annotate 'line', 3690

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3691
# Body
# {
.annotate 'line', 3693
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3694
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3695
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3696
ne $S1, $S2, __label_2
.annotate 'line', 3697
.return($S1)
__label_2: # endif
.annotate 'line', 3698
ne $S1, 'S', __label_3
.annotate 'line', 3699
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3701
.return('N')
__label_4: # endif
# }
.annotate 'line', 3702

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3703
# Body
# {
.annotate 'line', 3705
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3706
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3707
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3708
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3709
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3710
ne $S1, 'S', __label_2
# {
.annotate 'line', 3711
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3712
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3713
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3714
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3719
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3720
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3722
self.'annotate'(__ARG_1)
.annotate 'line', 3723
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3724
.return()
# }
__label_2: # endif
.annotate 'line', 3726
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
.annotate 'line', 3727
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3728
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3729
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3730
.return()
# }
__label_6: # endif
.annotate 'line', 3735
ne $S1, 'N', __label_10
# {
.annotate 'line', 3736
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3737
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3738
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3739
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3741
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3742
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3749
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3750
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3752
self.'annotate'(__ARG_1)
.annotate 'line', 3753
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3754
.return()
# }
__label_10: # endif
.annotate 'line', 3757
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3758
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3759
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3760
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3763
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3764
# }
__label_16: # endif
.annotate 'line', 3766
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3767
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3768
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3771
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3773
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3774
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3778
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3780
# }
__label_19: # endif
.annotate 'line', 3783
self.'annotate'(__ARG_1)
.annotate 'line', 3784
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3785

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3662
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3792
# Body
# {
.annotate 'line', 3794
self.'optimizearg'()
.annotate 'line', 3795
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3796
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3797
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3798
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3799
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3800
# var lval: $P3
null $P3
.annotate 'line', 3801
# var rval: $P4
null $P4
.annotate 'line', 3802
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3803
getattribute $P3, $P1, 'numval'
.annotate 'line', 3804
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3805
getattribute $P4, $P2, 'numval'
.annotate 'line', 3806
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3807
eq $I2, 0, __label_6
.annotate 'line', 3808
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
.annotate 'line', 3811
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3812
getattribute $P3, $P1, 'numval'
.annotate 'line', 3813
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3814
getattribute $P4, $P2, 'numval'
.annotate 'line', 3815
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3816
eq $N2, $N3, __label_8
.annotate 'line', 3817
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
.annotate 'line', 3821
.return(self)
# }
.annotate 'line', 3822

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3823
# Body
# {
.annotate 'line', 3825
.return('N')
# }
.annotate 'line', 3826

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3827
# Body
# {
.annotate 'line', 3829
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3830
# var lreg: $P2
null $P2
.annotate 'line', 3831
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'N', __label_0
.annotate 'line', 3832
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3834
$P2 = self.'tempreg'('N')
.annotate 'line', 3835
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3837
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3838
# var rreg: $P4
null $P4
.annotate 'line', 3839
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'N', __label_2
.annotate 'line', 3840
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3842
$P4 = self.'tempreg'('N')
.annotate 'line', 3843
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3845
self.'annotate'(__ARG_1)
.annotate 'line', 3846
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3847

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3790
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3854
# Body
# {
.annotate 'line', 3856
.return('I')
# }
.annotate 'line', 3857

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3858
# Body
# {
.annotate 'line', 3860
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3861
# var lreg: $P2
null $P2
.annotate 'line', 3862
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3863
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3865
$P2 = self.'tempreg'('I')
.annotate 'line', 3866
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3868
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3869
# var rreg: $P4
null $P4
.annotate 'line', 3870
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3871
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3873
$P4 = self.'tempreg'('I')
.annotate 'line', 3874
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3876
self.'annotate'(__ARG_1)
.annotate 'line', 3877
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3878

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3852
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3885
# Body
# {
.annotate 'line', 3887
.return('I')
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
# var lreg: $P2
null $P2
.annotate 'line', 3893
$P5 = $P1.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3894
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3896
$P2 = self.'tempreg'('I')
.annotate 'line', 3897
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3899
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3900
# var rreg: $P4
null $P4
.annotate 'line', 3901
$P5 = $P3.'checkresult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3902
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3904
$P4 = self.'tempreg'('I')
.annotate 'line', 3905
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3907
self.'annotate'(__ARG_1)
.annotate 'line', 3912
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3913

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3883
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3922
# Body
# {
.annotate 'line', 3924
setattribute self, 'arg', __ARG_1
.annotate 'line', 3925
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3926

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3927
# Body
# {
.annotate 'line', 3929
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3930
.return(self)
# }
.annotate 'line', 3931

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3932
# Body
# {
.annotate 'line', 3934
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3935

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3920
addattribute $P0, 'arg'
.annotate 'line', 3921
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3938
# Body
# {
.annotate 'line', 3940
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3941
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3942
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3943
.return(1)
# }
.annotate 'line', 3944

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3953
# Body
# {
.annotate 'line', 3955
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3956
setattribute self, 'predef', __ARG_3
.annotate 'line', 3957
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3958

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 3959
# Body
# {
.annotate 'line', 3961
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3962

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3963
# Body
# {
.annotate 'line', 3965
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3966
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3967
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3968
# var arg: $P4
null $P4
.annotate 'line', 3969
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 3970
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 3972
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 3973
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 3974
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 3978
# var rawargs: $P5
root_new $P8, ['parrot';'ResizablePMCArray']
set $P5, $P8
.annotate 'line', 3979
iter $P10, $P2
set $P10, 0
__label_7: # for iteration
unless $P10 goto __label_8
shift $P4, $P10
.annotate 'line', 3980
getattribute $P11, $P4, 'arg'
$P5.'push'($P11)
goto __label_7
__label_8: # endfor
.annotate 'line', 3981
getattribute $P12, self, 'predef'
getattribute $P13, self, 'start'
$P12.'expand'(__ARG_1, self, $P13, __ARG_2, $P5)
.annotate 'line', 3982
.return()
__label_1: # default
.annotate 'line', 3984
# int n: $I2
getattribute $P14, self, 'args'
set $I2, $P14
# for loop
.annotate 'line', 3985
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 3986
$P15 = $P2[$I3]
getattribute $P4, $P15, 'arg'
.annotate 'line', 3987
# string argtype: $S2
$P9 = $P4.'checkresult'()
null $S2
if_null $P9, __label_12
set $S2, $P9
__label_12:
.annotate 'line', 3988
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 3989
# string argr: $S4
null $S4
.annotate 'line', 3990
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 3991
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 3993
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 3994
ne $S3, 'P', __label_17
# {
.annotate 'line', 3995
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3996
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
.annotate 'line', 4001
eq $S5, '', __label_23
.annotate 'line', 4002
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4004
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4006
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 3985
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4009
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4010

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3948
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3950
addattribute $P0, 'predef'
.annotate 'line', 3951
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4020
# Body
# {
.annotate 'line', 4022
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4023
setattribute self, 'funref', __ARG_4
.annotate 'line', 4024
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4025
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4026
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4027
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4028
# {
.annotate 'line', 4029
# var modifier: $P2
null $P2
.annotate 'line', 4030
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4031
$P1 = __ARG_1.'get'()
.annotate 'line', 4032
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4033
$P1 = __ARG_1.'get'()
.annotate 'line', 4034
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4035
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4036
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4039
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4042
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4043
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4044
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4045
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4047

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4048
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4049
# Body
# {
.annotate 'line', 4051
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4052
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4053
'optimize_array'($P1)
.annotate 'line', 4056
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4057
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4058
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4059
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4060
if_null $P3, __label_2
# {
.annotate 'line', 4061
self.'use_predef'($S1)
.annotate 'line', 4064
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4065
if_null $P4, __label_3
# {
.annotate 'line', 4066
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4067
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4070
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
.annotate 'line', 4074
.return(self)
# }
.annotate 'line', 4075

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4076
# Body
# {
.annotate 'line', 4078
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4079
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4080
# string call: $S1
null $S1
.annotate 'line', 4081
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4082
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4083
ne $S1, '', __label_2
# {
.annotate 'line', 4084
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4085
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4089
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4091
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4092
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4093
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4094
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4095
# string reg: $S3
null $S3
.annotate 'line', 4096
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4097
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4098
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4101
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4102
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4104
self.'annotate'(__ARG_1)
.annotate 'line', 4106
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 4107
$S9 = __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 4108
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4110
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 4113
unless $I1 goto __label_14
.annotate 'line', 4114
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4116
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4118
__ARG_1.'print'('(')
.annotate 'line', 4120
# string sep: $S4
set $S4, ''
.annotate 'line', 4121
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4122
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4123
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4124
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4125
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4126
# string setname: $S6
set $S6, ''
.annotate 'line', 4127
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4128
if_null $P6, __label_19
# {
.annotate 'line', 4129
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4130
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4131
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4133
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4135
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
.annotate 'line', 4139
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4140
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4141
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4142
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4145
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
.annotate 'line', 4150
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4151
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4152
unless $I4 goto __label_32
.annotate 'line', 4153
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4154
unless $I5 goto __label_34
# {
.annotate 'line', 4155
__ARG_1.'print'(' :named')
.annotate 'line', 4156
eq $S6, '', __label_35
.annotate 'line', 4157
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4159
# }
__label_16: # for iteration
.annotate 'line', 4122
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4161
__ARG_1.'say'(')')
# }
.annotate 'line', 4162

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4015
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4017
addattribute $P0, 'funref'
.annotate 'line', 4018
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4172
# Body
# {
.annotate 'line', 4174
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4175
setattribute self, 'left', __ARG_4
.annotate 'line', 4176
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4177

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4178
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4179
# Body
# {
.annotate 'line', 4181
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4182
.return(self)
# }
.annotate 'line', 4183

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4184
# Body
# {
.annotate 'line', 4186
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4187

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4188
# Body
# {
.annotate 'line', 4190
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4191
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4192
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4193
eq $S1, 'P', __label_2
# {
.annotate 'line', 4194
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4195
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4196
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4198
.return($S2)
# }
.annotate 'line', 4199

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4200
# Body
# {
.annotate 'line', 4202
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4203
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4204
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4205
self.'annotate'(__ARG_1)
.annotate 'line', 4206
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4207
.return($S3)
# }
.annotate 'line', 4208

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4209
# Body
# {
.annotate 'line', 4211
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4212
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4213
self.'annotate'(__ARG_1)
.annotate 'line', 4214
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4215

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4216
# Body
# {
.annotate 'line', 4218
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4219
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4220
# string value: $S3
null $S3
.annotate 'line', 4221
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4223
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4224
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4225
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4227
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4230
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4231
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4233
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4234

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4235
# Body
# {
.annotate 'line', 4237
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4238
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4239
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4240
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4241
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4243
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4244
$P4 = __ARG_2.'checkresult'()
$S5 = $P4
eq $S5, 'P', __label_6
.annotate 'line', 4245
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4247
# }
__label_4: # endif
.annotate 'line', 4249
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4250
.return($S3)
# }
.annotate 'line', 4251

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4167
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4169
addattribute $P0, 'left'
.annotate 'line', 4170
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4260
# Body
# {
.annotate 'line', 4262
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4263
setattribute self, 'left', __ARG_4
.annotate 'line', 4264
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4265

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4266
# Body
# {
.annotate 'line', 4268
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
$S1 = $P1
ne $S1, 'S', __label_0
.annotate 'line', 4269
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4271
.return('P')
__label_1: # endif
# }
.annotate 'line', 4272

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4273
# Body
# {
.annotate 'line', 4275
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4276
self.'optimizeargs'()
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
# var regleft: $P1
null $P1
.annotate 'line', 4282
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4283
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4285
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4286
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4287
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4288
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4289
ne $S1, 'S', __label_3
# {
.annotate 'line', 4290
eq $I1, 1, __label_5
.annotate 'line', 4291
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4292
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4295
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4296
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4297
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4299

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4300
# Body
# {
.annotate 'line', 4302
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4303
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4304
self.'annotate'(__ARG_1)
.annotate 'line', 4305
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4306
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4307
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4308

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4309
# Body
# {
.annotate 'line', 4311
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4312
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4313
# string rreg: $S1
null $S1
.annotate 'line', 4314
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4315
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4316
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4319
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4320
self.'annotate'(__ARG_1)
.annotate 'line', 4321
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4322
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4323
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4324
.return($S1)
# }
.annotate 'line', 4325

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4256
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4258
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4334
# Body
# {
.annotate 'line', 4336
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4337
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4338
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4339
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4340
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4341
# {
.annotate 'line', 4342
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4343
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4344
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4345
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4346
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4348

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4349
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4350
# Body
# {
.annotate 'line', 4352
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4353
.return(self)
# }
.annotate 'line', 4354

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4355
# Body
# {
.annotate 'line', 4357
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4358
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4359

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4360
# Body
# {
.annotate 'line', 4362
self.'annotate'(__ARG_1)
.annotate 'line', 4363
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4364
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4365
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4366
# string itemreg: $S3
null $S3
.annotate 'line', 4367
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4368
# string type: $S4
$P5 = $P1.'checkresult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4369
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
.annotate 'line', 4371
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4372
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4376
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4378
self.'annotate'(__ARG_1)
.annotate 'line', 4379
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4381
.return($S1)
# }
.annotate 'line', 4382

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4330
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4332
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4392
# Body
# {
.annotate 'line', 4394
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4395
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4396
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4397
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4398
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4399
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4400
# {
.annotate 'line', 4401
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4402
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4403
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4404
$P2.'push'($P4)
.annotate 'line', 4405
$P3.'push'($P5)
# }
.annotate 'line', 4407
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4408
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4409
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4411
setattribute self, 'keys', $P2
.annotate 'line', 4412
setattribute self, 'values', $P3
# }
.annotate 'line', 4413

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4414
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4415
# Body
# {
.annotate 'line', 4417
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4418
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4419
.return(self)
# }
.annotate 'line', 4420

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4421
# Body
# {
.annotate 'line', 4423
self.'annotate'(__ARG_1)
.annotate 'line', 4424
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4425
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4426
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4427
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4428
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4429
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4430
# string item: $S1
null $S1
.annotate 'line', 4431
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4432
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4433
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4434
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4437
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4439
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4440
# string itemreg: $S3
null $S3
.annotate 'line', 4441
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4442
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4443
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4444
# {
.annotate 'line', 4446
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4447
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
unless_null $P9, __label_13
# {
.annotate 'line', 4448
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4449
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4452
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4456
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4457
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
__label_0: # for iteration
.annotate 'line', 4428
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4459

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4460
# Body
# {
.annotate 'line', 4462
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4463
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4464
.return($S1)
# }
.annotate 'line', 4465

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4387
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4389
addattribute $P0, 'keys'
.annotate 'line', 4390
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4474
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4475
# Body
# {
.annotate 'line', 4479
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4480
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4481
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4482
__ARG_1.'unget'($P2)
.annotate 'line', 4483
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4484
# {
.annotate 'line', 4485
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4486
$P3.'push'($P4)
# }
.annotate 'line', 4487
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4488
setattribute self, 'initializer', $P3
.annotate 'line', 4489
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4491

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4470
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4472
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4500
# Body
# {
.annotate 'line', 4502
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4504
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4505
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4506
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4507
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4508
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4509
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4510
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4511
# {
.annotate 'line', 4512
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4513
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4514
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4515
$P2.'push'($P3)
# }
.annotate 'line', 4516
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4517
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4520
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4523
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4525
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4526
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4528
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4529

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4530
# Body
# {
.annotate 'line', 4532
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4533
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4536
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4537
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4538
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4539
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4540
$P1 = $P3['value']
.annotate 'line', 4541
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4542
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4543
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4546
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4550
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4551
if_null $P4, __label_7
.annotate 'line', 4552
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4553
.return(self)
# }
.annotate 'line', 4554

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4555
# Body
# {
.annotate 'line', 4557
self.'annotate'(__ARG_1)
.annotate 'line', 4559
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4560
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
.annotate 'line', 4563
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4564
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4565
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
.annotate 'line', 4567
# string reginit: $S1
set $S1, ''
.annotate 'line', 4568
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4569
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4570
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4574
ne $I2, 1, __label_13
.annotate 'line', 4575
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4577
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4578
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4579
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4583
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4584
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4585
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4588
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4591
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4592
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4593
unless_null $P3, __label_23
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4594
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4598
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4599
le $I1, 1, __label_24
# {
.annotate 'line', 4600
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4604
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4605
# predefined elements
elements $I6, $P4
sub $I5, $I6, 1
$S3 = $P4[$I5]
.annotate 'line', 4606
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4609
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4610
unless_null $P5, __label_25
# {
.annotate 'line', 4612
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4613
if_null $P6, __label_27
# {
.annotate 'line', 4614
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4617
'Warn'('Checking: new unknown type')
.annotate 'line', 4618
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4620
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4624
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4628
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4630
isgt $I7, $I1, 1
if $I7 goto __label_30
isgt $I7, $I1, 0
unless $I7 goto __label_31
iseq $I7, $I2, 1
__label_31:
__label_30:
unless $I7 goto __label_29
# {
.annotate 'line', 4631
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4632
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4633
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4634
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4636
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4637
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4638
__ARG_1.'say'(")")
.annotate 'line', 4639
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4641

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4496
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4498
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4650
# Body
# {
.annotate 'line', 4652
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4653
setattribute self, 'owner', __ARG_2
.annotate 'line', 4654
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4655
setattribute self, 'nskey', $P1
.annotate 'line', 4656
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4657
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4658
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4660
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4661

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4662
# Body
# {
.annotate 'line', 4664
# string reginit: $S1
null $S1
.annotate 'line', 4665
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4666
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
.annotate 'line', 4667
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4671
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4672
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4675
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4677
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4678
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4679
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4680
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4681
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4682
if_null $S1, __label_7
.annotate 'line', 4683
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4684
__ARG_1.'say'()
# }
.annotate 'line', 4685

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4646
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4648
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4694
# Body
# {
.annotate 'line', 4696
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4697
setattribute self, 'owner', __ARG_2
.annotate 'line', 4698
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4699
setattribute self, 'nskey', $P1
.annotate 'line', 4700
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4701
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4702
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4704
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4705

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4706
# Body
# {
.annotate 'line', 4708
# string reginit: $S1
null $S1
.annotate 'line', 4709
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4711
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4712
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4713
le $I1, 0, __label_3
.annotate 'line', 4714
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4715
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4716
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4717
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4718
__ARG_1.'say'()
.annotate 'line', 4720
le $I1, 0, __label_4
# {
.annotate 'line', 4721
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4722
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4723
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4724
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4726
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4727
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4728
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4729
__ARG_1.'say'(")")
.annotate 'line', 4730
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4732

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4690
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4692
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4737
# Body
# {
.annotate 'line', 4739
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4741
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4743
new $P5, [ 'CallExpr' ]
.annotate 'line', 4744
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4743
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4746
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4748
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4750
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4753
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4754
__ARG_1.'unget'($P2)
.annotate 'line', 4755
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4757
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4761
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
.annotate 'line', 4766
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4768

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4777
# Body
# {
.annotate 'line', 4779
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4780
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4781
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4782

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4783
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4784
# Body
# {
.annotate 'line', 4786
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4787
# string checkedval: $S1
null $S1
.annotate 'line', 4788
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4789
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4790
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4794
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4795
self.'annotate'(__ARG_1)
.annotate 'line', 4796
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4797

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4772
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4774
addattribute $P0, 'lexpr'
.annotate 'line', 4775
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4812
# Body
# {
.annotate 'line', 4814
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4815
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4816
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4817
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4818
.return(self)
# }
.annotate 'line', 4819

.end # set


.sub 'optimize' :method

.annotate 'line', 4820
# Body
# {
.annotate 'line', 4822
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4823
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
.annotate 'line', 4825
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4827
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4829
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4830
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4831
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4833

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4834
# Body
# {
.annotate 'line', 4836
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 4837

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4838
# Body
# {
.annotate 'line', 4840
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4841
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4842
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4843
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4844
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4845
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4846
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4847
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4848

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4802
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4808
addattribute $P0, 'condition'
.annotate 'line', 4809
addattribute $P0, 'etrue'
.annotate 'line', 4810
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

.annotate 'line', 4885
# Body
# {
.annotate 'line', 4887
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
.annotate 'line', 4888
.return(1)
__label_3: # case
.annotate 'line', 4889
.return(2)
__label_4: # case
.annotate 'line', 4890
.return(3)
__label_1: # default
.annotate 'line', 4891
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4893

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4895
# Body
# {
.annotate 'line', 4897
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
.annotate 'line', 4898
.return(8)
__label_3: # case
.annotate 'line', 4899
.return(11)
__label_4: # case
.annotate 'line', 4900
.return(9)
__label_5: # case
.annotate 'line', 4901
.return(10)
__label_1: # default
.annotate 'line', 4902
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4904

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4906
# Body
# {
.annotate 'line', 4908
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
.annotate 'line', 4909
.return(19)
__label_3: # case
.annotate 'line', 4910
.return(20)
__label_4: # case
.annotate 'line', 4911
.return(21)
__label_5: # case
.annotate 'line', 4912
.return(22)
__label_1: # default
.annotate 'line', 4913
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4915

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4917
# Body
# {
.annotate 'line', 4919
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
.annotate 'line', 4920
.return(12)
__label_3: # case
.annotate 'line', 4921
.return(13)
__label_4: # case
.annotate 'line', 4922
.return(25)
__label_5: # case
.annotate 'line', 4923
.return(26)
__label_1: # default
.annotate 'line', 4925
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4926
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4928

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4930
# Body
# {
.annotate 'line', 4932
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
.annotate 'line', 4933
.return(14)
__label_3: # case
.annotate 'line', 4934
.return(16)
__label_4: # case
.annotate 'line', 4935
.return(15)
__label_5: # case
.annotate 'line', 4936
.return(17)
__label_1: # default
.annotate 'line', 4937
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4939

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4941
# Body
# {
.annotate 'line', 4943
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
.annotate 'line', 4944
.return(4)
__label_3: # case
.annotate 'line', 4945
.return(5)
__label_4: # case
.annotate 'line', 4946
.return(6)
__label_5: # case
.annotate 'line', 4947
.return(18)
__label_6: # case
.annotate 'line', 4948
.return(23)
__label_7: # case
.annotate 'line', 4949
.return(24)
__label_1: # default
.annotate 'line', 4950
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4952

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4954
# Body
# {
.annotate 'line', 4956
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4958
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4959
# var expr: $P2
null $P2
.annotate 'line', 4960
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4961
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4962
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4963
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4965
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4966
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4967
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4968
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4969
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4970
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4971
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4972
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4973
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4974
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4975
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4976
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4977
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4978
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4979
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4980
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 4981
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4982

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4984
# Body
# {
.annotate 'line', 4986
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4987
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4989
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4990
# var t: $P2
null $P2
.annotate 'line', 4991
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4992
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 4993
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4995
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4998
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5001
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5004
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5007
__ARG_1.'unget'($P2)
.annotate 'line', 5008
.return($P1)
# }
.annotate 'line', 5009

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5011
# Body
# {
.annotate 'line', 5013
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5015
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5016
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5017
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5018
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5019
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5020
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5023
__ARG_1.'unget'($P2)
.annotate 'line', 5024
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5026

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5028
# Body
# {
.annotate 'line', 5030
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5031
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5032
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5034
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5035
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5036
# var subexpr: $P2
null $P2
.annotate 'line', 5037
eq $I1, 0, __label_0
# {
.annotate 'line', 5038
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5039
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5040
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
.annotate 'line', 5042
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5045
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5048
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5051
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5054
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5056
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5059
__ARG_1.'unget'($P1)
.annotate 'line', 5060
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5062
.return($P2)
# }
.annotate 'line', 5063

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5065
# Body
# {
.annotate 'line', 5067
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5068
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5070
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5071
# var t: $P2
null $P2
.annotate 'line', 5072
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5073
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5074
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5075
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5076
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
.annotate 'line', 5078
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5081
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5084
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5087
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5090
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5092
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5093
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5095
__ARG_1.'unget'($P2)
.annotate 'line', 5096
.return($P1)
# }
.annotate 'line', 5097

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5099
# Body
# {
.annotate 'line', 5101
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5103
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5104
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5105
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5106
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5107
# var expr: $P4
null $P4
.annotate 'line', 5108
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5109
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5111
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5112
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5114
__ARG_1.'unget'($P2)
.annotate 'line', 5115
.return($P1)
# }
.annotate 'line', 5116

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5118
# Body
# {
.annotate 'line', 5120
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5121
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5123
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5124
# var rexpr: $P2
null $P2
.annotate 'line', 5125
# var t: $P3
null $P3
.annotate 'line', 5126
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5127
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5128
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
.annotate 'line', 5130
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5131
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5134
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5135
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5138
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5139
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5142
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5143
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5146
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5149
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5152
__ARG_1.'unget'($P3)
.annotate 'line', 5153
.return($P1)
# }
.annotate 'line', 5154

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5156
# Body
# {
.annotate 'line', 5158
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5159
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5161
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5162
# var t: $P2
null $P2
.annotate 'line', 5163
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5164
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5165
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5166
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
.annotate 'line', 5168
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5171
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5174
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5177
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5180
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5183
__ARG_1.'unget'($P2)
.annotate 'line', 5184
.return($P1)
# }
.annotate 'line', 5185

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5187
# Body
# {
.annotate 'line', 5189
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5191
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5192
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5193
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5194
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5195
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5197
__ARG_1.'unget'($P2)
.annotate 'line', 5198
.return($P1)
# }
.annotate 'line', 5199

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5201
# Body
# {
.annotate 'line', 5203
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5205
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5206
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5207
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5208
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5209
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5211
__ARG_1.'unget'($P2)
.annotate 'line', 5212
.return($P1)
# }
.annotate 'line', 5213

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5215
# Body
# {
.annotate 'line', 5217
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5219
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5220
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5221
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5222
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5223
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5225
__ARG_1.'unget'($P2)
.annotate 'line', 5226
.return($P1)
# }
.annotate 'line', 5227

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5229
# Body
# {
.annotate 'line', 5231
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5233
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5234
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5235
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5236
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5237
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5239
__ARG_1.'unget'($P2)
.annotate 'line', 5240
.return($P1)
# }
.annotate 'line', 5241

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5243
# Body
# {
.annotate 'line', 5245
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5246
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5248
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5249
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5250
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5251
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5252
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5253
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5254
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5257
__ARG_1.'unget'($P2)
.annotate 'line', 5258
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5260

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5262
# Body
# {
.annotate 'line', 5264
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5265
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5266
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5268
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5269
# var t: $P2
null $P2
.annotate 'line', 5270
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5271
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5272
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5273
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5274
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
.annotate 'line', 5276
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5279
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5282
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5285
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5288
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5291
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5294
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5296
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5297
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5299
__ARG_1.'unget'($P2)
.annotate 'line', 5300
.return($P1)
# }
.annotate 'line', 5301

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5303
# Body
# {
.annotate 'line', 5305
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5307
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5308

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5321
# Body
# {
.annotate 'line', 5323
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5324
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5325
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5326
setattribute self, 'brlabel', $P2
.annotate 'line', 5327
.return($S1)
# }
.annotate 'line', 5328

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5329
# Body
# {
.annotate 'line', 5331
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5332
unless_null $P1, __label_0
.annotate 'line', 5333
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5334
.return($P1)
# }
.annotate 'line', 5335

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5319
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5342
# Body
# {
.annotate 'line', 5344
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5345
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5346
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5347
setattribute self, 'cntlabel', $P2
.annotate 'line', 5348
.return($S1)
# }
.annotate 'line', 5349

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5350
# Body
# {
.annotate 'line', 5352
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5353
unless_null $P1, __label_0
.annotate 'line', 5354
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5355
.return($P1)
# }
.annotate 'line', 5356

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5338
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5340
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5370
# Body
# {
.annotate 'line', 5372
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5373
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5374
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5375
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5376
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5377
# {
.annotate 'line', 5378
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5379
$P2.'push'($P3)
# }
.annotate 'line', 5380
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5382
'RequireOp'(';', $P1)
.annotate 'line', 5383
setattribute self, 'values', $P2
# }
.annotate 'line', 5384

.end # parse


.sub 'optimize' :method

.annotate 'line', 5385
# Body
# {
.annotate 'line', 5387
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5388
.return(self)
# }
.annotate 'line', 5389

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5390
# Body
# {
.annotate 'line', 5392
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5393
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5394
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5397
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5398
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5400
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5401
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5402
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5403
self.'annotate'(__ARG_1)
.annotate 'line', 5404
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5408
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5409
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5410
# string reg: $S1
null $S1
.annotate 'line', 5411
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5412
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5413
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5416
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5417
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5408
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5419
self.'annotate'(__ARG_1)
.annotate 'line', 5420
self.'emitret'(__ARG_1)
.annotate 'line', 5421
# string sep: $S2
set $S2, ''
.annotate 'line', 5422
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5423
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5424
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5426
__ARG_1.'say'(')')
# }
.annotate 'line', 5427

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5366
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5368
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5432
# Body
# {
.annotate 'line', 5434
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5435

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5436
# Body
# {
.annotate 'line', 5438
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5439

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5430
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5444
# Body
# {
.annotate 'line', 5446
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5447

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5448
# Body
# {
.annotate 'line', 5450
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5451

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5442
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5462
# Body
# {
.annotate 'line', 5464
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5465
setattribute self, 'name', __ARG_1
.annotate 'line', 5466
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5467
setattribute self, 'value', $P2
# }
.annotate 'line', 5468

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5469
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5470
# Body
# {
.annotate 'line', 5472
self.'annotate'(__ARG_1)
.annotate 'line', 5473
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5474
# string comment: $S2
concat $S0, 'label ', $S1
set $S2, $S0
.annotate 'line', 5475
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5476

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5458
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5460
addattribute $P0, 'name'
.annotate 'line', 5461
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5487
# Body
# {
.annotate 'line', 5489
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5490
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5491
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5492
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5493
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5494
setattribute self, 'label', $P1
.annotate 'line', 5495
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5496

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5497
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5498
# Body
# {
.annotate 'line', 5500
self.'annotate'(__ARG_1)
.annotate 'line', 5501
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5502
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5503
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5504

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5483
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5485
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5513
# Body
# {
.annotate 'line', 5515
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5516

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5517
# Body
# {
.annotate 'line', 5519
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5520
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5521
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5522

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5511
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

.annotate 'line', 5533
# Body
# {
.annotate 'line', 5535
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5536
self.'parsecondition'(__ARG_2)
.annotate 'line', 5537
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5538
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5539
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5540
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5542
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5543
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5545

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5546
# Body
# {
.annotate 'line', 5548
self.'optimize_condition'()
.annotate 'line', 5549
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5550
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5551
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5552
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5554
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5556
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5558
.return(self)
# }
.annotate 'line', 5559

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5560
# Body
# {
.annotate 'line', 5562
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5563
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5564
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5565
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5566
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5567
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5568
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5569
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5570
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5571
self.'annotate'(__ARG_1)
.annotate 'line', 5572
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5573
$P1.'emit'(__ARG_1)
.annotate 'line', 5575
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5576
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5577
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5578
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5580
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5581

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5529
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5531
addattribute $P0, 'truebranch'
.annotate 'line', 5532
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5591
# Body
# {
.annotate 'line', 5593
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5594

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5595
# Body
# {
.annotate 'line', 5597
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5598
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5600
self.'annotate'(__ARG_1)
.annotate 'line', 5601
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5602
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5603
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5604
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5605

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5588
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5590
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
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
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5619

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5620
# Body
# {
.annotate 'line', 5622
self.'optimize_condition'()
.annotate 'line', 5623
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5624
.return(self)
# }
.annotate 'line', 5625

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5626
# Body
# {
.annotate 'line', 5628
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5630
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5633
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5636
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5637
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5639
self.'annotate'(__ARG_1)
.annotate 'line', 5640
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5641
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5642
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5643
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5644
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5646

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5612
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

.annotate 'line', 5655
# Body
# {
.annotate 'line', 5657
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5658
self.'parsebody'(__ARG_2)
.annotate 'line', 5659
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5660
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5661

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5662
# Body
# {
.annotate 'line', 5664
self.'optimize_condition'()
.annotate 'line', 5665
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5666
.return(self)
# }
.annotate 'line', 5667

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5668
# Body
# {
.annotate 'line', 5670
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5672
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5675
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5676
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5677
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5679
self.'annotate'(__ARG_1)
.annotate 'line', 5680
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5682
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5683
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5684
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5686

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5653
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

.annotate 'line', 5695
# Body
# {
.annotate 'line', 5697
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5698
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5699

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5700
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5701
# Body
# {
.annotate 'line', 5703
self.'annotate'(__ARG_1)
.annotate 'line', 5704
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5705
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5706

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5693
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5715
# Body
# {
.annotate 'line', 5717
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5718
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5719

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5720
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5721
# Body
# {
.annotate 'line', 5723
self.'annotate'(__ARG_1)
.annotate 'line', 5724
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5725
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5726

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5713
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5740
# Body
# {
.annotate 'line', 5742
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5743
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5744
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5745
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5746
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5747
$P1 = __ARG_2.'get'()
.annotate 'line', 5748
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5749
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5750
$P1 = __ARG_2.'get'()
.annotate 'line', 5751
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5752
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5753
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5754
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5755
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5756
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5757
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5758
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5759
$P1 = __ARG_2.'get'()
.annotate 'line', 5760
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5761
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5762
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5763
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
.annotate 'line', 5764
__ARG_2.'unget'($P1)
.annotate 'line', 5765
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5767
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5768
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5771
$P1 = __ARG_2.'get'()
.annotate 'line', 5772
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5773
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5774
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
.annotate 'line', 5775
__ARG_2.'unget'($P1)
.annotate 'line', 5776
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5778
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5781

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5782
# Body
# {
.annotate 'line', 5784
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5785
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5786
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5787
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5788
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5789
.return(self)
# }
.annotate 'line', 5790

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5791
# Body
# {
.annotate 'line', 5794
# string type: $S1
set $S1, ''
.annotate 'line', 5795
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5796
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5797
ne $S2, 'N', __label_3
.annotate 'line', 5798
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5799
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5801
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5802
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5805
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5806
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
$S9 = $P11
ne $S9, $S1, __label_8
.annotate 'line', 5807
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5809
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5810
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5814
self.'genbreaklabel'()
.annotate 'line', 5815
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5816
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5817
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5818
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5819
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5820
$P2.'push'($S7)
.annotate 'line', 5821
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5822
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5824
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5827
__ARG_1.'comment'('switch')
.annotate 'line', 5828
self.'annotate'(__ARG_1)
.annotate 'line', 5829
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5830
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5831
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5832
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5833
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5834
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5835
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5836
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5831
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5839
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5840
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5841
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5843
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5844

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5733
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5735
addattribute $P0, 'condition'
.annotate 'line', 5736
addattribute $P0, 'case_value'
.annotate 'line', 5737
addattribute $P0, 'case_st'
.annotate 'line', 5738
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5856
# Body
# {
.annotate 'line', 5858
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5859
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5860
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5861
__ARG_2.'unget'($P1)
.annotate 'line', 5862
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5864
$P1 = __ARG_2.'get'()
.annotate 'line', 5865
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5866
__ARG_2.'unget'($P1)
.annotate 'line', 5867
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5868
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5870
$P1 = __ARG_2.'get'()
.annotate 'line', 5871
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5872
__ARG_2.'unget'($P1)
.annotate 'line', 5873
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5874
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5876
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5877

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5878
# Body
# {
.annotate 'line', 5880
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5881
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5882
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5883
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5884
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5885
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5886
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5887
.return(self)
# }
.annotate 'line', 5888

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5889
# Body
# {
.annotate 'line', 5891
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5892
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5893
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5894
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5895
.return()
# }
__label_0: # endif
.annotate 'line', 5897
__ARG_1.'comment'('for loop')
.annotate 'line', 5898
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5899
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5900
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5901
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5902
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5904
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5905
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5906
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5908
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5909
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5910
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5911
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5912
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5914
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5915

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5851
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5853
addattribute $P0, 'initializer'
.annotate 'line', 5854
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5927
# Body
# {
.annotate 'line', 5929
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5930
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5931
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5932
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5933
eq $S2, '', __label_2
# {
.annotate 'line', 5934
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5936
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5938
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5939
setattribute self, 'varname', $P1
.annotate 'line', 5940
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5941
$P2 = __ARG_2.'get'()
.annotate 'line', 5942
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5943
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5944
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5945

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5946
# Body
# {
.annotate 'line', 5948
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5949
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5950
.return(self)
# }
.annotate 'line', 5951

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5952
# Body
# {
.annotate 'line', 5954
self.'annotate'(__ARG_1)
.annotate 'line', 5955
# string regcont: $S1
null $S1
.annotate 'line', 5956
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
$S6 = $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 5957
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5958
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5959
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5962
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5963
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5964
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5965
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5966
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5967
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5968
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5969
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5970
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
.annotate 'line', 5971
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5972
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5973
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5974
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5975

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5922
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5924
addattribute $P0, 'varname'
.annotate 'line', 5925
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5980
# Body
# {
.annotate 'line', 5982
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5983
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5984
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5985
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5986
__ARG_2.'unget'($P3)
.annotate 'line', 5987
__ARG_2.'unget'($P2)
.annotate 'line', 5988
__ARG_2.'unget'($P1)
.annotate 'line', 5989
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5990
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5992
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5993

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6003
# Body
# {
.annotate 'line', 6005
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6006
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6007

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6008
# Body
# {
.annotate 'line', 6010
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6011
.return(self)
# }
.annotate 'line', 6012

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6013
# Body
# {
.annotate 'line', 6015
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6016
self.'annotate'(__ARG_1)
.annotate 'line', 6017
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6018

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5999
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6001
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6032
# Body
# {
.annotate 'line', 6034
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6035
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6036
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6037
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6040
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6042
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6043
$P1 = __ARG_2.'get'()
.annotate 'line', 6044
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6045
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6046
$P1 = __ARG_2.'get'()
.annotate 'line', 6047
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6048
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6049
$P1 = __ARG_2.'get'()
.annotate 'line', 6050
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6051
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6052
setattribute self, 'exname', $P1
.annotate 'line', 6053
self.'createvar'($S1, 'P')
.annotate 'line', 6054
$P1 = __ARG_2.'get'()
.annotate 'line', 6055
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6056
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6058
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6059

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6060
# Body
# {
.annotate 'line', 6062
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6063
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6064
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6065
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
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
.annotate 'line', 6070
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6071
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6072
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6073
# string exreg: $S4
null $S4
.annotate 'line', 6074
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6075
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6076
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6079
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6081
self.'annotate'(__ARG_1)
.annotate 'line', 6082
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6084
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6085
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6087
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6088
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6089
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6090
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6091
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6092
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6095
eq $I1, 1, __label_14
.annotate 'line', 6096
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6097
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6098
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6099
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6102
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6103
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6104
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6105
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_16: # for iteration
.annotate 'line', 6103
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6107
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6108
# string sep: $S7
set $S7, ''
.annotate 'line', 6109
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6110
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6111
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6113
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6116
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6121
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6122
__ARG_1.'comment'('try: begin')
.annotate 'line', 6123
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6124
__ARG_1.'comment'('try: end')
.annotate 'line', 6126
self.'annotate'(__ARG_1)
.annotate 'line', 6127
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6129
__ARG_1.'comment'('catch')
.annotate 'line', 6130
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6131
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6132
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6133
__ARG_1.'say'('pop_eh')
.annotate 'line', 6134
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6136
__ARG_1.'comment'('catch end')
.annotate 'line', 6137
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6138

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6025
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6027
addattribute $P0, 'stry'
.annotate 'line', 6028
addattribute $P0, 'modifiers'
.annotate 'line', 6029
addattribute $P0, 'exname'
.annotate 'line', 6030
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6149
# Body
# {
.annotate 'line', 6151
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6152
setattribute self, 'name', __ARG_3
.annotate 'line', 6153
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P')
.annotate 'line', 6154
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6155

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6145
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6147
addattribute $P0, 'name'
.annotate 'line', 6148
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6172
# Body
# {
.annotate 'line', 6174
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6175
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6176
$P4 = $P1.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 6177
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6178
setattribute self, 'name', $P1
.annotate 'line', 6179
# var vdata: $P2
null $P2
.annotate 'line', 6180
# string reg: $S1
null $S1
.annotate 'line', 6182
$P1 = __ARG_2.'get'()
.annotate 'line', 6183
$P5 = $P1.'isop'('[')
if_null $P5, __label_1
unless $P5 goto __label_1
# {
box $P6, 1
.annotate 'line', 6185
setattribute self, 'typearray', $P6
.annotate 'line', 6186
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6187
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6188
$P1 = __ARG_2.'get'()
.annotate 'line', 6189
$P7 = $P1.'isop'(']')
if_null $P7, __label_3
unless $P7 goto __label_3
# {
.annotate 'line', 6191
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6194
__ARG_2.'unget'($P1)
.annotate 'line', 6195
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6196
$P1 = __ARG_2.'get'()
.annotate 'line', 6197
$P8 = $P1.'isop'(']')
isfalse $I1, $P8
unless $I1 goto __label_5
.annotate 'line', 6198
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6199
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P9, 0
.annotate 'line', 6204
setattribute self, 'typearray', $P9
.annotate 'line', 6205
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P2 = self.'createvar'($P9, $P10)
.annotate 'line', 6206
$P10 = $P2.'getreg'()
set $S1, $P10
.annotate 'line', 6207
$P11 = $P1.'isop'('=')
if_null $P11, __label_6
unless $P11 goto __label_6
# {
.annotate 'line', 6209
$P13 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P13
.annotate 'line', 6210
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6214
setattribute self, 'reg', $P11
.annotate 'line', 6215
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6217
$P1 = __ARG_2.'get'()
.annotate 'line', 6218
$P13 = $P1.'isop'('[')
isfalse $I2, $P13
unless $I2 goto __label_8
.annotate 'line', 6219
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6220
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P15
.annotate 'line', 6221
$P1 = __ARG_2.'get'()
.annotate 'line', 6222
$P14 = $P1.'isop'(']')
isfalse $I2, $P14
unless $I2 goto __label_9
# {
.annotate 'line', 6223
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6224
# {
.annotate 'line', 6225
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6226
getattribute $P15, self, 'init'
$P15.'push'($P3)
# }
.annotate 'line', 6227
$P1 = __ARG_2.'get'()
$P16 = $P1.'isop'(',')
if_null $P16, __label_11
if $P16 goto __label_10
__label_11: # enddo
.annotate 'line', 6228
$P17 = $P1.'isop'(']')
isfalse $I3, $P17
unless $I3 goto __label_13
.annotate 'line', 6229
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6231
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6233
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6234

.end # parse


.sub 'optimize' :method

.annotate 'line', 6235
# Body
# {
.annotate 'line', 6237
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6238
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6239
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6240
if_null $P1, __label_1
# {
.annotate 'line', 6241
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6242
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6244
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6246
.return(self)
# }
.annotate 'line', 6247

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6248
# Body
# {
.annotate 'line', 6250
self.'annotate'(__ARG_1)
.annotate 'line', 6251
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6252
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6253
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6254
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6255
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6256
__ARG_1.'comment'($S10)
.annotate 'line', 6258
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6259
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6260
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6262
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6263
ne $S5, $S4, __label_10
# {
.annotate 'line', 6264
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6267
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_12
# {
.annotate 'line', 6269
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 6272
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 6273
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6274
iseq $I4, $S4, 'S'
unless $I4 goto __label_17
iseq $I4, $S5, 'P'
__label_17:
unless $I4 goto __label_15
# {
.annotate 'line', 6275
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 6276
__ARG_1.'emitnull'($S3)
.annotate 'line', 6277
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6278
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6279
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 6282
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
.annotate 'line', 6288
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6289
if_null $P2, __label_19
# {
.annotate 'line', 6291
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 6292
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 6296
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 6298
if_null $P1, __label_22
# {
.annotate 'line', 6299
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 6300
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6301
unless_null $P2, __label_24
# {
.annotate 'line', 6302
le $I1, 0, __label_25
# {
.annotate 'line', 6304
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6307
# int i: $I2
null $I2
.annotate 'line', 6308
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6309
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6310
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6311
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6315

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6316
# Body
# {
.annotate 'line', 6318
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6319

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6162
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6164
addattribute $P0, 'name'
.annotate 'line', 6165
addattribute $P0, 't_reg'
.annotate 'line', 6166
addattribute $P0, 't_name'
.annotate 'line', 6167
addattribute $P0, 't_array'
.annotate 'line', 6168
addattribute $P0, 'reg'
.annotate 'line', 6169
addattribute $P0, 'typearray'
.annotate 'line', 6170
addattribute $P0, 'size'
.annotate 'line', 6171
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6322
# Body
# {
.annotate 'line', 6324
# var next: $P1
null $P1
.annotate 'line', 6325
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6326
# {
.annotate 'line', 6327
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6328
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6329
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6330
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6331
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6332
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6333
.return($P2)
# }
.annotate 'line', 6334

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6346
# Body
# {
.annotate 'line', 6349
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6350
setattribute self, 'type', $P1
.annotate 'line', 6351
setattribute self, 'name', __ARG_4
.annotate 'line', 6352
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6353

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6354
# Body
# {
.annotate 'line', 6356
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6357
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6358
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6359
$P1 = $P1.'optimize'()
.annotate 'line', 6360
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6362
getattribute $P4, self, 'start'
.annotate 'line', 6361
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6364
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6365
setattribute self, 'value', $P1
.annotate 'line', 6366
.return(self)
# }
.annotate 'line', 6367

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6368
# Body
# {
.annotate 'line', 6370
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6371

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6372
# Body
# {
.annotate 'line', 6374
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6375
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6376

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6340
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6342
addattribute $P0, 'type'
.annotate 'line', 6343
addattribute $P0, 'name'
.annotate 'line', 6344
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6379
# Body
# {
.annotate 'line', 6381
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6382
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6383
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6384
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6386
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6387
# {
.annotate 'line', 6388
$P1 = __ARG_2.'get'()
.annotate 'line', 6389
# var name: $P3
set $P3, $P1
.annotate 'line', 6390
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6391
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6393
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6392
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6394
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6395
.return($P2)
# }
.annotate 'line', 6396

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6405
# Body
# {
.annotate 'line', 6407
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6408
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6409
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6410
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6411
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6413
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6414
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6415

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6416
# Body
# {
.annotate 'line', 6418
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6419
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6420
.return(self)
# }
.annotate 'line', 6421

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6422
# Body
# {
.annotate 'line', 6424
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6425

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6426
# Body
# {
.annotate 'line', 6428
self.'annotate'(__ARG_1)
.annotate 'line', 6429
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6430
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6431
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6432
__ARG_1.'comment'($S5)
.annotate 'line', 6433
if_null $P1, __label_2
.annotate 'line', 6434
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6436
if_null $P1, __label_4
# {
.annotate 'line', 6437
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6438
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
.annotate 'line', 6440
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6445
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6446
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6447
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6450
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6454
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6455

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6402
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6404
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6460
# Body
# {
.annotate 'line', 6462
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6463
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6464
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6465
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6466

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6467
# Body
# {
.annotate 'line', 6469
self.'annotate'(__ARG_1)
.annotate 'line', 6470
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6471
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6472
__ARG_1.'comment'($S3)
.annotate 'line', 6473
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6474

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6458
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6481
# Body
# {
.annotate 'line', 6483
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6484
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6485
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6486
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6487
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6488
$P1 = __ARG_2.'get'()
.annotate 'line', 6489
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6490
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6491

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6492
# Body
# {
.annotate 'line', 6494
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6495
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6496

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6497
# Body
# {
.annotate 'line', 6499
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6500
self.'annotate'(__ARG_1)
.annotate 'line', 6501
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6502
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6503
__ARG_1.'comment'($S4)
.annotate 'line', 6504
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6505

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6477
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6479
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6508
# Body
# {
.annotate 'line', 6510
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6511
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6512
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6513
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6514
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6515
$P2 = __ARG_2.'get'()
.annotate 'line', 6516
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6517
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6519
__ARG_2.'unget'($P2)
.annotate 'line', 6520
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
.annotate 'line', 6524
__ARG_2.'unget'($P2)
.annotate 'line', 6525
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6527

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6535
# Body
# {
box $P1, 'S'
.annotate 'line', 6537
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6538
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6539
setattribute self, 't_array', $P2
.annotate 'line', 6540
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6541

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6542
# Body
# {
.annotate 'line', 6544
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6545

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6533
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6548
# Body
# {
.annotate 'line', 6550
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6551

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6553
# Body
# {
.annotate 'line', 6555
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6556
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6557

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6565
# Body
# {
box $P1, 'I'
.annotate 'line', 6567
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6568
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6569
setattribute self, 't_array', $P2
.annotate 'line', 6570
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6571

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6572
# Body
# {
.annotate 'line', 6574
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6575

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6563
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6578
# Body
# {
.annotate 'line', 6580
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6581

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6583
# Body
# {
.annotate 'line', 6585
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6586
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6587

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6595
# Body
# {
box $P1, 'N'
.annotate 'line', 6597
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6599
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6600
setattribute self, 't_array', $P2
.annotate 'line', 6601
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6602

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6603
# Body
# {
.annotate 'line', 6605
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6606

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6593
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6609
# Body
# {
.annotate 'line', 6611
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6612

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6614
# Body
# {
.annotate 'line', 6616
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6617
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6618

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6631
# Body
# {
.annotate 'line', 6633
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6634
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6635
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6636
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6637
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6638
__ARG_2.'unget'($P1)
.annotate 'line', 6639
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6640
unless_null $P2, __label_2
.annotate 'line', 6641
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6642
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6644
setattribute self, 'end', $P1
# }
.annotate 'line', 6645

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6646
# Body
# {
.annotate 'line', 6648
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6649
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6650
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6651
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6652
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6653
.return($S2)
# }
.annotate 'line', 6654

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6655
# Body
# {
.annotate 'line', 6657
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6658
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6659
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6660
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6661
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6662
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6663
$P1[$S1] = $S3
.annotate 'line', 6664
.return($S3)
# }
.annotate 'line', 6665

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6666
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6667
# Body
# {
.annotate 'line', 6669
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6670
.return(self)
# }
.annotate 'line', 6671

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6672
# Body
# {
.annotate 'line', 6674
__ARG_1.'comment'('{')
.annotate 'line', 6675
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6676
$P1.'emit'(__ARG_1)
.annotate 'line', 6677
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6679
__ARG_1.'comment'('}')
# }
.annotate 'line', 6680

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6624
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6626
addattribute $P0, 'statements'
.annotate 'line', 6627
addattribute $P0, 'end'
.annotate 'line', 6628
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6693
# Body
# {
box $P3, 1
.annotate 'line', 6696
setattribute self, 'nreg', $P3
.annotate 'line', 6697
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6698
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6699
setattribute self, 'tempreg', $P1
.annotate 'line', 6700
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6701

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6702
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6704
setattribute self, 'type', $P1
.annotate 'line', 6705
.return(self)
# }
.annotate 'line', 6706

.end # settype


.sub 'createreg' :method

.annotate 'line', 6707
# Body
# {
.annotate 'line', 6709
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6710
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6711
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6713
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6715
.return($S1)
# }
.annotate 'line', 6716

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6717
# Body
# {
.annotate 'line', 6719
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6720
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6721
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6722
# string reg: $S1
null $S1
.annotate 'line', 6723
le $I1, 0, __label_0
.annotate 'line', 6724
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6726
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6727
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6729
.return($S1)
# }
.annotate 'line', 6730

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6731
# Body
# {
.annotate 'line', 6733
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6734
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6735
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6736
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6737

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6689
addattribute $P0, 'type'
.annotate 'line', 6690
addattribute $P0, 'nreg'
.annotate 'line', 6691
addattribute $P0, 'tempreg'
.annotate 'line', 6692
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6764
# Body
# {
.annotate 'line', 6766
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6767
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6768
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6769
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6770
setattribute self, 'nlabel', $P7
box $P7, 0
.annotate 'line', 6771
setattribute self, 'paramnum', $P7
box $P8, 0
.annotate 'line', 6772
setattribute self, 'lexnum', $P8
# }
.annotate 'line', 6773

.end # init


.sub 'getouter' :method

.annotate 'line', 6775
# Body
# {
.return(self)
# }

.end # getouter


.sub 'getparamnum' :method

.annotate 'line', 6776
# Body
# {
.annotate 'line', 6779
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 6780
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 6782
.return($I1)
# }
.annotate 'line', 6783

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 6784
# Body
# {
.annotate 'line', 6787
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 6788
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 6790
.return($I1)
# }
.annotate 'line', 6791

.end # getlexnum


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6792
# Body
# {
.annotate 'line', 6794
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6795
.return($I1)
# }
.annotate 'line', 6796

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6797
# Body
# {
.annotate 'line', 6799
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6800
unless_null $P1, __label_0
# {
.annotate 'line', 6801
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6802
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6804
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6805

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6806
# Body
# {
.annotate 'line', 6808
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6809
unless_null $P1, __label_0
# {
.annotate 'line', 6810
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6811
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6813
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6814

.end # setusedlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 6815
# Body
# {
.annotate 'line', 6819
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 6820
# string lexname: $S1
null $S1
.annotate 'line', 6821
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 6822
# {
.annotate 'line', 6824
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 6825
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 6826
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 6827
self.'setlex'($S1, $S2)
.annotate 'line', 6828
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 6830
.return($S1)
# }
.annotate 'line', 6831

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6833
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6834
# Body
# {
.annotate 'line', 6836
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6837
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
.annotate 'line', 6839
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6841
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6843
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6845
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6847
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6849
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6850
.return($S1)
# }
.annotate 'line', 6851

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6852
# Body
# {
.annotate 'line', 6854
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6855
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
.annotate 'line', 6857
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6859
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6861
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6863
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6865
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6867
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6868
.return($S1)
# }
.annotate 'line', 6869

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6870
# Body
# {
.annotate 'line', 6872
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
.annotate 'line', 6873
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6874

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6875
# Body
# {
.annotate 'line', 6877
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6878
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6879
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6881
.return($S1)
# }
.annotate 'line', 6882

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6883
# Body
# {
.annotate 'line', 6885
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6886
unless_null $P1, __label_0
.annotate 'line', 6887
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6889
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6890

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6892
# Body
# {
.annotate 'line', 6894
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6895
.return(self)
# }
.annotate 'line', 6896

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6898
# Body
# {
.annotate 'line', 6900
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6901
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6902
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 6903
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 6904
# {
.annotate 'line', 6905
$P1 = __ARG_1.'get'()
.annotate 'line', 6906
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6907
eq $S1, '', __label_5
.annotate 'line', 6908
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6911
# string argname: $S2
# predefined string
$P7 = self.'getparamnum'()
set $S4, $P7
concat $S0, '__ARG_', $S4
set $S2, $S0
.annotate 'line', 6912
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6914
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6915
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6916
$P2['name'] = $S3
.annotate 'line', 6917
$P1 = __ARG_1.'get'()
.annotate 'line', 6918
$P8 = $P1.'isop'('[')
if_null $P8, __label_8
unless $P8 goto __label_8
# {
.annotate 'line', 6919
# var modifiers: $P3
new $P9, [ 'ModifierList' ]
$P9.'ModifierList'(__ARG_1, self)
set $P3, $P9
.annotate 'line', 6920
$P2['modifiers'] = $P3
.annotate 'line', 6921
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6923
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6924
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6925
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_9
.annotate 'line', 6926
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6928

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6930
# Body
# {
.annotate 'line', 6932
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6933
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6934
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6935
setattribute self, 'isanon', $P3
.annotate 'line', 6936
$P1 = __ARG_2.'get'()
.annotate 'line', 6937
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6938
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6939
setattribute self, 'modifiers', $P2
.annotate 'line', 6940
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6942
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6943
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6944
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6946
$P1 = __ARG_2.'get'()
.annotate 'line', 6947
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6948
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6949
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6950
.return(self)
# }
.annotate 'line', 6951

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6952
# Body
# {
.annotate 'line', 6954
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6955
__ARG_1.'say'()
.annotate 'line', 6956
__ARG_1.'print'(".sub ")
.annotate 'line', 6957
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6958
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6960
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6961
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 6962
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6963
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 6964
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6965
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6966
if_null $P2, __label_5
.annotate 'line', 6967
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6971
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6972
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6973
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6974
if_null $P3, __label_7
# {
.annotate 'line', 6975
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6976
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6977
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6978
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6979
le $I1, 0, __label_11
# {
.annotate 'line', 6980
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6981
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 6982
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6983
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 6984
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6985
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 6981
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 6987
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
.annotate 'line', 6992
ne $S1, 'main', __label_16
.annotate 'line', 6993
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6995
__ARG_1.'say'()
.annotate 'line', 6997
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6998
# var arg: $P8
null $P8
.annotate 'line', 6999
# string argname: $S2
null $S2
.annotate 'line', 7000
# var a: $P9
null $P9
.annotate 'line', 7002
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7003
$S2 = $P8['name']
.annotate 'line', 7004
$P9 = self.'getvar'($S2)
.annotate 'line', 7005
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7006
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7007
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7008
if_null $P10, __label_20
# {
.annotate 'line', 7009
# var named: $P11
null $P11
.annotate 'line', 7010
# var slurpy: $P12
null $P12
.annotate 'line', 7011
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7012
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7013
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7014
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
.annotate 'line', 7022
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7025
isnull $I6, $P11
not $I6
unless $I6 goto __label_30
isnull $I6, $P12
not $I6
__label_30:
unless $I6 goto __label_28
# {
.annotate 'line', 7030
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7033
if_null $P11, __label_31
# {
.annotate 'line', 7034
# string setname: $S5
null $S5
.annotate 'line', 7035
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7036
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
.annotate 'line', 7041
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7042
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7043
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7044
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7047
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7049
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7051
if_null $P12, __label_38
# {
.annotate 'line', 7052
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7056
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7058
__ARG_1.'say'()
.annotate 'line', 7059
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7062
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7063
if_null $P16, __label_39
# {
.annotate 'line', 7065
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 7066
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7069
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7070
if_null $P16, __label_42
# {
.annotate 'line', 7072
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 7073
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7076
__ARG_1.'comment'('Body')
.annotate 'line', 7077
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7079
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7080
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7083
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7084
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7086
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I7, $P17
ge $I4, $I7, __label_47
# {
.annotate 'line', 7087
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7088
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7086
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7091

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7092
# Body
# {
.annotate 'line', 7094
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7095

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7096
# Body
# {
.annotate 'line', 7098
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7099

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6744
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6746
addattribute $P0, 'name'
.annotate 'line', 6747
addattribute $P0, 'subid'
.annotate 'line', 6748
addattribute $P0, 'isanon'
.annotate 'line', 6749
addattribute $P0, 'modifiers'
.annotate 'line', 6750
addattribute $P0, 'args'
.annotate 'line', 6751
addattribute $P0, 'paramnum'
.annotate 'line', 6752
addattribute $P0, 'lexnum'
.annotate 'line', 6753
addattribute $P0, 'body'
.annotate 'line', 6754
addattribute $P0, 'regstI'
.annotate 'line', 6755
addattribute $P0, 'regstN'
.annotate 'line', 6756
addattribute $P0, 'regstS'
.annotate 'line', 6757
addattribute $P0, 'regstP'
.annotate 'line', 6758
addattribute $P0, 'nlabel'
.annotate 'line', 6759
addattribute $P0, 'localfun'
.annotate 'line', 6760
addattribute $P0, 'lexicals'
.annotate 'line', 6761
addattribute $P0, 'usedlexicals'
.annotate 'line', 6762
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7108
# Body
# {
.annotate 'line', 7110
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 7111
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 7112
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 7113
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 7114
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 7115
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 7116
setattribute self, 'isanon', $P6
.annotate 'line', 7117
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7118
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7119
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 7120
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 7121
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 7122
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7123

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 7124
# Body
# {
.annotate 'line', 7126
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7127

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7128
# Body
# {
.annotate 'line', 7131
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7132

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7133
# Body
# {
.annotate 'line', 7136
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7137

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7138
# Body
# {
.annotate 'line', 7140
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7141
unless_null $P1, __label_0
# {
.annotate 'line', 7144
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7145
unless_null $P1, __label_1
# {
.annotate 'line', 7147
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7148
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7149
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7150
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7151
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7152
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7153
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7157
$P8 = $P1.'gettype'()
$S5 = $P8
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I1, $P9
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 7158
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7159
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7160
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7161
isa $I1, $P4, 'FunctionStatement'
unless $I1 goto __label_9
# {
.annotate 'line', 7162
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7163
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7164
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7165
# string reg: $S4
$P10 = $P1.'getreg'()
null $S4
if_null $P10, __label_12
set $S4, $P10
__label_12:
.annotate 'line', 7166
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
.annotate 'line', 7171
isnull $I2, $P1
not $I2
unless $I2 goto __label_14
isa $I3, $P1, 'VarData'
not $I2, $I3
__label_14:
unless $I2 goto __label_13
.annotate 'line', 7172
'InternalError'('Incorrect data for variable in LocalFunction')
__label_13: # endif
.annotate 'line', 7173
.return($P1)
# }
.annotate 'line', 7174

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7106
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 7183
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7181
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

.annotate 'line', 7200
# Body
# {
.annotate 'line', 7202
setattribute self, 'owner', __ARG_1
.annotate 'line', 7203
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7204

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7205
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7207
# Body
# {
.annotate 'line', 7209
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7210

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7198
addattribute $P0, 'owner'
.annotate 'line', 7199
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7216
# Body
# {
.annotate 'line', 7218
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7219
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7220

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7221
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7223
# Body
# {
.annotate 'line', 7225
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7226
__ARG_1.'print'($S1)
# }
.annotate 'line', 7227

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7213
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7215
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7234
# Body
# {
.annotate 'line', 7236
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7237
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 7238
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7239
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7240
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7241
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7242
$P2 = __ARG_1.'get'()
.annotate 'line', 7243
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 7244
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
.annotate 'line', 7246
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7250
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7252
# {
.annotate 'line', 7253
$P2 = __ARG_1.'get'()
.annotate 'line', 7254
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7255
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7256
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7257
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7258
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 7259
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7261
setattribute self, 'key', $P1
# }
.annotate 'line', 7262

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7263
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7264
# Body
# {
# predefined int
.annotate 'line', 7266
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7267

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7269
# Body
# {
.annotate 'line', 7271
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7272

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7230
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7232
addattribute $P0, 'key'
.annotate 'line', 7233
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7278
# Body
# {
.annotate 'line', 7280
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7281
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 7282
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7283
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7284
$P2 = __ARG_1.'get'()
# predefined string
set $S1, $P2
.annotate 'line', 7285
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7287
__ARG_1.'unget'($P2)
.annotate 'line', 7288
setattribute self, 'key', $P1
# }
.annotate 'line', 7289

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7290
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7292
# Body
# {
.annotate 'line', 7294
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7295
.return($P2)
# }
.annotate 'line', 7296

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7298
# Body
# {
.annotate 'line', 7300
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7301
unless_null $P1, __label_0
# {
.annotate 'line', 7302
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7303
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7305
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7306

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7275
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7277
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7309
# Body
# {
.annotate 'line', 7311
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7312
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7313
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7314
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7315
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7316
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7317
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7318
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7319

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7336
# Body
# {
.annotate 'line', 7338
setattribute self, 'parent', __ARG_2
.annotate 'line', 7339
setattribute self, 'owner', __ARG_2
.annotate 'line', 7340
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7341
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7342
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7343
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7345
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7346
setattribute self, 'name', $P1
.annotate 'line', 7347
$P1 = __ARG_1.'get'()
.annotate 'line', 7348
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7349
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7350
# {
.annotate 'line', 7351
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7352
$P2.'push'($P3)
.annotate 'line', 7353
$P1 = __ARG_1.'get'()
.annotate 'line', 7354
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
.annotate 'line', 7357
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7358
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7359
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7360
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7361
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7362
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 7363
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7364
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7366
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7367
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7368
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7369
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7370
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7371
$P1 = __ARG_1.'get'()
.annotate 'line', 7372
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 7373
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7375
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7376
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7377
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7378
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7381
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7382
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7384
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 7385
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7386
setattribute self, 'classns', $P9
# }
.annotate 'line', 7387

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 7388
# Body
# {
.annotate 'line', 7390
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7391

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7392
# Body
# {
.annotate 'line', 7394
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7395

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7396
# Body
# {
.annotate 'line', 7398
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7399

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7400
# Body
# {
.annotate 'line', 7402
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7403

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7404
# Body
# {
.annotate 'line', 7406
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7407
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7408
.return(self)
# }
.annotate 'line', 7409

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7410
# Body
# {
.annotate 'line', 7412
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7413

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7414
# Body
# {
.annotate 'line', 7416
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7417
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7418
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7419
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7421
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7423
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7424
# int n: $I1
set $I1, 1
.annotate 'line', 7425
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7426
$P3.'annotate'(__ARG_1)
.annotate 'line', 7427
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7428
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7429
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7430
__ARG_1.'say'()
.annotate 'line', 7431
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7433
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7434
__ARG_1.'annotate'($P4)
.annotate 'line', 7435
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7438
__ARG_1.'say'('.end')
# }
.annotate 'line', 7439

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7325
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7327
addattribute $P0, 'parent'
.annotate 'line', 7328
addattribute $P0, 'owner'
.annotate 'line', 7329
addattribute $P0, 'name'
.annotate 'line', 7330
addattribute $P0, 'bases'
.annotate 'line', 7331
addattribute $P0, 'constants'
.annotate 'line', 7332
addattribute $P0, 'functions'
.annotate 'line', 7333
addattribute $P0, 'members'
.annotate 'line', 7334
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7446
# Body
# {
.annotate 'line', 7448
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7449
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7450
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7451
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7452
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7453
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7458
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7459
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7460
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7461
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7462
# string filepath: $S3
concat $S0, $S2, $S1
set $S3, $S0
.annotate 'line', 7463
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7464
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7465
# }
# try: end
goto __label_5
.annotate 'line', 7463
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
.annotate 'line', 7470
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7471
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7476
load_bytecode 'PGE.pbc'
.annotate 'line', 7477
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7478
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7480
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
.annotate 'line', 7481
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7482
$P8 = $P7($S4)
.annotate 'line', 7483
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7484
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7485
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7486
# int ivalue: $I1
null $I1
.annotate 'line', 7487
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7488
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7493
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7492
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7491
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7480
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7497
$P5.'close'()
# }
.annotate 'line', 7498

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7510
# Body
# {
.annotate 'line', 7512
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7513
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7514
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7515
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7516

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7517
# Body
# {
.annotate 'line', 7519
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7520
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7521
getattribute $P4, $P2, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7522
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7523
.return($P4)
# }
.annotate 'line', 7524

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7525
# Body
# {
# predefined elements
.annotate 'line', 7529
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7531
.return($P5)
__label_3: # case
.annotate 'line', 7534
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7539
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7540
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7541
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7542
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7543
getattribute $P9, $P3, 'name'
$S2 = $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7545
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7546
if_null $P4, __label_8
.annotate 'line', 7547
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7551
.return($P5)
# }
.annotate 'line', 7552

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7553
# Body
# {
.annotate 'line', 7555
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7556
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7557
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7559
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7561
# var start: $P2
set $P2, $P1
.annotate 'line', 7562
$P1 = __ARG_1.'get'()
.annotate 'line', 7563
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7564
$P1 = __ARG_1.'get'()
.annotate 'line', 7566
# var modifier: $P3
null $P3
.annotate 'line', 7567
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7568
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7569
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7572
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7573
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7574
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7575
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7576
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7577
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7579
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7580
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7581
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7583
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7584
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7585
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7586
$P7.'push'($P6)
.annotate 'line', 7587
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7589
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7590
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7591
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7592
$P9.'push'($P8)
.annotate 'line', 7593
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7595
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7596
$P1 = __ARG_1.'get'()
.annotate 'line', 7597
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7598
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7599
$P1 = __ARG_1.'get'()
.annotate 'line', 7600
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7601
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7602
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7603
self.'addlib'($S2)
.annotate 'line', 7604
$P1 = __ARG_1.'get'()
.annotate 'line', 7605
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7607
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7608
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7610
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7611
$P1 = __ARG_1.'get'()
.annotate 'line', 7612
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7613
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7614
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7615
self.'addload'($S3)
.annotate 'line', 7616
$P1 = __ARG_1.'get'()
.annotate 'line', 7617
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7619
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7620
self.'close_ns'($P1)
.annotate 'line', 7621
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7624
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
.annotate 'line', 7626
self.'unclosed_ns'()
# }
.annotate 'line', 7627

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7628
# Body
# {
.annotate 'line', 7630
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7631

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7632
# Body
# {
.annotate 'line', 7634
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7635
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7637
# int activate: $I1
set $I1, 1
.annotate 'line', 7638
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7639
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7640
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7643
unless $I1 goto __label_6
# {
.annotate 'line', 7644
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7645
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7647
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7649

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7502
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7504
addattribute $P0, 'namespaces'
.annotate 'line', 7505
addattribute $P0, 'classes'
.annotate 'line', 7506
addattribute $P0, 'functions'
.annotate 'line', 7507
addattribute $P0, 'items'
.annotate 'line', 7508
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7664
# Body
# {
.annotate 'line', 7667
setattribute self, 'parent', __ARG_1
.annotate 'line', 7668
setattribute self, 'start', __ARG_2
.annotate 'line', 7669
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7670
setattribute self, 'name', $P2
.annotate 'line', 7671
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7672
if_null __ARG_4, __label_0
# {
.annotate 'line', 7673
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7674
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7676

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7677
# Body
# {
.annotate 'line', 7679
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7680

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7681
# Body
# {
.annotate 'line', 7683
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7684

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7685
# Body
# {
.annotate 'line', 7687
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7688
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7689
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7690
.return($P1)
# }
.annotate 'line', 7691

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7692
# Body
# {
.annotate 'line', 7694
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7695

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7696
# Body
# {
.annotate 'line', 7698
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7699

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7700
# Body
# {
.annotate 'line', 7702
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7703
unless_null $P1, __label_0
.annotate 'line', 7704
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7706
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7707

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7708
# Body
# {
.annotate 'line', 7712
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7713
unless_null $P1, __label_0
.annotate 'line', 7714
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7715
.return($P1)
# }
.annotate 'line', 7716

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7717
# Body
# {
.annotate 'line', 7719
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7720

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7721
# Body
# {
# }
.annotate 'line', 7724

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7725
# Body
# {
.annotate 'line', 7727
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7728
if_null $P1, __label_0
# {
.annotate 'line', 7729
$P1 = $P1.'optimize'()
.annotate 'line', 7730
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7732
self.'optimize_base'()
.annotate 'line', 7733
.return(self)
# }
.annotate 'line', 7734

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7735
# Body
# {
.annotate 'line', 7737
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7738
if_null $P1, __label_0
.annotate 'line', 7739
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7741
self.'emit_base'(__ARG_1)
.annotate 'line', 7743
if_null $P1, __label_1
.annotate 'line', 7744
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7745

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7656
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7658
addattribute $P0, 'parent'
.annotate 'line', 7659
addattribute $P0, 'start'
.annotate 'line', 7660
addattribute $P0, 'name'
.annotate 'line', 7661
addattribute $P0, 'modifier'
.annotate 'line', 7662
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7759
# Body
# {
.annotate 'line', 7761
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7762
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7763

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7764
# Body
# {
.annotate 'line', 7766
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7767
$P1[__ARG_1] = 1
# }
.annotate 'line', 7768

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7769
# Body
# {
.annotate 'line', 7771
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7772
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7773

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7775
# Body
# {
.annotate 'line', 7777
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7778
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7779
inc $I1
assign $P1, $I1
.annotate 'line', 7781
# string id: $S1
# predefined string
set $S2, $I1
concat $S0, 'WSubId_', $S2
set $S1, $S0
.annotate 'line', 7782
.return($S1)
# }
.annotate 'line', 7783

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7785
# Body
# {
.annotate 'line', 7787
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7788
unless_null $P1, __label_0
# {
.annotate 'line', 7789
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7790
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7792
$P1[__ARG_1] = 1
# }
.annotate 'line', 7793

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7794
# Body
# {
.annotate 'line', 7796
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7797
unless_null $P1, __label_0
# {
.annotate 'line', 7798
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7799
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7801
$P1[__ARG_1] = 1
# }
.annotate 'line', 7802

.end # addload


.sub 'getpath' :method

.annotate 'line', 7803
# Body
# {
.annotate 'line', 7805
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7806
.return($P1)
# }
.annotate 'line', 7807

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7808
# Body
# {
.annotate 'line', 7810
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7811

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7812
# Body
# {
.annotate 'line', 7815
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7816

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7817
# Body
# {
# }
.annotate 'line', 7820

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7821
# Body
# {
.annotate 'line', 7823
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7824

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7825
# Body
# {
.annotate 'line', 7827
self.'optimize_base'()
.annotate 'line', 7828
.return(self)
# }
.annotate 'line', 7829

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7830
# Body
# {
.annotate 'line', 7832
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7835
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7836
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7839
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
.annotate 'line', 7842
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7843
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7844
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7845
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7848
# int somelib: $I1
null $I1
.annotate 'line', 7849
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7850
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7852
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7853
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7856
# int someload: $I2
null $I2
.annotate 'line', 7857
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7858
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7860
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7861
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7862
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7863
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7865
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7866
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7868
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7869

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7752
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7754
addattribute $P0, 'predefs_used'
.annotate 'line', 7755
addattribute $P0, 'libs'
.annotate 'line', 7756
addattribute $P0, 'loads'
.annotate 'line', 7757
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7881
# Body
# {
.annotate 'line', 7883
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7886
# var taux: $P2
new $P3, [ 'TokenIdentifier' ]
$P3.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
set $P2, $P3
.annotate 'line', 7890
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 7889
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7888
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7894
new $P6, [ 'TokenInteger' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
$P6.'TokenInteger'($P7, $P8, 'false')
set $P5, $P6
.annotate 'line', 7893
$P4 = 'integerValue'($P1, $P5, 1)
.annotate 'line', 7892
$P1.'createconst'('true', 'I', $P4, '')
.annotate 'line', 7900
new $P9, [ 'StringLiteral' ]
.annotate 'line', 7901
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
.annotate 'line', 7899
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 7904
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7905

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7906
# Body
# {
.annotate 'line', 7908
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7909

.end # parse


.sub 'optimize' :method

.annotate 'line', 7910
# Body
# {
.annotate 'line', 7912
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7913

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7914
# Body
# {
.annotate 'line', 7916
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7917
__ARG_1.'say'('')
.annotate 'line', 7919
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7921
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7922

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7880
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7929
# Body
# {
.annotate 'line', 7931
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7933
$P1.'open'('__eval__', 'w')
.annotate 'line', 7934
$P1.'puts'(__ARG_1)
.annotate 'line', 7935
$P1.'close'()
.annotate 'line', 7936
$P1.'open'('__eval__', 'r')
.annotate 'line', 7937
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7938
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7939
$P3.'parse'($P2)
.annotate 'line', 7940
$P1.'close'()
.annotate 'line', 7941
$P3.'optimize'()
.annotate 'line', 7942
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7943
$P4.'open'('__eval__', 'w')
.annotate 'line', 7944
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7945
$P5.'initialize'($P4)
.annotate 'line', 7946
$P3.'emit'($P5)
.annotate 'line', 7947
$P5.'close'()
.annotate 'line', 7948
$P4.'close'()
.annotate 'line', 7949
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7950
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7951
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7952
.return($P7)
# }
.annotate 'line', 7953

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7954
# Body
# {
.annotate 'line', 7956
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7957
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7958
$P1.'encoding'('utf8')
.annotate 'line', 7959
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7960
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7961
$P3.'parse'($P2)
.annotate 'line', 7962
$P1.'close'()
.annotate 'line', 7963
$P3.'optimize'()
.annotate 'line', 7964
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7965
$P4.'initialize'(__ARG_2)
.annotate 'line', 7966
$P3.'emit'($P4)
.annotate 'line', 7967
$P4.'close'()
# }
.annotate 'line', 7968

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7969
# Body
# {
.annotate 'line', 7971
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7972
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7973
$P1.'encoding'('utf8')
.annotate 'line', 7974
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7975
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7976
$P3.'parse'($P2)
.annotate 'line', 7977
$P1.'close'()
.annotate 'line', 7978
$P3.'optimize'()
.annotate 'line', 7979
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7980
$P4.'open'('__eval__', 'w')
.annotate 'line', 7981
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7982
$P5.'initialize'($P4)
.annotate 'line', 7983
$P3.'emit'($P5)
.annotate 'line', 7984
$P5.'close'()
.annotate 'line', 7985
$P4.'close'()
.annotate 'line', 7986
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7987
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7988
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7989
.return($P7)
# }
.annotate 'line', 7990

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7995
# Body
# {
.annotate 'line', 7997
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7998
$P1.'parse'(__ARG_1)
.annotate 'line', 8000
$P1.'optimize'()
.annotate 'line', 8002
# var handle: $P2
null $P2
.annotate 'line', 8003
ne __ARG_2, '-', __label_0
.annotate 'line', 8004
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 8006
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 8007
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8008
$P3.'initialize'($P2)
.annotate 'line', 8009
$P1.'emit'($P3)
.annotate 'line', 8010
$P3.'close'()
.annotate 'line', 8011
$P2.'close'()
# }
.annotate 'line', 8012

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8018
# Body
# {
.annotate 'line', 8020
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 8021
compreg 'winxed', $P1
# }
.annotate 'line', 8022

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8024
# Body
# {
.annotate 'line', 8026
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8027
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8028
$P1.'notOptStop'(1)
.annotate 'line', 8029
$P1.'push_string'('o=s')
.annotate 'line', 8030
$P1.'push_string'('e=s')
.annotate 'line', 8031
$P1.'push_string'('c')
.annotate 'line', 8032
$P1.'push_string'('noan')
.annotate 'line', 8034
__ARG_1.'shift'()
.annotate 'line', 8035
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8036
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8037
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8038
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8039
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8041
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 8042
# string filename: $S1
null $S1
.annotate 'line', 8043
# string expr: $S2
null $S2
.annotate 'line', 8044
# var file: $P7
null $P7
.annotate 'line', 8045
unless_null $P4, __label_0
# {
.annotate 'line', 8046
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 8047
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 8049
$S1 = __ARG_1[0]
.annotate 'line', 8050
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 8051
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 8056
new $P7, [ 'StringHandle' ]
.annotate 'line', 8057
$P7.'open'('__eval__', 'w')
.annotate 'line', 8058
$P7.'puts'($S2)
.annotate 'line', 8059
$P7.'close'()
.annotate 'line', 8060
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 8063
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 8065
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8066
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 8068
'winxed_parser'($P8, $S3)
.annotate 'line', 8070
$P7.'close'()
# }
.annotate 'line', 8071

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8073
# Body
# {
.annotate 'line', 8075
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8081
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 8075
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8084
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 8085
print 'Error: '
say $S1
.annotate 'line', 8086
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8087
# int i: $I1
set $I1, 1
.annotate 'line', 8088
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8089
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8090
# string subname: $S2
null $S2
.annotate 'line', 8091
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8093
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8094
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
.annotate 'line', 8096
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8097
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8098
eq $S4, '', __label_8
# {
.annotate 'line', 8099
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 8100
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
.annotate 'line', 8104

.end # main

# End generated code
