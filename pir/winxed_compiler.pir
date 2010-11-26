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
.annotate 'line', 167
getattribute $P1, self, 'file'
# predefined string
$S2 = $P1
getattribute $P2, self, 'line'
# predefined string
$S3 = $P2
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
.annotate 'line', 221
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
.annotate 'line', 238
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
.annotate 'line', 263
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
.annotate 'line', 267
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
.annotate 'line', 279
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
.annotate 'line', 283
getattribute $P1, self, 'str'
# predefined string
$S1 = $P1
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
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck'
.param string __ARG_1

.annotate 'line', 634
# Body
# {
set $S1, __ARG_1
set $S2, 'int'
.annotate 'line', 636
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
.annotate 'line', 637
.return('I')
__label_3: # case
.annotate 'line', 638
.return('N')
__label_4: # case
.annotate 'line', 639
.return('S')
__label_5: # case
.annotate 'line', 640
.return('P')
__label_1: # default
.annotate 'line', 641
.return('')
__label_0: # switch end
# }
.annotate 'line', 643

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 645
# Body
# {
set $S1, __ARG_1
set $S2, 'I'
.annotate 'line', 647
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
.annotate 'line', 648
.return('int')
__label_3: # case
.annotate 'line', 649
.return('num')
__label_4: # case
.annotate 'line', 650
.return('string')
__label_5: # case
.annotate 'line', 651
.return('pmc')
__label_1: # default
.annotate 'line', 652
'InternalError'('Invalid reg type')
__label_0: # switch end
# }
.annotate 'line', 654

.end # typetopirname

.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 668
# Body
# {
.annotate 'line', 670
setattribute self, 'handle', __ARG_1
box $P1, ''
.annotate 'line', 671
setattribute self, 'file', $P1
box $P2, 0
.annotate 'line', 672
setattribute self, 'line', $P2
box $P2, 0
.annotate 'line', 673
setattribute self, 'pendingf', $P2
box $P3, 0
.annotate 'line', 674
setattribute self, 'pendingl', $P3
# }
.annotate 'line', 675

.end # initialize


.sub 'close' :method

.annotate 'line', 676
# Body
# {
null $P1
.annotate 'line', 678
setattribute self, 'handle', $P1
# }
.annotate 'line', 679

.end # close


.sub 'updateannot' :method

.annotate 'line', 680
# Body
# {
.annotate 'line', 682
getattribute $P1, self, 'pendingf'
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 683
getattribute $P2, self, 'handle'
$P2.'print'(".annotate 'file', '")
.annotate 'line', 684
getattribute $P1, self, 'handle'
getattribute $P2, self, 'file'
$P1.'print'($P2)
.annotate 'line', 685
getattribute $P3, self, 'handle'
$P3.'print'("'")
.annotate 'line', 686
getattribute $P3, self, 'handle'
$P3.'print'("\n")
box $P4, 0
.annotate 'line', 687
setattribute self, 'pendingf', $P4
# }
__label_0: # endif
.annotate 'line', 689
getattribute $P4, self, 'pendingl'
if_null $P4, __label_1
unless $P4 goto __label_1
# {
.annotate 'line', 690
getattribute $P5, self, 'handle'
$P5.'print'(".annotate 'line', ")
.annotate 'line', 691
getattribute $P5, self, 'handle'
getattribute $P6, self, 'line'
$P5.'print'($P6)
.annotate 'line', 692
getattribute $P6, self, 'handle'
$P6.'print'("\n")
box $P7, 0
.annotate 'line', 693
setattribute self, 'pendingl', $P7
# }
__label_1: # endif
# }
.annotate 'line', 695

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 696
# Body
# {
.annotate 'line', 698
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 699
getattribute $P3, self, 'handle'
$P3.'print'($P1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 700

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 701
# Body
# {
.annotate 'line', 703
self.'updateannot'()
.annotate 'line', 704
self.'vprint'(__ARG_1)
# }
.annotate 'line', 705

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 706
# Body
# {
.annotate 'line', 708
self.'updateannot'()
.annotate 'line', 709
self.'vprint'(__ARG_1)
.annotate 'line', 710
getattribute $P1, self, 'handle'
$P1.'print'("\n")
# }
.annotate 'line', 711

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 712
# Body
# {
.annotate 'line', 714
getattribute $P1, self, 'file'
getattribute $P2, __ARG_1, 'file'
eq $P1, $P2, __label_0
# {
.annotate 'line', 715
getattribute $P4, __ARG_1, 'file'
setattribute self, 'file', $P4
box $P1, 1
.annotate 'line', 716
setattribute self, 'pendingf', $P1
box $P2, 0
.annotate 'line', 717
setattribute self, 'line', $P2
# }
__label_0: # endif
.annotate 'line', 719
getattribute $P3, self, 'line'
getattribute $P4, __ARG_1, 'line'
eq $P3, $P4, __label_1
# {
.annotate 'line', 720
getattribute $P6, __ARG_1, 'line'
setattribute self, 'line', $P6
box $P5, 1
.annotate 'line', 721
setattribute self, 'pendingl', $P5
# }
__label_1: # endif
# }
.annotate 'line', 723

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 724
# Body
# {
.annotate 'line', 726
self.'updateannot'()
.annotate 'line', 727
getattribute $P1, self, 'handle'
concat $S1, '# ', __ARG_1
concat $S1, "\n"
$P1.'print'($S1)
# }
.annotate 'line', 728

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 729
# Body
# {
.annotate 'line', 731
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 732
$P1.'print'(__ARG_1)
.annotate 'line', 733
$P1.'print'(':')
.annotate 'line', 734
if_null __ARG_2, __label_0
# {
.annotate 'line', 735
$P1.'print'(' # ')
.annotate 'line', 736
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 738
$P1.'print'("\n")
# }
.annotate 'line', 739

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 740
# Body
# {
.annotate 'line', 742
# var handle: $P1
getattribute $P1, self, 'handle'
.annotate 'line', 743
$P1.'print'('goto ')
.annotate 'line', 744
$P1.'print'(__ARG_1)
.annotate 'line', 745
if_null __ARG_2, __label_0
# {
.annotate 'line', 746
$P1.'print'(' # ')
.annotate 'line', 747
$P1.'print'(__ARG_2)
# }
__label_0: # endif
.annotate 'line', 749
$P1.'print'("\n")
# }
.annotate 'line', 750

.end # emitgoto


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 751
# Body
# {
.annotate 'line', 753
# string ins: $S1
concat $S0, 'if_null ', __ARG_1
concat $S0, ', '
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 754
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 755

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 756
# Body
# {
.annotate 'line', 758
# string ins: $S1
concat $S0, "null ", __ARG_1
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 759
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 760

.end # emitnull


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 761
# Body
# {
.annotate 'line', 763
# string ins: $S1
concat $S0, "set ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 764
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 765

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 766
# Body
# {
.annotate 'line', 768
# string ins: $S1
concat $S0, "assign ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 769
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 770

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 771
# Body
# {
.annotate 'line', 773
# string ins: $S1
concat $S0, "box ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 774
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 775

.end # emitbox


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 776
# Body
# {
.annotate 'line', 778
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 779
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 780

.end # emitaddto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 781
# Body
# {
.annotate 'line', 783
# string ins: $S1
concat $S0, "add ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 784
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 785

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 786
# Body
# {
.annotate 'line', 788
# string ins: $S1
concat $S0, "mul ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 789
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 790

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 791
# Body
# {
.annotate 'line', 793
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 794
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 795

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 796
# Body
# {
.annotate 'line', 798
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 799
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 800

.end # emitconcat

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Emit' ]
.annotate 'line', 662
addattribute $P0, 'handle'
.annotate 'line', 663
addattribute $P0, 'file'
.annotate 'line', 664
addattribute $P0, 'line'
.annotate 'line', 665
addattribute $P0, 'pendingf'
.annotate 'line', 666
addattribute $P0, 'pendingl'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 807
# Body
# {
.annotate 'line', 809
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 810

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 812
# Body
# {
.annotate 'line', 814
# var t: $P1
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenFloat'($P3, $P4, __ARG_3)
set $P1, $P2
.annotate 'line', 815
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 816

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 818
# Body
# {
.annotate 'line', 824
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 825
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 826
.return($I1)
# }
.annotate 'line', 827

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 846
# Body
# {
.annotate 'line', 848
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 849
.return($S1)
# }
.annotate 'line', 850

.end # name


.sub 'result' :method

.annotate 'line', 851
# Body
# {
.annotate 'line', 853
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 854

.end # result


.sub 'params' :method

.annotate 'line', 855
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 856
# Body
# {
.annotate 'line', 858
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 859
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 860
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 861
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 862
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 864
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 866
.return($S1)
# }
.annotate 'line', 867

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 868
# Body
# {
box $P1, __ARG_1
.annotate 'line', 874
setattribute self, 'name', $P1
.annotate 'line', 875
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 876
setattribute self, 'typeresult', $P2
.annotate 'line', 877
# int n: $I1
null $I1
.annotate 'line', 878
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 879
setattribute self, 'type0', $P2
.annotate 'line', 880
ne __ARG_4, '*', __label_1
set $I1, -1
goto __label_2
__label_1: # else
.annotate 'line', 881
# {
set $I1, 1
.annotate 'line', 884
if_null __ARG_5, __label_3
# {
box $P3, __ARG_5
.annotate 'line', 885
setattribute self, 'type1', $P3
.annotate 'line', 886
inc $I1
# }
__label_3: # endif
.annotate 'line', 888
if_null __ARG_6, __label_4
# {
box $P3, __ARG_6
.annotate 'line', 889
setattribute self, 'type2', $P3
.annotate 'line', 890
inc $I1
# }
__label_4: # endif
# }
__label_2: # endif
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 894
setattribute self, 'nparams', $P4
.annotate 'line', 895
.return(self)
# }
.annotate 'line', 896

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 897
# Body
# {
.annotate 'line', 905
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 906
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 907
.return(self)
# }
.annotate 'line', 908

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 909
# Body
# {
.annotate 'line', 911
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 912
# string typeresult: $S2
getattribute $P2, self, 'typeresult'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 913
__ARG_1.'comment'($S6)
.annotate 'line', 915
getattribute $P3, self, 'body'
isa $I4, $P3, 'String'
unless $I4 goto __label_2
# {
.annotate 'line', 916
# string body: $S3
getattribute $P4, self, 'body'
null $S3
if_null $P4, __label_4
set $S3, $P4
__label_4:
.annotate 'line', 917
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 918
ne $S2, 'v', __label_5
# {
.annotate 'line', 919
isnull $I4, __ARG_4
not $I4
unless $I4 goto __label_8
isne $I4, __ARG_4, ''
__label_8:
unless $I4 goto __label_7
.annotate 'line', 920
'SyntaxError'('using return value from void predef')
__label_7: # endif
.annotate 'line', 921
eq $I1, -1, __label_9
.annotate 'line', 922
'InternalError'('void predef with {res}')
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 925
ne $I1, -1, __label_10
.annotate 'line', 926
'InternalError'('non void predef without {res}')
__label_10: # endif
.annotate 'line', 927
isne $I5, $S2, 'v'
unless $I5 goto __label_12
isnull $I5, __ARG_4
if $I5 goto __label_13
iseq $I5, __ARG_4, ''
__label_13:
__label_12:
unless $I5 goto __label_11
.annotate 'line', 928
$P3 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P3
__label_11: # endif
__label_14: # do
.annotate 'line', 929
# {
.annotate 'line', 930
# predefined substr
substr $S6, $S3, 0, $I1
add $I5, $I1, 5
# predefined substr
substr $S7, $S3, $I5
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 931
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_14
__label_15: # enddo
# }
__label_6: # endif
.annotate 'line', 934
# int n: $I2
set $P4, __ARG_5
set $I2, $P4
# for loop
.annotate 'line', 935
# int i: $I3
null $I3
__label_19: # for condition
ge $I3, $I2, __label_18
# {
.annotate 'line', 936
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S0, $S7, '}'
set $S4, $S0
.annotate 'line', 937
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_21: # while
.annotate 'line', 938
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_20
.annotate 'line', 939
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
.annotate 'line', 935
inc $I3
goto __label_19
__label_18: # for end
.annotate 'line', 941
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 942
__ARG_1.'say'($S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 945
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 946
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_3: # endif
# }
.annotate 'line', 948

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 837
addattribute $P0, 'name'
.annotate 'line', 838
addattribute $P0, 'body'
.annotate 'line', 839
addattribute $P0, 'evalfun'
.annotate 'line', 840
addattribute $P0, 'typeresult'
.annotate 'line', 841
addattribute $P0, 'type0'
.annotate 'line', 842
addattribute $P0, 'type1'
.annotate 'line', 843
addattribute $P0, 'type2'
.annotate 'line', 844
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 953
# Body
# {
.annotate 'line', 955
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 956
# int n: $I1
# predefined int
$I3 = __ARG_4
sub $I1, $I3, 1
.annotate 'line', 957
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 958
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 959
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 958
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 960
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 963
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 964

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

.annotate 'line', 969
# Body
# {
.annotate 'line', 971
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 972
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 973
# int n: $I1
# predefined int
$I1 = __ARG_4
# for loop
.annotate 'line', 974
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 975
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 974
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 976
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 977

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

.annotate 'line', 982
# Body
# {
.annotate 'line', 984
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 985
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 986
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 987
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 986
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 988

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 991
# Body
# {
.annotate 'line', 993
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 994
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 995
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 996

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 998
# Body
# {
.annotate 'line', 1000
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1001
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1002
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1003

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1005
# Body
# {
.annotate 'line', 1007
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1008
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1009
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1010

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1012
# Body
# {
.annotate 'line', 1014
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1015
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1016
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1017
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1018
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1019

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1021
# Body
# {
.annotate 'line', 1023
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1025
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1026
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1028
# var t: $P2
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
$P4.'TokenQuoted'($P5, $P6, $S1)
set $P2, $P4
.annotate 'line', 1029
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1030

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 1032
# Body
# {
.annotate 'line', 1034
# var predef_say: $P1
new $P1, [ 'Predef_say' ]
.annotate 'line', 1035
# var predef_cry: $P2
new $P2, [ 'Predef_cry' ]
.annotate 'line', 1036
# var predef_print: $P3
new $P3, [ 'Predef_print' ]
.annotate 'line', 1038
get_hll_global $P5, 'predefeval_length'
.annotate 'line', 1039
get_hll_global $P6, 'predefeval_bytelength'
.annotate 'line', 1040
get_hll_global $P7, 'predefeval_chr'
.annotate 'line', 1041
get_hll_global $P8, 'predefeval_ord'
.annotate 'line', 1042
get_hll_global $P9, 'predefeval_ord_n'
.annotate 'line', 1044
# var predefs: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
.annotate 'line', 1045
new $P13, [ 'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 1044
$P10.'push'($P12)
.annotate 'line', 1049
new $P15, [ 'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 1044
$P10.'push'($P14)
.annotate 'line', 1053
new $P17, [ 'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 1044
$P10.'push'($P16)
.annotate 'line', 1057
new $P19, [ 'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1044
$P10.'push'($P18)
.annotate 'line', 1061
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1044
$P10.'push'($P20)
.annotate 'line', 1065
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 1044
$P10.'push'($P22)
.annotate 'line', 1069
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1044
$P10.'push'($P24)
.annotate 'line', 1073
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1044
$P10.'push'($P26)
.annotate 'line', 1077
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P28)
.annotate 'line', 1082
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P30)
.annotate 'line', 1087
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P32)
.annotate 'line', 1092
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1044
$P10.'push'($P34)
.annotate 'line', 1098
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1044
$P10.'push'($P36)
.annotate 'line', 1105
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1044
$P10.'push'($P38)
.annotate 'line', 1109
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1044
$P10.'push'($P40)
.annotate 'line', 1114
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1044
$P10.'push'($P42)
.annotate 'line', 1119
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1044
$P10.'push'($P44)
.annotate 'line', 1126
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1044
$P10.'push'($P46)
.annotate 'line', 1131
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1044
$P10.'push'($P48)
.annotate 'line', 1136
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1044
$P10.'push'($P50)
.annotate 'line', 1140
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1044
$P10.'push'($P52)
.annotate 'line', 1144
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P54)
.annotate 'line', 1148
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1044
$P10.'push'($P56)
.annotate 'line', 1152
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1044
$P10.'push'($P58)
.annotate 'line', 1156
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P60)
.annotate 'line', 1160
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P62)
.annotate 'line', 1164
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P64)
.annotate 'line', 1168
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P66)
.annotate 'line', 1172
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P68)
.annotate 'line', 1177
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P70)
.annotate 'line', 1182
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P72)
.annotate 'line', 1186
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P74)
.annotate 'line', 1190
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P76)
.annotate 'line', 1194
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P78)
.annotate 'line', 1198
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P80)
.annotate 'line', 1202
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P82)
.annotate 'line', 1206
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P84)
.annotate 'line', 1210
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P86)
.annotate 'line', 1214
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P88)
.annotate 'line', 1218
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P90)
.annotate 'line', 1222
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1044
$P10.'push'($P92)
.annotate 'line', 1226
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1044
$P10.'push'($P94)
.annotate 'line', 1230
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P96)
.annotate 'line', 1234
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P98)
.annotate 'line', 1238
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P100)
.annotate 'line', 1242
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1044
$P10.'push'($P102)
.annotate 'line', 1246
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1044
$P10.'push'($P104)
.annotate 'line', 1250
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P106)
.annotate 'line', 1254
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1044
$P10.'push'($P108)
.annotate 'line', 1258
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P110)
.annotate 'line', 1263
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P112)
.annotate 'line', 1268
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1044
$P10.'push'($P114)
.annotate 'line', 1272
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1044
$P10.'push'($P116)
.annotate 'line', 1276
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1044
$P10.'push'($P118)
.annotate 'line', 1280
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1044
$P10.'push'($P120)
.annotate 'line', 1284
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1044
$P10.'push'($P122)
.annotate 'line', 1288
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 1044
$P10.'push'($P124)
.annotate 'line', 1292
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 1044
$P10.'push'($P126)
.annotate 'line', 1296
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('cry', $P2, 'P', '*')
.annotate 'line', 1044
$P10.'push'($P128)
set $P4, $P10
__label_1: # Infinite loop
.annotate 'line', 1302
.yield($P4)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1303

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1305
# Body
# {
.annotate 'line', 1307
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1308
getattribute $P4, $P1, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1309
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1310
iseq $I2, $I1, -1
if $I2 goto __label_4
iseq $I2, $I1, __ARG_2
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1311
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1313
.return($P2)
# }
.annotate 'line', 1314

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1320
# Body
# {
.annotate 'line', 1322
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1323
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1324
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1323
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1325

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1336
# Body
# {
.annotate 'line', 1338
setattribute self, 'start', __ARG_1
.annotate 'line', 1339
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1340

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1341
# Body
# {
.annotate 'line', 1343
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1344

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1345
# Body
# {
.annotate 'line', 1347
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1348

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1349
# Body
# {
.annotate 'line', 1351
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1352

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1353
# Body
# {
.annotate 'line', 1355
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1356

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1357
# Body
# {
.annotate 'line', 1359
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1360

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1333
addattribute $P0, 'start'
.annotate 'line', 1334
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1373
# Body
# {
.annotate 'line', 1375
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1376

.end # init


.sub 'numargs' :method

.annotate 'line', 1378
# Body
# {
.annotate 'line', 1380
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1381

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1382
# Body
# {
.annotate 'line', 1384
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1385
.return($P2)
# }
.annotate 'line', 1386

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1388
# Body
# {
.annotate 'line', 1390
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1391
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1392
# {
.annotate 'line', 1393
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1394
$P1.'push'($P3)
# }
.annotate 'line', 1395
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1396
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1397

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1399
# Body
# {
.annotate 'line', 1401
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1402
if_null $P1, __label_0
.annotate 'line', 1403
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1404

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1405
# Body
# {
.annotate 'line', 1407
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1408
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1409
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1410
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1411
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1412
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1413
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1410
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1415
.return($P2)
# }
.annotate 'line', 1416

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1417
# Body
# {
.annotate 'line', 1419
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1420
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1421

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1371
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1433
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1434
# Body
# {
.annotate 'line', 1436
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1437
.return($I1)
# }
.annotate 'line', 1438

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1439
# Body
# {
.annotate 'line', 1441
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1442
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1443
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1445
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1446

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1447
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1449
setattribute self, 'name', $P1
.annotate 'line', 1450
if_null __ARG_2, __label_0
.annotate 'line', 1451
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1452

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1453
# Body
# {
.annotate 'line', 1455
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1456

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1430
addattribute $P0, 'name'
.annotate 'line', 1431
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1463
# Body
# {
.annotate 'line', 1465
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1466
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1467
# {
.annotate 'line', 1468
$P2 = __ARG_1.'get'()
.annotate 'line', 1469
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1470
$P2 = __ARG_1.'get'()
.annotate 'line', 1471
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1472
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1473
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1474
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1476
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1477
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1478
'RequireOp'(']', $P2)
.annotate 'line', 1479
setattribute self, 'list', $P1
# }
.annotate 'line', 1480

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1481
# Body
# {
.annotate 'line', 1483
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1484
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1485

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1486
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1487
# Body
# {
.annotate 'line', 1489
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1490
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1491
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1492
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1493
$P3 = $P2.'getname'()
$S1 = $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1494
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1491
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1497
.return($P3)
# }
.annotate 'line', 1498

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1461
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1505
# Body
# {
.annotate 'line', 1507
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1508
.return($S2)
# }
.annotate 'line', 1509

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1511
# Body
# {
.annotate 'line', 1513
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1514
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1516
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1517
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1519

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1521
# Body
# {
.annotate 'line', 1523
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1524
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1525
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1526
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1527
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1529
__ARG_2.'unget'($P1)
.annotate 'line', 1530
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1532

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1534
# Body
# {
.annotate 'line', 1536
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1537
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1538
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1539
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1540
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1541
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1542
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1544
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1545
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1546
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
.annotate 'line', 1548
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1550
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1553
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1555
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1557
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1559
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1561
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_13: # case
.annotate 'line', 1563
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_14: # case
.annotate 'line', 1565
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_15: # case
.annotate 'line', 1567
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_16: # case
.annotate 'line', 1569
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_17: # case
.annotate 'line', 1571
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_18: # case
.annotate 'line', 1573
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_19: # case
.annotate 'line', 1575
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_20: # case
.annotate 'line', 1577
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_21: # case
.annotate 'line', 1579
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1581
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_23: # case
.annotate 'line', 1583
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1585
$P30 = $P1.'isidentifier'()
if_null $P30, __label_24
unless $P30 goto __label_24
# {
.annotate 'line', 1586
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1587
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1588
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_25: # endif
.annotate 'line', 1589
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1591
__ARG_1.'unget'($P1)
.annotate 'line', 1592
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1594
unless_null $P2, __label_26
.annotate 'line', 1595
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1596
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1597

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1605
# Body
# {
.annotate 'line', 1607
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1608

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1609
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1610
# Body
# {
.annotate 'line', 1612
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1613

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1614
# Body
# {
.annotate 'line', 1616
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1617

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1618
# Body
# {
.annotate 'line', 1620
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1621

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1622
# Body
# {
.annotate 'line', 1624
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1625

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1626
# Body
# {
.annotate 'line', 1628
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1629

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1630
# Body
# {
.annotate 'line', 1632
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1633

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1634
# Body
# {
.annotate 'line', 1636
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1637

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1638
# Body
# {
.annotate 'line', 1640
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1641

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1642
# Body
# {
.annotate 'line', 1644
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1645

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1646
# Body
# {
.annotate 'line', 1648
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1649

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1651
# Body
# {
.annotate 'line', 1656
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1657

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1658
# Body
# {
.annotate 'line', 1660
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1661

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1665

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1666
# Body
# {
.annotate 'line', 1668
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1670
.return(self)
# }
.annotate 'line', 1671

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1603
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1676
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1677
# Body
# {
.annotate 'line', 1679
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1680

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1681
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1682
# Body
# {
# }
.annotate 'line', 1685

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1674
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1692
# Body
# {
.annotate 'line', 1694
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1695
$P1.'push'(__ARG_1)
.annotate 'line', 1696
$P1.'push'(__ARG_2)
.annotate 'line', 1697
setattribute self, 'statements', $P1
# }
.annotate 'line', 1698

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1699
# Body
# {
.annotate 'line', 1701
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1702
.return(self)
# }
.annotate 'line', 1703

.end # push


.sub 'optimize' :method

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1707
.return(self)
# }
.annotate 'line', 1708

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1709
# Body
# {
.annotate 'line', 1711
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1712
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1713

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1690
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1716
# Body
# {
.annotate 'line', 1718
unless_null __ARG_1, __label_0
.annotate 'line', 1719
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1720
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1721
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1723
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1724

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1734
# Body
# {
.annotate 'line', 1736
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1737
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1738
# int dotted: $I1
null $I1
.annotate 'line', 1739
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1741
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1743
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1744
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
setattribute self, 'opname', $P3
.annotate 'line', 1745
$P1 = __ARG_2.'get'()
.annotate 'line', 1746
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1747
__ARG_2.'unget'($P1)
.annotate 'line', 1748
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1750
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1751

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1752
# Body
# {
.annotate 'line', 1754
self.'optimizeargs'()
.annotate 'line', 1755
.return(self)
# }
.annotate 'line', 1756

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1757
# Body
# {
.annotate 'line', 1759
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1760
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1761
__ARG_1.'comment'($S2)
.annotate 'line', 1762
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1763
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1765
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1766
self.'emitargs'(__ARG_1)
.annotate 'line', 1767
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1769

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1730
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1732
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1779
# Body
# {
.annotate 'line', 1781
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1782
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1783
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1784
# {
.annotate 'line', 1785
$P2 = __ARG_2.'get'()
.annotate 'line', 1786
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1787
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1788
'RequireOp'(';', $P2)
.annotate 'line', 1789
setattribute self, 'path', $P1
.annotate 'line', 1790
.return(self)
# }
.annotate 'line', 1791

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1792
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1793
# Body
# {
.annotate 'line', 1795
self.'annotate'(__ARG_1)
.annotate 'line', 1796
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1797

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1776
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1778
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1807
# Body
# {
.annotate 'line', 1809
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1810
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1811
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1812
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1813

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1814
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1815
# Body
# {
.annotate 'line', 1817
self.'annotate'(__ARG_1)
.annotate 'line', 1818
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1819
getattribute $P3, self, 'symbol'
.annotate 'line', 1818
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1820

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1804
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1806
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1830
# Body
# {
.annotate 'line', 1832
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1833
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1834
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1835
# {
.annotate 'line', 1836
$P2 = __ARG_2.'get'()
.annotate 'line', 1837
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1838
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1839
'RequireOp'(';', $P2)
.annotate 'line', 1840
setattribute self, 'path', $P1
# }
.annotate 'line', 1841

.end # UsingStatement


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
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1846
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1847
self.'annotate'(__ARG_1)
.annotate 'line', 1849
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1851
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1852
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1854
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1857
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1859

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1827
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1829
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1869
# Body
# {
.annotate 'line', 1871
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1872
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1873
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1874

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1875
# Body
# {
.annotate 'line', 1877
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1878
.return(self)
# }
.annotate 'line', 1879

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1880
# Body
# {
.annotate 'line', 1882
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1883

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1866
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1868
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1893
# Body
# {
.annotate 'line', 1895
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1896

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 1897
# Body
# {
# predefined Error
.annotate 'line', 1899
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1900

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1892
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1907
# Body
# {
.annotate 'line', 1909
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1910

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1911
# Body
# {
.annotate 'line', 1913
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1914
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1915
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1916
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 1917
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1918
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1919
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['scope'] = self
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1924
.return($S2)
# }
.annotate 'line', 1925

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1926
# Body
# {
.annotate 'line', 1928
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1929
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1930
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1931
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1932
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1933
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['scope'] = self
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1938

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1939
# Body
# {
.annotate 'line', 1941
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1942
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1943
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1944
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1945
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1946
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1949
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1951
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1952
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1953
$P1[$S1] = $P3
# }
.annotate 'line', 1954

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1955
# Body
# {
.annotate 'line', 1957
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1958
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1959
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1960
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1961
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1962
.return($P2)
# }
.annotate 'line', 1963

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 1964
# Body
# {
.annotate 'line', 1966
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1967
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1968
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1969
.return($P2)
# }
.annotate 'line', 1970

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 1971
# Body
# {
.annotate 'line', 1973
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 1974
# string lexname: $S1
$P3 = __ARG_1['reg']
$P2 = $P1.'createlex'($P3)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1975
.return($S1)
# }
.annotate 'line', 1976

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 1977
# Body
# {
.annotate 'line', 1979
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 1981
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 1982
.return('__WLEX_self')
# }
.annotate 'line', 1983

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1906
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1992
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2002
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2003
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2004
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2005
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2006
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2007
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2008
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2009
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2010
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2011
# Body
# {
.annotate 'line', 2013
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2014

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2015
# Body
# {
.annotate 'line', 2017
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2018

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2019
# Body
# {
.annotate 'line', 2022
.return(self)
# }
.annotate 'line', 2023

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2024
# Body
# {
.annotate 'line', 2026
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2027
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2028
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2029
.return($S2)
# }
.annotate 'line', 2030

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2031
# Body
# {
.annotate 'line', 2033
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2034

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2000
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2039
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2037
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2047
# Body
# {
.annotate 'line', 2049
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2050
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2051
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2052
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2053
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2054

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 2055
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 2056
# Body
# {
.annotate 'line', 2058
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2059
.return(self)
# }
.annotate 'line', 2060

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2061
# Body
# {
.annotate 'line', 2063
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2064
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2065
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2066
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2067
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2068

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2044
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2046
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2081
# Body
# {
.annotate 'line', 2083
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2084
.return(self)
# }
.annotate 'line', 2085

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2086
# Body
# {
.annotate 'line', 2088
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2089

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2090
# Body
# {
.annotate 'line', 2092
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2093
.return(self)
# }
.annotate 'line', 2094

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2095
# Body
# {
.annotate 'line', 2097
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2098
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2099
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2101
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2102
ne $I1, 0, __label_4
.annotate 'line', 2103
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2105
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2108
.return(0)
# }
.annotate 'line', 2109

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2110
# Body
# {
.annotate 'line', 2112
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2114
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2115
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2116
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2118
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2119
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2120
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
.annotate 'line', 2123
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2126
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2129
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2132

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2133
# Body
# {
.annotate 'line', 2135
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2137
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2138
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2139
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2141
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2142
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2143
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
.annotate 'line', 2146
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2149
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2152
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2155

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2080
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2162
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2163
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2160
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2174
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2175

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2176
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2177
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getPirString' :method

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2181
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2182
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2183
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2184
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2185
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2187
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2190
unless $I2 goto __label_4
# {
.annotate 'line', 2191
unless $I1 goto __label_5
# {
null $I1
.annotate 'line', 2193
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2195
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2196
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2198
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2201
# string result: $S4
set $S4, ''
.annotate 'line', 2202
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2203
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2204
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2205
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2206
le $I6, 127, __label_12
# {
.annotate 'line', 2207
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
.annotate 'line', 2208
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2211
# }
__label_9: # for iteration
.annotate 'line', 2203
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2213
# }
__label_4: # endif
.annotate 'line', 2215
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
.annotate 'line', 2217
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2219
.return($S1)
# }
.annotate 'line', 2220

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2221
# Body
# {
.annotate 'line', 2223
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2224
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2225
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2226
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2227
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2229
.return($S1)
# }
.annotate 'line', 2230

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2231
# Body
# {
.annotate 'line', 2233
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2234

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2235
# Body
# {
.annotate 'line', 2237
.tailcall self.'getPirString'()
# }
.annotate 'line', 2238

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2168
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2170
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2247
# Body
# {
.annotate 'line', 2250
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2251
setattribute self, 'pos', __ARG_2
.annotate 'line', 2252
# int n: $I1
null $I1
.annotate 'line', 2253
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2254
# {
.annotate 'line', 2256
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2257
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2259
setattribute self, 'numval', $P2
# }
.annotate 'line', 2260

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2261
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2262
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'getIntegerValue' :method

.annotate 'line', 2263
# Body
# {
.annotate 'line', 2265
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2266
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2267
.return($I1)
# }
.annotate 'line', 2268

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2269
# Body
# {
.annotate 'line', 2271
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2272
ne $I1, 0, __label_0
.annotate 'line', 2273
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2275
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2276

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2277
# Body
# {
.annotate 'line', 2279
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2280

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2243
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2245
addattribute $P0, 'pos'
.annotate 'line', 2246
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2288
# Body
# {
.annotate 'line', 2290
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2291
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2292

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2293
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2294
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'getFloatValue' :method

.annotate 'line', 2295
# Body
# {
.annotate 'line', 2297
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2298
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2300
.return($P1)
# }
.annotate 'line', 2301

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2302
# Body
# {
.annotate 'line', 2304
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2305
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2306

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2307
# Body
# {
.annotate 'line', 2311
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2312
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2314
.return($S1)
# }
.annotate 'line', 2315

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2285
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2287
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2323
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2324
# Body
# {
.annotate 'line', 2326
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2327
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2328

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2329
# Body
# {
.annotate 'line', 2331
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2332

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2333
# Body
# {
.annotate 'line', 2335
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2336
if_null $P1, __label_0
$P2 = $P1['type']
.annotate 'line', 2337
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2339
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
.annotate 'line', 2342
.return('P')
__label_3: # default
.annotate 'line', 2344
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2347

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2348
# Body
# {
.annotate 'line', 2350
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2351
.return($S1)
# }
.annotate 'line', 2352

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2353
# Body
# {
.annotate 'line', 2355
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2356
unless_null $P1, __label_0
.annotate 'line', 2357
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2358
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2359
# string s: $S1
null $S1
.annotate 'line', 2360
unless_null $P2, __label_1
# {
.annotate 'line', 2361
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2362
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
.annotate 'line', 2368
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2372
$P4 = $P2['id']
if_null $P4, __label_8
$P5 = $P2['id']
.annotate 'line', 2373
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2375
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2377
.return($S1)
# }
.annotate 'line', 2378

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2379
# Body
# {
.annotate 'line', 2381
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2382
$S2 = $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2383
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2384
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2386
.return($P1)
# }
.annotate 'line', 2387

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2388
# Body
# {
.annotate 'line', 2390
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2391
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2392
if_null $P2, __label_0
# {
.annotate 'line', 2393
$I1 = $P2['const']
unless $I1 goto __label_2
$P3 = $P2['id']
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2394
.return($P4)
__label_1: # endif
# }
__label_0: # endif
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
self.'annotate'(__ARG_1)
.annotate 'line', 2401
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2402

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2403
# Body
# {
.annotate 'line', 2405
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2406

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2407
# Body
# {
.annotate 'line', 2409
self.'annotate'(__ARG_1)
.annotate 'line', 2410
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2411
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2412
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2413
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2416
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2419
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2422
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2423
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2425
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2426
ne $S1, $S3, __label_11
# {
.annotate 'line', 2427
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2430
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2431
self.'annotate'(__ARG_1)
.annotate 'line', 2432
iseq $I1, $S1, 'P'
unless $I1 goto __label_16
isne $I1, $S3, 'P'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 2433
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2435
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2438
.return($S2)
# }
.annotate 'line', 2439

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2320
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2322
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2446
# Body
# {
.annotate 'line', 2448
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2449

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2444
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2457
# Body
# {
.annotate 'line', 2459
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2460
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2461

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2464
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2465

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2466
# Body
# {
.annotate 'line', 2468
self.'optimizearg'()
.annotate 'line', 2469
.return(self)
# }
.annotate 'line', 2470

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2454
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2456
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2482
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2483
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2484

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2485
# Body
# {
.annotate 'line', 2487
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2488
.return(self)
# }
.annotate 'line', 2489

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2490
# Body
# {
.annotate 'line', 2492
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2493

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2494
# Body
# {
.annotate 'line', 2496
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2497
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2498

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2499
# Body
# {
.annotate 'line', 2501
self.'optimizearg'()
.annotate 'line', 2502
.return(self)
# }
.annotate 'line', 2503

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2475
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2477
addattribute $P0, 'lexpr'
.annotate 'line', 2478
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2510
# Body
# {
.annotate 'line', 2512
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2513

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2514
# Body
# {
.annotate 'line', 2516
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2517
.return(self)
# }
.annotate 'line', 2518

.end # set


.sub 'optimize' :method

.annotate 'line', 2519
# Body
# {
.annotate 'line', 2521
self.'optimizearg'()
.annotate 'line', 2522
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2523
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2524
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2525
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2528
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2529
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2530
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2531
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2534
.return(self)
# }
.annotate 'line', 2535

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2536
# Body
# {
.annotate 'line', 2538
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2539
self.'annotate'(__ARG_1)
.annotate 'line', 2540
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2541

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2508
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2548
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkResult' :method

.annotate 'line', 2549
# Body
# {
.annotate 'line', 2551
.return('I')
# }
.annotate 'line', 2552

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2553
# Body
# {
.annotate 'line', 2555
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2556
.return(self)
# }
.annotate 'line', 2557

.end # set


.sub 'optimize' :method

.annotate 'line', 2558
# Body
# {
.annotate 'line', 2560
self.'optimizearg'()
.annotate 'line', 2561
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2562
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2563
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2564
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2565
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2567
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2568
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2569
.return(self)
# }
.annotate 'line', 2570

.end # optimize


.sub 'negated' :method

.annotate 'line', 2571
# Body
# {
.annotate 'line', 2573
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2574

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2575
# Body
# {
.annotate 'line', 2577
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2578
self.'annotate'(__ARG_1)
.annotate 'line', 2579
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2580
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2582
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2585
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2588
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2590

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2546
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2599
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2600

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2601
# Body
# {
.annotate 'line', 2603
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2604
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2605
.return(self)
# }
.annotate 'line', 2606

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2607
# Body
# {
.annotate 'line', 2609
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2610
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2611
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2612

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2613
# Body
# {
.annotate 'line', 2615
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2616
self.'annotate'(__ARG_1)
.annotate 'line', 2617
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2618
.return($S1)
# }
.annotate 'line', 2619

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2595
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2626
# Body
# {
.annotate 'line', 2628
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2629
.return(self)
# }
.annotate 'line', 2630

.end # set


.sub 'checkResult' :method

.annotate 'line', 2631
# Body
# {
.annotate 'line', 2633
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2634

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2635
# Body
# {
.annotate 'line', 2637
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2638
self.'annotate'(__ARG_1)
.annotate 'line', 2639
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2640
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2641
.return($S1)
# }
.annotate 'line', 2642

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2624
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2649
# Body
# {
.annotate 'line', 2651
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2652

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2653
# Body
# {
.annotate 'line', 2655
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2656
.return(self)
# }
.annotate 'line', 2657

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2658
# Body
# {
.annotate 'line', 2660
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2661
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2662
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2663

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2664
# Body
# {
.annotate 'line', 2666
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2667
self.'annotate'(__ARG_1)
.annotate 'line', 2668
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2669
.return($S1)
# }
.annotate 'line', 2670

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2647
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

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
.return(self)
# }
.annotate 'line', 2681

.end # set


.sub 'checkResult' :method

.annotate 'line', 2682
# Body
# {
.annotate 'line', 2684
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2685

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2686
# Body
# {
.annotate 'line', 2688
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2689
self.'annotate'(__ARG_1)
.annotate 'line', 2690
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2691
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2692
.return($S1)
# }
.annotate 'line', 2693

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2675
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2705
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2706
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2707
.return(self)
# }
.annotate 'line', 2708

.end # set


.sub 'checkResult' :method

.annotate 'line', 2709
# Body
# {
.annotate 'line', 2711
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2712
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2714
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2715

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2716
# Body
# {
.annotate 'line', 2718
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2719
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2720
.return(self)
# }
.annotate 'line', 2721

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2722
# Body
# {
.annotate 'line', 2724
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2725

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2698
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2700
addattribute $P0, 'lexpr'
.annotate 'line', 2701
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2732
# Body
# {
.annotate 'line', 2734
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2735
$S2 = __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 2736
self.'annotate'(__ARG_1)
.annotate 'line', 2737
__ARG_1.'emitset'(__ARG_2, $S1)
# }
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
self.'annotate'(__ARG_1)
.annotate 'line', 2743
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2744
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2745

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2730
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2752
# Body
# {
.annotate 'line', 2754
self.'annotate'(__ARG_1)
.annotate 'line', 2755
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2756
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2757
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2758

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2759
# Body
# {
.annotate 'line', 2761
self.'annotate'(__ARG_1)
.annotate 'line', 2762
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2763
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2764
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2765
.return($S1)
# }
.annotate 'line', 2766

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2750
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2773
# Body
# {
.annotate 'line', 2775
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2776
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2777
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2778

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2779
# Body
# {
.annotate 'line', 2781
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2782
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2783
# string ltype: $S1
$P3 = $P1.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2784
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2785
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2786
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2788
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2789
self.'annotate'(__ARG_1)
.annotate 'line', 2790
ne $S1, 'S', __label_6
# {
.annotate 'line', 2791
$P4 = $P2.'checkResult'()
$S5 = $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2792
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2793
__ARG_1.'say'($S4, ' = ', $S3)
set $S3, $S4
.annotate 'line', 2794
# }
__label_8: # endif
.annotate 'line', 2796
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2799
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2801
.return($S2)
# }
.annotate 'line', 2802

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2771
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2809
# Body
# {
.annotate 'line', 2811
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2812
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2813
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2814

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2818
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2819
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2820
self.'annotate'(__ARG_1)
.annotate 'line', 2821
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2822
.return($S2)
# }
.annotate 'line', 2823

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2807
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2830
# Body
# {
.annotate 'line', 2832
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2833
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2834
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2835

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2836
# Body
# {
.annotate 'line', 2838
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2839
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2840
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2841
self.'annotate'(__ARG_1)
.annotate 'line', 2842
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2843
.return($S2)
# }
.annotate 'line', 2844

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2828
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

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
$P1 = $P2.'checkResult'()
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
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2864
.return($S2)
# }
.annotate 'line', 2865

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2849
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2872
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2873
# Body
# {
.annotate 'line', 2875
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2876
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2877
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2878
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2879
self.'annotate'(__ARG_1)
.annotate 'line', 2880
# string aux: $S5
null $S5
.annotate 'line', 2881
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2883
ne $S1, 'I', __label_7
# {
.annotate 'line', 2884
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2885
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2886
# }
__label_7: # endif
.annotate 'line', 2888
ne $S2, 'I', __label_8
# {
.annotate 'line', 2889
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2890
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2891
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2894
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2895
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2896
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2897
# }
goto __label_10
__label_9: # else
.annotate 'line', 2899
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2900
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2901
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2902
# }
goto __label_13
__label_12: # else
.annotate 'line', 2904
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 2905
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2906
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2907
# }
goto __label_16
__label_15: # else
.annotate 'line', 2909
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 2910
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2911
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2912
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 2915
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 2917
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 2920
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 2923
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 2924
# }
.annotate 'line', 2926

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2927
# Body
# {
.annotate 'line', 2929
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2930

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2931
# Body
# {
.annotate 'line', 2933
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 2934

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2935
# Body
# {
.annotate 'line', 2937
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 2938

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2870
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 2951
# Body
# {
.annotate 'line', 2953
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2954
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 2955
setattribute self, 'checknull', $P2
# }
.annotate 'line', 2956

.end # NullCheckerExpr


.sub 'checkResult' :method

.annotate 'line', 2957
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'isnegable' :method

.annotate 'line', 2958
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2959
# Body
# {
.annotate 'line', 2961
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 2962
setattribute self, 'checknull', $P1
.annotate 'line', 2963
.return(self)
# }
.annotate 'line', 2964

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2965
# Body
# {
.annotate 'line', 2967
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2968
self.'annotate'(__ARG_1)
.annotate 'line', 2969
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2970
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 2971
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 2972

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2973
# Body
# {
.annotate 'line', 2975
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2976
self.'annotate'(__ARG_1)
.annotate 'line', 2977
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
.annotate 'line', 2978

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2946
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2948
addattribute $P0, 'expr'
.annotate 'line', 2949
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2985
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2986
# Body
# {
.annotate 'line', 2988
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2989

.end # negated


.sub 'optimize' :method

.annotate 'line', 2990
# Body
# {
.annotate 'line', 2992
self.'optimizearg'()
.annotate 'line', 2993
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2994
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2995
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2996
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2997
unless $I1 goto __label_0
# {
.annotate 'line', 2998
unless $I2 goto __label_1
.annotate 'line', 2999
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3001
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3003
unless $I2 goto __label_3
.annotate 'line', 3004
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3005
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3006
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3007
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3008
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3009
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3010
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3011
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3014
.return(self)
# }
.annotate 'line', 3015

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3016
# Body
# {
.annotate 'line', 3018
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3019

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3020
# Body
# {
.annotate 'line', 3022
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3023

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3024
# Body
# {
.annotate 'line', 3026
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3027

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3028
# Body
# {
.annotate 'line', 3030
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3031

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2983
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3038
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3039
# Body
# {
.annotate 'line', 3041
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3042

.end # negated


.sub 'optimize' :method

.annotate 'line', 3043
# Body
# {
.annotate 'line', 3045
self.'optimizearg'()
.annotate 'line', 3046
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3047
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3048
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3049
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3050
unless $I1 goto __label_0
# {
.annotate 'line', 3051
unless $I2 goto __label_1
.annotate 'line', 3052
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3054
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3056
unless $I2 goto __label_3
.annotate 'line', 3057
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3058
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3059
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3060
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3061
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3062
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3063
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3064
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3067
.return(self)
# }
.annotate 'line', 3068

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3069
# Body
# {
.annotate 'line', 3071
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3072

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3073
# Body
# {
.annotate 'line', 3075
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3076

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3077
# Body
# {
.annotate 'line', 3079
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3080

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3081
# Body
# {
.annotate 'line', 3083
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3084

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3036
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

.annotate 'line', 3092
# Body
# {
.annotate 'line', 3094
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3095
setattribute self, 'positive', $P1
# }
.annotate 'line', 3096

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3097
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3098
# Body
# {
.annotate 'line', 3100
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3101
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
.annotate 'line', 3102

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3103
# Body
# {
.annotate 'line', 3105
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3106
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3107
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3108

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3112

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3113
# Body
# {
.annotate 'line', 3115
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3116
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3117
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3118

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3119
# Body
# {
.annotate 'line', 3121
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3122
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3123
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3124

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3089
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3091
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3131
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3135

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3139

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3140
# Body
# {
.annotate 'line', 3142
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3143

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3144
# Body
# {
.annotate 'line', 3146
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3147

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3129
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3154
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3155
# Body
# {
.annotate 'line', 3157
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3158

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3159
# Body
# {
.annotate 'line', 3161
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3162

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3163
# Body
# {
.annotate 'line', 3165
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3166

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3167
# Body
# {
.annotate 'line', 3169
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3170

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3152
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3177
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3178
# Body
# {
.annotate 'line', 3180
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3181

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3182
# Body
# {
.annotate 'line', 3184
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3185

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3186
# Body
# {
.annotate 'line', 3188
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3189

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3190
# Body
# {
.annotate 'line', 3192
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3193

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3175
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3200
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3201
# Body
# {
.annotate 'line', 3203
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3204

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3205
# Body
# {
.annotate 'line', 3207
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3208

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3212

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3213
# Body
# {
.annotate 'line', 3215
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3216

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3198
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3223
# Body
# {
.annotate 'line', 3225
.return('I')
# }
.annotate 'line', 3226

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3221
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
self.'optimizearg'()
.annotate 'line', 3236
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3237
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3238
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3239
eq $I1, 0, __label_1
.annotate 'line', 3240
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3242
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3244
.return(self)
# }
.annotate 'line', 3245

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3246
# Body
# {
.annotate 'line', 3248
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
.annotate 'line', 3249
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3250
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3251
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3252
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3253
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3254
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3257
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3258
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3259
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3260
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3261
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3263

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3231
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
self.'optimizearg'()
.annotate 'line', 3273
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3274
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3275
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3276
ne $I1, 0, __label_1
.annotate 'line', 3277
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3279
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3281
.return(self)
# }
.annotate 'line', 3282

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3283
# Body
# {
.annotate 'line', 3285
# string res: $S1
null $S1
.annotate 'line', 3286
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3289
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3290
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3291
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3292
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3293
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3294
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3295
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3298
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3299
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3300
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3301
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3302
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3304

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3268
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3311
# Body
# {
.annotate 'line', 3313
.return('I')
# }
.annotate 'line', 3314

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3309
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3321
# Body
# {
.annotate 'line', 3323
self.'optimizearg'()
.annotate 'line', 3324
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3325
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3326
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3327
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3328
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3329
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3331
.return(self)
# }
.annotate 'line', 3332

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3333
# Body
# {
.annotate 'line', 3335
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
.annotate 'line', 3336
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3337
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3338
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3339
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3340
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3341

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3319
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3348
# Body
# {
.annotate 'line', 3350
self.'optimizearg'()
.annotate 'line', 3351
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3352
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3353
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3354
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3355
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3356
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3358
.return(self)
# }
.annotate 'line', 3359

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3360
# Body
# {
.annotate 'line', 3362
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
.annotate 'line', 3363
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3364
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3365
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3366
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3367
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3368

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3346
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3376
# Body
# {
.annotate 'line', 3378
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3379
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3380
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3381
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3382
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3384
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3386
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3387
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3388
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3391
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3392

.end # ConcatString


.sub 'checkResult' :method

.annotate 'line', 3393
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3394
# Body
# {
.annotate 'line', 3396
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3397
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3398
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3399
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3400
ge $I2, $I1, __label_1
.annotate 'line', 3401
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
# predefined string
$S1 = $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3400
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3402
.return($P2)
# }
.annotate 'line', 3403

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3404
# Body
# {
.annotate 'line', 3406
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3407
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3408
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3409
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3410
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3411
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3412
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3411
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3413
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3414

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3415
# Body
# {
.annotate 'line', 3417
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3418
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3419
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3420
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3421
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3422
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3423
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3422
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3424
.return($S1)
# }
.annotate 'line', 3425

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3426
# Body
# {
.annotate 'line', 3428
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3429
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3430
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3431
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3432
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3431
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3433

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3373
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3375
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3440
# Body
# {
.annotate 'line', 3442
self.'optimizearg'()
.annotate 'line', 3443
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3444
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3445
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3446
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3447
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3448
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3449
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3450
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3451
# var t: $P5
null $P5
.annotate 'line', 3452
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3453
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3454
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3455
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3457
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3458
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3460
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3461
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3462
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3463
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3464
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3465
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3468
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3469
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3470
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3471
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3472
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3473
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3477
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3478
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3480
.return(self)
# }
.annotate 'line', 3481

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3482
# Body
# {
.annotate 'line', 3484
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3485
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3486
ne $S1, $S2, __label_2
.annotate 'line', 3487
.return($S1)
__label_2: # endif
.annotate 'line', 3488
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3489
.return('S')
__label_3: # endif
.annotate 'line', 3490
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3491
.return('S')
__label_5: # endif
.annotate 'line', 3492
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3493
.return('N')
__label_7: # endif
.annotate 'line', 3494
.return('I')
# }
.annotate 'line', 3495

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3496
# Body
# {
.annotate 'line', 3498
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3499
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3500
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3501
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3502
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3504
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3505
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3506
ne $S1, 'S', __label_5
# {
.annotate 'line', 3507
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3508
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3509
eq $S2, 'S', __label_10
# {
.annotate 'line', 3510
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3511
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3514
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3515
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3518
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3521
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3522
# string l: $S7
null $S7
.annotate 'line', 3523
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3525
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3526
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3528
# string r: $S8
null $S8
.annotate 'line', 3529
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3531
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3532
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3534
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3537
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3539

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3438
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

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
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3552
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3553
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3554
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3555
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3556
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3557
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3558
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3559
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3562
.return(self)
# }
.annotate 'line', 3563

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3564
# Body
# {
.annotate 'line', 3566
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3567
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3568
ne $S1, $S2, __label_2
.annotate 'line', 3569
.return($S1)
__label_2: # endif
.annotate 'line', 3570
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3571
.return('N')
__label_3: # endif
.annotate 'line', 3572
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3573
.return('N')
__label_5: # endif
.annotate 'line', 3574
.return('I')
# }
.annotate 'line', 3575

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3576
# Body
# {
.annotate 'line', 3578
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3579
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3580
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3581

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3544
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

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
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3595
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
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
set $P8, $P3
set $I1, $P8
.annotate 'line', 3599
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3600
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3601
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3604
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3605
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3606
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3607
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3608
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3609
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3613
.return(self)
# }
.annotate 'line', 3614

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3615
# Body
# {
.annotate 'line', 3617
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3618
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3619
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3620
ne $S1, $S2, __label_2
.annotate 'line', 3621
.return($S1)
__label_2: # endif
.annotate 'line', 3622
ne $S1, 'S', __label_3
.annotate 'line', 3623
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3625
.return('N')
__label_4: # endif
# }
.annotate 'line', 3626

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3627
# Body
# {
.annotate 'line', 3629
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3630
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3631
# string ltype: $S1
$P3 = $P1.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3632
# string rtype: $S2
$P3 = $P2.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3633
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3634
ne $S1, 'S', __label_2
# {
.annotate 'line', 3635
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3636
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3637
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3638
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3643
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3644
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3646
self.'annotate'(__ARG_1)
.annotate 'line', 3647
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3648
.return()
# }
__label_2: # endif
.annotate 'line', 3650
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
.annotate 'line', 3651
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3652
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3653
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3654
.return()
# }
__label_6: # endif
.annotate 'line', 3659
ne $S1, 'N', __label_10
# {
.annotate 'line', 3660
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3661
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3662
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3663
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3665
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3666
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3673
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3674
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3676
self.'annotate'(__ARG_1)
.annotate 'line', 3677
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3678
.return()
# }
__label_10: # endif
.annotate 'line', 3681
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3682
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3683
$P10 = self.'checkResult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3684
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3687
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3688
# }
__label_16: # endif
.annotate 'line', 3690
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3691
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3692
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3695
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3697
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3698
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3702
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3704
# }
__label_19: # endif
.annotate 'line', 3707
self.'annotate'(__ARG_1)
.annotate 'line', 3708
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3586
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3716
# Body
# {
.annotate 'line', 3718
self.'optimizearg'()
.annotate 'line', 3719
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3720
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3721
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3722
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3723
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3724
# var lval: $P3
null $P3
.annotate 'line', 3725
# var rval: $P4
null $P4
.annotate 'line', 3726
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3727
getattribute $P3, $P1, 'numval'
.annotate 'line', 3728
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3729
getattribute $P4, $P2, 'numval'
.annotate 'line', 3730
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3731
eq $I2, 0, __label_6
.annotate 'line', 3732
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
.annotate 'line', 3735
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3736
getattribute $P3, $P1, 'numval'
.annotate 'line', 3737
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3738
getattribute $P4, $P2, 'numval'
.annotate 'line', 3739
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3740
eq $N2, $N3, __label_8
.annotate 'line', 3741
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
.annotate 'line', 3745
.return(self)
# }
.annotate 'line', 3746

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3747
# Body
# {
.annotate 'line', 3749
.return('N')
# }
.annotate 'line', 3750

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3751
# Body
# {
.annotate 'line', 3753
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3754
# var lreg: $P2
null $P2
.annotate 'line', 3755
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_0
.annotate 'line', 3756
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3758
$P2 = self.'tempreg'('N')
.annotate 'line', 3759
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3761
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3762
# var rreg: $P4
null $P4
.annotate 'line', 3763
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_2
.annotate 'line', 3764
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3766
$P4 = self.'tempreg'('N')
.annotate 'line', 3767
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3769
self.'annotate'(__ARG_1)
.annotate 'line', 3770
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3771

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3714
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3778
# Body
# {
.annotate 'line', 3780
.return('I')
# }
.annotate 'line', 3781

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3782
# Body
# {
.annotate 'line', 3784
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3785
# var lreg: $P2
null $P2
.annotate 'line', 3786
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3787
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3789
$P2 = self.'tempreg'('I')
.annotate 'line', 3790
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3792
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3793
# var rreg: $P4
null $P4
.annotate 'line', 3794
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3795
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3797
$P4 = self.'tempreg'('I')
.annotate 'line', 3798
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3800
self.'annotate'(__ARG_1)
.annotate 'line', 3801
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3802

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3776
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3809
# Body
# {
.annotate 'line', 3811
.return('I')
# }
.annotate 'line', 3812

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3813
# Body
# {
.annotate 'line', 3815
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3816
# var lreg: $P2
null $P2
.annotate 'line', 3817
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3818
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3820
$P2 = self.'tempreg'('I')
.annotate 'line', 3821
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3823
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3824
# var rreg: $P4
null $P4
.annotate 'line', 3825
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3826
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3828
$P4 = self.'tempreg'('I')
.annotate 'line', 3829
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3831
self.'annotate'(__ARG_1)
.annotate 'line', 3836
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3837

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3807
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3846
# Body
# {
.annotate 'line', 3848
setattribute self, 'arg', __ARG_1
.annotate 'line', 3849
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3850

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3851
# Body
# {
.annotate 'line', 3853
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3854
.return(self)
# }
.annotate 'line', 3855

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3856
# Body
# {
.annotate 'line', 3858
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3859

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3844
addattribute $P0, 'arg'
.annotate 'line', 3845
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3862
# Body
# {
.annotate 'line', 3864
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3865
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3866
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3867
.return(1)
# }
.annotate 'line', 3868

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3877
# Body
# {
.annotate 'line', 3879
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3880
setattribute self, 'predef', __ARG_3
.annotate 'line', 3881
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3882

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3883
# Body
# {
.annotate 'line', 3885
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3886

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3887
# Body
# {
.annotate 'line', 3889
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3890
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3891
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3892
# var arg: $P4
null $P4
.annotate 'line', 3893
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3894
ne $I1, -1, __label_0
# {
.annotate 'line', 3895
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3896
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3897
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3901
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3902
# int i: $I3
null $I3
__label_7: # for condition
ge $I3, $I2, __label_6
# {
.annotate 'line', 3903
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3904
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3905
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3906
# string argr: $S4
null $S4
.annotate 'line', 3907
iseq $I4, $S2, $S3
if $I4 goto __label_12
iseq $I4, $S3, '?'
__label_12:
unless $I4 goto __label_10
.annotate 'line', 3908
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3910
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3911
ne $S3, 'P', __label_13
# {
.annotate 'line', 3912
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3913
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
.annotate 'line', 3918
eq $S5, '', __label_19
.annotate 'line', 3919
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3921
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3923
$P3.'push'($S4)
# }
__label_5: # for iteration
.annotate 'line', 3902
inc $I3
goto __label_7
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3926
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3927

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3872
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3874
addattribute $P0, 'predef'
.annotate 'line', 3875
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3937
# Body
# {
.annotate 'line', 3939
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3940
setattribute self, 'funref', __ARG_4
.annotate 'line', 3941
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3942
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3943
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3944
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3945
# {
.annotate 'line', 3946
# var modifier: $P2
null $P2
.annotate 'line', 3947
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3948
$P1 = __ARG_1.'get'()
.annotate 'line', 3949
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3950
$P1 = __ARG_1.'get'()
.annotate 'line', 3951
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3952
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3953
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3956
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3959
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3960
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3961
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3962
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3964

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3965
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3966
# Body
# {
.annotate 'line', 3968
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3969
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3970
'optimize_array'($P1)
.annotate 'line', 3973
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3974
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3975
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3976
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3977
if_null $P3, __label_2
# {
.annotate 'line', 3978
self.'use_predef'($S1)
.annotate 'line', 3981
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3982
if_null $P4, __label_3
# {
.annotate 'line', 3983
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3984
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3987
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
.annotate 'line', 3991
.return(self)
# }
.annotate 'line', 3992

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3993
# Body
# {
.annotate 'line', 3995
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3996
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3997
# string call: $S1
null $S1
.annotate 'line', 3998
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3999
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4000
ne $S1, '', __label_2
# {
.annotate 'line', 4001
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4002
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 4006
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4008
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4009
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4010
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4011
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4012
# string reg: $S3
null $S3
.annotate 'line', 4013
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4014
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4015
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4018
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4019
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4021
self.'annotate'(__ARG_1)
.annotate 'line', 4023
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 4024
$S9 = __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 4025
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4027
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 4030
unless $I1 goto __label_14
.annotate 'line', 4031
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4033
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4035
__ARG_1.'print'('(')
.annotate 'line', 4037
# string sep: $S4
set $S4, ''
.annotate 'line', 4038
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4039
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4040
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4041
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4042
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4043
# string setname: $S6
set $S6, ''
.annotate 'line', 4044
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4045
if_null $P6, __label_19
# {
.annotate 'line', 4046
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4047
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4048
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4050
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4052
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
.annotate 'line', 4056
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4057
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4058
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4059
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4062
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
.annotate 'line', 4067
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4068
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4069
unless $I4 goto __label_32
.annotate 'line', 4070
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4071
unless $I5 goto __label_34
# {
.annotate 'line', 4072
__ARG_1.'print'(' :named')
.annotate 'line', 4073
eq $S6, '', __label_35
.annotate 'line', 4074
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4076
# }
__label_16: # for iteration
.annotate 'line', 4039
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4078
__ARG_1.'say'(')')
# }
.annotate 'line', 4079

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3932
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3934
addattribute $P0, 'funref'
.annotate 'line', 3935
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4089
# Body
# {
.annotate 'line', 4091
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4092
setattribute self, 'left', __ARG_4
.annotate 'line', 4093
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4094

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 4095
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4096
# Body
# {
.annotate 'line', 4098
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4099
.return(self)
# }
.annotate 'line', 4100

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4101
# Body
# {
.annotate 'line', 4103
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4104

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4105
# Body
# {
.annotate 'line', 4107
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4108
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4109
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4110
eq $S1, 'P', __label_2
# {
.annotate 'line', 4111
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4112
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4113
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4115
.return($S2)
# }
.annotate 'line', 4116

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4117
# Body
# {
.annotate 'line', 4119
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4120
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4121
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4122
self.'annotate'(__ARG_1)
.annotate 'line', 4123
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4124
.return($S3)
# }
.annotate 'line', 4125

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4126
# Body
# {
.annotate 'line', 4128
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4129
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4130
self.'annotate'(__ARG_1)
.annotate 'line', 4131
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4132

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4133
# Body
# {
.annotate 'line', 4135
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4136
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4137
# string value: $S3
null $S3
.annotate 'line', 4138
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4140
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4141
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4142
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4144
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4147
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4148
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4150
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4151

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4152
# Body
# {
.annotate 'line', 4154
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4155
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4156
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4157
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4158
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4160
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4161
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
eq $S5, 'P', __label_6
.annotate 'line', 4162
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4164
# }
__label_4: # endif
.annotate 'line', 4166
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4167
.return($S3)
# }
.annotate 'line', 4168

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4084
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4086
addattribute $P0, 'left'
.annotate 'line', 4087
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4177
# Body
# {
.annotate 'line', 4179
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4180
setattribute self, 'left', __ARG_4
.annotate 'line', 4181
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4182

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 4183
# Body
# {
.annotate 'line', 4185
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
ne $S1, 'S', __label_0
.annotate 'line', 4186
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4188
.return('P')
__label_1: # endif
# }
.annotate 'line', 4189

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4190
# Body
# {
.annotate 'line', 4192
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4193
self.'optimizeargs'()
.annotate 'line', 4194
.return(self)
# }
.annotate 'line', 4195

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4196
# Body
# {
.annotate 'line', 4198
# var regleft: $P1
null $P1
.annotate 'line', 4199
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4200
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4202
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4203
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4204
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4205
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4206
ne $S1, 'S', __label_3
# {
.annotate 'line', 4207
eq $I1, 1, __label_5
.annotate 'line', 4208
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4209
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4212
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4213
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4214
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4216

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4217
# Body
# {
.annotate 'line', 4219
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4220
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4221
self.'annotate'(__ARG_1)
.annotate 'line', 4222
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4223
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4224
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4225

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4226
# Body
# {
.annotate 'line', 4228
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4229
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4230
# string rreg: $S1
null $S1
.annotate 'line', 4231
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4232
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4233
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4236
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4237
self.'annotate'(__ARG_1)
.annotate 'line', 4238
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4239
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4240
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4241
.return($S1)
# }
.annotate 'line', 4242

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4173
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4175
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4251
# Body
# {
.annotate 'line', 4253
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4254
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4255
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4256
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4257
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4258
# {
.annotate 'line', 4259
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4260
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4261
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4262
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4263
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4265

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 4266
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4267
# Body
# {
.annotate 'line', 4269
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4270
.return(self)
# }
.annotate 'line', 4271

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4272
# Body
# {
.annotate 'line', 4274
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4275
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4276

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4277
# Body
# {
.annotate 'line', 4279
self.'annotate'(__ARG_1)
.annotate 'line', 4280
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4281
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4282
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4283
# string itemreg: $S3
null $S3
.annotate 'line', 4284
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4285
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4286
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
.annotate 'line', 4288
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4289
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4293
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4295
self.'annotate'(__ARG_1)
.annotate 'line', 4296
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4298
.return($S1)
# }
.annotate 'line', 4299

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4247
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4249
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4309
# Body
# {
.annotate 'line', 4311
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4312
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4313
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4314
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4315
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4316
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4317
# {
.annotate 'line', 4318
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4319
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4320
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4321
$P2.'push'($P4)
.annotate 'line', 4322
$P3.'push'($P5)
# }
.annotate 'line', 4324
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4325
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4326
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4328
setattribute self, 'keys', $P2
.annotate 'line', 4329
setattribute self, 'values', $P3
# }
.annotate 'line', 4330

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 4331
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4332
# Body
# {
.annotate 'line', 4334
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4335
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4336
.return(self)
# }
.annotate 'line', 4337

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4338
# Body
# {
.annotate 'line', 4340
self.'annotate'(__ARG_1)
.annotate 'line', 4341
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4342
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4343
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4344
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4345
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4346
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4347
# string item: $S1
null $S1
.annotate 'line', 4348
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4349
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4350
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4351
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4354
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4356
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4357
# string itemreg: $S3
null $S3
.annotate 'line', 4358
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4359
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4360
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4361
# {
.annotate 'line', 4363
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4364
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
unless_null $P9, __label_13
# {
.annotate 'line', 4365
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4366
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4369
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4373
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4374
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
__label_0: # for iteration
.annotate 'line', 4345
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4376

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4377
# Body
# {
.annotate 'line', 4379
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4380
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4381
.return($S1)
# }
.annotate 'line', 4382

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4304
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4306
addattribute $P0, 'keys'
.annotate 'line', 4307
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 4391
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4392
# Body
# {
.annotate 'line', 4396
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4397
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4398
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4399
__ARG_1.'unget'($P2)
.annotate 'line', 4400
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4401
# {
.annotate 'line', 4402
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4403
$P3.'push'($P4)
# }
.annotate 'line', 4404
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4405
setattribute self, 'initializer', $P3
.annotate 'line', 4406
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4408

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4387
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4389
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4417
# Body
# {
.annotate 'line', 4419
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4421
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4422
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4423
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4424
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4425
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4426
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4427
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4428
# {
.annotate 'line', 4429
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4430
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4431
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4432
$P2.'push'($P3)
# }
.annotate 'line', 4433
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4434
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4437
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4440
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4442
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4443
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4445
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4446

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4447
# Body
# {
.annotate 'line', 4449
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4450
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4453
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4454
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4455
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4456
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4457
$P1 = $P3['value']
.annotate 'line', 4458
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4459
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4460
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4463
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4467
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4468
if_null $P4, __label_7
.annotate 'line', 4469
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4470
.return(self)
# }
.annotate 'line', 4471

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4472
# Body
# {
.annotate 'line', 4474
self.'annotate'(__ARG_1)
.annotate 'line', 4476
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4477
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
.annotate 'line', 4480
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4481
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4482
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
.annotate 'line', 4484
# string reginit: $S1
set $S1, ''
.annotate 'line', 4485
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4486
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4487
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4491
ne $I2, 1, __label_13
.annotate 'line', 4492
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4494
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4495
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4496
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4500
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4501
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4502
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4505
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4508
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4509
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4510
unless_null $P3, __label_23
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4511
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4515
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4516
le $I1, 1, __label_24
# {
.annotate 'line', 4517
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4521
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4522
# predefined elements
elements $I6, $P4
sub $I5, $I6, 1
$S3 = $P4[$I5]
.annotate 'line', 4523
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4526
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4527
unless_null $P5, __label_25
# {
.annotate 'line', 4529
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4530
if_null $P6, __label_27
# {
.annotate 'line', 4531
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4534
'Warn'('Checking: new unknown type')
.annotate 'line', 4535
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4537
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4541
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4545
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4547
isgt $I7, $I1, 1
if $I7 goto __label_30
isgt $I7, $I1, 0
unless $I7 goto __label_31
iseq $I7, $I2, 1
__label_31:
__label_30:
unless $I7 goto __label_29
# {
.annotate 'line', 4548
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4549
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4550
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4551
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4553
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4554
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4555
__ARG_1.'say'(")")
.annotate 'line', 4556
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4558

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4413
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4415
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4567
# Body
# {
.annotate 'line', 4569
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4570
setattribute self, 'owner', __ARG_2
.annotate 'line', 4571
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4572
setattribute self, 'nskey', $P1
.annotate 'line', 4573
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4574
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4575
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4577
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4578

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4579
# Body
# {
.annotate 'line', 4581
# string reginit: $S1
null $S1
.annotate 'line', 4582
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4583
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
.annotate 'line', 4584
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4588
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4589
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4592
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4594
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4595
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4596
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4597
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4598
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4599
if_null $S1, __label_7
.annotate 'line', 4600
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4601
__ARG_1.'say'()
# }
.annotate 'line', 4602

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4563
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4565
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4611
# Body
# {
.annotate 'line', 4613
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4614
setattribute self, 'owner', __ARG_2
.annotate 'line', 4615
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4616
setattribute self, 'nskey', $P1
.annotate 'line', 4617
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4618
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4619
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4621
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4622

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4623
# Body
# {
.annotate 'line', 4625
# string reginit: $S1
null $S1
.annotate 'line', 4626
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4628
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4629
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4630
le $I1, 0, __label_3
.annotate 'line', 4631
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4632
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4633
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4634
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4635
__ARG_1.'say'()
.annotate 'line', 4637
le $I1, 0, __label_4
# {
.annotate 'line', 4638
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4639
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4640
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4641
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4643
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4644
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4645
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4646
__ARG_1.'say'(")")
.annotate 'line', 4647
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4649

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4607
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4609
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4654
# Body
# {
.annotate 'line', 4656
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4658
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4660
new $P5, [ 'CallExpr' ]
.annotate 'line', 4661
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4660
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4663
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4665
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4667
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4670
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4671
__ARG_1.'unget'($P2)
.annotate 'line', 4672
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4674
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4678
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
.annotate 'line', 4683
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4685

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4694
# Body
# {
.annotate 'line', 4696
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4697
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4698
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4699

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4700
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4701
# Body
# {
.annotate 'line', 4703
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4704
# string checkedval: $S1
null $S1
.annotate 'line', 4705
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4706
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4707
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4711
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4712
self.'annotate'(__ARG_1)
.annotate 'line', 4713
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4714

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4689
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4691
addattribute $P0, 'lexpr'
.annotate 'line', 4692
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4729
# Body
# {
.annotate 'line', 4731
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4732
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4733
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4734
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4735
.return(self)
# }
.annotate 'line', 4736

.end # set


.sub 'optimize' :method

.annotate 'line', 4737
# Body
# {
.annotate 'line', 4739
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4740
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
.annotate 'line', 4742
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4744
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4746
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4747
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4748
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4750

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4751
# Body
# {
.annotate 'line', 4753
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4754

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4755
# Body
# {
.annotate 'line', 4757
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4758
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4759
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4760
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4761
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4762
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4763
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4764
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4765

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4719
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4725
addattribute $P0, 'condition'
.annotate 'line', 4726
addattribute $P0, 'etrue'
.annotate 'line', 4727
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

.annotate 'line', 4802
# Body
# {
.annotate 'line', 4804
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
.annotate 'line', 4805
.return(1)
__label_3: # case
.annotate 'line', 4806
.return(2)
__label_4: # case
.annotate 'line', 4807
.return(3)
__label_1: # default
.annotate 'line', 4808
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4810

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4812
# Body
# {
.annotate 'line', 4814
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
.annotate 'line', 4815
.return(8)
__label_3: # case
.annotate 'line', 4816
.return(11)
__label_4: # case
.annotate 'line', 4817
.return(9)
__label_5: # case
.annotate 'line', 4818
.return(10)
__label_1: # default
.annotate 'line', 4819
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4821

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4823
# Body
# {
.annotate 'line', 4825
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
.annotate 'line', 4826
.return(19)
__label_3: # case
.annotate 'line', 4827
.return(20)
__label_4: # case
.annotate 'line', 4828
.return(21)
__label_5: # case
.annotate 'line', 4829
.return(22)
__label_1: # default
.annotate 'line', 4830
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4832

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4834
# Body
# {
.annotate 'line', 4836
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
.annotate 'line', 4837
.return(12)
__label_3: # case
.annotate 'line', 4838
.return(13)
__label_4: # case
.annotate 'line', 4839
.return(25)
__label_5: # case
.annotate 'line', 4840
.return(26)
__label_1: # default
.annotate 'line', 4842
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4843
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4845

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4847
# Body
# {
.annotate 'line', 4849
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
.annotate 'line', 4850
.return(14)
__label_3: # case
.annotate 'line', 4851
.return(16)
__label_4: # case
.annotate 'line', 4852
.return(15)
__label_5: # case
.annotate 'line', 4853
.return(17)
__label_1: # default
.annotate 'line', 4854
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4856

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4858
# Body
# {
.annotate 'line', 4860
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
.annotate 'line', 4861
.return(4)
__label_3: # case
.annotate 'line', 4862
.return(5)
__label_4: # case
.annotate 'line', 4863
.return(6)
__label_5: # case
.annotate 'line', 4864
.return(18)
__label_6: # case
.annotate 'line', 4865
.return(23)
__label_7: # case
.annotate 'line', 4866
.return(24)
__label_1: # default
.annotate 'line', 4867
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4869

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4871
# Body
# {
.annotate 'line', 4873
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4875
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4876
# var expr: $P2
null $P2
.annotate 'line', 4877
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4878
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4879
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4880
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4882
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4883
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4884
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4885
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4886
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4887
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4888
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4889
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4890
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4891
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4892
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4893
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4894
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4895
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4896
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4897
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 4898
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4899

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4901
# Body
# {
.annotate 'line', 4903
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4904
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4906
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4907
# var t: $P2
null $P2
.annotate 'line', 4908
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4909
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 4910
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4912
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4915
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4918
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4921
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4924
__ARG_1.'unget'($P2)
.annotate 'line', 4925
.return($P1)
# }
.annotate 'line', 4926

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4928
# Body
# {
.annotate 'line', 4930
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4932
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4933
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4934
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4935
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4936
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4937
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4940
__ARG_1.'unget'($P2)
.annotate 'line', 4941
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4943

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4945
# Body
# {
.annotate 'line', 4947
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4948
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4949
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4951
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4952
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4953
# var subexpr: $P2
null $P2
.annotate 'line', 4954
eq $I1, 0, __label_0
# {
.annotate 'line', 4955
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4956
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4957
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
.annotate 'line', 4959
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4962
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4965
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4968
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4971
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4973
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4976
__ARG_1.'unget'($P1)
.annotate 'line', 4977
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4979
.return($P2)
# }
.annotate 'line', 4980

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4982
# Body
# {
.annotate 'line', 4984
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4985
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4987
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4988
# var t: $P2
null $P2
.annotate 'line', 4989
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4990
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 4991
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4992
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4993
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
.annotate 'line', 4995
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4998
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5001
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5004
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5007
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5009
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5010
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5012
__ARG_1.'unget'($P2)
.annotate 'line', 5013
.return($P1)
# }
.annotate 'line', 5014

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5016
# Body
# {
.annotate 'line', 5018
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5020
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5021
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5022
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5023
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5024
# var expr: $P4
null $P4
.annotate 'line', 5025
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5026
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5028
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5029
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5031
__ARG_1.'unget'($P2)
.annotate 'line', 5032
.return($P1)
# }
.annotate 'line', 5033

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5035
# Body
# {
.annotate 'line', 5037
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5038
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5040
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5041
# var rexpr: $P2
null $P2
.annotate 'line', 5042
# var t: $P3
null $P3
.annotate 'line', 5043
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5044
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5045
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
.annotate 'line', 5047
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5048
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5051
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5052
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5055
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5056
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5059
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5060
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5063
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5066
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5069
__ARG_1.'unget'($P3)
.annotate 'line', 5070
.return($P1)
# }
.annotate 'line', 5071

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5073
# Body
# {
.annotate 'line', 5075
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5076
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5078
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5079
# var t: $P2
null $P2
.annotate 'line', 5080
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5081
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5082
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5083
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
.annotate 'line', 5085
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5088
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5091
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5094
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5097
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5100
__ARG_1.'unget'($P2)
.annotate 'line', 5101
.return($P1)
# }
.annotate 'line', 5102

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5104
# Body
# {
.annotate 'line', 5106
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5108
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5109
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5110
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5111
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5112
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5114
__ARG_1.'unget'($P2)
.annotate 'line', 5115
.return($P1)
# }
.annotate 'line', 5116

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5118
# Body
# {
.annotate 'line', 5120
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5122
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5123
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5124
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5125
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5126
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5128
__ARG_1.'unget'($P2)
.annotate 'line', 5129
.return($P1)
# }
.annotate 'line', 5130

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5132
# Body
# {
.annotate 'line', 5134
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5136
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5137
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5138
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5139
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5140
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5142
__ARG_1.'unget'($P2)
.annotate 'line', 5143
.return($P1)
# }
.annotate 'line', 5144

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5146
# Body
# {
.annotate 'line', 5148
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5150
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5151
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5152
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5153
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5154
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5156
__ARG_1.'unget'($P2)
.annotate 'line', 5157
.return($P1)
# }
.annotate 'line', 5158

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5160
# Body
# {
.annotate 'line', 5162
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5163
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5165
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5166
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5167
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5168
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5169
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5170
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5171
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5174
__ARG_1.'unget'($P2)
.annotate 'line', 5175
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5177

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5179
# Body
# {
.annotate 'line', 5181
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5182
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5183
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5185
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5186
# var t: $P2
null $P2
.annotate 'line', 5187
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5188
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5189
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5190
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5191
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
.annotate 'line', 5193
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5196
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5199
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5202
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5205
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5208
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5211
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5213
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5214
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5216
__ARG_1.'unget'($P2)
.annotate 'line', 5217
.return($P1)
# }
.annotate 'line', 5218

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5220
# Body
# {
.annotate 'line', 5222
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5224
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5225

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5238
# Body
# {
.annotate 'line', 5240
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5241
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5242
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5243
setattribute self, 'brlabel', $P2
.annotate 'line', 5244
.return($S1)
# }
.annotate 'line', 5245

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5246
# Body
# {
.annotate 'line', 5248
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5249
unless_null $P1, __label_0
.annotate 'line', 5250
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5251
.return($P1)
# }
.annotate 'line', 5252

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5236
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5259
# Body
# {
.annotate 'line', 5261
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5262
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5263
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5264
setattribute self, 'cntlabel', $P2
.annotate 'line', 5265
.return($S1)
# }
.annotate 'line', 5266

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5267
# Body
# {
.annotate 'line', 5269
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5270
unless_null $P1, __label_0
.annotate 'line', 5271
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5272
.return($P1)
# }
.annotate 'line', 5273

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5255
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5257
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5287
# Body
# {
.annotate 'line', 5289
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5290
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5291
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5292
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5293
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5294
# {
.annotate 'line', 5295
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5296
$P2.'push'($P3)
# }
.annotate 'line', 5297
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5299
'RequireOp'(';', $P1)
.annotate 'line', 5300
setattribute self, 'values', $P2
# }
.annotate 'line', 5301

.end # parse


.sub 'optimize' :method

.annotate 'line', 5302
# Body
# {
.annotate 'line', 5304
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5305
.return(self)
# }
.annotate 'line', 5306

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5307
# Body
# {
.annotate 'line', 5309
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5310
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5311
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5314
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5315
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5317
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5318
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5319
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5320
self.'annotate'(__ARG_1)
.annotate 'line', 5321
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5325
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5326
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5327
# string reg: $S1
null $S1
.annotate 'line', 5328
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5329
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5330
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5333
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5334
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5325
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5336
self.'annotate'(__ARG_1)
.annotate 'line', 5337
self.'emitret'(__ARG_1)
.annotate 'line', 5338
# string sep: $S2
set $S2, ''
.annotate 'line', 5339
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5340
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5341
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5343
__ARG_1.'say'(')')
# }
.annotate 'line', 5344

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5283
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5285
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5349
# Body
# {
.annotate 'line', 5351
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5352

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5353
# Body
# {
.annotate 'line', 5355
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5356

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5347
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5361
# Body
# {
.annotate 'line', 5363
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5364

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5365
# Body
# {
.annotate 'line', 5367
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5368

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5359
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5379
# Body
# {
.annotate 'line', 5381
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5382
setattribute self, 'name', __ARG_1
.annotate 'line', 5383
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5384
setattribute self, 'value', $P2
# }
.annotate 'line', 5385

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5386
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5387
# Body
# {
.annotate 'line', 5389
self.'annotate'(__ARG_1)
.annotate 'line', 5390
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5391
# string comment: $S2
concat $S0, 'label ', $S1
set $S2, $S0
.annotate 'line', 5392
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5393

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5375
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5377
addattribute $P0, 'name'
.annotate 'line', 5378
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5404
# Body
# {
.annotate 'line', 5406
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5407
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5408
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5409
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5410
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5411
setattribute self, 'label', $P1
.annotate 'line', 5412
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5413

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5414
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5415
# Body
# {
.annotate 'line', 5417
self.'annotate'(__ARG_1)
.annotate 'line', 5418
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5419
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5420
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5421

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5400
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5402
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5430
# Body
# {
.annotate 'line', 5432
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5433

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5434
# Body
# {
.annotate 'line', 5436
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5437
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5438
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5439

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5428
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

.annotate 'line', 5450
# Body
# {
.annotate 'line', 5452
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5453
self.'parsecondition'(__ARG_2)
.annotate 'line', 5454
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5455
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5456
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5457
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5459
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5460
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5462

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5463
# Body
# {
.annotate 'line', 5465
self.'optimize_condition'()
.annotate 'line', 5466
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5467
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5468
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5469
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5471
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5473
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5475
.return(self)
# }
.annotate 'line', 5476

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5477
# Body
# {
.annotate 'line', 5479
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5480
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5481
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5482
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5483
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5484
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5485
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5486
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5487
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5488
self.'annotate'(__ARG_1)
.annotate 'line', 5489
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5490
$P1.'emit'(__ARG_1)
.annotate 'line', 5492
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5493
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5494
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5495
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5497
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5498

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5446
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5448
addattribute $P0, 'truebranch'
.annotate 'line', 5449
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5508
# Body
# {
.annotate 'line', 5510
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5511

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5512
# Body
# {
.annotate 'line', 5514
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5515
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5517
self.'annotate'(__ARG_1)
.annotate 'line', 5518
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5519
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5520
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5521
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5522

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5505
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5507
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5531
# Body
# {
.annotate 'line', 5533
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5534
self.'parsecondition'(__ARG_2)
.annotate 'line', 5535
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5536

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5537
# Body
# {
.annotate 'line', 5539
self.'optimize_condition'()
.annotate 'line', 5540
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5541
.return(self)
# }
.annotate 'line', 5542

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5543
# Body
# {
.annotate 'line', 5545
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5547
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5550
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5553
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5554
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5556
self.'annotate'(__ARG_1)
.annotate 'line', 5557
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5558
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5559
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5560
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5561
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5563

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5529
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

.annotate 'line', 5572
# Body
# {
.annotate 'line', 5574
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5575
self.'parsebody'(__ARG_2)
.annotate 'line', 5576
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5577
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5578

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5579
# Body
# {
.annotate 'line', 5581
self.'optimize_condition'()
.annotate 'line', 5582
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5583
.return(self)
# }
.annotate 'line', 5584

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5585
# Body
# {
.annotate 'line', 5587
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5589
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5592
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5593
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5594
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5596
self.'annotate'(__ARG_1)
.annotate 'line', 5597
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5599
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5600
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5601
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5603

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5570
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

.annotate 'line', 5612
# Body
# {
.annotate 'line', 5614
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5615
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5616

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5617
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5618
# Body
# {
.annotate 'line', 5620
self.'annotate'(__ARG_1)
.annotate 'line', 5621
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5622
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5623

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5610
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5632
# Body
# {
.annotate 'line', 5634
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5635
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5636

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5637
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5638
# Body
# {
.annotate 'line', 5640
self.'annotate'(__ARG_1)
.annotate 'line', 5641
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5642
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5643

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5630
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5657
# Body
# {
.annotate 'line', 5659
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5660
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5661
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5662
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5663
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5664
$P1 = __ARG_2.'get'()
.annotate 'line', 5665
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5666
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5667
$P1 = __ARG_2.'get'()
.annotate 'line', 5668
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5669
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5670
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5671
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5672
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5673
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5674
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5675
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5676
$P1 = __ARG_2.'get'()
.annotate 'line', 5677
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5678
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5679
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5680
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
.annotate 'line', 5681
__ARG_2.'unget'($P1)
.annotate 'line', 5682
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5684
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5685
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5688
$P1 = __ARG_2.'get'()
.annotate 'line', 5689
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5690
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5691
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
.annotate 'line', 5692
__ARG_2.'unget'($P1)
.annotate 'line', 5693
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5695
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5698

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5699
# Body
# {
.annotate 'line', 5701
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5702
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5703
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5704
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5705
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5706
.return(self)
# }
.annotate 'line', 5707

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5708
# Body
# {
.annotate 'line', 5711
# string type: $S1
set $S1, ''
.annotate 'line', 5712
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5713
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5714
ne $S2, 'N', __label_3
.annotate 'line', 5715
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5716
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5718
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5719
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5722
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5723
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
ne $S9, $S1, __label_8
.annotate 'line', 5724
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5726
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5727
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5731
self.'genbreaklabel'()
.annotate 'line', 5732
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5733
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5734
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5735
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5736
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5737
$P2.'push'($S7)
.annotate 'line', 5738
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5739
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5741
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5744
__ARG_1.'comment'('switch')
.annotate 'line', 5745
self.'annotate'(__ARG_1)
.annotate 'line', 5746
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5747
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5748
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5749
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5750
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5751
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5752
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5753
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5748
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5756
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5757
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5758
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5760
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5761

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5650
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5652
addattribute $P0, 'condition'
.annotate 'line', 5653
addattribute $P0, 'case_value'
.annotate 'line', 5654
addattribute $P0, 'case_st'
.annotate 'line', 5655
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5773
# Body
# {
.annotate 'line', 5775
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5776
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5777
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5778
__ARG_2.'unget'($P1)
.annotate 'line', 5779
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5781
$P1 = __ARG_2.'get'()
.annotate 'line', 5782
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5783
__ARG_2.'unget'($P1)
.annotate 'line', 5784
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5785
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5787
$P1 = __ARG_2.'get'()
.annotate 'line', 5788
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5789
__ARG_2.'unget'($P1)
.annotate 'line', 5790
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5791
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5793
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5794

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5795
# Body
# {
.annotate 'line', 5797
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5798
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5799
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5800
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5801
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5802
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5803
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5804
.return(self)
# }
.annotate 'line', 5805

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5806
# Body
# {
.annotate 'line', 5808
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5809
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5810
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5811
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5812
.return()
# }
__label_0: # endif
.annotate 'line', 5814
__ARG_1.'comment'('for loop')
.annotate 'line', 5815
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5816
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5817
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5818
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5819
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5821
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5822
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5823
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5825
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5826
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5827
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5828
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5829
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5831
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5832

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5768
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5770
addattribute $P0, 'initializer'
.annotate 'line', 5771
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5844
# Body
# {
.annotate 'line', 5846
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5847
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5848
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5849
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5850
eq $S2, '', __label_2
# {
.annotate 'line', 5851
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5853
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5855
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5856
setattribute self, 'varname', $P1
.annotate 'line', 5857
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5858
$P2 = __ARG_2.'get'()
.annotate 'line', 5859
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5860
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5861
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5862

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5863
# Body
# {
.annotate 'line', 5865
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5866
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5867
.return(self)
# }
.annotate 'line', 5868

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5869
# Body
# {
.annotate 'line', 5871
self.'annotate'(__ARG_1)
.annotate 'line', 5872
# string regcont: $S1
null $S1
.annotate 'line', 5873
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 5874
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5875
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5876
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5879
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5880
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5881
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5882
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5883
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5884
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5885
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5886
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5887
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5888
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5889
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5890
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5891
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5892

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5839
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5841
addattribute $P0, 'varname'
.annotate 'line', 5842
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5897
# Body
# {
.annotate 'line', 5899
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5900
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5901
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5902
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5903
__ARG_2.'unget'($P3)
.annotate 'line', 5904
__ARG_2.'unget'($P2)
.annotate 'line', 5905
__ARG_2.'unget'($P1)
.annotate 'line', 5906
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5907
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5909
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5910

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5920
# Body
# {
.annotate 'line', 5922
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5923
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5924

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5925
# Body
# {
.annotate 'line', 5927
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5928
.return(self)
# }
.annotate 'line', 5929

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5930
# Body
# {
.annotate 'line', 5932
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5933
self.'annotate'(__ARG_1)
.annotate 'line', 5934
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5935

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5916
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5918
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5949
# Body
# {
.annotate 'line', 5951
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5952
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5953
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5954
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5957
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5959
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5960
$P1 = __ARG_2.'get'()
.annotate 'line', 5961
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5962
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5963
$P1 = __ARG_2.'get'()
.annotate 'line', 5964
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5965
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5966
$P1 = __ARG_2.'get'()
.annotate 'line', 5967
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5968
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5969
setattribute self, 'exname', $P1
.annotate 'line', 5970
self.'createvar'($S1, 'P')
.annotate 'line', 5971
$P1 = __ARG_2.'get'()
.annotate 'line', 5972
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5973
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5975
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5976

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5977
# Body
# {
.annotate 'line', 5979
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 5980
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5981
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5982
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 5983
.return(self)
# }
.annotate 'line', 5984

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5985
# Body
# {
.annotate 'line', 5987
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5988
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5989
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5990
# string exreg: $S4
null $S4
.annotate 'line', 5991
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 5992
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5993
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5996
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5998
self.'annotate'(__ARG_1)
.annotate 'line', 5999
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6001
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6002
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6004
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6005
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6006
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6007
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 6008
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6009
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6012
eq $I1, 1, __label_14
.annotate 'line', 6013
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6014
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6015
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6016
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6019
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6020
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6021
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6022
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
__label_16: # for iteration
.annotate 'line', 6020
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6024
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6025
# string sep: $S7
set $S7, ''
.annotate 'line', 6026
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6027
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6028
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6030
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6033
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6038
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6039
__ARG_1.'comment'('try: begin')
.annotate 'line', 6040
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6041
__ARG_1.'comment'('try: end')
.annotate 'line', 6043
self.'annotate'(__ARG_1)
.annotate 'line', 6044
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6046
__ARG_1.'comment'('catch')
.annotate 'line', 6047
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6048
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6049
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6050
__ARG_1.'say'('pop_eh')
.annotate 'line', 6051
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 6053
__ARG_1.'comment'('catch end')
.annotate 'line', 6054
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6055

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5942
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5944
addattribute $P0, 'stry'
.annotate 'line', 5945
addattribute $P0, 'modifiers'
.annotate 'line', 5946
addattribute $P0, 'exname'
.annotate 'line', 5947
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6066
# Body
# {
.annotate 'line', 6068
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6069
setattribute self, 'name', __ARG_3
.annotate 'line', 6070
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 6071
setattribute self, 'reg', $P2
# }
.annotate 'line', 6072

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6062
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6064
addattribute $P0, 'name'
.annotate 'line', 6065
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6089
# Body
# {
.annotate 'line', 6091
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6092
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6093
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6094
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6095
setattribute self, 'name', $P1
.annotate 'line', 6096
# string reg: $S1
null $S1
.annotate 'line', 6098
$P1 = __ARG_2.'get'()
.annotate 'line', 6099
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 6101
setattribute self, 'typearray', $P5
.annotate 'line', 6102
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 6103
$P1 = __ARG_2.'get'()
.annotate 'line', 6104
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 6106
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6109
__ARG_2.'unget'($P1)
.annotate 'line', 6110
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 6111
$P1 = __ARG_2.'get'()
.annotate 'line', 6112
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 6113
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6114
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 6119
setattribute self, 'typearray', $P8
.annotate 'line', 6120
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 6121
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 6123
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 6124
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6128
setattribute self, 'reg', $P11
.annotate 'line', 6129
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6131
$P1 = __ARG_2.'get'()
.annotate 'line', 6132
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 6133
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6134
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 6135
$P1 = __ARG_2.'get'()
.annotate 'line', 6136
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 6137
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6138
# {
.annotate 'line', 6139
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6140
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 6141
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 6142
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 6143
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6145
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6147
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6148

.end # parse


.sub 'optimize' :method

.annotate 'line', 6149
# Body
# {
.annotate 'line', 6151
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6152
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6153
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6154
if_null $P1, __label_1
# {
.annotate 'line', 6155
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6156
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6158
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6160
.return(self)
# }
.annotate 'line', 6161

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6162
# Body
# {
.annotate 'line', 6164
self.'annotate'(__ARG_1)
.annotate 'line', 6165
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6166
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6167
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6168
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6169
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6170
__ARG_1.'comment'($S10)
.annotate 'line', 6172
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6173
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6174
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6176
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6177
ne $S5, $S4, __label_10
# {
.annotate 'line', 6178
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6181
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_12
# {
.annotate 'line', 6183
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 6186
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 6187
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6188
iseq $I4, $S4, 'S'
unless $I4 goto __label_17
iseq $I4, $S5, 'P'
__label_17:
unless $I4 goto __label_15
# {
.annotate 'line', 6189
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 6190
__ARG_1.'emitnull'($S3)
.annotate 'line', 6191
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6192
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6193
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 6196
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
.annotate 'line', 6202
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6203
if_null $P2, __label_19
# {
.annotate 'line', 6205
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 6206
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 6210
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 6212
if_null $P1, __label_22
# {
.annotate 'line', 6213
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 6214
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6215
unless_null $P2, __label_24
# {
.annotate 'line', 6216
le $I1, 0, __label_25
# {
.annotate 'line', 6218
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6221
# int i: $I2
null $I2
.annotate 'line', 6222
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6223
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6224
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6225
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6229

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6230
# Body
# {
.annotate 'line', 6232
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6233

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6079
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6081
addattribute $P0, 'name'
.annotate 'line', 6082
addattribute $P0, 't_reg'
.annotate 'line', 6083
addattribute $P0, 't_name'
.annotate 'line', 6084
addattribute $P0, 't_array'
.annotate 'line', 6085
addattribute $P0, 'reg'
.annotate 'line', 6086
addattribute $P0, 'typearray'
.annotate 'line', 6087
addattribute $P0, 'size'
.annotate 'line', 6088
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6236
# Body
# {
.annotate 'line', 6238
# var next: $P1
null $P1
.annotate 'line', 6239
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6240
# {
.annotate 'line', 6241
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6242
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6243
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6244
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6245
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6246
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6247
.return($P2)
# }
.annotate 'line', 6248

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6260
# Body
# {
.annotate 'line', 6263
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6264
setattribute self, 'type', $P1
.annotate 'line', 6265
setattribute self, 'name', __ARG_4
.annotate 'line', 6266
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6267

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6268
# Body
# {
.annotate 'line', 6270
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6271
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6272
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6273
$P1 = $P1.'optimize'()
.annotate 'line', 6274
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6276
getattribute $P4, self, 'start'
.annotate 'line', 6275
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6278
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6279
setattribute self, 'value', $P1
.annotate 'line', 6280
.return(self)
# }
.annotate 'line', 6281

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 6282
# Body
# {
.annotate 'line', 6284
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6285

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6286
# Body
# {
.annotate 'line', 6288
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6289
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6290

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6254
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6256
addattribute $P0, 'type'
.annotate 'line', 6257
addattribute $P0, 'name'
.annotate 'line', 6258
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6293
# Body
# {
.annotate 'line', 6295
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6296
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6297
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6298
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6300
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6301
# {
.annotate 'line', 6302
$P1 = __ARG_2.'get'()
.annotate 'line', 6303
# var name: $P3
set $P3, $P1
.annotate 'line', 6304
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6305
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6307
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6306
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6308
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6309
.return($P2)
# }
.annotate 'line', 6310

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6319
# Body
# {
.annotate 'line', 6321
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6322
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6323
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6324
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6325
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6327
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6328
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6329

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6330
# Body
# {
.annotate 'line', 6332
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6333
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6334
.return(self)
# }
.annotate 'line', 6335

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6336
# Body
# {
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
self.'annotate'(__ARG_1)
.annotate 'line', 6343
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6344
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6345
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6346
__ARG_1.'comment'($S5)
.annotate 'line', 6347
if_null $P1, __label_2
.annotate 'line', 6348
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6350
if_null $P1, __label_4
# {
.annotate 'line', 6351
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6352
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
.annotate 'line', 6354
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6359
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6360
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6361
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6364
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6368
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6369

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6316
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6318
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6374
# Body
# {
.annotate 'line', 6376
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6377
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6378
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6379
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6380

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6381
# Body
# {
.annotate 'line', 6383
self.'annotate'(__ARG_1)
.annotate 'line', 6384
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6385
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6386
__ARG_1.'comment'($S3)
.annotate 'line', 6387
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6388

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6372
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6395
# Body
# {
.annotate 'line', 6397
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6398
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6399
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6400
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6401
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6402
$P1 = __ARG_2.'get'()
.annotate 'line', 6403
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6404
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6405

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6406
# Body
# {
.annotate 'line', 6408
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6409
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6410

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6411
# Body
# {
.annotate 'line', 6413
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6414
self.'annotate'(__ARG_1)
.annotate 'line', 6415
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6416
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6417
__ARG_1.'comment'($S4)
.annotate 'line', 6418
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6419

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6391
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6393
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6422
# Body
# {
.annotate 'line', 6424
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6425
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6426
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6427
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6428
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6429
$P2 = __ARG_2.'get'()
.annotate 'line', 6430
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6431
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6433
__ARG_2.'unget'($P2)
.annotate 'line', 6434
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
.annotate 'line', 6438
__ARG_2.'unget'($P2)
.annotate 'line', 6439
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6441

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6449
# Body
# {
box $P1, 'S'
.annotate 'line', 6451
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6452
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6453
setattribute self, 't_array', $P2
.annotate 'line', 6454
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6455

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6456
# Body
# {
.annotate 'line', 6458
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6459

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6447
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6462
# Body
# {
.annotate 'line', 6464
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6465

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6467
# Body
# {
.annotate 'line', 6469
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6470
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6471

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6479
# Body
# {
box $P1, 'I'
.annotate 'line', 6481
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6482
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6483
setattribute self, 't_array', $P2
.annotate 'line', 6484
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6485

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6486
# Body
# {
.annotate 'line', 6488
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6489

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6477
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6492
# Body
# {
.annotate 'line', 6494
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6495

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6497
# Body
# {
.annotate 'line', 6499
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6500
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6501

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6509
# Body
# {
box $P1, 'N'
.annotate 'line', 6511
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6513
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6514
setattribute self, 't_array', $P2
.annotate 'line', 6515
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6516

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6517
# Body
# {
.annotate 'line', 6519
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6520

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6507
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6523
# Body
# {
.annotate 'line', 6525
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6526

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6528
# Body
# {
.annotate 'line', 6530
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6531
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6532

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6545
# Body
# {
.annotate 'line', 6547
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6548
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6549
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6550
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6551
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6552
__ARG_2.'unget'($P1)
.annotate 'line', 6553
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6554
unless_null $P2, __label_2
.annotate 'line', 6555
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6556
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6558
setattribute self, 'end', $P1
# }
.annotate 'line', 6559

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6560
# Body
# {
.annotate 'line', 6562
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6563
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6564
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6565
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6566
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6567
.return($S2)
# }
.annotate 'line', 6568

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6569
# Body
# {
.annotate 'line', 6571
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6572
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6573
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6574
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6575
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6576
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6577
$P1[$S1] = $S3
.annotate 'line', 6578
.return($S3)
# }
.annotate 'line', 6579

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6580
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6581
# Body
# {
.annotate 'line', 6583
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6584
.return(self)
# }
.annotate 'line', 6585

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6586
# Body
# {
.annotate 'line', 6588
__ARG_1.'comment'('{')
.annotate 'line', 6589
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6590
$P1.'emit'(__ARG_1)
.annotate 'line', 6591
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6593
__ARG_1.'comment'('}')
# }
.annotate 'line', 6594

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6538
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6540
addattribute $P0, 'statements'
.annotate 'line', 6541
addattribute $P0, 'end'
.annotate 'line', 6542
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6607
# Body
# {
box $P3, 1
.annotate 'line', 6610
setattribute self, 'nreg', $P3
.annotate 'line', 6611
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6612
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6613
setattribute self, 'tempreg', $P1
.annotate 'line', 6614
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6615

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6616
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6618
setattribute self, 'type', $P1
.annotate 'line', 6619
.return(self)
# }
.annotate 'line', 6620

.end # settype


.sub 'createreg' :method

.annotate 'line', 6621
# Body
# {
.annotate 'line', 6623
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6624
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6625
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6627
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6629
.return($S1)
# }
.annotate 'line', 6630

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6631
# Body
# {
.annotate 'line', 6633
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6634
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6635
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6636
# string reg: $S1
null $S1
.annotate 'line', 6637
le $I1, 0, __label_0
.annotate 'line', 6638
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6640
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6641
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6643
.return($S1)
# }
.annotate 'line', 6644

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6645
# Body
# {
.annotate 'line', 6647
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6648
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6649
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6650
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6651

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6603
addattribute $P0, 'type'
.annotate 'line', 6604
addattribute $P0, 'nreg'
.annotate 'line', 6605
addattribute $P0, 'tempreg'
.annotate 'line', 6606
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6676
# Body
# {
.annotate 'line', 6678
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6679
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6680
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6681
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6682
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6683

.end # init


.sub 'getouter' :method

.annotate 'line', 6685
# Body
# {
.return(self)
# }

.end # getouter


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6686
# Body
# {
.annotate 'line', 6688
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6689
.return($I1)
# }
.annotate 'line', 6690

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6691
# Body
# {
.annotate 'line', 6693
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6694
unless_null $P1, __label_0
# {
.annotate 'line', 6695
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6696
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6698
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6699

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6700
# Body
# {
.annotate 'line', 6702
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6703
unless_null $P1, __label_0
# {
.annotate 'line', 6704
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6705
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6707
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6708

.end # setusedlex


.sub 'createlex' :method
.param string __ARG_1

.annotate 'line', 6709
# Body
# {
.annotate 'line', 6711
# string lexname: $S1
# predefined substr
substr $S2, __ARG_1, 1
concat $S0, '__WLEX_', $S2
set $S1, $S0
.annotate 'line', 6712
self.'setlex'($S1, __ARG_1)
.annotate 'line', 6713
.return($S1)
# }
.annotate 'line', 6714

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6716
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6717
# Body
# {
.annotate 'line', 6719
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6720
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
.annotate 'line', 6722
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6724
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6726
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6728
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6730
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6732
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6733
.return($S1)
# }
.annotate 'line', 6734

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6735
# Body
# {
.annotate 'line', 6737
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6738
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
.annotate 'line', 6740
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6742
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6744
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6746
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6748
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6750
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6751
.return($S1)
# }
.annotate 'line', 6752

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6753
# Body
# {
.annotate 'line', 6755
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
.annotate 'line', 6756
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6757

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6758
# Body
# {
.annotate 'line', 6760
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6761
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6762
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6764
.return($S1)
# }
.annotate 'line', 6765

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6766
# Body
# {
.annotate 'line', 6768
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6769
unless_null $P1, __label_0
.annotate 'line', 6770
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6772
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6773

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6775
# Body
# {
.annotate 'line', 6777
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6778
.return(self)
# }
.annotate 'line', 6779

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6781
# Body
# {
.annotate 'line', 6783
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6784
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6785
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6786
__ARG_1.'unget'($P1)
.annotate 'line', 6787
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6788
# {
.annotate 'line', 6789
$P1 = __ARG_1.'get'()
.annotate 'line', 6790
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6791
eq $S1, '', __label_5
.annotate 'line', 6792
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6795
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S0, '__ARG_', $S4
set $S2, $S0
.annotate 'line', 6796
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6798
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6799
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6800
$P2['name'] = $S3
.annotate 'line', 6801
$P1 = __ARG_1.'get'()
.annotate 'line', 6802
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6803
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6804
$P2['modifiers'] = $P3
.annotate 'line', 6805
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6807
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6808
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6809
$P9 = $P1.'isop'(')')
isfalse $I2, $P9
unless $I2 goto __label_9
.annotate 'line', 6810
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6812

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6814
# Body
# {
.annotate 'line', 6816
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6817
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6818
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6819
setattribute self, 'isanon', $P3
.annotate 'line', 6820
$P1 = __ARG_2.'get'()
.annotate 'line', 6821
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6822
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6823
setattribute self, 'modifiers', $P2
.annotate 'line', 6824
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6826
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6827
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6828
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6830
$P1 = __ARG_2.'get'()
.annotate 'line', 6831
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6832
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6833
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6834
.return(self)
# }
.annotate 'line', 6835

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6836
# Body
# {
.annotate 'line', 6838
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6839
__ARG_1.'say'()
.annotate 'line', 6840
__ARG_1.'print'(".sub ")
.annotate 'line', 6841
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6842
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6844
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6845
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 6846
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6847
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 6848
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6849
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6850
if_null $P2, __label_5
.annotate 'line', 6851
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6855
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6856
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6857
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6858
if_null $P3, __label_7
# {
.annotate 'line', 6859
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6860
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6861
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6862
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6863
le $I1, 0, __label_11
# {
.annotate 'line', 6864
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6865
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 6866
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6867
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 6868
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6869
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 6865
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 6871
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
.annotate 'line', 6876
ne $S1, 'main', __label_16
.annotate 'line', 6877
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6879
__ARG_1.'say'()
.annotate 'line', 6881
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6882
# var arg: $P8
null $P8
.annotate 'line', 6883
# string argname: $S2
null $S2
.annotate 'line', 6884
# var a: $P9
null $P9
.annotate 'line', 6886
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 6887
$S2 = $P8['name']
.annotate 'line', 6888
$P9 = self.'getvar'($S2)
.annotate 'line', 6889
# string ptype: $S3
$P27 = $P9['type']
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
$P27 = $P9['reg']
.annotate 'line', 6890
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 6891
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 6892
if_null $P10, __label_20
# {
.annotate 'line', 6893
# var named: $P11
null $P11
.annotate 'line', 6894
# var slurpy: $P12
null $P12
.annotate 'line', 6895
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 6896
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 6897
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 6898
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
.annotate 'line', 6906
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 6909
isnull $I6, $P11
not $I6
unless $I6 goto __label_30
isnull $I6, $P12
not $I6
__label_30:
unless $I6 goto __label_28
# {
.annotate 'line', 6914
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 6917
if_null $P11, __label_31
# {
.annotate 'line', 6918
# string setname: $S5
null $S5
.annotate 'line', 6919
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 6920
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
.annotate 'line', 6925
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 6926
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 6927
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 6928
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 6931
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 6933
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 6935
if_null $P12, __label_38
# {
.annotate 'line', 6936
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 6940
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 6942
__ARG_1.'say'()
.annotate 'line', 6943
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 6946
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 6947
if_null $P16, __label_39
# {
.annotate 'line', 6949
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 6950
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 6953
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 6954
if_null $P16, __label_42
# {
.annotate 'line', 6956
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 6957
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 6960
__ARG_1.'comment'('Body')
.annotate 'line', 6961
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 6963
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 6964
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6967
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 6968
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 6970
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I7, $P17
ge $I4, $I7, __label_47
# {
.annotate 'line', 6971
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 6972
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 6970
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 6975

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6976
# Body
# {
.annotate 'line', 6978
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6979

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6980
# Body
# {
.annotate 'line', 6982
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6983

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6658
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6660
addattribute $P0, 'name'
.annotate 'line', 6661
addattribute $P0, 'subid'
.annotate 'line', 6662
addattribute $P0, 'isanon'
.annotate 'line', 6663
addattribute $P0, 'modifiers'
.annotate 'line', 6664
addattribute $P0, 'args'
.annotate 'line', 6665
addattribute $P0, 'body'
.annotate 'line', 6666
addattribute $P0, 'regstI'
.annotate 'line', 6667
addattribute $P0, 'regstN'
.annotate 'line', 6668
addattribute $P0, 'regstS'
.annotate 'line', 6669
addattribute $P0, 'regstP'
.annotate 'line', 6670
addattribute $P0, 'nlabel'
.annotate 'line', 6671
addattribute $P0, 'localfun'
.annotate 'line', 6672
addattribute $P0, 'lexicals'
.annotate 'line', 6673
addattribute $P0, 'usedlexicals'
.annotate 'line', 6674
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6992
# Body
# {
.annotate 'line', 6994
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6995
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 6996
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6997
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 6998
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 6999
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 7000
setattribute self, 'isanon', $P6
.annotate 'line', 7001
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7002
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7003
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 7004
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 7005
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 7006
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7007

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 7008
# Body
# {
.annotate 'line', 7010
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7011

.end # getsubid


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7012
# Body
# {
.annotate 'line', 7014
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7015
unless_null $P1, __label_0
# {
.annotate 'line', 7018
getattribute $P8, self, 'owner'
$P1 = $P8.'getvar'(__ARG_1)
.annotate 'line', 7019
unless_null $P1, __label_1
# {
.annotate 'line', 7021
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7022
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7023
getattribute $P9, self, 'outer'
$P8 = $P9.'ismethod'()
if_null $P8, __label_4
unless $P8 goto __label_4
# {
.annotate 'line', 7024
# string lexself: $S1
$P10 = $P2.'makelexicalself'()
null $S1
if_null $P10, __label_5
set $S1, $P10
__label_5:
.annotate 'line', 7025
# var r2: $P3
$P3 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7026
# string reg: $S2
set $P9, $P3
null $S2
if_null $P9, __label_6
set $S2, $P9
__label_6:
.annotate 'line', 7027
self.'setusedlex'($S1, $S2)
set $P1, $P3
.annotate 'line', 7028
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7032
$P10 = $P1['type']
$S5 = $P10
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P11 = $P1['const']
isfalse $I1, $P11
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 7033
# var scope: $P4
$P4 = $P1['scope']
.annotate 'line', 7034
# var ownerscope: $P5
$P5 = $P4.'getouter'()
.annotate 'line', 7035
# var outer: $P6
getattribute $P6, self, 'outer'
.annotate 'line', 7036
isa $I1, $P5, 'FunctionStatement'
unless $I1 goto __label_9
# {
.annotate 'line', 7037
$P11 = $P5.'same_scope_as'($P6)
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 7038
# string lexname: $S3
$P12 = $P4.'makelexical'($P1)
null $S3
if_null $P12, __label_11
set $S3, $P12
__label_11:
.annotate 'line', 7039
# var r2: $P7
$P7 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7040
# string reg: $S4
set $P12, $P7
null $S4
if_null $P12, __label_12
set $S4, $P12
__label_12:
.annotate 'line', 7041
self.'setusedlex'($S3, $S4)
set $P1, $P7
.annotate 'line', 7042
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 7047
.return($P1)
# }
.annotate 'line', 7048

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6990
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 7057
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7055
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

.annotate 'line', 7074
# Body
# {
.annotate 'line', 7076
setattribute self, 'owner', __ARG_1
.annotate 'line', 7077
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7078

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7079
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7081
# Body
# {
.annotate 'line', 7083
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7084

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7072
addattribute $P0, 'owner'
.annotate 'line', 7073
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7090
# Body
# {
.annotate 'line', 7092
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7093
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7094

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7095
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7097
# Body
# {
.annotate 'line', 7099
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7100
__ARG_1.'print'($S1)
# }
.annotate 'line', 7101

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7087
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7089
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7108
# Body
# {
.annotate 'line', 7110
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7111
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 7112
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7113
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7114
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7115
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7116
$P2 = __ARG_1.'get'()
.annotate 'line', 7117
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 7118
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
.annotate 'line', 7120
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7124
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7126
# {
.annotate 'line', 7127
$P2 = __ARG_1.'get'()
.annotate 'line', 7128
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7129
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7130
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7131
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7132
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 7133
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7135
setattribute self, 'key', $P1
# }
.annotate 'line', 7136

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7137
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7138
# Body
# {
.annotate 'line', 7140
getattribute $P1, self, 'hll'
isnull $I2, $P1
not $I2
# predefined int
$I1 = $I2
.return($I1)
# }
.annotate 'line', 7141

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7143
# Body
# {
.annotate 'line', 7145
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7146

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7104
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7106
addattribute $P0, 'key'
.annotate 'line', 7107
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7152
# Body
# {
.annotate 'line', 7154
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7155
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 7156
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7157
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7158
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 7159
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7161
__ARG_1.'unget'($P2)
.annotate 'line', 7162
setattribute self, 'key', $P1
# }
.annotate 'line', 7163

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7164
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7166
# Body
# {
.annotate 'line', 7168
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7169
.return($P2)
# }
.annotate 'line', 7170

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7172
# Body
# {
.annotate 'line', 7174
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7175
unless_null $P1, __label_0
# {
.annotate 'line', 7176
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7177
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7179
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7180

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7149
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7151
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7183
# Body
# {
.annotate 'line', 7185
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7186
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7187
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7188
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7189
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7190
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7191
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7192
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7193

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7210
# Body
# {
.annotate 'line', 7212
setattribute self, 'parent', __ARG_2
.annotate 'line', 7213
setattribute self, 'owner', __ARG_2
.annotate 'line', 7214
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7215
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7216
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7217
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7219
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7220
setattribute self, 'name', $P1
.annotate 'line', 7221
$P1 = __ARG_1.'get'()
.annotate 'line', 7222
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7223
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7224
# {
.annotate 'line', 7225
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7226
$P2.'push'($P3)
.annotate 'line', 7227
$P1 = __ARG_1.'get'()
.annotate 'line', 7228
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
.annotate 'line', 7231
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7232
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7233
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7234
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7235
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7236
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 7237
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7238
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7240
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7241
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7242
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7243
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7244
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7245
$P1 = __ARG_1.'get'()
.annotate 'line', 7246
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 7247
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7249
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7250
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7251
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7252
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7255
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7256
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7258
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 7259
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7260
setattribute self, 'classns', $P9
# }
.annotate 'line', 7261

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 7262
# Body
# {
.annotate 'line', 7264
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7265

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7266
# Body
# {
.annotate 'line', 7268
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7269

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7270
# Body
# {
.annotate 'line', 7272
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7273

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7274
# Body
# {
.annotate 'line', 7276
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7277

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7278
# Body
# {
.annotate 'line', 7280
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7281
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7282
.return(self)
# }
.annotate 'line', 7283

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7284
# Body
# {
.annotate 'line', 7286
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7287

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7288
# Body
# {
.annotate 'line', 7290
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7291
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7292
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7293
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7295
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7297
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7298
# int n: $I1
set $I1, 1
.annotate 'line', 7299
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7300
$P3.'annotate'(__ARG_1)
.annotate 'line', 7301
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7302
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7303
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7304
__ARG_1.'say'()
.annotate 'line', 7305
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7307
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7308
__ARG_1.'annotate'($P4)
.annotate 'line', 7309
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7312
__ARG_1.'say'('.end')
# }
.annotate 'line', 7313

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7199
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7201
addattribute $P0, 'parent'
.annotate 'line', 7202
addattribute $P0, 'owner'
.annotate 'line', 7203
addattribute $P0, 'name'
.annotate 'line', 7204
addattribute $P0, 'bases'
.annotate 'line', 7205
addattribute $P0, 'constants'
.annotate 'line', 7206
addattribute $P0, 'functions'
.annotate 'line', 7207
addattribute $P0, 'members'
.annotate 'line', 7208
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7320
# Body
# {
.annotate 'line', 7322
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7323
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7324
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7325
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7326
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7327
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7332
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7333
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7334
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7335
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7336
# string filepath: $S3
concat $S0, $S2, $S1
set $S3, $S0
.annotate 'line', 7337
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7338
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7339
# }
# try: end
goto __label_5
.annotate 'line', 7337
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
.annotate 'line', 7344
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7345
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7350
load_bytecode 'PGE.pbc'
.annotate 'line', 7351
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7352
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7354
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
.annotate 'line', 7355
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7356
$P8 = $P7($S4)
.annotate 'line', 7357
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7358
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7359
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7360
# int ivalue: $I1
null $I1
.annotate 'line', 7361
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7362
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7367
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7366
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7365
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7354
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7371
$P5.'close'()
# }
.annotate 'line', 7372

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7384
# Body
# {
.annotate 'line', 7386
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7387
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7388
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7389
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7390

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7391
# Body
# {
.annotate 'line', 7393
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7394
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7395
getattribute $P4, $P2, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7396
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7397
.return($P4)
# }
.annotate 'line', 7398

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7399
# Body
# {
# predefined elements
.annotate 'line', 7403
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7405
.return($P5)
__label_3: # case
.annotate 'line', 7408
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7413
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7414
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7415
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7416
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7417
getattribute $P9, $P3, 'name'
$S2 = $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7419
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7420
if_null $P4, __label_8
.annotate 'line', 7421
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7425
.return($P5)
# }
.annotate 'line', 7426

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7427
# Body
# {
.annotate 'line', 7429
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7430
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7431
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7433
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7435
# var start: $P2
set $P2, $P1
.annotate 'line', 7436
$P1 = __ARG_1.'get'()
.annotate 'line', 7437
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7438
$P1 = __ARG_1.'get'()
.annotate 'line', 7440
# var modifier: $P3
null $P3
.annotate 'line', 7441
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7442
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7443
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7446
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7447
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7448
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7449
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7450
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7451
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7453
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7454
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7455
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7457
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7458
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7459
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7460
$P7.'push'($P6)
.annotate 'line', 7461
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7463
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7464
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7465
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7466
$P9.'push'($P8)
.annotate 'line', 7467
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7469
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7470
$P1 = __ARG_1.'get'()
.annotate 'line', 7471
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7472
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7473
$P1 = __ARG_1.'get'()
.annotate 'line', 7474
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7475
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7476
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7477
self.'addlib'($S2)
.annotate 'line', 7478
$P1 = __ARG_1.'get'()
.annotate 'line', 7479
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7481
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7482
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7484
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7485
$P1 = __ARG_1.'get'()
.annotate 'line', 7486
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7487
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7488
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7489
self.'addload'($S3)
.annotate 'line', 7490
$P1 = __ARG_1.'get'()
.annotate 'line', 7491
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7493
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7494
self.'close_ns'($P1)
.annotate 'line', 7495
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7498
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
.annotate 'line', 7500
self.'unclosed_ns'()
# }
.annotate 'line', 7501

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7502
# Body
# {
.annotate 'line', 7504
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7505

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7506
# Body
# {
.annotate 'line', 7508
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7509
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7511
# int activate: $I1
set $I1, 1
.annotate 'line', 7512
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7513
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7514
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7517
unless $I1 goto __label_6
# {
.annotate 'line', 7518
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7519
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7521
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7523

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7376
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7378
addattribute $P0, 'namespaces'
.annotate 'line', 7379
addattribute $P0, 'classes'
.annotate 'line', 7380
addattribute $P0, 'functions'
.annotate 'line', 7381
addattribute $P0, 'items'
.annotate 'line', 7382
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7538
# Body
# {
.annotate 'line', 7541
setattribute self, 'parent', __ARG_1
.annotate 'line', 7542
setattribute self, 'start', __ARG_2
.annotate 'line', 7543
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7544
setattribute self, 'name', $P2
.annotate 'line', 7545
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7546
if_null __ARG_4, __label_0
# {
.annotate 'line', 7547
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7548
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7550

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7551
# Body
# {
.annotate 'line', 7553
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7554

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7555
# Body
# {
.annotate 'line', 7557
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7558

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7559
# Body
# {
.annotate 'line', 7561
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7562
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7563
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7564
.return($P1)
# }
.annotate 'line', 7565

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7566
# Body
# {
.annotate 'line', 7568
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7569

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7570
# Body
# {
.annotate 'line', 7572
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7573

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7574
# Body
# {
.annotate 'line', 7576
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7577
unless_null $P1, __label_0
.annotate 'line', 7578
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7580
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7581

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7582
# Body
# {
.annotate 'line', 7586
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7587
unless_null $P1, __label_0
.annotate 'line', 7588
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7589
.return($P1)
# }
.annotate 'line', 7590

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7591
# Body
# {
.annotate 'line', 7593
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7594

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7595
# Body
# {
# }
.annotate 'line', 7598

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7599
# Body
# {
.annotate 'line', 7601
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7602
if_null $P1, __label_0
# {
.annotate 'line', 7603
$P1 = $P1.'optimize'()
.annotate 'line', 7604
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7606
self.'optimize_base'()
.annotate 'line', 7607
.return(self)
# }
.annotate 'line', 7608

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7609
# Body
# {
.annotate 'line', 7611
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7612
if_null $P1, __label_0
.annotate 'line', 7613
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7615
self.'emit_base'(__ARG_1)
.annotate 'line', 7617
if_null $P1, __label_1
.annotate 'line', 7618
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7619

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7530
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7532
addattribute $P0, 'parent'
.annotate 'line', 7533
addattribute $P0, 'start'
.annotate 'line', 7534
addattribute $P0, 'name'
.annotate 'line', 7535
addattribute $P0, 'modifier'
.annotate 'line', 7536
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7633
# Body
# {
.annotate 'line', 7635
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7636
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7637

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7638
# Body
# {
.annotate 'line', 7640
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7641
$P1[__ARG_1] = 1
# }
.annotate 'line', 7642

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7643
# Body
# {
.annotate 'line', 7645
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7646
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7647

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7649
# Body
# {
.annotate 'line', 7651
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7652
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7653
inc $I1
assign $P1, $I1
.annotate 'line', 7655
# string id: $S1
# predefined string
$S2 = $I1
concat $S0, 'WSubId_', $S2
set $S1, $S0
.annotate 'line', 7656
.return($S1)
# }
.annotate 'line', 7657

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7659
# Body
# {
.annotate 'line', 7661
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7662
unless_null $P1, __label_0
# {
.annotate 'line', 7663
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7664
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7666
$P1[__ARG_1] = 1
# }
.annotate 'line', 7667

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7668
# Body
# {
.annotate 'line', 7670
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7671
unless_null $P1, __label_0
# {
.annotate 'line', 7672
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7673
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7675
$P1[__ARG_1] = 1
# }
.annotate 'line', 7676

.end # addload


.sub 'getpath' :method

.annotate 'line', 7677
# Body
# {
.annotate 'line', 7679
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7680
.return($P1)
# }
.annotate 'line', 7681

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7682
# Body
# {
.annotate 'line', 7684
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7685

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7686
# Body
# {
.annotate 'line', 7689
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7690

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7691
# Body
# {
# }
.annotate 'line', 7694

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7695
# Body
# {
.annotate 'line', 7697
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7698

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7699
# Body
# {
.annotate 'line', 7701
self.'optimize_base'()
.annotate 'line', 7702
.return(self)
# }
.annotate 'line', 7703

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7704
# Body
# {
.annotate 'line', 7706
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7709
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7710
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7713
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
.annotate 'line', 7716
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7717
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7718
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7719
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7722
# int somelib: $I1
null $I1
.annotate 'line', 7723
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7724
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7726
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7727
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7730
# int someload: $I2
null $I2
.annotate 'line', 7731
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7732
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7734
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7735
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7736
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7737
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7739
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7740
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7742
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7743

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7626
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7628
addattribute $P0, 'predefs_used'
.annotate 'line', 7629
addattribute $P0, 'libs'
.annotate 'line', 7630
addattribute $P0, 'loads'
.annotate 'line', 7631
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7755
# Body
# {
.annotate 'line', 7757
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7760
# var taux: $P2
new $P3, [ 'TokenIdentifier' ]
$P3.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
set $P2, $P3
.annotate 'line', 7764
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 7763
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7762
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7768
new $P6, [ 'TokenInteger' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
$P6.'TokenInteger'($P7, $P8, 'false')
set $P5, $P6
.annotate 'line', 7767
$P4 = 'integerValue'($P1, $P5, 1)
.annotate 'line', 7766
$P1.'createconst'('true', 'I', $P4, '')
.annotate 'line', 7774
new $P9, [ 'StringLiteral' ]
.annotate 'line', 7775
new $P11, [ 'TokenQuoted' ]
getattribute $P12, $P2, 'file'
getattribute $P13, $P2, 'line'
# predefined int
$I2 = "2"
add $I1, $I2, 1
# predefined string
$S1 = $I1
$P11.'TokenQuoted'($P12, $P13, $S1)
set $P10, $P11
$P9.'StringLiteral'($P1, $P10)
set $P8, $P9
.annotate 'line', 7773
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 7778
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7779

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7780
# Body
# {
.annotate 'line', 7782
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7783

.end # parse


.sub 'optimize' :method

.annotate 'line', 7784
# Body
# {
.annotate 'line', 7786
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7787

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7788
# Body
# {
.annotate 'line', 7790
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7791
__ARG_1.'say'('')
.annotate 'line', 7793
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7795
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7796

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7754
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7803
# Body
# {
.annotate 'line', 7805
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7807
$P1.'open'('__eval__', 'w')
.annotate 'line', 7808
$P1.'puts'(__ARG_1)
.annotate 'line', 7809
$P1.'close'()
.annotate 'line', 7810
$P1.'open'('__eval__', 'r')
.annotate 'line', 7811
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7812
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7813
$P3.'parse'($P2)
.annotate 'line', 7814
$P1.'close'()
.annotate 'line', 7815
$P3.'optimize'()
.annotate 'line', 7816
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7817
$P4.'open'('__eval__', 'w')
.annotate 'line', 7818
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7819
$P5.'initialize'($P4)
.annotate 'line', 7820
$P3.'emit'($P5)
.annotate 'line', 7821
$P5.'close'()
.annotate 'line', 7822
$P4.'close'()
.annotate 'line', 7823
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7824
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7825
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7826
.return($P7)
# }
.annotate 'line', 7827

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7828
# Body
# {
.annotate 'line', 7830
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7831
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7832
$P1.'encoding'('utf8')
.annotate 'line', 7833
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7834
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7835
$P3.'parse'($P2)
.annotate 'line', 7836
$P1.'close'()
.annotate 'line', 7837
$P3.'optimize'()
.annotate 'line', 7838
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7839
$P4.'initialize'(__ARG_2)
.annotate 'line', 7840
$P3.'emit'($P4)
.annotate 'line', 7841
$P4.'close'()
# }
.annotate 'line', 7842

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7843
# Body
# {
.annotate 'line', 7845
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7846
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7847
$P1.'encoding'('utf8')
.annotate 'line', 7848
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7849
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7850
$P3.'parse'($P2)
.annotate 'line', 7851
$P1.'close'()
.annotate 'line', 7852
$P3.'optimize'()
.annotate 'line', 7853
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7854
$P4.'open'('__eval__', 'w')
.annotate 'line', 7855
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7856
$P5.'initialize'($P4)
.annotate 'line', 7857
$P3.'emit'($P5)
.annotate 'line', 7858
$P5.'close'()
.annotate 'line', 7859
$P4.'close'()
.annotate 'line', 7860
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7861
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7862
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7863
.return($P7)
# }
.annotate 'line', 7864

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7869
# Body
# {
.annotate 'line', 7871
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7872
$P1.'parse'(__ARG_1)
.annotate 'line', 7874
$P1.'optimize'()
.annotate 'line', 7876
# var handle: $P2
null $P2
.annotate 'line', 7877
ne __ARG_2, '-', __label_0
.annotate 'line', 7878
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7880
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7881
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7882
$P3.'initialize'($P2)
.annotate 'line', 7883
$P1.'emit'($P3)
.annotate 'line', 7884
$P3.'close'()
.annotate 'line', 7885
$P2.'close'()
# }
.annotate 'line', 7886

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7892
# Body
# {
.annotate 'line', 7894
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7895
compreg 'winxed', $P1
# }
.annotate 'line', 7896

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7898
# Body
# {
.annotate 'line', 7900
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7901
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7902
$P1.'notOptStop'(1)
.annotate 'line', 7903
$P1.'push_string'('o=s')
.annotate 'line', 7904
$P1.'push_string'('e=s')
.annotate 'line', 7905
$P1.'push_string'('c')
.annotate 'line', 7906
$P1.'push_string'('noan')
.annotate 'line', 7908
__ARG_1.'shift'()
.annotate 'line', 7909
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7910
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7911
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7912
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7913
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7915
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7916
# string filename: $S1
null $S1
.annotate 'line', 7917
# string expr: $S2
null $S2
.annotate 'line', 7918
# var file: $P7
null $P7
.annotate 'line', 7919
unless_null $P4, __label_0
# {
.annotate 'line', 7920
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 7921
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7923
$S1 = __ARG_1[0]
.annotate 'line', 7924
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7925
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 7930
new $P7, [ 'StringHandle' ]
.annotate 'line', 7931
$P7.'open'('__eval__', 'w')
.annotate 'line', 7932
$P7.'puts'($S2)
.annotate 'line', 7933
$P7.'close'()
.annotate 'line', 7934
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7937
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7939
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7940
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7942
'winxed_parser'($P8, $S3)
.annotate 'line', 7944
$P7.'close'()
# }
.annotate 'line', 7945

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7947
# Body
# {
.annotate 'line', 7949
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7955
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7949
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7958
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7959
print 'Error: '
say $S1
.annotate 'line', 7960
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7961
# int i: $I1
set $I1, 1
.annotate 'line', 7962
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7963
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7964
# string subname: $S2
null $S2
.annotate 'line', 7965
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 7967
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7968
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
.annotate 'line', 7970
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7971
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7972
eq $S4, '', __label_8
# {
.annotate 'line', 7973
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 7974
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
.annotate 'line', 7978

.end # main

# End generated code
