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
.annotate 'line', 413
# int h: $I2
null $I2
.annotate 'line', 414
$P2 = __ARG_1.'getchar'()
set $S2, $P2
__label_7: # while
.annotate 'line', 415
$P2 = 'hexdigit'($S2)
set $I2, $P2
lt $I2, 0, __label_6
# {
set $I4, $I1
.annotate 'line', 416
mul $I3, $I4, 16
add $I1, $I3, $I2
concat $S1, $S2
.annotate 'line', 418
$P3 = __ARG_1.'getchar'()
set $S2, $P3
# }
goto __label_7
__label_6: # endwhile
.annotate 'line', 420
__ARG_1.'ungetchar'($S2)
set $S1, $I1
.annotate 'line', 422
new $P4, [ 'TokenInteger' ]
getattribute $P5, __ARG_1, 'filename'
$P4.'TokenInteger'($P5, __ARG_3, $S1)
set $P3, $P4
.return($P3)
# }
__label_3: # endif
.annotate 'line', 424
ne $S2, '.', __label_8
# {
__label_10: # do
.annotate 'line', 425
# {
concat $S1, $S2
.annotate 'line', 427
$P4 = __ARG_1.'getchar'()
set $S2, $P4
# }
.annotate 'line', 428
$P5 = 'isdigit'($S2)
if_null $P5, __label_11
if $P5 goto __label_10
__label_11: # enddo
.annotate 'line', 429
iseq $I4, $S2, 'e'
if $I4 goto __label_14
iseq $I4, $S2, 'E'
__label_14:
unless $I4 goto __label_13
# {
concat $S1, 'E'
.annotate 'line', 431
$P6 = __ARG_1.'getchar'()
set $S2, $P6
iseq $I5, $S2, '+'
if $I5 goto __label_16
iseq $I5, $S2, '-'
__label_16:
unless $I5 goto __label_15
# {
concat $S1, $S2
.annotate 'line', 433
$P6 = __ARG_1.'getchar'()
set $S2, $P6
# }
__label_15: # endif
__label_18: # while
.annotate 'line', 435
$P7 = 'isdigit'($S2)
if_null $P7, __label_17
unless $P7 goto __label_17
# {
concat $S1, $S2
.annotate 'line', 437
$P7 = __ARG_1.'getchar'()
set $S2, $P7
# }
goto __label_18
__label_17: # endwhile
# }
__label_13: # endif
.annotate 'line', 440
__ARG_1.'ungetchar'($S2)
.annotate 'line', 441
new $P9, [ 'TokenFloat' ]
getattribute $P10, __ARG_1, 'filename'
$P9.'TokenFloat'($P10, __ARG_3, $S1)
set $P8, $P9
.return($P8)
# }
goto __label_9
__label_8: # else
# {
.annotate 'line', 444
iseq $I5, $S2, 'e'
if $I5 goto __label_21
iseq $I5, $S2, 'E'
__label_21:
unless $I5 goto __label_19
# {
concat $S1, 'E'
.annotate 'line', 446
$P8 = __ARG_1.'getchar'()
set $S2, $P8
iseq $I6, $S2, '+'
if $I6 goto __label_23
iseq $I6, $S2, '-'
__label_23:
unless $I6 goto __label_22
# {
concat $S1, $S2
.annotate 'line', 448
$P9 = __ARG_1.'getchar'()
set $S2, $P9
# }
__label_22: # endif
__label_25: # while
.annotate 'line', 450
$P10 = 'isdigit'($S2)
if_null $P10, __label_24
unless $P10 goto __label_24
# {
concat $S1, $S2
.annotate 'line', 452
$P11 = __ARG_1.'getchar'()
set $S2, $P11
# }
goto __label_25
__label_24: # endwhile
.annotate 'line', 454
__ARG_1.'ungetchar'($S2)
.annotate 'line', 455
new $P12, [ 'TokenFloat' ]
getattribute $P13, __ARG_1, 'filename'
$P12.'TokenFloat'($P13, __ARG_3, $S1)
set $P11, $P12
.return($P11)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 458
__ARG_1.'ungetchar'($S2)
.annotate 'line', 459
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
.annotate 'line', 462

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 464
# Body
# {
.annotate 'line', 466
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 467
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_2: # while
.annotate 'line', 468
isne $I1, $S2, ''
unless $I1 goto __label_3
isne $I1, $S2, "\n"
__label_3:
unless $I1 goto __label_1
# {
concat $S1, $S2
.annotate 'line', 470
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_2
__label_1: # endwhile
.annotate 'line', 472
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 473

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 475
# Body
# {
.annotate 'line', 477
# string s: $S1
set $S1, __ARG_2
.annotate 'line', 478
# string c: $S2
$P1 = __ARG_1.'getchar'()
null $S2
if_null $P1, __label_0
set $S2, $P1
__label_0:
__label_1: # do
.annotate 'line', 479
# {
__label_5: # while
.annotate 'line', 480
isne $I1, $S2, ''
unless $I1 goto __label_6
isne $I1, $S2, '*'
__label_6:
unless $I1 goto __label_4
# {
concat $S1, $S2
.annotate 'line', 481
$P1 = __ARG_1.'getchar'()
set $S2, $P1
# }
goto __label_5
__label_4: # endwhile
.annotate 'line', 482
ne $S2, '', __label_7
.annotate 'line', 483
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_7: # endif
concat $S1, $S2
.annotate 'line', 485
$P2 = __ARG_1.'getchar'()
set $S2, $P2
.annotate 'line', 486
ne $S2, '', __label_8
.annotate 'line', 487
'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
__label_8: # endif
# }
.annotate 'line', 488
ne $S2, '/', __label_1
__label_2: # enddo
concat $S1, '/'
.annotate 'line', 490
new $P3, [ 'TokenComment' ]
getattribute $P4, __ARG_1, 'filename'
$P3.'TokenComment'($P4, __ARG_3, $S1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 491

.end # getcomment


.sub 'getop'
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
new $P2, [ 'TokenOp' ]
getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 497

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 511
# Body
# {
.annotate 'line', 513
.const 'Sub' $P2 = 'getop'
.annotate 'line', 515
setattribute self, 'h', __ARG_1
box $P3, ''
.annotate 'line', 516
setattribute self, 'pending', $P3
.annotate 'line', 517
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'stacked', $P5
box $P4, __ARG_2
.annotate 'line', 518
setattribute self, 'filename', $P4
box $P5, 1
.annotate 'line', 519
setattribute self, 'line', $P5
.annotate 'line', 520
# var select: $P1
root_new $P1, ['parrot';'Hash']
.annotate 'line', 521
root_new $P6, ['parrot';'Hash']
get_hll_global $P7, 'getident'
$P6[''] = $P7
$P6['{'] = $P2
$P1['$'] = $P6
get_hll_global $P8, 'getquoted'
$P1['"'] = $P8
get_hll_global $P9, 'getsinglequoted'
$P1["'"] = $P9
.annotate 'line', 524
root_new $P10, ['parrot';'Hash']
.annotate 'line', 525
root_new $P11, ['parrot';'Hash']
$P11[''] = $P2
$P11['='] = $P2
$P10['='] = $P11
$P10[':'] = $P2
$P1['='] = $P10
.annotate 'line', 528
root_new $P12, ['parrot';'Hash']
$P12['+'] = $P2
$P12['='] = $P2
$P1['+'] = $P12
.annotate 'line', 529
root_new $P13, ['parrot';'Hash']
$P13['-'] = $P2
$P13['='] = $P2
$P1['-'] = $P13
.annotate 'line', 530
root_new $P14, ['parrot';'Hash']
$P14['='] = $P2
$P1['*'] = $P14
.annotate 'line', 531
root_new $P15, ['parrot';'Hash']
$P15['|'] = $P2
$P1['|'] = $P15
.annotate 'line', 532
root_new $P16, ['parrot';'Hash']
$P16['&'] = $P2
$P1['&'] = $P16
.annotate 'line', 533
root_new $P17, ['parrot';'Hash']
.annotate 'line', 534
root_new $P18, ['parrot';'Hash']
$P18[''] = $P2
get_hll_global $P19, 'getheredoc'
$P18[':'] = $P19
$P17['<'] = $P18
$P17['='] = $P2
$P1['<'] = $P17
.annotate 'line', 537
root_new $P20, ['parrot';'Hash']
$P20['>'] = $P2
$P20['='] = $P2
$P1['>'] = $P20
.annotate 'line', 538
root_new $P21, ['parrot';'Hash']
.annotate 'line', 539
root_new $P22, ['parrot';'Hash']
$P22[''] = $P2
$P22['='] = $P2
$P21['='] = $P22
$P1['!'] = $P21
.annotate 'line', 541
root_new $P23, ['parrot';'Hash']
$P23['%'] = $P2
$P1['%'] = $P23
.annotate 'line', 542
root_new $P24, ['parrot';'Hash']
$P24['='] = $P2
get_hll_global $P25, 'getlinecomment'
$P24['/'] = $P25
get_hll_global $P26, 'getcomment'
$P24['*'] = $P26
$P1['/'] = $P24
get_hll_global $P27, 'getlinecomment'
$P1['#'] = $P27
.annotate 'line', 545
setattribute self, 'select', $P1
# }
.annotate 'line', 546

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 547
# Body
# {
.annotate 'line', 549
# string pending: $S1
getattribute $P2, self, 'pending'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 550
eq $S1, '', __label_1
# {
box $P2, ''
.annotate 'line', 551
setattribute self, 'pending', $P2
.annotate 'line', 552
.return($S1)
# }
__label_1: # endif
.annotate 'line', 554
# var h: $P1
getattribute $P1, self, 'h'
.annotate 'line', 555
# string c: $S2
$P3 = $P1.'read'(1)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 556
ne $S2, "\n", __label_3
# {
.annotate 'line', 557
# int l: $I1
getattribute $P3, self, 'line'
set $I1, $P3
.annotate 'line', 558
inc $I1
box $P4, $I1
.annotate 'line', 559
setattribute self, 'line', $P4
# }
__label_3: # endif
.annotate 'line', 561
.return($S2)
# }
.annotate 'line', 562

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 563
# Body
# {
box $P1, __ARG_1
.annotate 'line', 565
setattribute self, 'pending', $P1
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
getattribute $P1, self, 'stacked'
$P1.'push'(__ARG_1)
# }

.end # unget

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 505
addattribute $P0, 'h'
.annotate 'line', 506
addattribute $P0, 'pending'
.annotate 'line', 507
addattribute $P0, 'select'
.annotate 'line', 508
addattribute $P0, 'stacked'
.annotate 'line', 509
addattribute $P0, 'filename'
.annotate 'line', 510
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


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 786
# Body
# {
.annotate 'line', 788
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 789
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 790

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 791
# Body
# {
.annotate 'line', 793
# string ins: $S1
concat $S0, "concat ", __ARG_1
concat $S0, ", "
concat $S0, __ARG_2
concat $S0, ", "
concat $S0, __ARG_3
concat $S0, "\n"
set $S1, $S0
.annotate 'line', 794
getattribute $P1, self, 'handle'
$P1.'print'($S1)
# }
.annotate 'line', 795

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

.annotate 'line', 802
# Body
# {
.annotate 'line', 804
new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 805

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 807
# Body
# {
.annotate 'line', 809
# var t: $P1
new $P2, [ 'TokenFloat' ]
getattribute $P3, __ARG_2, 'file'
getattribute $P4, __ARG_2, 'line'
$P2.'TokenFloat'($P3, $P4, __ARG_3)
set $P1, $P2
.annotate 'line', 810
new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
set $P2, $P3
.return($P2)
# }
.annotate 'line', 811

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 813
# Body
# {
.annotate 'line', 819
# int result: $I1
iseq $I1, __ARG_1, 'N'
unless $I1 goto __label_1
iseq $I1, __ARG_2, 'N'
if $I1 goto __label_2
iseq $I1, __ARG_2, 'I'
__label_2:
__label_1:
if $I1 goto __label_0
.annotate 'line', 820
iseq $I1, __ARG_2, 'N'
unless $I1 goto __label_3
iseq $I1, __ARG_1, 'N'
if $I1 goto __label_4
iseq $I1, __ARG_1, 'I'
__label_4:
__label_3:
__label_0:
.annotate 'line', 821
.return($I1)
# }
.annotate 'line', 822

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 842
# Body
# {
.annotate 'line', 844
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 845
.return($S1)
# }
.annotate 'line', 846

.end # name


.sub 'result' :method

.annotate 'line', 847
# Body
# {
.annotate 'line', 849
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 850

.end # result


.sub 'params' :method

.annotate 'line', 851
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 852
# Body
# {
.annotate 'line', 854
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 855
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 856
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 857
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 858
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 860
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 862
.return($S1)
# }
.annotate 'line', 863

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 864
# Body
# {
box $P1, __ARG_1
.annotate 'line', 870
setattribute self, 'name', $P1
.annotate 'line', 871
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 872
setattribute self, 'typeresult', $P2
.annotate 'line', 873
# int n: $I1
null $I1
.annotate 'line', 874
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 875
setattribute self, 'type0', $P2
.annotate 'line', 876
ne __ARG_4, '*', __label_1
set $I1, -1
goto __label_2
__label_1: # else
.annotate 'line', 877
# {
set $I1, 1
.annotate 'line', 880
if_null __ARG_5, __label_3
# {
box $P3, __ARG_5
.annotate 'line', 881
setattribute self, 'type1', $P3
.annotate 'line', 882
inc $I1
# }
__label_3: # endif
.annotate 'line', 884
if_null __ARG_6, __label_4
# {
box $P3, __ARG_6
.annotate 'line', 885
setattribute self, 'type2', $P3
.annotate 'line', 886
inc $I1
# }
__label_4: # endif
# }
__label_2: # endif
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 890
setattribute self, 'nparams', $P4
.annotate 'line', 891
.return(self)
# }
.annotate 'line', 892

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 893
# Body
# {
.annotate 'line', 901
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 902
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 903
.return(self)
# }
.annotate 'line', 904

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 905
# Body
# {
.annotate 'line', 907
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 908
# string typeresult: $S2
getattribute $P2, self, 'typeresult'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 909
__ARG_1.'comment'($S6)
.annotate 'line', 911
getattribute $P3, self, 'body'
isa $I4, $P3, 'String'
unless $I4 goto __label_2
# {
.annotate 'line', 912
# string body: $S3
getattribute $P4, self, 'body'
null $S3
if_null $P4, __label_4
set $S3, $P4
__label_4:
.annotate 'line', 913
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 914
ne $S2, 'v', __label_5
# {
.annotate 'line', 915
isnull $I4, __ARG_4
not $I4
unless $I4 goto __label_8
isne $I4, __ARG_4, ''
__label_8:
unless $I4 goto __label_7
.annotate 'line', 916
'SyntaxError'('using return value from void predef')
__label_7: # endif
.annotate 'line', 917
eq $I1, -1, __label_9
.annotate 'line', 918
'InternalError'('void predef with {res}')
__label_9: # endif
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 921
ne $I1, -1, __label_10
.annotate 'line', 922
'InternalError'('non void predef without {res}')
__label_10: # endif
.annotate 'line', 923
isne $I5, $S2, 'v'
unless $I5 goto __label_12
isnull $I5, __ARG_4
if $I5 goto __label_13
iseq $I5, __ARG_4, ''
__label_13:
__label_12:
unless $I5 goto __label_11
.annotate 'line', 924
$P3 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P3
__label_11: # endif
__label_14: # do
.annotate 'line', 925
# {
.annotate 'line', 926
# predefined substr
substr $S6, $S3, 0, $I1
add $I5, $I1, 5
# predefined substr
substr $S7, $S3, $I5
concat $S0, $S6, __ARG_4
concat $S0, $S7
set $S3, $S0
# }
.annotate 'line', 927
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_14
__label_15: # enddo
# }
__label_6: # endif
.annotate 'line', 930
# int n: $I2
set $P4, __ARG_5
set $I2, $P4
# for loop
.annotate 'line', 931
# int i: $I3
null $I3
__label_19: # for condition
ge $I3, $I2, __label_18
# {
.annotate 'line', 932
# string argmark: $S4
$S8 = $I3
concat $S7, '{arg', $S8
concat $S0, $S7, '}'
set $S4, $S0
.annotate 'line', 933
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_21: # while
.annotate 'line', 934
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_20
.annotate 'line', 935
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
.annotate 'line', 931
inc $I3
goto __label_19
__label_18: # for end
.annotate 'line', 937
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 938
__ARG_1.'say'($S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 941
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 942
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_3: # endif
# }
.annotate 'line', 944

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 833
addattribute $P0, 'name'
.annotate 'line', 834
addattribute $P0, 'body'
.annotate 'line', 835
addattribute $P0, 'evalfun'
.annotate 'line', 836
addattribute $P0, 'typeresult'
.annotate 'line', 837
addattribute $P0, 'type0'
.annotate 'line', 838
addattribute $P0, 'type1'
.annotate 'line', 839
addattribute $P0, 'type2'
.annotate 'line', 840
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 949
# Body
# {
.annotate 'line', 951
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 952
# int n: $I1
# predefined int
$I3 = __ARG_4
sub $I1, $I3, 1
.annotate 'line', 953
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 954
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
$P1 = __ARG_4[$I2]
.annotate 'line', 955
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 954
inc $I2
goto __label_4
__label_3: # for end
$P1 = __ARG_4[$I1]
.annotate 'line', 956
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 959
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 960

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

.annotate 'line', 965
# Body
# {
.annotate 'line', 967
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 968
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 969
# int n: $I1
# predefined int
$I1 = __ARG_4
# for loop
.annotate 'line', 970
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 971
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 970
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 972
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 973

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

.annotate 'line', 978
# Body
# {
.annotate 'line', 980
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 981
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 982
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P1 = __ARG_4[$I2]
.annotate 'line', 983
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 982
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 984

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 987
# Body
# {
.annotate 'line', 989
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 990
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 991
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 992

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 994
# Body
# {
.annotate 'line', 996
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 997
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 998
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 999

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1001
# Body
# {
.annotate 'line', 1003
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1004
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1005
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1006

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1008
# Body
# {
.annotate 'line', 1010
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1011
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1012
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1013
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1014
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1015

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1017
# Body
# {
.annotate 'line', 1019
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1021
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1022
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1024
# var t: $P2
new $P4, [ 'TokenQuoted' ]
getattribute $P5, __ARG_2, 'file'
getattribute $P6, __ARG_2, 'line'
$P4.'TokenQuoted'($P5, $P6, $S1)
set $P2, $P4
.annotate 'line', 1025
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1026

.end # predefeval_chr


.sub 'getpredefs'

.annotate 'line', 1028
# Body
# {
.annotate 'line', 1030
# var predef_say: $P1
new $P1, [ 'Predef_say' ]
.annotate 'line', 1031
# var predef_cry: $P2
new $P2, [ 'Predef_cry' ]
.annotate 'line', 1032
# var predef_print: $P3
new $P3, [ 'Predef_print' ]
.annotate 'line', 1034
get_hll_global $P5, 'predefeval_length'
.annotate 'line', 1035
get_hll_global $P6, 'predefeval_bytelength'
.annotate 'line', 1036
get_hll_global $P7, 'predefeval_chr'
.annotate 'line', 1037
get_hll_global $P8, 'predefeval_ord'
.annotate 'line', 1038
get_hll_global $P9, 'predefeval_ord_n'
.annotate 'line', 1040
# var predefs: $P4
root_new $P10, ['parrot';'ResizablePMCArray']
.annotate 'line', 1041
new $P13, [ 'PredefFunction' ]
$P12 = $P13.'set'('int', '{res} = {arg0}', 'I', '?')
.annotate 'line', 1040
$P10.'push'($P12)
.annotate 'line', 1045
new $P15, [ 'PredefFunction' ]
$P14 = $P15.'set'('float', '{res} = {arg0}', 'N', '?')
.annotate 'line', 1040
$P10.'push'($P14)
.annotate 'line', 1049
new $P17, [ 'PredefFunction' ]
$P16 = $P17.'set'('string', '{res} = {arg0}', 'S', '?')
.annotate 'line', 1040
$P10.'push'($P16)
.annotate 'line', 1053
new $P19, [ 'PredefFunction' ]
$P18 = $P19.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1040
$P10.'push'($P18)
.annotate 'line', 1057
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1040
$P10.'push'($P20)
.annotate 'line', 1061
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('time', 'time {res}', 'I')
.annotate 'line', 1040
$P10.'push'($P22)
.annotate 'line', 1065
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1040
$P10.'push'($P24)
.annotate 'line', 1069
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1040
$P10.'push'($P26)
.annotate 'line', 1073
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P28)
.annotate 'line', 1078
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P30)
.annotate 'line', 1083
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P32)
.annotate 'line', 1088
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1040
$P10.'push'($P34)
.annotate 'line', 1094
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1040
$P10.'push'($P36)
.annotate 'line', 1101
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1040
$P10.'push'($P38)
.annotate 'line', 1105
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set_eval'('length', $P5, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1040
$P10.'push'($P40)
.annotate 'line', 1110
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set_eval'('bytelength', $P6, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1040
$P10.'push'($P42)
.annotate 'line', 1115
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set_eval'('chr', $P7, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1040
$P10.'push'($P44)
.annotate 'line', 1122
new $P47, [ 'PredefFunction' ]
$P46 = $P47.'set_eval'('ord', $P8, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1040
$P10.'push'($P46)
.annotate 'line', 1127
new $P49, [ 'PredefFunction' ]
$P48 = $P49.'set_eval'('ord', $P9, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1040
$P10.'push'($P48)
.annotate 'line', 1132
new $P51, [ 'PredefFunction' ]
$P50 = $P51.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1040
$P10.'push'($P50)
.annotate 'line', 1136
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1040
$P10.'push'($P52)
.annotate 'line', 1140
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P54)
.annotate 'line', 1144
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1040
$P10.'push'($P56)
.annotate 'line', 1148
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1040
$P10.'push'($P58)
.annotate 'line', 1152
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P60)
.annotate 'line', 1156
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P62)
.annotate 'line', 1160
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P64)
.annotate 'line', 1164
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P66)
.annotate 'line', 1168
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P68)
.annotate 'line', 1173
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P70)
.annotate 'line', 1178
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P72)
.annotate 'line', 1182
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P74)
.annotate 'line', 1186
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P76)
.annotate 'line', 1190
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P78)
.annotate 'line', 1194
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P80)
.annotate 'line', 1198
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P82)
.annotate 'line', 1202
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P84)
.annotate 'line', 1206
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P86)
.annotate 'line', 1210
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P88)
.annotate 'line', 1214
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P90)
.annotate 'line', 1218
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1040
$P10.'push'($P92)
.annotate 'line', 1222
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1040
$P10.'push'($P94)
.annotate 'line', 1226
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P96)
.annotate 'line', 1230
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P98)
.annotate 'line', 1234
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P100)
.annotate 'line', 1238
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1040
$P10.'push'($P102)
.annotate 'line', 1242
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1040
$P10.'push'($P104)
.annotate 'line', 1246
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P106)
.annotate 'line', 1250
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1040
$P10.'push'($P108)
.annotate 'line', 1254
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P110)
.annotate 'line', 1259
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P112)
.annotate 'line', 1264
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1040
$P10.'push'($P114)
.annotate 'line', 1268
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1040
$P10.'push'($P116)
.annotate 'line', 1272
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1040
$P10.'push'($P118)
.annotate 'line', 1276
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1040
$P10.'push'($P120)
.annotate 'line', 1280
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1040
$P10.'push'($P122)
.annotate 'line', 1284
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('print', $P3, 'P', '*')
.annotate 'line', 1040
$P10.'push'($P124)
.annotate 'line', 1288
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('say', $P1, 'P', '*')
.annotate 'line', 1040
$P10.'push'($P126)
.annotate 'line', 1292
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('cry', $P2, 'P', '*')
.annotate 'line', 1040
$P10.'push'($P128)
set $P4, $P10
__label_1: # Infinite loop
.annotate 'line', 1298
.yield($P4)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1299

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1301
# Body
# {
.annotate 'line', 1303
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1304
getattribute $P4, $P1, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1305
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1306
iseq $I2, $I1, -1
if $I2 goto __label_4
iseq $I2, $I1, __ARG_2
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1307
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1309
.return($P2)
# }
.annotate 'line', 1310

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1316
# Body
# {
.annotate 'line', 1318
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1319
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1320
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1319
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1321

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1332
# Body
# {
.annotate 'line', 1334
setattribute self, 'start', __ARG_1
.annotate 'line', 1335
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1336

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1337
# Body
# {
.annotate 'line', 1339
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1340

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1341
# Body
# {
.annotate 'line', 1343
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1344

.end # use_predef


.sub 'createsubid' :method

.annotate 'line', 1345
# Body
# {
.annotate 'line', 1347
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 1348

.end # createsubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1349
# Body
# {
.annotate 'line', 1351
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1352

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1353
# Body
# {
.annotate 'line', 1355
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1356

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1329
addattribute $P0, 'start'
.annotate 'line', 1330
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1369
# Body
# {
.annotate 'line', 1371
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1372

.end # init


.sub 'numargs' :method

.annotate 'line', 1374
# Body
# {
.annotate 'line', 1376
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1377

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1378
# Body
# {
.annotate 'line', 1380
# var args: $P1
getattribute $P1, self, 'args'
$P2 = $P1[__ARG_1]
.annotate 'line', 1381
.return($P2)
# }
.annotate 'line', 1382

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1384
# Body
# {
.annotate 'line', 1386
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1387
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1388
# {
.annotate 'line', 1389
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1390
$P1.'push'($P3)
# }
.annotate 'line', 1391
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1392
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1393

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1395
# Body
# {
.annotate 'line', 1397
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1398
if_null $P1, __label_0
.annotate 'line', 1399
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1400

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1401
# Body
# {
.annotate 'line', 1403
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1404
# var argreg: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 1405
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1406
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1407
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1408
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1409
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1406
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1411
.return($P2)
# }
.annotate 'line', 1412

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1413
# Body
# {
.annotate 'line', 1415
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
# predefined join
.annotate 'line', 1416
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1417

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1367
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1429
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1430
# Body
# {
.annotate 'line', 1432
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1433
.return($I1)
# }
.annotate 'line', 1434

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1435
# Body
# {
.annotate 'line', 1437
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1438
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1439
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1441
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1442

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1443
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1445
setattribute self, 'name', $P1
.annotate 'line', 1446
if_null __ARG_2, __label_0
.annotate 'line', 1447
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1448

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1449
# Body
# {
.annotate 'line', 1451
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1452

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1426
addattribute $P0, 'name'
.annotate 'line', 1427
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1459
# Body
# {
.annotate 'line', 1461
# var list: $P1
root_new $P4, ['parrot';'ResizablePMCArray']
set $P1, $P4
.annotate 'line', 1462
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1463
# {
.annotate 'line', 1464
$P2 = __ARG_1.'get'()
.annotate 'line', 1465
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1466
$P2 = __ARG_1.'get'()
.annotate 'line', 1467
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1468
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1469
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1470
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1472
new $P7, [ 'Modifier' ]
$P7.'Modifier'($S1, $P3)
set $P6, $P7
$P1.'push'($P6)
# }
.annotate 'line', 1473
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1474
'RequireOp'(']', $P2)
.annotate 'line', 1475
setattribute self, 'list', $P1
# }
.annotate 'line', 1476

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1477
# Body
# {
.annotate 'line', 1479
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1480
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1481

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1482
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1483
# Body
# {
.annotate 'line', 1485
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1486
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1487
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1488
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1489
$P3 = $P2.'getname'()
$S1 = $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1490
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1487
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1493
.return($P3)
# }
.annotate 'line', 1494

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1457
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1501
# Body
# {
.annotate 'line', 1503
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, "' ]"
.annotate 'line', 1504
.return($S2)
# }
.annotate 'line', 1505

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1507
# Body
# {
.annotate 'line', 1509
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1510
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1512
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, "' ]"
.annotate 'line', 1513
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1515

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1517
# Body
# {
.annotate 'line', 1519
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1520
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1521
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1522
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1523
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1525
__ARG_2.'unget'($P1)
.annotate 'line', 1526
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1528

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1530
# Body
# {
.annotate 'line', 1532
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1533
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1534
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1535
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1536
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1537
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1538
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1540
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1541
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1542
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
.annotate 'line', 1544
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1546
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1549
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_9: # case
.annotate 'line', 1551
new $P9, [ 'StringStatement' ]
$P9.'StringStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_10: # case
.annotate 'line', 1553
new $P11, [ 'IntStatement' ]
$P11.'IntStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_11: # case
.annotate 'line', 1555
new $P13, [ 'FloatStatement' ]
$P13.'FloatStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_12: # case
.annotate 'line', 1557
new $P15, [ 'ReturnStatement' ]
$P15.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_13: # case
.annotate 'line', 1559
new $P17, [ 'YieldStatement' ]
$P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_14: # case
.annotate 'line', 1561
new $P19, [ 'GotoStatement' ]
$P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_15: # case
.annotate 'line', 1563
new $P21, [ 'IfStatement' ]
$P21.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_16: # case
.annotate 'line', 1565
new $P23, [ 'WhileStatement' ]
$P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_17: # case
.annotate 'line', 1567
new $P25, [ 'DoStatement' ]
$P25.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_18: # case
.annotate 'line', 1569
new $P27, [ 'ContinueStatement' ]
$P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_19: # case
.annotate 'line', 1571
new $P29, [ 'BreakStatement' ]
$P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_20: # case
.annotate 'line', 1573
new $P31, [ 'SwitchStatement' ]
$P31.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P30, $P31
.return($P30)
__label_21: # case
.annotate 'line', 1575
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_22: # case
.annotate 'line', 1577
new $P33, [ 'ThrowStatement' ]
$P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P32, $P33
.return($P32)
__label_23: # case
.annotate 'line', 1579
new $P35, [ 'TryStatement' ]
$P35.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P34, $P35
.return($P34)
__label_5: # default
.annotate 'line', 1581
$P36 = $P1.'isidentifier'()
if_null $P36, __label_24
unless $P36 goto __label_24
# {
.annotate 'line', 1582
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1583
$P9 = $P3.'isop'(':')
if_null $P9, __label_25
unless $P9 goto __label_25
.annotate 'line', 1584
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_25: # endif
.annotate 'line', 1585
__ARG_1.'unget'($P3)
# }
__label_24: # endif
.annotate 'line', 1587
__ARG_1.'unget'($P1)
.annotate 'line', 1588
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1590
unless_null $P2, __label_26
.annotate 'line', 1591
'InternalError'('parseStatement failure')
__label_26: # endif
.annotate 'line', 1592
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1593

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1601
# Body
# {
.annotate 'line', 1603
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1604

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1605
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1606
# Body
# {
.annotate 'line', 1608
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1609

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1610
# Body
# {
.annotate 'line', 1612
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1613

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1614
# Body
# {
.annotate 'line', 1616
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1617

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1618
# Body
# {
.annotate 'line', 1620
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1621

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1622
# Body
# {
.annotate 'line', 1624
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1625

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1626
# Body
# {
.annotate 'line', 1628
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1629

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1630
# Body
# {
.annotate 'line', 1632
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1633

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1634
# Body
# {
.annotate 'line', 1636
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1637

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1638
# Body
# {
.annotate 'line', 1640
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1641

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1642
# Body
# {
.annotate 'line', 1644
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1645

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1647
# Body
# {
.annotate 'line', 1652
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1653

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1654
# Body
# {
.annotate 'line', 1656
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1657

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1658
# Body
# {
.annotate 'line', 1660
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1661

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1662
# Body
# {
.annotate 'line', 1664
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1666
.return(self)
# }
.annotate 'line', 1667

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1599
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1672
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1673
# Body
# {
.annotate 'line', 1675
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1676

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1677
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1678
# Body
# {
# }
.annotate 'line', 1681

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1670
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1688
# Body
# {
.annotate 'line', 1690
# var statements: $P1
root_new $P2, ['parrot';'ResizablePMCArray']
set $P1, $P2
.annotate 'line', 1691
$P1.'push'(__ARG_1)
.annotate 'line', 1692
$P1.'push'(__ARG_2)
.annotate 'line', 1693
setattribute self, 'statements', $P1
# }
.annotate 'line', 1694

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1695
# Body
# {
.annotate 'line', 1697
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1698
.return(self)
# }
.annotate 'line', 1699

.end # push


.sub 'optimize' :method

.annotate 'line', 1700
# Body
# {
.annotate 'line', 1702
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1703
.return(self)
# }
.annotate 'line', 1704

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1705
# Body
# {
.annotate 'line', 1707
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1708
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1709

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1686
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1712
# Body
# {
.annotate 'line', 1714
unless_null __ARG_1, __label_0
.annotate 'line', 1715
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1716
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1717
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1719
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1720

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1730
# Body
# {
.annotate 'line', 1732
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1733
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1734
# int dotted: $I1
null $I1
.annotate 'line', 1735
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1737
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1739
# string opname: $S1
$P2 = $P1.'getidentifier'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 1740
unless $I1 goto __label_3
set $S2, '.'
goto __label_2
__label_3:
set $S2, ''
__label_2:
concat $S3, $S2, $S1
box $P3, $S3
setattribute self, 'opname', $P3
.annotate 'line', 1741
$P1 = __ARG_2.'get'()
.annotate 'line', 1742
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1743
__ARG_2.'unget'($P1)
.annotate 'line', 1744
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1746
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1747

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1748
# Body
# {
.annotate 'line', 1750
self.'optimizeargs'()
.annotate 'line', 1751
.return(self)
# }
.annotate 'line', 1752

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1753
# Body
# {
.annotate 'line', 1755
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1756
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1757
__ARG_1.'comment'($S2)
.annotate 'line', 1758
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1759
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1761
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1762
self.'emitargs'(__ARG_1)
.annotate 'line', 1763
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1765

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1726
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1728
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1775
# Body
# {
.annotate 'line', 1777
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1778
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1779
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1780
# {
.annotate 'line', 1781
$P2 = __ARG_2.'get'()
.annotate 'line', 1782
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1783
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1784
'RequireOp'(';', $P2)
.annotate 'line', 1785
setattribute self, 'path', $P1
.annotate 'line', 1786
.return(self)
# }
.annotate 'line', 1787

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1788
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1789
# Body
# {
.annotate 'line', 1791
self.'annotate'(__ARG_1)
.annotate 'line', 1792
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1793

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1772
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1774
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1803
# Body
# {
.annotate 'line', 1805
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1806
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1807
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1808
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1809

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1810
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1811
# Body
# {
.annotate 'line', 1813
self.'annotate'(__ARG_1)
.annotate 'line', 1814
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1815
getattribute $P3, self, 'symbol'
.annotate 'line', 1814
__ARG_1.'say'(".const 'Sub' ", $P1, " = '", $P3, "'")
# }
.annotate 'line', 1816

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1800
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1802
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1826
# Body
# {
.annotate 'line', 1828
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1829
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1830
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1831
# {
.annotate 'line', 1832
$P2 = __ARG_2.'get'()
.annotate 'line', 1833
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1834
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1835
'RequireOp'(';', $P2)
.annotate 'line', 1836
setattribute self, 'path', $P1
# }
.annotate 'line', 1837

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1838
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1839
# Body
# {
.annotate 'line', 1841
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1842
# string name: $S1
$P2 = $P1.'pop'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1843
self.'annotate'(__ARG_1)
.annotate 'line', 1845
$P2 = self.'createvar'($S1, 'P')
__ARG_1.'print'('get_hll_global ', $P2, ', ')
.annotate 'line', 1847
# int n: $I1
set $P3, $P1
set $I1, $P3
set $I2, $I1
null $I3
.annotate 'line', 1848
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1850
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1853
$P3 = 'getparrotkey'($P1)
__ARG_1.'say'($P3, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1855

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1823
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1825
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1865
# Body
# {
.annotate 'line', 1867
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1868
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1869
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1870

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1871
# Body
# {
.annotate 'line', 1873
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1874
.return(self)
# }
.annotate 'line', 1875

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1876
# Body
# {
.annotate 'line', 1878
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1879

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1862
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1864
addattribute $P0, 'expr'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1889
# Body
# {
.annotate 'line', 1891
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1892

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 1893
# Body
# {
# predefined Error
.annotate 'line', 1895
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'Attempt to use unexpanded constant!!!'
throw $P1
# }
.annotate 'line', 1896

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1888
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 1903
# Body
# {
.annotate 'line', 1905
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 1906

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 1907
# Body
# {
.annotate 'line', 1909
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1910
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1911
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1912
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, "'"
.annotate 'line', 1913
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 1914
# string reg: $S2
$P3 = self.'createreg'(__ARG_2)
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 1915
root_new $P4, ['parrot';'Hash']
$P4['type'] = __ARG_2
$P4['reg'] = $S2
$P4['scope'] = self
$P4['const'] = 0
$P1[$S1] = $P4
.annotate 'line', 1920
.return($S2)
# }
.annotate 'line', 1921

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 1922
# Body
# {
.annotate 'line', 1924
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1925
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1926
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1927
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1928
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1929
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['reg'] = __ARG_3
$P3['scope'] = self
$P3['const'] = 0
$P1[$S1] = $P3
# }
.annotate 'line', 1934

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1935
# Body
# {
.annotate 'line', 1937
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1938
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1939
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1940
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, "'"
.annotate 'line', 1941
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 1942
# var data: $P3
root_new $P3, ['parrot';'Hash']
$P3['type'] = __ARG_2
$P3['value'] = __ARG_3
.annotate 'line', 1945
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3['reg'] = $P4
$P3['const'] = 1
.annotate 'line', 1947
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 1948
$P3['id'] = __ARG_4
__label_2: # endif
.annotate 'line', 1949
$P1[$S1] = $P3
# }
.annotate 'line', 1950

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1951
# Body
# {
.annotate 'line', 1953
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1954
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1955
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1956
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 1957
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 1958
.return($P2)
# }
.annotate 'line', 1959

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 1960
# Body
# {
.annotate 'line', 1962
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 1963
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1964
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 1965
.return($P2)
# }
.annotate 'line', 1966

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 1967
# Body
# {
.annotate 'line', 1969
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 1970
# string lexname: $S1
$P3 = __ARG_1['reg']
$P2 = $P1.'createlex'($P3)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1971
.return($S1)
# }
.annotate 'line', 1972

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 1973
# Body
# {
.annotate 'line', 1975
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 1977
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 1978
.return('__WLEX_self')
# }
.annotate 'line', 1979

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 1902
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 1988
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 1998
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 1999
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2000
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2001
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2002
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2003
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2004
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2005
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2006
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2007
# Body
# {
.annotate 'line', 2009
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2010

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2011
# Body
# {
.annotate 'line', 2013
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2014

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2015
# Body
# {
.annotate 'line', 2018
.return(self)
# }
.annotate 'line', 2019

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2020
# Body
# {
.annotate 'line', 2022
# string type: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2023
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2024
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2025
.return($S2)
# }
.annotate 'line', 2026

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2027
# Body
# {
.annotate 'line', 2029
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2030

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 1996
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2035
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2033
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2043
# Body
# {
.annotate 'line', 2045
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2046
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2047
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2048
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2049
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2050

.end # FunctionExpr


.sub 'checkResult' :method

.annotate 'line', 2051
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 2052
# Body
# {
.annotate 'line', 2054
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2055
.return(self)
# }
.annotate 'line', 2056

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2057
# Body
# {
.annotate 'line', 2059
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2060
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2061
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2062
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2063
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2064

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2040
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2042
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2077
# Body
# {
.annotate 'line', 2079
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2080
.return(self)
# }
.annotate 'line', 2081

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2082
# Body
# {
.annotate 'line', 2084
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2085

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2086
# Body
# {
.annotate 'line', 2088
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2089
.return(self)
# }
.annotate 'line', 2090

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2091
# Body
# {
.annotate 'line', 2093
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2094
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2095
$P3 = $P1.'checkResult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2097
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2098
ne $I1, 0, __label_4
.annotate 'line', 2099
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2101
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2104
.return(0)
# }
.annotate 'line', 2105

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2106
# Body
# {
.annotate 'line', 2108
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2110
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2111
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2112
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2114
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2115
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2116
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
.annotate 'line', 2119
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2122
__ARG_1.'say'('if ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2125
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2128

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2129
# Body
# {
.annotate 'line', 2131
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2133
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2134
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2135
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2137
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2138
# string type: $S2
$P2 = $P1.'checkResult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2139
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
.annotate 'line', 2142
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2145
__ARG_1.'say'('unless ', $S1, ' goto ', __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2148
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2151

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2076
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2158
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2159
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2156
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2167
# Body
# {
.annotate 'line', 2169
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2170
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2171

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2172
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkResult' :method

.annotate 'line', 2173
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getPirString' :method

.annotate 'line', 2174
# Body
# {
.annotate 'line', 2176
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2177
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2178
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2179
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2180
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2181
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2183
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
.annotate 'line', 2186
unless $I2 goto __label_4
# {
.annotate 'line', 2187
unless $I1 goto __label_5
# {
null $I1
.annotate 'line', 2189
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2191
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2192
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S3
.annotate 'line', 2194
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2197
# string result: $S4
set $S4, ''
.annotate 'line', 2198
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2199
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2200
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2201
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2202
le $I6, 127, __label_12
# {
.annotate 'line', 2203
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
.annotate 'line', 2204
# }
goto __label_13
__label_12: # else
concat $S4, $S5
__label_13: # endif
.annotate 'line', 2207
# }
__label_9: # for iteration
.annotate 'line', 2199
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2209
# }
__label_4: # endif
.annotate 'line', 2211
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
.annotate 'line', 2213
unless $I2 goto __label_17
concat $S0, 'unicode:', $S1
set $S1, $S0
__label_17: # endif
.annotate 'line', 2215
.return($S1)
# }
.annotate 'line', 2216

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2217
# Body
# {
.annotate 'line', 2219
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2220
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2221
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2222
# var s: $P2
set $S2, $S1
box $P2, $S2
.annotate 'line', 2223
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2225
.return($S1)
# }
.annotate 'line', 2226

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2227
# Body
# {
.annotate 'line', 2229
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2230

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2231
# Body
# {
.annotate 'line', 2233
.tailcall self.'getPirString'()
# }
.annotate 'line', 2234

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2164
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2166
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2243
# Body
# {
.annotate 'line', 2246
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2247
setattribute self, 'pos', __ARG_2
.annotate 'line', 2248
# int n: $I1
null $I1
.annotate 'line', 2249
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2250
# {
.annotate 'line', 2252
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2253
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2255
setattribute self, 'numval', $P2
# }
.annotate 'line', 2256

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2257
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkResult' :method

.annotate 'line', 2258
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'getIntegerValue' :method

.annotate 'line', 2259
# Body
# {
.annotate 'line', 2261
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2262
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2263
.return($I1)
# }
.annotate 'line', 2264

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2265
# Body
# {
.annotate 'line', 2267
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2268
ne $I1, 0, __label_0
.annotate 'line', 2269
__ARG_1.'emitnull'(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 2271
__ARG_1.'emitset'(__ARG_2, $I1)
__label_1: # endif
# }
.annotate 'line', 2272

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2273
# Body
# {
.annotate 'line', 2275
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2276

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2239
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2241
addattribute $P0, 'pos'
.annotate 'line', 2242
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2284
# Body
# {
.annotate 'line', 2286
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2287
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2288

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2289
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkResult' :method

.annotate 'line', 2290
# Body
# {
.return('N')
# }

.end # checkResult


.sub 'getFloatValue' :method

.annotate 'line', 2291
# Body
# {
.annotate 'line', 2293
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2294
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2296
.return($P1)
# }
.annotate 'line', 2297

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2298
# Body
# {
.annotate 'line', 2300
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2301
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2302

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2303
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
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, '.0'
__label_1: # endif
.annotate 'line', 2310
.return($S1)
# }
.annotate 'line', 2311

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2281
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2283
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2319
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2320
# Body
# {
.annotate 'line', 2322
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2323
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2324

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2325
# Body
# {
.annotate 'line', 2327
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2328

.end # isnull


.sub 'checkResult' :method

.annotate 'line', 2329
# Body
# {
.annotate 'line', 2331
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2332
if_null $P1, __label_0
$P2 = $P1['type']
.annotate 'line', 2333
.return($P2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2335
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
.annotate 'line', 2338
.return('P')
__label_3: # default
.annotate 'line', 2340
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2343

.end # checkResult


.sub 'getName' :method

.annotate 'line', 2344
# Body
# {
.annotate 'line', 2346
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2347
.return($S1)
# }
.annotate 'line', 2348

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2349
# Body
# {
.annotate 'line', 2351
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2352
unless_null $P1, __label_0
.annotate 'line', 2353
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2354
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2355
# string s: $S1
null $S1
.annotate 'line', 2356
unless_null $P2, __label_1
# {
.annotate 'line', 2357
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2358
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
.annotate 'line', 2364
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2368
$P4 = $P2['id']
if_null $P4, __label_8
$P5 = $P2['id']
.annotate 'line', 2369
.return($P5)
goto __label_9
__label_8: # else
.annotate 'line', 2371
$S1 = $P2['reg']
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2373
.return($S1)
# }
.annotate 'line', 2374

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
# var value: $P1
$P1 = self.'checkIdentifier'()
.annotate 'line', 2378
$S2 = $P1
ne $S2, '', __label_0
# {
.annotate 'line', 2379
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, "' is not defined"
.annotate 'line', 2380
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2382
.return($P1)
# }
.annotate 'line', 2383

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2384
# Body
# {
.annotate 'line', 2386
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2387
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2388
if_null $P2, __label_0
# {
.annotate 'line', 2389
$I1 = $P2['const']
unless $I1 goto __label_2
$P3 = $P2['id']
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
$P4 = $P2['value']
.annotate 'line', 2390
.return($P4)
__label_1: # endif
# }
__label_0: # endif
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
self.'annotate'(__ARG_1)
.annotate 'line', 2397
$P1 = self.'getIdentifier'()
__ARG_1.'emitset'(__ARG_2, $P1)
# }
.annotate 'line', 2398

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2399
# Body
# {
.annotate 'line', 2401
.tailcall self.'getIdentifier'()
# }
.annotate 'line', 2402

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2403
# Body
# {
.annotate 'line', 2405
self.'annotate'(__ARG_1)
.annotate 'line', 2406
# string typeleft: $S1
$P1 = self.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2407
# string lreg: $S2
$P1 = self.'getIdentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2408
$P2 = __ARG_2.'isnull'()
if_null $P2, __label_2
unless $P2 goto __label_2
# {
set $S5, $S1
set $S6, 'S'
.annotate 'line', 2409
if $S5 == $S6 goto __label_6
set $S6, 'P'
if $S5 == $S6 goto __label_7
goto __label_5
# switch
__label_6: # case
__label_7: # case
.annotate 'line', 2412
__ARG_1.'emitnull'($S2)
goto __label_4 # break
__label_5: # default
.annotate 'line', 2415
getattribute $P3, self, 'start'
'SyntaxError'("Can't assign null to that type", $P3)
__label_4: # switch end
# }
goto __label_3
__label_2: # else
.annotate 'line', 2418
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_8
.annotate 'line', 2419
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_9
__label_8: # else
# {
.annotate 'line', 2421
# string typeright: $S3
$P2 = __ARG_2.'checkResult'()
null $S3
if_null $P2, __label_10
set $S3, $P2
__label_10:
.annotate 'line', 2422
ne $S1, $S3, __label_11
# {
.annotate 'line', 2423
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_12
__label_11: # else
# {
.annotate 'line', 2426
# string rreg: $S4
$P3 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_13
set $S4, $P3
__label_13:
.annotate 'line', 2427
self.'annotate'(__ARG_1)
.annotate 'line', 2428
iseq $I1, $S1, 'P'
unless $I1 goto __label_16
isne $I1, $S3, 'P'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 2429
__ARG_1.'emitbox'($S2, $S4)
goto __label_15
__label_14: # else
.annotate 'line', 2431
__ARG_1.'emitset'($S2, $S4)
__label_15: # endif
# }
__label_12: # endif
# }
__label_9: # endif
__label_3: # endif
.annotate 'line', 2434
.return($S2)
# }
.annotate 'line', 2435

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2316
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2318
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2442
# Body
# {
.annotate 'line', 2444
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2445

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2440
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2453
# Body
# {
.annotate 'line', 2455
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2456
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2457

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2458
# Body
# {
.annotate 'line', 2460
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2461

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2462
# Body
# {
.annotate 'line', 2464
self.'optimizearg'()
.annotate 'line', 2465
.return(self)
# }
.annotate 'line', 2466

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2450
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2452
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2475
# Body
# {
.annotate 'line', 2477
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2478
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2479
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2480

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2481
# Body
# {
.annotate 'line', 2483
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2484
.return(self)
# }
.annotate 'line', 2485

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2486
# Body
# {
.annotate 'line', 2488
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2489

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2490
# Body
# {
.annotate 'line', 2492
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2493
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2494

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2495
# Body
# {
.annotate 'line', 2497
self.'optimizearg'()
.annotate 'line', 2498
.return(self)
# }
.annotate 'line', 2499

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2471
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2473
addattribute $P0, 'lexpr'
.annotate 'line', 2474
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2506
# Body
# {
.annotate 'line', 2508
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2509

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2510
# Body
# {
.annotate 'line', 2512
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2513
.return(self)
# }
.annotate 'line', 2514

.end # set


.sub 'optimize' :method

.annotate 'line', 2515
# Body
# {
.annotate 'line', 2517
self.'optimizearg'()
.annotate 'line', 2518
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2519
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2520
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2521
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2524
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2525
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2526
# float n: $N1
# predefined string
$S1 = $P2
set $N1, $S1
.annotate 'line', 2527
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2530
.return(self)
# }
.annotate 'line', 2531

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2532
# Body
# {
.annotate 'line', 2534
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2535
self.'annotate'(__ARG_1)
.annotate 'line', 2536
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2537

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2504
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2544
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkResult' :method

.annotate 'line', 2545
# Body
# {
.annotate 'line', 2547
.return('I')
# }
.annotate 'line', 2548

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2549
# Body
# {
.annotate 'line', 2551
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2552
.return(self)
# }
.annotate 'line', 2553

.end # set


.sub 'optimize' :method

.annotate 'line', 2554
# Body
# {
.annotate 'line', 2556
self.'optimizearg'()
.annotate 'line', 2557
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2558
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2559
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2560
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2561
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2563
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2564
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2565
.return(self)
# }
.annotate 'line', 2566

.end # optimize


.sub 'negated' :method

.annotate 'line', 2567
# Body
# {
.annotate 'line', 2569
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2570

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2571
# Body
# {
.annotate 'line', 2573
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2574
self.'annotate'(__ARG_1)
.annotate 'line', 2575
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2576
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2578
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2581
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2584
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2586

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2542
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2593
# Body
# {
.annotate 'line', 2595
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2596

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2599
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2600
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2601
.return(self)
# }
.annotate 'line', 2602

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2603
# Body
# {
.annotate 'line', 2605
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2606
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2607
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2608

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2609
# Body
# {
.annotate 'line', 2611
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2612
self.'annotate'(__ARG_1)
.annotate 'line', 2613
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2614
.return($S1)
# }
.annotate 'line', 2615

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2591
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2622
# Body
# {
.annotate 'line', 2624
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2625
.return(self)
# }
.annotate 'line', 2626

.end # set


.sub 'checkResult' :method

.annotate 'line', 2627
# Body
# {
.annotate 'line', 2629
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2630

.end # checkResult


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
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2636
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2637
.return($S1)
# }
.annotate 'line', 2638

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2620
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2645
# Body
# {
.annotate 'line', 2647
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2648

.end # checkResult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2649
# Body
# {
.annotate 'line', 2651
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2652
.return(self)
# }
.annotate 'line', 2653

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2654
# Body
# {
.annotate 'line', 2656
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2657
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2658
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2659

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2660
# Body
# {
.annotate 'line', 2662
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2663
self.'annotate'(__ARG_1)
.annotate 'line', 2664
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2665
.return($S1)
# }
.annotate 'line', 2666

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2643
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2673
# Body
# {
.annotate 'line', 2675
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2676
.return(self)
# }
.annotate 'line', 2677

.end # set


.sub 'checkResult' :method

.annotate 'line', 2678
# Body
# {
.annotate 'line', 2680
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 2681

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2682
# Body
# {
.annotate 'line', 2684
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2685
self.'annotate'(__ARG_1)
.annotate 'line', 2686
__ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 2687
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2688
.return($S1)
# }
.annotate 'line', 2689

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2671
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2698
# Body
# {
.annotate 'line', 2700
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2701
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2702
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2703
.return(self)
# }
.annotate 'line', 2704

.end # set


.sub 'checkResult' :method

.annotate 'line', 2705
# Body
# {
.annotate 'line', 2707
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2708
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkResult'()
goto __label_1
__label_0: # else
.annotate 'line', 2710
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2711

.end # checkResult


.sub 'optimize_base' :method

.annotate 'line', 2712
# Body
# {
.annotate 'line', 2714
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2715
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2716
.return(self)
# }
.annotate 'line', 2717

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2718
# Body
# {
.annotate 'line', 2720
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2721

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2694
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2696
addattribute $P0, 'lexpr'
.annotate 'line', 2697
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2728
# Body
# {
.annotate 'line', 2730
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2731
$S2 = __ARG_2
eq $S2, '', __label_1
# {
.annotate 'line', 2732
self.'annotate'(__ARG_1)
.annotate 'line', 2733
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2735

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2736
# Body
# {
.annotate 'line', 2738
self.'annotate'(__ARG_1)
.annotate 'line', 2739
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2740
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2741

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2726
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2748
# Body
# {
.annotate 'line', 2750
self.'annotate'(__ARG_1)
.annotate 'line', 2751
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2752
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
$S2 = __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2753
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2754

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2755
# Body
# {
.annotate 'line', 2757
self.'annotate'(__ARG_1)
.annotate 'line', 2758
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2759
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2760
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2761
.return($S1)
# }
.annotate 'line', 2762

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2746
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2769
# Body
# {
.annotate 'line', 2771
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2772
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2773
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2774

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2775
# Body
# {
.annotate 'line', 2777
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2778
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2779
# string ltype: $S1
$P3 = $P1.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2780
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2781
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2782
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2784
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2785
self.'annotate'(__ARG_1)
.annotate 'line', 2786
ne $S1, 'S', __label_6
# {
.annotate 'line', 2787
$P4 = $P2.'checkResult'()
$S5 = $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2788
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2789
__ARG_1.'say'($S4, ' = ', $S3)
set $S3, $S4
.annotate 'line', 2790
# }
__label_8: # endif
.annotate 'line', 2792
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2795
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2797
.return($S2)
# }
.annotate 'line', 2798

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2767
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2805
# Body
# {
.annotate 'line', 2807
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2808
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2809
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2810

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2811
# Body
# {
.annotate 'line', 2813
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2814
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2815
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2816
self.'annotate'(__ARG_1)
.annotate 'line', 2817
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2818
.return($S2)
# }
.annotate 'line', 2819

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2803
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2826
# Body
# {
.annotate 'line', 2828
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2829
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2830
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2831

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2832
# Body
# {
.annotate 'line', 2834
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2835
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2836
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2837
self.'annotate'(__ARG_1)
.annotate 'line', 2838
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2839
.return($S2)
# }
.annotate 'line', 2840

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2824
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2847
# Body
# {
.annotate 'line', 2849
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2850
$S2 = __ARG_2
eq $S2, '', __label_1
.annotate 'line', 2851
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2852

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2853
# Body
# {
.annotate 'line', 2855
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2856
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2857
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2858
self.'annotate'(__ARG_1)
.annotate 'line', 2859
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2860
.return($S2)
# }
.annotate 'line', 2861

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2845
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 2868
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2869
# Body
# {
.annotate 'line', 2871
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2872
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2873
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2874
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 2875
self.'annotate'(__ARG_1)
.annotate 'line', 2876
# string aux: $S5
null $S5
.annotate 'line', 2877
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 2879
ne $S1, 'I', __label_7
# {
.annotate 'line', 2880
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2881
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2882
# }
__label_7: # endif
.annotate 'line', 2884
ne $S2, 'I', __label_8
# {
.annotate 'line', 2885
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 2886
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2887
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 2890
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 2891
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2892
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 2893
# }
goto __label_10
__label_9: # else
.annotate 'line', 2895
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 2896
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 2897
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 2898
# }
goto __label_13
__label_12: # else
.annotate 'line', 2900
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 2901
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2902
__ARG_1.'say'($S5, ' = ', $S3)
set $S3, $S5
.annotate 'line', 2903
# }
goto __label_16
__label_15: # else
.annotate 'line', 2905
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 2906
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 2907
__ARG_1.'say'($S5, ' = ', $S4)
set $S4, $S5
.annotate 'line', 2908
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 2911
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 2913
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 2916
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 2919
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 2920
# }
.annotate 'line', 2922

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2923
# Body
# {
.annotate 'line', 2925
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2926

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2927
# Body
# {
.annotate 'line', 2929
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 2930

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2931
# Body
# {
.annotate 'line', 2933
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 2934

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2866
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 2947
# Body
# {
.annotate 'line', 2949
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 2950
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 2951
setattribute self, 'checknull', $P2
# }
.annotate 'line', 2952

.end # NullCheckerExpr


.sub 'checkResult' :method

.annotate 'line', 2953
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'isnegable' :method

.annotate 'line', 2954
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2955
# Body
# {
.annotate 'line', 2957
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 2958
setattribute self, 'checknull', $P1
.annotate 'line', 2959
.return(self)
# }
.annotate 'line', 2960

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2961
# Body
# {
.annotate 'line', 2963
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2964
self.'annotate'(__ARG_1)
.annotate 'line', 2965
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 2966
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 2967
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 2968

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2969
# Body
# {
.annotate 'line', 2971
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2972
self.'annotate'(__ARG_1)
.annotate 'line', 2973
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
.annotate 'line', 2974

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 2942
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2944
addattribute $P0, 'expr'
.annotate 'line', 2945
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2981
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 2982
# Body
# {
.annotate 'line', 2984
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 2985

.end # negated


.sub 'optimize' :method

.annotate 'line', 2986
# Body
# {
.annotate 'line', 2988
self.'optimizearg'()
.annotate 'line', 2989
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2990
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2991
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 2992
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 2993
unless $I1 goto __label_0
# {
.annotate 'line', 2994
unless $I2 goto __label_1
.annotate 'line', 2995
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 2997
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 2999
unless $I2 goto __label_3
.annotate 'line', 3000
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3001
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3002
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3003
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3004
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3005
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3006
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3007
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3010
.return(self)
# }
.annotate 'line', 3011

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3012
# Body
# {
.annotate 'line', 3014
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3015

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3016
# Body
# {
.annotate 'line', 3018
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3019

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3020
# Body
# {
.annotate 'line', 3022
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3023

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3024
# Body
# {
.annotate 'line', 3026
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3027

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 2979
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

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
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3038

.end # negated


.sub 'optimize' :method

.annotate 'line', 3039
# Body
# {
.annotate 'line', 3041
self.'optimizearg'()
.annotate 'line', 3042
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3043
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3044
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3045
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
.annotate 'line', 3046
unless $I1 goto __label_0
# {
.annotate 'line', 3047
unless $I2 goto __label_1
.annotate 'line', 3048
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3050
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3052
unless $I2 goto __label_3
.annotate 'line', 3053
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3054
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3055
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3056
# string rtype: $S2
$P8 = $P2.'checkResult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3057
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3058
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3059
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3060
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3063
.return(self)
# }
.annotate 'line', 3064

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3065
# Body
# {
.annotate 'line', 3067
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3068

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3069
# Body
# {
.annotate 'line', 3071
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3072

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3073
# Body
# {
.annotate 'line', 3075
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3076

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3077
# Body
# {
.annotate 'line', 3079
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3080

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3032
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

.annotate 'line', 3088
# Body
# {
.annotate 'line', 3090
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3091
setattribute self, 'positive', $P1
# }
.annotate 'line', 3092

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3093
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3094
# Body
# {
.annotate 'line', 3096
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3097
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
.annotate 'line', 3098

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3099
# Body
# {
.annotate 'line', 3101
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3102
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3103
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3104

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3105
# Body
# {
.annotate 'line', 3107
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3108

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3112
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3113
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3114

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3115
# Body
# {
.annotate 'line', 3117
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3118
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3119
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3120

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3085
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3087
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3127
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3128
# Body
# {
.annotate 'line', 3130
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3131

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3135

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3139

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3140
# Body
# {
.annotate 'line', 3142
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3143

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3125
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3150
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3151
# Body
# {
.annotate 'line', 3153
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3154

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3155
# Body
# {
.annotate 'line', 3157
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3158

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3159
# Body
# {
.annotate 'line', 3161
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3162

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3163
# Body
# {
.annotate 'line', 3165
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3166

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3148
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

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
new $P1, [ 'OpGreaterExpr' ]
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
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
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
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
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
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3189

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3171
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

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
new $P1, [ 'OpLessExpr' ]
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
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
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
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
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
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3212

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3194
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3219
# Body
# {
.annotate 'line', 3221
.return('I')
# }
.annotate 'line', 3222

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3217
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3229
# Body
# {
.annotate 'line', 3231
self.'optimizearg'()
.annotate 'line', 3232
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3233
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3234
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3235
eq $I1, 0, __label_1
.annotate 'line', 3236
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3238
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3240
.return(self)
# }
.annotate 'line', 3241

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3242
# Body
# {
.annotate 'line', 3244
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
.annotate 'line', 3245
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3246
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3247
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3248
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3249
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3250
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3253
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3254
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3255
__ARG_1.'say'('unless ', $S1, ' goto ', $S4)
.annotate 'line', 3256
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3257
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3259

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3227
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
self.'optimizearg'()
.annotate 'line', 3269
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3270
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3271
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3272
ne $I1, 0, __label_1
.annotate 'line', 3273
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3275
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3277
.return(self)
# }
.annotate 'line', 3278

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3279
# Body
# {
.annotate 'line', 3281
# string res: $S1
null $S1
.annotate 'line', 3282
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3285
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3286
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3287
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3288
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3289
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3290
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3291
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3294
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3295
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3296
__ARG_1.'say'('if ', $S1, ' goto ', $S4)
.annotate 'line', 3297
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3298
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3300

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3264
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3307
# Body
# {
.annotate 'line', 3309
.return('I')
# }
.annotate 'line', 3310

.end # checkResult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3305
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3317
# Body
# {
.annotate 'line', 3319
self.'optimizearg'()
.annotate 'line', 3320
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3321
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3322
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3323
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3324
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3325
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3327
.return(self)
# }
.annotate 'line', 3328

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3329
# Body
# {
.annotate 'line', 3331
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
.annotate 'line', 3332
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3333
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3334
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3335
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3336
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3337

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3315
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3344
# Body
# {
.annotate 'line', 3346
self.'optimizearg'()
.annotate 'line', 3347
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3348
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3349
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3350
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3351
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3352
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3354
.return(self)
# }
.annotate 'line', 3355

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3356
# Body
# {
.annotate 'line', 3358
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
.annotate 'line', 3359
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3360
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3361
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3362
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3363
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3364

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3342
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3372
# Body
# {
.annotate 'line', 3374
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3375
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3376
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3377
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3378
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3380
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3382
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3383
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3384
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3387
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3388

.end # ConcatString


.sub 'checkResult' :method

.annotate 'line', 3389
# Body
# {
.return('S')
# }

.end # checkResult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3390
# Body
# {
.annotate 'line', 3392
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3393
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3394
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3395
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3396
ge $I2, $I1, __label_1
.annotate 'line', 3397
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
# predefined string
$S1 = $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3396
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3398
.return($P2)
# }
.annotate 'line', 3399

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3400
# Body
# {
.annotate 'line', 3402
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3403
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3404
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3405
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3406
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3407
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3408
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3407
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3409
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3410

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3411
# Body
# {
.annotate 'line', 3413
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3414
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3415
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3416
self.'annotate'(__ARG_1)
$P2 = $P1[0]
$P3 = $P1[1]
.annotate 'line', 3417
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3418
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
$P3 = $P1[$I2]
.annotate 'line', 3419
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3418
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3420
.return($S1)
# }
.annotate 'line', 3421

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3422
# Body
# {
.annotate 'line', 3424
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3425
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3426
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3427
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
$P2 = $P1[$I2]
.annotate 'line', 3428
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3427
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3429

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3369
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3371
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3436
# Body
# {
.annotate 'line', 3438
self.'optimizearg'()
.annotate 'line', 3439
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3440
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3441
# string ltype: $S1
$P10 = $P1.'checkResult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3442
# string rtype: $S2
$P10 = $P2.'checkResult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3443
$I4 = $P1.'isliteral'()
unless $I4 goto __label_3
$I4 = $P2.'isliteral'()
__label_3:
unless $I4 goto __label_2
# {
.annotate 'line', 3444
iseq $I5, $S1, 'S'
unless $I5 goto __label_5
iseq $I5, $S2, 'S'
__label_5:
unless $I5 goto __label_4
# {
.annotate 'line', 3445
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3446
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3447
# var t: $P5
null $P5
.annotate 'line', 3448
# int newtype: $I1
null $I1
.annotate 'line', 3449
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3450
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3451
isa $I4, $P3, 'TypeSingleQuoted'
unless $I4 goto __label_10
isa $I4, $P4, 'TypeSingleQuoted'
__label_10:
unless $I4 goto __label_8
.annotate 'line', 3452
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3454
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3455
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3457
iseq $I5, $S1, 'I'
unless $I5 goto __label_12
iseq $I5, $S2, 'I'
__label_12:
unless $I5 goto __label_11
# {
.annotate 'line', 3458
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3459
# int ln: $I2
set $P15, $P6
set $I2, $P15
.annotate 'line', 3460
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3461
# int rn: $I3
set $P16, $P7
set $I3, $P16
.annotate 'line', 3462
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I6, $I2, $I3
.tailcall 'integerValue'($P17, $P18, $I6)
# }
__label_11: # endif
# {
.annotate 'line', 3465
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3466
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3467
# float lf: $N1
# predefined string
$S5 = $P8
set $N1, $S5
.annotate 'line', 3468
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3469
# float rf: $N2
# predefined string
$S6 = $P9
set $N2, $S6
.annotate 'line', 3470
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3474
iseq $I6, $S1, 'S'
unless $I6 goto __label_15
iseq $I6, $S2, 'S'
__label_15:
unless $I6 goto __label_14
# {
.annotate 'line', 3475
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3477
.return(self)
# }
.annotate 'line', 3478

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3479
# Body
# {
.annotate 'line', 3481
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3482
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3483
ne $S1, $S2, __label_2
.annotate 'line', 3484
.return($S1)
__label_2: # endif
.annotate 'line', 3485
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3486
.return('S')
__label_3: # endif
.annotate 'line', 3487
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3488
.return('S')
__label_5: # endif
.annotate 'line', 3489
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3490
.return('N')
__label_7: # endif
.annotate 'line', 3491
.return('I')
# }
.annotate 'line', 3492

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3493
# Body
# {
.annotate 'line', 3495
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3496
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3497
# string restype: $S1
$P3 = self.'checkResult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3498
# string ltype: $S2
$P3 = $P1.'checkResult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3499
# string rtype: $S3
$P4 = $P2.'checkResult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3501
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3502
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3503
ne $S1, 'S', __label_5
# {
.annotate 'line', 3504
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3505
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3506
eq $S2, 'S', __label_10
# {
.annotate 'line', 3507
__ARG_1.'say'($S6, ' = ', $S4)
set $S4, $S6
.annotate 'line', 3508
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3511
__ARG_1.'say'($S6, ' = ', $S5)
set $S5, $S6
.annotate 'line', 3512
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3515
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3518
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3519
# string l: $S7
null $S7
.annotate 'line', 3520
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3522
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3523
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3525
# string r: $S8
null $S8
.annotate 'line', 3526
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3528
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3529
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3531
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3534
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3536

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3434
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3543
# Body
# {
.annotate 'line', 3545
self.'optimizearg'()
.annotate 'line', 3546
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3547
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3548
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3549
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3550
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3551
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3552
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3553
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3554
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3555
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3556
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3559
.return(self)
# }
.annotate 'line', 3560

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3561
# Body
# {
.annotate 'line', 3563
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkResult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3564
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkResult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3565
ne $S1, $S2, __label_2
.annotate 'line', 3566
.return($S1)
__label_2: # endif
.annotate 'line', 3567
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3568
.return('N')
__label_3: # endif
.annotate 'line', 3569
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3570
.return('N')
__label_5: # endif
.annotate 'line', 3571
.return('I')
# }
.annotate 'line', 3572

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3573
# Body
# {
.annotate 'line', 3575
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3576
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3577
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3578

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3541
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3585
# Body
# {
.annotate 'line', 3587
self.'optimizearg'()
.annotate 'line', 3588
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3589
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3590
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3591
# string ltype: $S1
$P7 = $P1.'checkResult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3592
# string rtype: $S2
$P7 = $P2.'checkResult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3593
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3594
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3595
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3596
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3597
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3598
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
set $I5, $I1
set $I6, $I2
mul $I4, $I5, $I6
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3601
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3602
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3603
# float lf: $N1
# predefined string
$S3 = $P5
set $N1, $S3
.annotate 'line', 3604
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3605
# float rf: $N2
# predefined string
$S3 = $P6
set $N2, $S3
.annotate 'line', 3606
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3610
.return(self)
# }
.annotate 'line', 3611

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3612
# Body
# {
.annotate 'line', 3614
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3615
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3616
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkResult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3617
ne $S1, $S2, __label_2
.annotate 'line', 3618
.return($S1)
__label_2: # endif
.annotate 'line', 3619
ne $S1, 'S', __label_3
.annotate 'line', 3620
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3622
.return('N')
__label_4: # endif
# }
.annotate 'line', 3623

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3624
# Body
# {
.annotate 'line', 3626
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3627
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3628
# var ltype: $P3
$P3 = $P1.'checkResult'()
.annotate 'line', 3629
$S10 = $P3
ne $S10, 'S', __label_0
# {
.annotate 'line', 3630
# string lreg: $S1
$P4 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_1
set $S1, $P4
__label_1:
.annotate 'line', 3631
# string rreg: $S2
$P4 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 3632
# string rval: $S3
null $S3
.annotate 'line', 3633
$P5 = $P2.'checkResult'()
set $S10, $P5
set $S11, 'I'
if $S10 == $S11 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S3, $S2
goto __label_3 # break
__label_4: # default
.annotate 'line', 3638
$P6 = self.'tempreg'('I')
set $S3, $P6
.annotate 'line', 3639
__ARG_1.'emitset'($S3, $S2)
__label_3: # switch end
.annotate 'line', 3641
self.'annotate'(__ARG_1)
.annotate 'line', 3642
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S1, ', ', $S3)
.annotate 'line', 3643
.return()
# }
__label_0: # endif
.annotate 'line', 3648
$S11 = $P3
ne $S11, 'N', __label_6
# {
.annotate 'line', 3649
# string lreg: $S4
$P5 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_7
set $S4, $P5
__label_7:
.annotate 'line', 3650
# string rreg: $S5
$P6 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P6, __label_8
set $S5, $P6
__label_8:
.annotate 'line', 3651
# string rval: $S6
null $S6
.annotate 'line', 3652
$P7 = $P2.'checkResult'()
set $S12, $P7
set $S13, 'I'
if $S12 == $S13 goto __label_11
set $S13, 'N'
if $S12 == $S13 goto __label_12
goto __label_10
# switch
__label_11: # case
.annotate 'line', 3654
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3655
__ARG_1.'emitset'($S6, $S5)
set $S6, $S5
goto __label_9 # break
__label_12: # case
set $S6, $S5
goto __label_9 # break
__label_10: # default
.annotate 'line', 3662
$P9 = self.'tempreg'('N')
set $S6, $P9
.annotate 'line', 3663
__ARG_1.'emitset'($S6, $S5)
__label_9: # switch end
.annotate 'line', 3665
self.'annotate'(__ARG_1)
.annotate 'line', 3666
__ARG_1.'say'('mul ', __ARG_2, ', ', $S4, ', ', $S6)
.annotate 'line', 3667
.return()
# }
__label_6: # endif
.annotate 'line', 3670
# string rleft: $S7
null $S7
.annotate 'line', 3671
# string rright: $S8
null $S8
.annotate 'line', 3672
# int nleft: $I1
null $I1
.annotate 'line', 3673
# int nright: $I2
null $I2
.annotate 'line', 3674
$P7 = $P1.'issimple'()
isfalse $I3, $P7
if $I3 goto __label_15
$I3 = $P1.'isidentifier'()
__label_15:
unless $I3 goto __label_13
# {
.annotate 'line', 3675
$P9 = self.'checkResult'()
$P8 = self.'tempreg'($P9)
set $S7, $P8
.annotate 'line', 3676
$P1.'emit'(__ARG_1, $S7)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 3679
$P10 = $P1.'getIntegerValue'()
set $I1, $P10
set $S7, $I1
.annotate 'line', 3680
# }
__label_14: # endif
.annotate 'line', 3682
$P10 = $P2.'issimple'()
isfalse $I3, $P10
if $I3 goto __label_18
$I3 = $P2.'isidentifier'()
__label_18:
unless $I3 goto __label_16
# {
.annotate 'line', 3683
$P12 = self.'checkResult'()
$P11 = self.'tempreg'($P12)
set $S8, $P11
.annotate 'line', 3684
$P2.'emit'(__ARG_1, $S8)
# }
goto __label_17
__label_16: # else
# {
.annotate 'line', 3687
# string type: $S9
$P11 = $P2.'checkResult'()
null $S9
if_null $P11, __label_19
set $S9, $P11
__label_19:
set $S12, $S9
set $S13, 'S'
.annotate 'line', 3688
if $S12 == $S13 goto __label_22
set $S13, 'I'
if $S12 == $S13 goto __label_23
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3690
$P13 = self.'checkResult'()
$P12 = self.'tempreg'($P13)
set $S8, $P12
.annotate 'line', 3691
$P2.'emit'(__ARG_1, $S8)
goto __label_20 # break
__label_23: # case
__label_21: # default
.annotate 'line', 3695
$P14 = $P2.'getIntegerValue'()
set $I2, $P14
set $S8, $I2
goto __label_20 # break
__label_20: # switch end
.annotate 'line', 3697
# }
__label_17: # endif
.annotate 'line', 3700
self.'annotate'(__ARG_1)
.annotate 'line', 3701
__ARG_1.'say'('mul ', __ARG_2, ', ', $S7, ', ', $S8)
# }
.annotate 'line', 3702

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3583
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3709
# Body
# {
.annotate 'line', 3711
self.'optimizearg'()
.annotate 'line', 3712
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3713
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3714
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3715
# string ltype: $S1
$P5 = $P1.'checkResult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3716
# string rtype: $S2
$P5 = $P2.'checkResult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3717
# var lval: $P3
null $P3
.annotate 'line', 3718
# var rval: $P4
null $P4
.annotate 'line', 3719
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3720
getattribute $P3, $P1, 'numval'
.annotate 'line', 3721
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3722
getattribute $P4, $P2, 'numval'
.annotate 'line', 3723
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3724
eq $I2, 0, __label_6
.annotate 'line', 3725
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
.annotate 'line', 3728
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3729
getattribute $P3, $P1, 'numval'
.annotate 'line', 3730
# float lf: $N1
# predefined string
$S3 = $P3
set $N1, $S3
.annotate 'line', 3731
getattribute $P4, $P2, 'numval'
.annotate 'line', 3732
# float rf: $N2
# predefined string
$S3 = $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3733
eq $N2, $N3, __label_8
.annotate 'line', 3734
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
.annotate 'line', 3738
.return(self)
# }
.annotate 'line', 3739

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 3740
# Body
# {
.annotate 'line', 3742
.return('N')
# }
.annotate 'line', 3743

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3744
# Body
# {
.annotate 'line', 3746
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3747
# var lreg: $P2
null $P2
.annotate 'line', 3748
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_0
.annotate 'line', 3749
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3751
$P2 = self.'tempreg'('N')
.annotate 'line', 3752
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3754
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3755
# var rreg: $P4
null $P4
.annotate 'line', 3756
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'N', __label_2
.annotate 'line', 3757
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3759
$P4 = self.'tempreg'('N')
.annotate 'line', 3760
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3762
self.'annotate'(__ARG_1)
.annotate 'line', 3763
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3764

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3707
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3771
# Body
# {
.annotate 'line', 3773
.return('I')
# }
.annotate 'line', 3774

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3775
# Body
# {
.annotate 'line', 3777
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3778
# var lreg: $P2
null $P2
.annotate 'line', 3779
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3780
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3782
$P2 = self.'tempreg'('I')
.annotate 'line', 3783
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3785
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3786
# var rreg: $P4
null $P4
.annotate 'line', 3787
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3788
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3790
$P4 = self.'tempreg'('I')
.annotate 'line', 3791
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3793
self.'annotate'(__ARG_1)
.annotate 'line', 3794
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3795

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3769
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkResult' :method

.annotate 'line', 3802
# Body
# {
.annotate 'line', 3804
.return('I')
# }
.annotate 'line', 3805

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3806
# Body
# {
.annotate 'line', 3808
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3809
# var lreg: $P2
null $P2
.annotate 'line', 3810
$P5 = $P1.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_0
.annotate 'line', 3811
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3813
$P2 = self.'tempreg'('I')
.annotate 'line', 3814
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3816
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3817
# var rreg: $P4
null $P4
.annotate 'line', 3818
$P5 = $P3.'checkResult'()
$S1 = $P5
ne $S1, 'I', __label_2
.annotate 'line', 3819
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3821
$P4 = self.'tempreg'('I')
.annotate 'line', 3822
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3824
self.'annotate'(__ARG_1)
.annotate 'line', 3829
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3830

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3800
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3839
# Body
# {
.annotate 'line', 3841
setattribute self, 'arg', __ARG_1
.annotate 'line', 3842
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3843

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3844
# Body
# {
.annotate 'line', 3846
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3847
.return(self)
# }
.annotate 'line', 3848

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3849
# Body
# {
.annotate 'line', 3851
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3852

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3837
addattribute $P0, 'arg'
.annotate 'line', 3838
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3855
# Body
# {
.annotate 'line', 3857
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 3858
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 3859
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 3860
.return(1)
# }
.annotate 'line', 3861

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3870
# Body
# {
.annotate 'line', 3872
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3873
setattribute self, 'predef', __ARG_3
.annotate 'line', 3874
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 3875

.end # CallPredefExpr


.sub 'checkResult' :method

.annotate 'line', 3876
# Body
# {
.annotate 'line', 3878
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 3879

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3880
# Body
# {
.annotate 'line', 3882
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 3883
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 3884
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 3885
# var arg: $P4
null $P4
.annotate 'line', 3886
# int np: $I1
$P5 = $P1.'params'()
set $I1, $P5
.annotate 'line', 3887
ne $I1, -1, __label_0
# {
.annotate 'line', 3888
iter $P6, $P2
set $P6, 0
__label_2: # for iteration
unless $P6 goto __label_3
shift $P4, $P6
# {
.annotate 'line', 3889
# string reg: $S1
getattribute $P7, $P4, 'arg'
$P5 = $P7.'emit_get'(__ARG_1)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 3890
$P3.'push'($S1)
# }
goto __label_2
__label_3: # endfor
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 3894
# int n: $I2
getattribute $P7, self, 'args'
set $I2, $P7
# for loop
.annotate 'line', 3895
# int i: $I3
null $I3
__label_7: # for condition
ge $I3, $I2, __label_6
# {
.annotate 'line', 3896
$P8 = $P2[$I3]
getattribute $P4, $P8, 'arg'
.annotate 'line', 3897
# string argtype: $S2
$P8 = $P4.'checkResult'()
null $S2
if_null $P8, __label_8
set $S2, $P8
__label_8:
.annotate 'line', 3898
# string paramtype: $S3
$P9 = $P1.'paramtype'($I3)
null $S3
if_null $P9, __label_9
set $S3, $P9
__label_9:
.annotate 'line', 3899
# string argr: $S4
null $S4
.annotate 'line', 3900
iseq $I4, $S2, $S3
if $I4 goto __label_12
iseq $I4, $S3, '?'
__label_12:
unless $I4 goto __label_10
.annotate 'line', 3901
$P9 = $P4.'emit_get'(__ARG_1)
set $S4, $P9
goto __label_11
__label_10: # else
# {
.annotate 'line', 3903
$P10 = self.'tempreg'($S3)
set $S4, $P10
.annotate 'line', 3904
ne $S3, 'P', __label_13
# {
.annotate 'line', 3905
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 3906
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
.annotate 'line', 3911
eq $S5, '', __label_19
.annotate 'line', 3912
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_19: # endif
# }
__label_13: # endif
.annotate 'line', 3914
$P4.'emit'(__ARG_1, $S4)
# }
__label_11: # endif
.annotate 'line', 3916
$P3.'push'($S4)
# }
__label_5: # for iteration
.annotate 'line', 3895
inc $I3
goto __label_7
__label_6: # for end
# }
__label_1: # endif
.annotate 'line', 3919
getattribute $P10, self, 'predef'
getattribute $P11, self, 'start'
$P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P3)
# }
.annotate 'line', 3920

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 3865
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3867
addattribute $P0, 'predef'
.annotate 'line', 3868
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3930
# Body
# {
.annotate 'line', 3932
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 3933
setattribute self, 'funref', __ARG_4
.annotate 'line', 3934
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 3935
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 3936
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 3937
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 3938
# {
.annotate 'line', 3939
# var modifier: $P2
null $P2
.annotate 'line', 3940
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 3941
$P1 = __ARG_1.'get'()
.annotate 'line', 3942
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 3943
$P1 = __ARG_1.'get'()
.annotate 'line', 3944
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 3945
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 3946
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3949
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 3952
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 3953
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 3954
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 3955
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 3957

.end # CallExpr


.sub 'checkResult' :method

.annotate 'line', 3958
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 3959
# Body
# {
.annotate 'line', 3961
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 3962
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 3963
'optimize_array'($P1)
.annotate 'line', 3966
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 3967
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 3968
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 3969
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 3970
if_null $P3, __label_2
# {
.annotate 'line', 3971
self.'use_predef'($S1)
.annotate 'line', 3974
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 3975
if_null $P4, __label_3
# {
.annotate 'line', 3976
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 3977
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 3980
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
.annotate 'line', 3984
.return(self)
# }
.annotate 'line', 3985

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3986
# Body
# {
.annotate 'line', 3988
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 3989
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 3990
# string call: $S1
null $S1
.annotate 'line', 3991
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 3992
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 3993
ne $S1, '', __label_2
# {
.annotate 'line', 3994
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, "'"
set $S1, $S0
.annotate 'line', 3995
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3999
unless $I1 goto __label_5
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4001
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4002
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4003
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4004
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4005
# string reg: $S3
null $S3
.annotate 'line', 4006
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4007
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4008
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4011
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4012
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4014
self.'annotate'(__ARG_1)
.annotate 'line', 4016
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
$S8 = __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
.annotate 'line', 4017
$S9 = __ARG_2
ne $S9, '.tailcall', __label_12
.annotate 'line', 4018
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4020
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
.annotate 'line', 4023
unless $I1 goto __label_14
.annotate 'line', 4024
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4026
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4028
__ARG_1.'print'('(')
.annotate 'line', 4030
# string sep: $S4
set $S4, ''
.annotate 'line', 4031
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4032
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4033
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4034
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4035
# int isflat: $I4
null $I4
.annotate 'line', 4036
# int isnamed: $I5
null $I5
.annotate 'line', 4037
# string setname: $S6
set $S6, ''
.annotate 'line', 4038
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4039
if_null $P6, __label_19
# {
.annotate 'line', 4040
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4041
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4042
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4044
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4046
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
.annotate 'line', 4050
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4051
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4052
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4053
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4056
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
.annotate 'line', 4061
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4062
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
.annotate 'line', 4063
unless $I4 goto __label_32
.annotate 'line', 4064
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
.annotate 'line', 4065
unless $I5 goto __label_34
# {
.annotate 'line', 4066
__ARG_1.'print'(' :named')
.annotate 'line', 4067
eq $S6, '', __label_35
.annotate 'line', 4068
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4070
# }
__label_16: # for iteration
.annotate 'line', 4032
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4072
__ARG_1.'say'(')')
# }
.annotate 'line', 4073

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 3925
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3927
addattribute $P0, 'funref'
.annotate 'line', 3928
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4083
# Body
# {
.annotate 'line', 4085
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4086
setattribute self, 'left', __ARG_4
.annotate 'line', 4087
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4088

.end # MemberExpr


.sub 'checkResult' :method

.annotate 'line', 4089
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4090
# Body
# {
.annotate 'line', 4092
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4093
.return(self)
# }
.annotate 'line', 4094

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4095
# Body
# {
.annotate 'line', 4097
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4098

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4099
# Body
# {
.annotate 'line', 4101
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4102
# string type: $S1
$P2 = $P1.'checkResult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4103
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4104
eq $S1, 'P', __label_2
# {
.annotate 'line', 4105
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4106
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4107
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4109
.return($S2)
# }
.annotate 'line', 4110

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4111
# Body
# {
.annotate 'line', 4113
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4114
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4115
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4116
self.'annotate'(__ARG_1)
.annotate 'line', 4117
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4118
.return($S3)
# }
.annotate 'line', 4119

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4120
# Body
# {
.annotate 'line', 4122
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4123
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4124
self.'annotate'(__ARG_1)
.annotate 'line', 4125
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4126

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4127
# Body
# {
.annotate 'line', 4129
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4130
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4131
# string value: $S3
null $S3
.annotate 'line', 4132
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4134
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4135
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4136
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4138
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4141
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4142
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4144
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4145

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4146
# Body
# {
.annotate 'line', 4148
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4149
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4150
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4151
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4152
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4154
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4155
$P4 = __ARG_2.'checkResult'()
$S5 = $P4
eq $S5, 'P', __label_6
.annotate 'line', 4156
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4158
# }
__label_4: # endif
.annotate 'line', 4160
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4161
.return($S3)
# }
.annotate 'line', 4162

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4078
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4080
addattribute $P0, 'left'
.annotate 'line', 4081
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4171
# Body
# {
.annotate 'line', 4173
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4174
setattribute self, 'left', __ARG_4
.annotate 'line', 4175
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4176

.end # IndexExpr


.sub 'checkResult' :method

.annotate 'line', 4177
# Body
# {
.annotate 'line', 4179
getattribute $P2, self, 'left'
$P1 = $P2.'checkResult'()
$S1 = $P1
ne $S1, 'S', __label_0
.annotate 'line', 4180
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4182
.return('P')
__label_1: # endif
# }
.annotate 'line', 4183

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4184
# Body
# {
.annotate 'line', 4186
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4187
self.'optimizeargs'()
.annotate 'line', 4188
.return(self)
# }
.annotate 'line', 4189

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4190
# Body
# {
.annotate 'line', 4192
# var regleft: $P1
null $P1
.annotate 'line', 4193
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4194
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4196
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4197
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4198
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4199
# string type: $S1
$P4 = self.'checkResult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4200
ne $S1, 'S', __label_3
# {
.annotate 'line', 4201
eq $I1, 1, __label_5
.annotate 'line', 4202
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4203
$P6 = self.'getarg'(0)
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4206
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
# predefined join
.annotate 'line', 4207
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4208
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4210

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4211
# Body
# {
.annotate 'line', 4213
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4214
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4215
self.'annotate'(__ARG_1)
.annotate 'line', 4216
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4217
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4218
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4219

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4220
# Body
# {
.annotate 'line', 4222
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4223
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4224
# string rreg: $S1
null $S1
.annotate 'line', 4225
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4226
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4227
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4230
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4231
self.'annotate'(__ARG_1)
.annotate 'line', 4232
__ARG_1.'print'($P1, '[')
# predefined join
.annotate 'line', 4233
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4234
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4235
.return($S1)
# }
.annotate 'line', 4236

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4167
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4169
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4245
# Body
# {
.annotate 'line', 4247
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4248
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4249
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4250
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4251
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4252
# {
.annotate 'line', 4253
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4254
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4255
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4256
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4257
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4259

.end # ArrayExpr


.sub 'checkResult' :method

.annotate 'line', 4260
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4261
# Body
# {
.annotate 'line', 4263
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4264
.return(self)
# }
.annotate 'line', 4265

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4266
# Body
# {
.annotate 'line', 4268
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4269
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4270

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4271
# Body
# {
.annotate 'line', 4273
self.'annotate'(__ARG_1)
.annotate 'line', 4274
# string container: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4275
__ARG_1.'say'('root_new ', $S1, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4276
# string it_p: $S2
$P2 = self.'tempreg'('P')
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4277
# string itemreg: $S3
null $S3
.annotate 'line', 4278
getattribute $P3, self, 'values'
iter $P4, $P3
set $P4, 0
__label_2: # for iteration
unless $P4 goto __label_3
shift $P1, $P4
# {
.annotate 'line', 4279
# string type: $S4
$P5 = $P1.'checkResult'()
null $S4
if_null $P5, __label_4
set $S4, $P5
__label_4:
set $S6, $S4
set $S7, 'I'
.annotate 'line', 4280
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
.annotate 'line', 4282
# string aux: $S5
$P3 = $P1.'emit_get'(__ARG_1)
null $S5
if_null $P3, __label_10
set $S5, $P3
__label_10:
.annotate 'line', 4283
__ARG_1.'emitbox'($S2, $S5)
set $S3, $S2
goto __label_5 # break
__label_6: # default
.annotate 'line', 4287
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
__label_5: # switch end
.annotate 'line', 4289
self.'annotate'(__ARG_1)
.annotate 'line', 4290
__ARG_1.'say'($S1, ".'push'(", $S3, ")")
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 4292
.return($S1)
# }
.annotate 'line', 4293

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4241
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4243
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4303
# Body
# {
.annotate 'line', 4305
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4306
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4307
# var keys: $P2
root_new $P6, ['parrot';'ResizablePMCArray']
set $P2, $P6
.annotate 'line', 4308
# var values: $P3
root_new $P6, ['parrot';'ResizablePMCArray']
set $P3, $P6
.annotate 'line', 4309
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_0
# {
.annotate 'line', 4310
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4311
# {
.annotate 'line', 4312
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4313
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4314
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4315
$P2.'push'($P4)
.annotate 'line', 4316
$P3.'push'($P5)
# }
.annotate 'line', 4318
$P1 = __ARG_1.'get'()
$P8 = $P1.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 4319
$P9 = $P1.'isop'('}')
isfalse $I1, $P9
unless $I1 goto __label_4
.annotate 'line', 4320
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4322
setattribute self, 'keys', $P2
.annotate 'line', 4323
setattribute self, 'values', $P3
# }
.annotate 'line', 4324

.end # HashExpr


.sub 'checkResult' :method

.annotate 'line', 4325
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'optimize' :method

.annotate 'line', 4326
# Body
# {
.annotate 'line', 4328
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4329
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4330
.return(self)
# }
.annotate 'line', 4331

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4332
# Body
# {
.annotate 'line', 4334
self.'annotate'(__ARG_1)
.annotate 'line', 4335
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
.annotate 'line', 4336
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4337
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4338
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4339
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 4340
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4341
# string item: $S1
null $S1
.annotate 'line', 4342
$P5 = $P3.'isidentifier'()
if_null $P5, __label_3
unless $P5 goto __label_3
# {
.annotate 'line', 4343
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_5
set $S2, $P6
__label_5:
.annotate 'line', 4344
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4345
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_4
__label_3: # else
.annotate 'line', 4348
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_4: # endif
.annotate 'line', 4350
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4351
# string itemreg: $S3
null $S3
.annotate 'line', 4352
$P7 = $P4.'isidentifier'()
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4353
# string s: $S4
$P8 = $P4.'checkIdentifier'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4354
isnull $I3, $S4
not $I3
unless $I3 goto __label_11
isne $I3, $S4, ''
__label_11:
unless $I3 goto __label_9
set $S3, $S4
goto __label_10
__label_9: # else
.annotate 'line', 4355
# {
.annotate 'line', 4357
# string id: $S5
$P8 = $P4.'getName'()
null $S5
if_null $P8, __label_12
set $S5, $P8
__label_12:
.annotate 'line', 4358
getattribute $P10, self, 'owner'
$P9 = $P10.'getvar'($S5)
unless_null $P9, __label_13
# {
.annotate 'line', 4359
$P11 = self.'tempreg'('P')
set $S3, $P11
.annotate 'line', 4360
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_14
__label_13: # else
.annotate 'line', 4363
$P9 = $P4.'emit_get'(__ARG_1)
set $S3, $P9
__label_14: # endif
# }
__label_10: # endif
# }
goto __label_7
__label_6: # else
.annotate 'line', 4367
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_7: # endif
.annotate 'line', 4368
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
# }
__label_0: # for iteration
.annotate 'line', 4339
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 4370

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4371
# Body
# {
.annotate 'line', 4373
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4374
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4375
.return($S1)
# }
.annotate 'line', 4376

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4298
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4300
addattribute $P0, 'keys'
.annotate 'line', 4301
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkResult' :method

.annotate 'line', 4385
# Body
# {
.return('P')
# }

.end # checkResult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4386
# Body
# {
.annotate 'line', 4390
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4391
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4392
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4393
__ARG_1.'unget'($P2)
.annotate 'line', 4394
# var initializer: $P3
root_new $P5, ['parrot';'ResizablePMCArray']
set $P3, $P5
__label_1: # do
.annotate 'line', 4395
# {
.annotate 'line', 4396
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4397
$P3.'push'($P4)
# }
.annotate 'line', 4398
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4399
setattribute self, 'initializer', $P3
.annotate 'line', 4400
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4402

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4381
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4383
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4411
# Body
# {
.annotate 'line', 4413
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4415
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4416
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4417
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4418
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4419
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4420
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4421
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4422
# {
.annotate 'line', 4423
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4424
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4425
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4426
$P2.'push'($P3)
# }
.annotate 'line', 4427
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4428
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4431
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4434
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4436
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4437
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4439
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4440

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4441
# Body
# {
.annotate 'line', 4443
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4444
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4447
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4448
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4449
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4450
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4451
$P1 = $P3['value']
.annotate 'line', 4452
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4453
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4454
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4457
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4461
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4462
if_null $P4, __label_7
.annotate 'line', 4463
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4464
.return(self)
# }
.annotate 'line', 4465

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4466
# Body
# {
.annotate 'line', 4468
self.'annotate'(__ARG_1)
.annotate 'line', 4470
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4471
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
.annotate 'line', 4474
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4475
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4476
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
.annotate 'line', 4478
# string reginit: $S1
set $S1, ''
.annotate 'line', 4479
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4480
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4481
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4485
ne $I2, 1, __label_13
.annotate 'line', 4486
$P10 = self.'tempreg'('P')
set $S2, $P10
goto __label_14
__label_13: # else
# {
.annotate 'line', 4488
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4489
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4490
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4494
isne $I4, $I2, 1
unless $I4 goto __label_16
isne $I4, $I2, 2
__label_16:
unless $I4 goto __label_15
.annotate 'line', 4495
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_15: # endif
.annotate 'line', 4496
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_9: # switch end
set $I5, $I2
null $I6
.annotate 'line', 4499
if $I5 == $I6 goto __label_19
set $I6, 2
if $I5 == $I6 goto __label_20
set $I6, 1
if $I5 == $I6 goto __label_21
goto __label_18
# switch
__label_19: # case
.annotate 'line', 4502
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_22
set $S4, $P14
__label_22:
.annotate 'line', 4503
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4504
unless_null $P3, __label_23
concat $S6, "Can't locate class ", $S4
concat $S6, " at compile time"
.annotate 'line', 4505
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_23: # endif
.annotate 'line', 4509
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4510
le $I1, 1, __label_24
# {
.annotate 'line', 4511
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_24: # endif
goto __label_17 # break
__label_20: # case
.annotate 'line', 4515
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4516
# predefined elements
elements $I6, $P4
sub $I5, $I6, 1
$S3 = $P4[$I5]
.annotate 'line', 4517
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_17 # break
__label_21: # case
.annotate 'line', 4520
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4521
unless_null $P5, __label_25
# {
.annotate 'line', 4523
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4524
if_null $P6, __label_27
# {
.annotate 'line', 4525
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4528
'Warn'('Checking: new unknown type')
.annotate 'line', 4529
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_28: # endif
.annotate 'line', 4531
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_26
__label_25: # else
# {
$P20 = $P5['reg']
.annotate 'line', 4535
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_26: # endif
goto __label_17 # break
__label_18: # default
.annotate 'line', 4539
'InternalError'('Unexpected type in new')
__label_17: # switch end
.annotate 'line', 4541
isgt $I7, $I1, 1
if $I7 goto __label_30
isgt $I7, $I1, 0
unless $I7 goto __label_31
iseq $I7, $I2, 1
__label_31:
__label_30:
unless $I7 goto __label_29
# {
.annotate 'line', 4542
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4543
iter $P21, $P1
set $P21, 0
__label_32: # for iteration
unless $P21 goto __label_33
shift $P8, $P21
# {
.annotate 'line', 4544
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_34
set $S5, $P22
__label_34:
.annotate 'line', 4545
$P7.'push'($S5)
# }
goto __label_32
__label_33: # endfor
.annotate 'line', 4547
__ARG_1.'print'($S2, ".'", $S3, "'(")
# predefined join
.annotate 'line', 4548
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4549
__ARG_1.'say'(")")
.annotate 'line', 4550
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_29: # endif
# }
.annotate 'line', 4552

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4407
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4409
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4561
# Body
# {
.annotate 'line', 4563
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4564
setattribute self, 'owner', __ARG_2
.annotate 'line', 4565
# var nskey: $P1
new $P3, [ 'ClassSpecifierParrotKey' ]
$P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4566
setattribute self, 'nskey', $P1
.annotate 'line', 4567
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4568
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4569
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4571
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4572

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4573
# Body
# {
.annotate 'line', 4575
# string reginit: $S1
null $S1
.annotate 'line', 4576
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4577
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
.annotate 'line', 4578
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4582
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4583
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4586
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4588
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4589
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4590
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4591
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4592
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4593
if_null $S1, __label_7
.annotate 'line', 4594
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4595
__ARG_1.'say'()
# }
.annotate 'line', 4596

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4557
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4559
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4605
# Body
# {
.annotate 'line', 4607
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4608
setattribute self, 'owner', __ARG_2
.annotate 'line', 4609
# var nskey: $P1
new $P3, [ 'ClassSpecifierId' ]
$P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P3
.annotate 'line', 4610
setattribute self, 'nskey', $P1
.annotate 'line', 4611
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4612
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4613
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4615
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4616

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4617
# Body
# {
.annotate 'line', 4619
# string reginit: $S1
null $S1
.annotate 'line', 4620
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4622
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4623
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4624
le $I1, 0, __label_3
.annotate 'line', 4625
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4626
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4627
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4628
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4629
__ARG_1.'say'()
.annotate 'line', 4631
le $I1, 0, __label_4
# {
.annotate 'line', 4632
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4633
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4634
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4635
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4637
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4638
__ARG_1.'print'($S2, ".'", $S4, "'(")
# predefined join
.annotate 'line', 4639
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4640
__ARG_1.'say'(")")
.annotate 'line', 4641
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4643

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4601
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4603
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4648
# Body
# {
.annotate 'line', 4650
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4652
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4654
new $P5, [ 'CallExpr' ]
.annotate 'line', 4655
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4654
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4657
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4659
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4661
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4664
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4665
__ARG_1.'unget'($P2)
.annotate 'line', 4666
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4668
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4672
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
.annotate 'line', 4677
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4679

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4688
# Body
# {
.annotate 'line', 4690
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4691
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4692
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4693

.end # OpInstanceOfExpr


.sub 'checkResult' :method

.annotate 'line', 4694
# Body
# {
.return('I')
# }

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4695
# Body
# {
.annotate 'line', 4697
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4698
# string checkedval: $S1
null $S1
.annotate 'line', 4699
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4700
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, "'"
set $S1, $S0
.annotate 'line', 4701
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4705
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4706
self.'annotate'(__ARG_1)
.annotate 'line', 4707
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4708

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4683
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4685
addattribute $P0, 'lexpr'
.annotate 'line', 4686
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4723
# Body
# {
.annotate 'line', 4725
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4726
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4727
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4728
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4729
.return(self)
# }
.annotate 'line', 4730

.end # set


.sub 'optimize' :method

.annotate 'line', 4731
# Body
# {
.annotate 'line', 4733
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4734
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
.annotate 'line', 4736
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4738
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4740
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4741
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4742
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4744

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 4745
# Body
# {
.annotate 'line', 4747
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkResult'()
# }
.annotate 'line', 4748

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4749
# Body
# {
.annotate 'line', 4751
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4752
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4753
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4754
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4755
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4756
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4757
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4758
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4759

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4713
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4719
addattribute $P0, 'condition'
.annotate 'line', 4720
addattribute $P0, 'etrue'
.annotate 'line', 4721
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

.annotate 'line', 4796
# Body
# {
.annotate 'line', 4798
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
.annotate 'line', 4799
.return(1)
__label_3: # case
.annotate 'line', 4800
.return(2)
__label_4: # case
.annotate 'line', 4801
.return(3)
__label_1: # default
.annotate 'line', 4802
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4804

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 4806
# Body
# {
.annotate 'line', 4808
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
.annotate 'line', 4809
.return(8)
__label_3: # case
.annotate 'line', 4810
.return(11)
__label_4: # case
.annotate 'line', 4811
.return(9)
__label_5: # case
.annotate 'line', 4812
.return(10)
__label_1: # default
.annotate 'line', 4813
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4815

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 4817
# Body
# {
.annotate 'line', 4819
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
.annotate 'line', 4820
.return(19)
__label_3: # case
.annotate 'line', 4821
.return(20)
__label_4: # case
.annotate 'line', 4822
.return(21)
__label_5: # case
.annotate 'line', 4823
.return(22)
__label_1: # default
.annotate 'line', 4824
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4826

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 4828
# Body
# {
.annotate 'line', 4830
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
.annotate 'line', 4831
.return(12)
__label_3: # case
.annotate 'line', 4832
.return(13)
__label_4: # case
.annotate 'line', 4833
.return(25)
__label_5: # case
.annotate 'line', 4834
.return(26)
__label_1: # default
.annotate 'line', 4836
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 4837
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 4839

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 4841
# Body
# {
.annotate 'line', 4843
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
.annotate 'line', 4844
.return(14)
__label_3: # case
.annotate 'line', 4845
.return(16)
__label_4: # case
.annotate 'line', 4846
.return(15)
__label_5: # case
.annotate 'line', 4847
.return(17)
__label_1: # default
.annotate 'line', 4848
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4850

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 4852
# Body
# {
.annotate 'line', 4854
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
.annotate 'line', 4855
.return(4)
__label_3: # case
.annotate 'line', 4856
.return(5)
__label_4: # case
.annotate 'line', 4857
.return(6)
__label_5: # case
.annotate 'line', 4858
.return(18)
__label_6: # case
.annotate 'line', 4859
.return(23)
__label_7: # case
.annotate 'line', 4860
.return(24)
__label_1: # default
.annotate 'line', 4861
.return(0)
__label_0: # switch end
# }
.annotate 'line', 4863

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4865
# Body
# {
.annotate 'line', 4867
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 4869
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4870
# var expr: $P2
null $P2
.annotate 'line', 4871
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 4872
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4873
'ExpectOp'(')', __ARG_1)
.annotate 'line', 4874
.return($P2)
# }
__label_0: # endif
.annotate 'line', 4876
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 4877
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 4878
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 4879
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 4880
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 4881
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 4882
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 4883
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 4884
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 4885
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 4886
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 4887
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 4888
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 4889
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 4890
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 4891
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 4892
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 4893

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4895
# Body
# {
.annotate 'line', 4897
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 4898
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 4900
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4901
# var t: $P2
null $P2
.annotate 'line', 4902
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4903
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 4904
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 4906
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 4909
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 4912
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 4915
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 4918
__ARG_1.'unget'($P2)
.annotate 'line', 4919
.return($P1)
# }
.annotate 'line', 4920

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4922
# Body
# {
.annotate 'line', 4924
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 4926
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 4927
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4928
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4929
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 4930
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 4931
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4934
__ARG_1.'unget'($P2)
.annotate 'line', 4935
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4937

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4939
# Body
# {
.annotate 'line', 4941
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 4942
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 4943
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 4945
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4946
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 4947
# var subexpr: $P2
null $P2
.annotate 'line', 4948
eq $I1, 0, __label_0
# {
.annotate 'line', 4949
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4950
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 4951
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
.annotate 'line', 4953
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4956
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4959
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4962
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 4965
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 4967
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4970
__ARG_1.'unget'($P1)
.annotate 'line', 4971
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 4973
.return($P2)
# }
.annotate 'line', 4974

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4976
# Body
# {
.annotate 'line', 4978
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 4979
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 4981
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4982
# var t: $P2
null $P2
.annotate 'line', 4983
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 4984
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 4985
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 4986
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 4987
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
.annotate 'line', 4989
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 4992
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 4995
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 4998
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5001
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5003
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5004
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5006
__ARG_1.'unget'($P2)
.annotate 'line', 5007
.return($P1)
# }
.annotate 'line', 5008

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5010
# Body
# {
.annotate 'line', 5012
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5014
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5015
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5016
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5017
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5018
# var expr: $P4
null $P4
.annotate 'line', 5019
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5020
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5022
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5023
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5025
__ARG_1.'unget'($P2)
.annotate 'line', 5026
.return($P1)
# }
.annotate 'line', 5027

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5029
# Body
# {
.annotate 'line', 5031
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5032
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5034
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5035
# var rexpr: $P2
null $P2
.annotate 'line', 5036
# var t: $P3
null $P3
.annotate 'line', 5037
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5038
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5039
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
.annotate 'line', 5041
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5042
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5045
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5046
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5049
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5050
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5053
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5054
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5057
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5060
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5063
__ARG_1.'unget'($P3)
.annotate 'line', 5064
.return($P1)
# }
.annotate 'line', 5065

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5067
# Body
# {
.annotate 'line', 5069
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5070
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5072
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5073
# var t: $P2
null $P2
.annotate 'line', 5074
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5075
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5076
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5077
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
.annotate 'line', 5079
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5082
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5085
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5088
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5091
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5094
__ARG_1.'unget'($P2)
.annotate 'line', 5095
.return($P1)
# }
.annotate 'line', 5096

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5098
# Body
# {
.annotate 'line', 5100
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5102
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5103
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5104
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5105
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5106
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5108
__ARG_1.'unget'($P2)
.annotate 'line', 5109
.return($P1)
# }
.annotate 'line', 5110

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5112
# Body
# {
.annotate 'line', 5114
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5116
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5117
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5118
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5119
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5120
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5122
__ARG_1.'unget'($P2)
.annotate 'line', 5123
.return($P1)
# }
.annotate 'line', 5124

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5126
# Body
# {
.annotate 'line', 5128
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5130
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5131
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5132
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5133
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5134
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5136
__ARG_1.'unget'($P2)
.annotate 'line', 5137
.return($P1)
# }
.annotate 'line', 5138

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5140
# Body
# {
.annotate 'line', 5142
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5144
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5145
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5146
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5147
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5148
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5150
__ARG_1.'unget'($P2)
.annotate 'line', 5151
.return($P1)
# }
.annotate 'line', 5152

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5154
# Body
# {
.annotate 'line', 5156
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5157
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5159
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5160
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5161
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5162
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5163
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5164
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5165
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5168
__ARG_1.'unget'($P2)
.annotate 'line', 5169
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5171

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5173
# Body
# {
.annotate 'line', 5175
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5176
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5177
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5179
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5180
# var t: $P2
null $P2
.annotate 'line', 5181
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5182
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5183
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5184
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5185
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
.annotate 'line', 5187
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5190
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5193
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5196
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5199
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5202
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5205
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5207
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5208
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5210
__ARG_1.'unget'($P2)
.annotate 'line', 5211
.return($P1)
# }
.annotate 'line', 5212

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5214
# Body
# {
.annotate 'line', 5216
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5218
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5219

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5232
# Body
# {
.annotate 'line', 5234
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5235
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5236
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5237
setattribute self, 'brlabel', $P2
.annotate 'line', 5238
.return($S1)
# }
.annotate 'line', 5239

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5240
# Body
# {
.annotate 'line', 5242
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5243
unless_null $P1, __label_0
.annotate 'line', 5244
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5245
.return($P1)
# }
.annotate 'line', 5246

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5230
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5253
# Body
# {
.annotate 'line', 5255
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5256
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5257
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5258
setattribute self, 'cntlabel', $P2
.annotate 'line', 5259
.return($S1)
# }
.annotate 'line', 5260

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5261
# Body
# {
.annotate 'line', 5263
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5264
unless_null $P1, __label_0
.annotate 'line', 5265
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5266
.return($P1)
# }
.annotate 'line', 5267

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5249
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5251
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5281
# Body
# {
.annotate 'line', 5283
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5284
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5285
# var values: $P2
root_new $P4, ['parrot';'ResizablePMCArray']
set $P2, $P4
.annotate 'line', 5286
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5287
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5288
# {
.annotate 'line', 5289
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5290
$P2.'push'($P3)
# }
.annotate 'line', 5291
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5293
'RequireOp'(';', $P1)
.annotate 'line', 5294
setattribute self, 'values', $P2
# }
.annotate 'line', 5295

.end # parse


.sub 'optimize' :method

.annotate 'line', 5296
# Body
# {
.annotate 'line', 5298
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5299
.return(self)
# }
.annotate 'line', 5300

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5301
# Body
# {
.annotate 'line', 5303
# var args: $P1
root_new $P6, ['parrot';'ResizablePMCArray']
set $P1, $P6
.annotate 'line', 5304
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5305
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5308
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5309
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5311
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5312
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5313
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5314
self.'annotate'(__ARG_1)
.annotate 'line', 5315
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5319
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5320
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5321
# string reg: $S1
null $S1
.annotate 'line', 5322
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5323
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5324
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5327
$P8 = $P5.'emit_get'(__ARG_1)
set $S1, $P8
__label_9: # endif
.annotate 'line', 5328
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5319
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5330
self.'annotate'(__ARG_1)
.annotate 'line', 5331
self.'emitret'(__ARG_1)
.annotate 'line', 5332
# string sep: $S2
set $S2, ''
.annotate 'line', 5333
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5334
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5335
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5337
__ARG_1.'say'(')')
# }
.annotate 'line', 5338

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5277
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5279
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5343
# Body
# {
.annotate 'line', 5345
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5346

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5347
# Body
# {
.annotate 'line', 5349
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5350

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5341
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5355
# Body
# {
.annotate 'line', 5357
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5358

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5359
# Body
# {
.annotate 'line', 5361
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5362

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5353
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5373
# Body
# {
.annotate 'line', 5375
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5376
setattribute self, 'name', __ARG_1
.annotate 'line', 5377
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5378
setattribute self, 'value', $P2
# }
.annotate 'line', 5379

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5380
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5381
# Body
# {
.annotate 'line', 5383
self.'annotate'(__ARG_1)
.annotate 'line', 5384
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5385
# string comment: $S2
concat $S0, 'label ', $S1
set $S2, $S0
.annotate 'line', 5386
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5387

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5369
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5371
addattribute $P0, 'name'
.annotate 'line', 5372
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5398
# Body
# {
.annotate 'line', 5400
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5401
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5402
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5403
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5404
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5405
setattribute self, 'label', $P1
.annotate 'line', 5406
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5407

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5408
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5409
# Body
# {
.annotate 'line', 5411
self.'annotate'(__ARG_1)
.annotate 'line', 5412
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5413
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5414
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5415

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5394
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5396
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5424
# Body
# {
.annotate 'line', 5426
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5427

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5428
# Body
# {
.annotate 'line', 5430
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5431
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5432
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5433

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5422
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

.annotate 'line', 5444
# Body
# {
.annotate 'line', 5446
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5447
self.'parsecondition'(__ARG_2)
.annotate 'line', 5448
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5449
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5450
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5451
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5453
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5454
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5456

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5457
# Body
# {
.annotate 'line', 5459
self.'optimize_condition'()
.annotate 'line', 5460
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5461
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5462
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5463
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5465
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5467
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
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
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5474
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5475
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5476
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5477
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5478
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5479
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5480
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5481
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5482
self.'annotate'(__ARG_1)
.annotate 'line', 5483
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5484
$P1.'emit'(__ARG_1)
.annotate 'line', 5486
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5487
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5488
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5489
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5491
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5492

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5440
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5442
addattribute $P0, 'truebranch'
.annotate 'line', 5443
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5502
# Body
# {
.annotate 'line', 5504
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5505

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5506
# Body
# {
.annotate 'line', 5508
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5509
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5511
self.'annotate'(__ARG_1)
.annotate 'line', 5512
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5513
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5514
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5515
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5516

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5499
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5501
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5525
# Body
# {
.annotate 'line', 5527
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5528
self.'parsecondition'(__ARG_2)
.annotate 'line', 5529
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5530

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5531
# Body
# {
.annotate 'line', 5533
self.'optimize_condition'()
.annotate 'line', 5534
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5535
.return(self)
# }
.annotate 'line', 5536

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5537
# Body
# {
.annotate 'line', 5539
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5541
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5544
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5547
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5548
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5550
self.'annotate'(__ARG_1)
.annotate 'line', 5551
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5552
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5553
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5554
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5555
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5557

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5523
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

.annotate 'line', 5566
# Body
# {
.annotate 'line', 5568
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5569
self.'parsebody'(__ARG_2)
.annotate 'line', 5570
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5571
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5572

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5573
# Body
# {
.annotate 'line', 5575
self.'optimize_condition'()
.annotate 'line', 5576
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5577
.return(self)
# }
.annotate 'line', 5578

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5579
# Body
# {
.annotate 'line', 5581
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5583
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5586
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5587
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5588
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5590
self.'annotate'(__ARG_1)
.annotate 'line', 5591
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5593
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5594
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5595
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5597

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5564
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

.annotate 'line', 5606
# Body
# {
.annotate 'line', 5608
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5609
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5610

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5611
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5612
# Body
# {
.annotate 'line', 5614
self.'annotate'(__ARG_1)
.annotate 'line', 5615
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5616
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5617

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5604
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5626
# Body
# {
.annotate 'line', 5628
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5629
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5630

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5631
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5632
# Body
# {
.annotate 'line', 5634
self.'annotate'(__ARG_1)
.annotate 'line', 5635
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5636
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5637

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5624
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5651
# Body
# {
.annotate 'line', 5653
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5654
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5655
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5656
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5657
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5658
$P1 = __ARG_2.'get'()
.annotate 'line', 5659
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5660
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5661
$P1 = __ARG_2.'get'()
.annotate 'line', 5662
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5663
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5664
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5665
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5666
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5667
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5668
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5669
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5670
$P1 = __ARG_2.'get'()
.annotate 'line', 5671
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5672
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5673
# var st: $P2
root_new $P12, ['parrot';'ResizablePMCArray']
set $P2, $P12
__label_10: # while
.annotate 'line', 5674
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
.annotate 'line', 5675
__ARG_2.'unget'($P1)
.annotate 'line', 5676
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5678
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5679
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5682
$P1 = __ARG_2.'get'()
.annotate 'line', 5683
$P14 = $P1.'isop'(':')
isfalse $I4, $P14
unless $I4 goto __label_13
.annotate 'line', 5684
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5685
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
.annotate 'line', 5686
__ARG_2.'unget'($P1)
.annotate 'line', 5687
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5689
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5692

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5693
# Body
# {
.annotate 'line', 5695
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5696
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5697
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5698
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5699
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5700
.return(self)
# }
.annotate 'line', 5701

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5702
# Body
# {
.annotate 'line', 5705
# string type: $S1
set $S1, ''
.annotate 'line', 5706
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5707
# string t: $S2
$P10 = $P1.'checkResult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5708
ne $S2, 'N', __label_3
.annotate 'line', 5709
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5710
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5712
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5713
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5716
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5717
getattribute $P12, self, 'condition'
$P11 = $P12.'checkResult'()
$S9 = $P11
ne $S9, $S1, __label_8
.annotate 'line', 5718
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5720
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5721
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5725
self.'genbreaklabel'()
.annotate 'line', 5726
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5727
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5728
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5729
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5730
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5731
$P2.'push'($S7)
.annotate 'line', 5732
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5733
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5735
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5738
__ARG_1.'comment'('switch')
.annotate 'line', 5739
self.'annotate'(__ARG_1)
.annotate 'line', 5740
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5741
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5742
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5743
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5744
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5745
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5746
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5747
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5742
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5750
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5751
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5752
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5754
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5755

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5644
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5646
addattribute $P0, 'condition'
.annotate 'line', 5647
addattribute $P0, 'case_value'
.annotate 'line', 5648
addattribute $P0, 'case_st'
.annotate 'line', 5649
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5767
# Body
# {
.annotate 'line', 5769
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5770
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5771
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5772
__ARG_2.'unget'($P1)
.annotate 'line', 5773
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5775
$P1 = __ARG_2.'get'()
.annotate 'line', 5776
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5777
__ARG_2.'unget'($P1)
.annotate 'line', 5778
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5779
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5781
$P1 = __ARG_2.'get'()
.annotate 'line', 5782
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5783
__ARG_2.'unget'($P1)
.annotate 'line', 5784
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5785
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5787
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5788

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5789
# Body
# {
.annotate 'line', 5791
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5792
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5793
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5794
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5795
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5796
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5797
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5798
.return(self)
# }
.annotate 'line', 5799

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5800
# Body
# {
.annotate 'line', 5802
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 5803
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 5804
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 5805
self.'emit_infinite'(__ARG_1)
.annotate 'line', 5806
.return()
# }
__label_0: # endif
.annotate 'line', 5808
__ARG_1.'comment'('for loop')
.annotate 'line', 5809
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 5810
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 5811
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 5812
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 5813
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 5815
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 5816
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 5817
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 5819
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5820
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 5821
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 5822
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 5823
__ARG_1.'emitgoto'($S3)
.annotate 'line', 5825
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 5826

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5762
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5764
addattribute $P0, 'initializer'
.annotate 'line', 5765
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5838
# Body
# {
.annotate 'line', 5840
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5841
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5842
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 5843
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 5844
eq $S2, '', __label_2
# {
.annotate 'line', 5845
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 5847
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 5849
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5850
setattribute self, 'varname', $P1
.annotate 'line', 5851
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 5852
$P2 = __ARG_2.'get'()
.annotate 'line', 5853
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5854
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 5855
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5856

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 5857
# Body
# {
.annotate 'line', 5859
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 5860
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5861
.return(self)
# }
.annotate 'line', 5862

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5863
# Body
# {
.annotate 'line', 5865
self.'annotate'(__ARG_1)
.annotate 'line', 5866
# string regcont: $S1
null $S1
.annotate 'line', 5867
getattribute $P3, self, 'container'
$P2 = $P3.'checkResult'()
$S6 = $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 5868
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 5869
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 5870
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 5873
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 5874
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 5875
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 5876
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 5877
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 5878
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 5879
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 5880
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 5881
__ARG_1.'say'('unless ', $S3, " goto ", $S5)
$P7 = $P1['reg']
.annotate 'line', 5882
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 5883
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 5884
__ARG_1.'emitgoto'($S4)
.annotate 'line', 5885
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 5886

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 5833
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 5835
addattribute $P0, 'varname'
.annotate 'line', 5836
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5891
# Body
# {
.annotate 'line', 5893
'ExpectOp'('(', __ARG_2)
.annotate 'line', 5894
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5895
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 5896
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 5897
__ARG_2.'unget'($P3)
.annotate 'line', 5898
__ARG_2.'unget'($P2)
.annotate 'line', 5899
__ARG_2.'unget'($P1)
.annotate 'line', 5900
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 5901
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 5903
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 5904

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5914
# Body
# {
.annotate 'line', 5916
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5917
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 5918

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 5919
# Body
# {
.annotate 'line', 5921
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 5922
.return(self)
# }
.annotate 'line', 5923

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5924
# Body
# {
.annotate 'line', 5926
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5927
self.'annotate'(__ARG_1)
.annotate 'line', 5928
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 5929

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 5910
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5912
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5943
# Body
# {
.annotate 'line', 5945
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5946
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5947
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 5948
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 5951
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 5953
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 5954
$P1 = __ARG_2.'get'()
.annotate 'line', 5955
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 5956
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 5957
$P1 = __ARG_2.'get'()
.annotate 'line', 5958
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 5959
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 5960
$P1 = __ARG_2.'get'()
.annotate 'line', 5961
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 5962
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 5963
setattribute self, 'exname', $P1
.annotate 'line', 5964
self.'createvar'($S1, 'P')
.annotate 'line', 5965
$P1 = __ARG_2.'get'()
.annotate 'line', 5966
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 5967
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 5969
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 5970

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 5971
# Body
# {
.annotate 'line', 5973
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 5974
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 5975
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 5976
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
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
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 5982
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 5983
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 5984
# string exreg: $S4
null $S4
.annotate 'line', 5985
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 5986
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 5987
$S4 = $P1['reg']
# }
goto __label_4
__label_3: # else
.annotate 'line', 5990
$P9 = self.'tempreg'('P')
set $S4, $P9
__label_4: # endif
.annotate 'line', 5992
self.'annotate'(__ARG_1)
.annotate 'line', 5993
__ARG_1.'comment'('try: create handler')
.annotate 'line', 5995
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 5996
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 5998
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 5999
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6000
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6001
# string modifname: $S5
$P10 = $P3.'getname'()
null $S5
if_null $P10, __label_8
set $S5, $P10
__label_8:
.annotate 'line', 6002
# int nargs: $I1
$P11 = $P3.'numargs'()
set $I1, $P11
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6003
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6006
eq $I1, 1, __label_14
.annotate 'line', 6007
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6008
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6009
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6010
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6013
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6014
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6015
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6016
$P13 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P13)
# }
__label_16: # for iteration
.annotate 'line', 6014
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6018
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6019
# string sep: $S7
set $S7, ''
.annotate 'line', 6020
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6021
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6022
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6024
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6027
getattribute $P14, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P14)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6032
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6033
__ARG_1.'comment'('try: begin')
.annotate 'line', 6034
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6035
__ARG_1.'comment'('try: end')
.annotate 'line', 6037
self.'annotate'(__ARG_1)
.annotate 'line', 6038
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6040
__ARG_1.'comment'('catch')
.annotate 'line', 6041
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6042
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6043
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6044
__ARG_1.'say'('pop_eh')
.annotate 'line', 6045
getattribute $P16, self, 'scatch'
$P16.'emit'(__ARG_1)
.annotate 'line', 6047
__ARG_1.'comment'('catch end')
.annotate 'line', 6048
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6049

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 5936
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 5938
addattribute $P0, 'stry'
.annotate 'line', 5939
addattribute $P0, 'modifiers'
.annotate 'line', 5940
addattribute $P0, 'exname'
.annotate 'line', 5941
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6060
# Body
# {
.annotate 'line', 6062
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6063
setattribute self, 'name', __ARG_3
.annotate 'line', 6064
# string reg: $S1
$P1 = self.'createvar'(__ARG_3, 'P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 6065
setattribute self, 'reg', $P2
# }
.annotate 'line', 6066

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6056
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6058
addattribute $P0, 'name'
.annotate 'line', 6059
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6083
# Body
# {
.annotate 'line', 6085
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6086
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6087
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6088
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6089
setattribute self, 'name', $P1
.annotate 'line', 6090
# string reg: $S1
null $S1
.annotate 'line', 6092
$P1 = __ARG_2.'get'()
.annotate 'line', 6093
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
# {
box $P5, 1
.annotate 'line', 6095
setattribute self, 'typearray', $P5
.annotate 'line', 6096
getattribute $P5, self, 'name'
$P4 = self.'createvar'($P5, 'P')
set $S1, $P4
.annotate 'line', 6097
$P1 = __ARG_2.'get'()
.annotate 'line', 6098
$P6 = $P1.'isop'(']')
if_null $P6, __label_3
unless $P6 goto __label_3
# {
.annotate 'line', 6100
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6103
__ARG_2.'unget'($P1)
.annotate 'line', 6104
$P7 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P7
.annotate 'line', 6105
$P1 = __ARG_2.'get'()
.annotate 'line', 6106
$P7 = $P1.'isop'(']')
isfalse $I1, $P7
unless $I1 goto __label_5
.annotate 'line', 6107
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6108
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P8, 0
.annotate 'line', 6113
setattribute self, 'typearray', $P8
.annotate 'line', 6114
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P8 = self.'createvar'($P9, $P10)
set $S1, $P8
.annotate 'line', 6115
$P9 = $P1.'isop'('=')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 6117
$P11 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P11
.annotate 'line', 6118
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6122
setattribute self, 'reg', $P11
.annotate 'line', 6123
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6125
$P1 = __ARG_2.'get'()
.annotate 'line', 6126
$P12 = $P1.'isop'('[')
isfalse $I2, $P12
unless $I2 goto __label_8
.annotate 'line', 6127
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6128
root_new $P14, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P14
.annotate 'line', 6129
$P1 = __ARG_2.'get'()
.annotate 'line', 6130
$P13 = $P1.'isop'(']')
isfalse $I2, $P13
unless $I2 goto __label_9
# {
.annotate 'line', 6131
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6132
# {
.annotate 'line', 6133
# var item: $P2
$P2 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6134
getattribute $P14, self, 'init'
$P14.'push'($P2)
# }
.annotate 'line', 6135
$P1 = __ARG_2.'get'()
$P15 = $P1.'isop'(',')
if_null $P15, __label_11
if $P15 goto __label_10
__label_11: # enddo
.annotate 'line', 6136
$P16 = $P1.'isop'(']')
isfalse $I3, $P16
unless $I3 goto __label_13
.annotate 'line', 6137
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6139
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6141
$P16 = $P1.'isop'(';')
isfalse $I3, $P16
unless $I3 goto __label_14
.annotate 'line', 6142
'SyntaxError'("Expected ';'", $P1)
__label_14: # endif
# }
.annotate 'line', 6143

.end # parse


.sub 'optimize' :method

.annotate 'line', 6144
# Body
# {
.annotate 'line', 6146
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6147
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6148
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6149
if_null $P1, __label_1
# {
.annotate 'line', 6150
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6151
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6153
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6155
.return(self)
# }
.annotate 'line', 6156

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6157
# Body
# {
.annotate 'line', 6159
self.'annotate'(__ARG_1)
.annotate 'line', 6160
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6161
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6162
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6163
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6164
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S2
concat $S10, ': '
concat $S10, $S3
.annotate 'line', 6165
__ARG_1.'comment'($S10)
.annotate 'line', 6167
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6168
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6169
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6171
# string itype: $S5
$P7 = $P1.'checkResult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6172
ne $S5, $S4, __label_10
# {
.annotate 'line', 6173
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6176
isa $I3, $P1, 'IndexExpr'
unless $I3 goto __label_12
# {
.annotate 'line', 6178
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 6181
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_14
set $S6, $P6
__label_14:
.annotate 'line', 6182
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6183
iseq $I4, $S4, 'S'
unless $I4 goto __label_17
iseq $I4, $S5, 'P'
__label_17:
unless $I4 goto __label_15
# {
.annotate 'line', 6184
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_18
set $S7, $P7
__label_18:
.annotate 'line', 6185
__ARG_1.'emitnull'($S3)
.annotate 'line', 6186
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6187
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6188
__ARG_1.'emitlabel'($S7)
# }
goto __label_16
__label_15: # else
.annotate 'line', 6191
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
.annotate 'line', 6197
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6198
if_null $P2, __label_19
# {
.annotate 'line', 6200
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_21
set $S8, $P8
__label_21:
.annotate 'line', 6201
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_20
__label_19: # else
# {
.annotate 'line', 6205
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_20: # endif
.annotate 'line', 6207
if_null $P1, __label_22
# {
.annotate 'line', 6208
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_23
set $S9, $P9
__label_23:
.annotate 'line', 6209
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6210
unless_null $P2, __label_24
# {
.annotate 'line', 6211
le $I1, 0, __label_25
# {
.annotate 'line', 6213
__ARG_1.'emitset'($S3, $I1)
# }
__label_25: # endif
# }
__label_24: # endif
.annotate 'line', 6216
# int i: $I2
null $I2
.annotate 'line', 6217
iter $P10, $P1
set $P10, 0
__label_26: # for iteration
unless $P10 goto __label_27
shift $P3, $P10
# {
.annotate 'line', 6218
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6219
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6220
inc $I2
# }
goto __label_26
__label_27: # endfor
# }
__label_22: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6224

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6225
# Body
# {
.annotate 'line', 6227
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6228

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6073
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6075
addattribute $P0, 'name'
.annotate 'line', 6076
addattribute $P0, 't_reg'
.annotate 'line', 6077
addattribute $P0, 't_name'
.annotate 'line', 6078
addattribute $P0, 't_array'
.annotate 'line', 6079
addattribute $P0, 'reg'
.annotate 'line', 6080
addattribute $P0, 'typearray'
.annotate 'line', 6081
addattribute $P0, 'size'
.annotate 'line', 6082
addattribute $P0, 'init'
.end
.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6241
# Body
# {
.annotate 'line', 6244
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6245
setattribute self, 'type', $P1
.annotate 'line', 6246
setattribute self, 'name', __ARG_4
.annotate 'line', 6247
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6248

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6249
# Body
# {
.annotate 'line', 6251
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6252
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6253
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6254
$P1 = $P1.'optimize'()
.annotate 'line', 6255
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6257
getattribute $P4, self, 'start'
.annotate 'line', 6256
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6259
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6260
setattribute self, 'value', $P1
.annotate 'line', 6261
.return(self)
# }
.annotate 'line', 6262

.end # optimize


.sub 'checkResult' :method

.annotate 'line', 6263
# Body
# {
.annotate 'line', 6265
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6266

.end # checkResult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6267
# Body
# {
.annotate 'line', 6269
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, ' evaluated at compile time'
.annotate 'line', 6270
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6271

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6235
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6237
addattribute $P0, 'type'
.annotate 'line', 6238
addattribute $P0, 'name'
.annotate 'line', 6239
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6274
# Body
# {
.annotate 'line', 6276
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6277
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6278
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6279
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6281
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6282
# {
.annotate 'line', 6283
$P1 = __ARG_2.'get'()
.annotate 'line', 6284
# var name: $P3
set $P3, $P1
.annotate 'line', 6285
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6286
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6288
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6287
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6289
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6290
.return($P2)
# }
.annotate 'line', 6291

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6300
# Body
# {
.annotate 'line', 6302
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6303
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6304
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6305
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6306
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6308
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6309
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6310

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6311
# Body
# {
.annotate 'line', 6313
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6314
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6315
.return(self)
# }
.annotate 'line', 6316

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6317
# Body
# {
.annotate 'line', 6319
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6320

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6321
# Body
# {
.annotate 'line', 6323
self.'annotate'(__ARG_1)
.annotate 'line', 6324
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6325
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6326
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, ': '
concat $S5, $S2
.annotate 'line', 6327
__ARG_1.'comment'($S5)
.annotate 'line', 6328
if_null $P1, __label_2
.annotate 'line', 6329
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6331
if_null $P1, __label_4
# {
.annotate 'line', 6332
# string type: $S3
$P3 = $P1.'checkResult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6333
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
.annotate 'line', 6335
$P1.'emit'(__ARG_1, $S2)
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6340
# string value: $S4
$P4 = self.'tempreg'($S3)
null $S4
if_null $P4, __label_13
set $S4, $P4
__label_13:
.annotate 'line', 6341
$P1.'emit'(__ARG_1, $S4)
.annotate 'line', 6342
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6345
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6349
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6350

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6297
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6299
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6355
# Body
# {
.annotate 'line', 6357
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6358
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6359
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6360
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6361

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6362
# Body
# {
.annotate 'line', 6364
self.'annotate'(__ARG_1)
.annotate 'line', 6365
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6366
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, '[] : '
concat $S3, $S2
.annotate 'line', 6367
__ARG_1.'comment'($S3)
.annotate 'line', 6368
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6369

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6353
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6376
# Body
# {
.annotate 'line', 6378
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6379
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6380
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6381
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6382
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6383
$P1 = __ARG_2.'get'()
.annotate 'line', 6384
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6385
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6386

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6387
# Body
# {
.annotate 'line', 6389
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6390
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6391

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6392
# Body
# {
.annotate 'line', 6394
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6395
self.'annotate'(__ARG_1)
.annotate 'line', 6396
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6397
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, '[] : '
concat $S4, $S3
.annotate 'line', 6398
__ARG_1.'comment'($S4)
.annotate 'line', 6399
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6400

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6372
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6374
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6403
# Body
# {
.annotate 'line', 6405
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6406
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6407
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6408
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6409
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6410
$P2 = __ARG_2.'get'()
.annotate 'line', 6411
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6412
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6414
__ARG_2.'unget'($P2)
.annotate 'line', 6415
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
.annotate 'line', 6419
__ARG_2.'unget'($P2)
.annotate 'line', 6420
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6422

.end # parseVar

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6430
# Body
# {
box $P1, 'S'
.annotate 'line', 6432
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6433
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6434
setattribute self, 't_array', $P2
.annotate 'line', 6435
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6436

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6437
# Body
# {
.annotate 'line', 6439
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6440

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6428
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6449
# Body
# {
box $P1, 'I'
.annotate 'line', 6451
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6452
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6453
setattribute self, 't_array', $P2
.annotate 'line', 6454
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6455

.end # IntStatement


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
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6447
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6468
# Body
# {
box $P1, 'N'
.annotate 'line', 6470
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6471
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6472
setattribute self, 't_array', $P2
.annotate 'line', 6473
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6474

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6475
# Body
# {
.annotate 'line', 6477
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6478

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6466
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6492
# Body
# {
.annotate 'line', 6494
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6495
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6496
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6497
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6498
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6499
__ARG_2.'unget'($P1)
.annotate 'line', 6500
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6501
unless_null $P2, __label_2
.annotate 'line', 6502
$P6 = 'InternalError'('Unexpected null statement')
throw $P6
__label_2: # endif
.annotate 'line', 6503
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6505
setattribute self, 'end', $P1
# }
.annotate 'line', 6506

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6507
# Body
# {
.annotate 'line', 6509
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6510
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6511
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6512
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6513
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6514
.return($S2)
# }
.annotate 'line', 6515

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6516
# Body
# {
.annotate 'line', 6518
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6519
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6520
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6521
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6522
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6523
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6524
$P1[$S1] = $S3
.annotate 'line', 6525
.return($S3)
# }
.annotate 'line', 6526

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6527
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6528
# Body
# {
.annotate 'line', 6530
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6531
.return(self)
# }
.annotate 'line', 6532

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6533
# Body
# {
.annotate 'line', 6535
__ARG_1.'comment'('{')
.annotate 'line', 6536
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6537
$P1.'emit'(__ARG_1)
.annotate 'line', 6538
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6540
__ARG_1.'comment'('}')
# }
.annotate 'line', 6541

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6485
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6487
addattribute $P0, 'statements'
.annotate 'line', 6488
addattribute $P0, 'end'
.annotate 'line', 6489
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6554
# Body
# {
box $P3, 1
.annotate 'line', 6557
setattribute self, 'nreg', $P3
.annotate 'line', 6558
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6559
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6560
setattribute self, 'tempreg', $P1
.annotate 'line', 6561
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6562

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6563
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6565
setattribute self, 'type', $P1
.annotate 'line', 6566
.return(self)
# }
.annotate 'line', 6567

.end # settype


.sub 'createreg' :method

.annotate 'line', 6568
# Body
# {
.annotate 'line', 6570
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6571
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6572
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6574
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S1
set $S1, $S0
.annotate 'line', 6576
.return($S1)
# }
.annotate 'line', 6577

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6578
# Body
# {
.annotate 'line', 6580
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6581
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6582
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6583
# string reg: $S1
null $S1
.annotate 'line', 6584
le $I1, 0, __label_0
.annotate 'line', 6585
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6587
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6588
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6590
.return($S1)
# }
.annotate 'line', 6591

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6592
# Body
# {
.annotate 'line', 6594
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6595
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6596
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6597
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6598

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6550
addattribute $P0, 'type'
.annotate 'line', 6551
addattribute $P0, 'nreg'
.annotate 'line', 6552
addattribute $P0, 'tempreg'
.annotate 'line', 6553
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionStatement' ]

.sub 'init' :method :vtable

.annotate 'line', 6623
# Body
# {
.annotate 'line', 6625
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('I')
setattribute self, 'regstI', $P2
.annotate 'line', 6626
new $P3, [ 'RegisterStore' ]
$P2 = $P3.'settype'('N')
setattribute self, 'regstN', $P2
.annotate 'line', 6627
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('S')
setattribute self, 'regstS', $P5
.annotate 'line', 6628
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('P')
setattribute self, 'regstP', $P5
box $P7, 0
.annotate 'line', 6629
setattribute self, 'nlabel', $P7
# }
.annotate 'line', 6630

.end # init


.sub 'getouter' :method

.annotate 'line', 6632
# Body
# {
.return(self)
# }

.end # getouter


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6633
# Body
# {
.annotate 'line', 6635
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6636
.return($I1)
# }
.annotate 'line', 6637

.end # same_scope_as


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6638
# Body
# {
.annotate 'line', 6640
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6641
unless_null $P1, __label_0
# {
.annotate 'line', 6642
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6643
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6645
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6646

.end # setlex


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6647
# Body
# {
.annotate 'line', 6649
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6650
unless_null $P1, __label_0
# {
.annotate 'line', 6651
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6652
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6654
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6655

.end # setusedlex


.sub 'createlex' :method
.param string __ARG_1

.annotate 'line', 6656
# Body
# {
.annotate 'line', 6658
# string lexname: $S1
# predefined substr
substr $S2, __ARG_1, 1
concat $S0, '__WLEX_', $S2
set $S1, $S0
.annotate 'line', 6659
self.'setlex'($S1, __ARG_1)
.annotate 'line', 6660
.return($S1)
# }
.annotate 'line', 6661

.end # createlex


.sub 'ismethod' :method

.annotate 'line', 6663
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6664
# Body
# {
.annotate 'line', 6666
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6667
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
.annotate 'line', 6669
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6671
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6673
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6675
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6677
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 6679
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6680
.return($S1)
# }
.annotate 'line', 6681

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 6682
# Body
# {
.annotate 'line', 6684
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6685
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
.annotate 'line', 6687
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 6689
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 6691
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 6693
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 6695
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 6697
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 6698
.return($S1)
# }
.annotate 'line', 6699

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6700
# Body
# {
.annotate 'line', 6702
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
.annotate 'line', 6703
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 6704

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 6705
# Body
# {
.annotate 'line', 6707
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 6708
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6709
# string s: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 6711
.return($S1)
# }
.annotate 'line', 6712

.end # genlabel


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6713
# Body
# {
.annotate 'line', 6715
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6716
unless_null $P1, __label_0
.annotate 'line', 6717
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6719
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6720

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6722
# Body
# {
.annotate 'line', 6724
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6725
.return(self)
# }
.annotate 'line', 6726

.end # optimize


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6728
# Body
# {
.annotate 'line', 6730
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 6731
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 6732
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_0
# {
.annotate 'line', 6733
__ARG_1.'unget'($P1)
.annotate 'line', 6734
# int argnum: $I1
null $I1
__label_1: # do
.annotate 'line', 6735
# {
.annotate 'line', 6736
$P1 = __ARG_1.'get'()
.annotate 'line', 6737
# string type: $S1
$P6 = $P1.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6738
eq $S1, '', __label_5
.annotate 'line', 6739
$P1 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6742
# string argname: $S2
inc $I1
# predefined string
$S4 = $I1
concat $S0, '__ARG_', $S4
set $S2, $S0
.annotate 'line', 6743
self.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 6745
# string varname: $S3
set $P7, $P1
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6746
# var arg: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 6747
$P2['name'] = $S3
.annotate 'line', 6748
$P1 = __ARG_1.'get'()
.annotate 'line', 6749
$P7 = $P1.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6750
# var modifiers: $P3
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, self)
set $P3, $P8
.annotate 'line', 6751
$P2['modifiers'] = $P3
.annotate 'line', 6752
$P1 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6754
getattribute $P8, self, 'args'
$P8.'push'($P2)
# }
.annotate 'line', 6755
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 6756
$P9 = $P1.'isop'(')')
isfalse $I2, $P9
unless $I2 goto __label_9
.annotate 'line', 6757
'SyntaxError'("Expected ')'", $P1)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6759

.end # parse_parameters


.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6761
# Body
# {
.annotate 'line', 6763
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6764
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6765
setattribute self, 'name', $P1
box $P3, 0
.annotate 'line', 6766
setattribute self, 'isanon', $P3
.annotate 'line', 6767
$P1 = __ARG_2.'get'()
.annotate 'line', 6768
$P4 = $P1.'isop'('[')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 6769
# var modifiers: $P2
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P2, $P5
.annotate 'line', 6770
setattribute self, 'modifiers', $P2
.annotate 'line', 6771
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6773
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_1
.annotate 'line', 6774
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 6775
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6777
$P1 = __ARG_2.'get'()
.annotate 'line', 6778
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_2
.annotate 'line', 6779
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 6780
new $P8, [ 'CompoundStatement' ]
$P8.'CompoundStatement'($P1, __ARG_2, self)
set $P7, $P8
setattribute self, 'body', $P7
.annotate 'line', 6781
.return(self)
# }
.annotate 'line', 6782

.end # parse


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6783
# Body
# {
.annotate 'line', 6785
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 6786
__ARG_1.'say'()
.annotate 'line', 6787
__ARG_1.'print'(".sub ")
.annotate 'line', 6788
getattribute $P19, self, 'isanon'
isfalse $I5, $P19
unless $I5 goto __label_1
.annotate 'line', 6789
__ARG_1.'print'("'", $S1, "'")
goto __label_2
__label_1: # else
.annotate 'line', 6791
__ARG_1.'print'("'' :anon")
__label_2: # endif
.annotate 'line', 6792
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 6793
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 6794
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 6795
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 6796
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 6797
if_null $P2, __label_5
.annotate 'line', 6798
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 6802
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 6803
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 6804
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 6805
if_null $P3, __label_7
# {
.annotate 'line', 6806
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 6807
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 6808
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 6809
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 6810
le $I1, 0, __label_11
# {
.annotate 'line', 6811
__ARG_1.'print'('(')
# for loop
.annotate 'line', 6812
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 6813
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 6814
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 6815
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 6816
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 6812
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 6818
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
.annotate 'line', 6823
ne $S1, 'main', __label_16
.annotate 'line', 6824
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 6826
__ARG_1.'say'()
.annotate 'line', 6828
# var args: $P7
getattribute $P7, self, 'args'
.annotate 'line', 6829
# var arg: $P8
null $P8
.annotate 'line', 6830
# string argname: $S2
null $S2
.annotate 'line', 6831
# var a: $P9
null $P9
.annotate 'line', 6833
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 6834
$S2 = $P8['name']
.annotate 'line', 6835
$P9 = self.'getvar'($S2)
.annotate 'line', 6836
# string ptype: $S3
$P27 = $P9['type']
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
$P27 = $P9['reg']
.annotate 'line', 6837
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 6838
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 6839
if_null $P10, __label_20
# {
.annotate 'line', 6840
# var named: $P11
null $P11
.annotate 'line', 6841
# var slurpy: $P12
null $P12
.annotate 'line', 6842
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 6843
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 6844
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 6845
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
.annotate 'line', 6853
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 6856
isnull $I6, $P11
not $I6
unless $I6 goto __label_30
isnull $I6, $P12
not $I6
__label_30:
unless $I6 goto __label_28
# {
.annotate 'line', 6861
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 6864
if_null $P11, __label_31
# {
.annotate 'line', 6865
# string setname: $S5
null $S5
.annotate 'line', 6866
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 6867
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
.annotate 'line', 6872
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 6873
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 6874
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 6875
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 6878
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 6880
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 6882
if_null $P12, __label_38
# {
.annotate 'line', 6883
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 6887
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 6889
__ARG_1.'say'()
.annotate 'line', 6890
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 6893
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 6894
if_null $P16, __label_39
# {
.annotate 'line', 6896
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
$P31 = $P16[$S6]
.annotate 'line', 6897
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 6900
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 6901
if_null $P16, __label_42
# {
.annotate 'line', 6903
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
$P32 = $P16[$S7]
.annotate 'line', 6904
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 6907
__ARG_1.'comment'('Body')
.annotate 'line', 6908
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 6910
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 6911
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 6914
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 6915
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 6917
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I7, $P17
ge $I4, $I7, __label_47
# {
.annotate 'line', 6918
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 6919
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 6917
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 6922

.end # emit


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6923
# Body
# {
.annotate 'line', 6925
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 6926

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6927
# Body
# {
.annotate 'line', 6929
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 6930

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 6605
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6607
addattribute $P0, 'name'
.annotate 'line', 6608
addattribute $P0, 'subid'
.annotate 'line', 6609
addattribute $P0, 'isanon'
.annotate 'line', 6610
addattribute $P0, 'modifiers'
.annotate 'line', 6611
addattribute $P0, 'args'
.annotate 'line', 6612
addattribute $P0, 'body'
.annotate 'line', 6613
addattribute $P0, 'regstI'
.annotate 'line', 6614
addattribute $P0, 'regstN'
.annotate 'line', 6615
addattribute $P0, 'regstS'
.annotate 'line', 6616
addattribute $P0, 'regstP'
.annotate 'line', 6617
addattribute $P0, 'nlabel'
.annotate 'line', 6618
addattribute $P0, 'localfun'
.annotate 'line', 6619
addattribute $P0, 'lexicals'
.annotate 'line', 6620
addattribute $P0, 'usedlexicals'
.annotate 'line', 6621
addattribute $P0, 'outer'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6939
# Body
# {
.annotate 'line', 6941
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6942
$P3 = __ARG_3.'getouter'()
setattribute self, 'outer', $P3
.annotate 'line', 6943
# string subid: $S1
$P2 = __ARG_3.'createsubid'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6944
getattribute $P3, self, 'outer'
$P5 = __ARG_3.'createsubid'()
setattribute $P3, 'subid', $P5
box $P4, $S1
.annotate 'line', 6945
setattribute self, 'subid', $P4
box $P5, $S1
.annotate 'line', 6946
setattribute self, 'name', $P5
box $P6, 1
.annotate 'line', 6947
setattribute self, 'isanon', $P6
.annotate 'line', 6948
self.'parse_parameters'(__ARG_2)
.annotate 'line', 6949
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6950
$P6 = $P1.'isop'('{')
isfalse $I1, $P6
unless $I1 goto __label_1
.annotate 'line', 6951
'Expected'('{', $P1)
__label_1: # endif
.annotate 'line', 6952
new $P9, [ 'CompoundStatement' ]
$P9.'CompoundStatement'($P1, __ARG_2, self)
set $P8, $P9
setattribute self, 'body', $P8
.annotate 'line', 6953
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 6954

.end # LocalFunctionStatement


.sub 'getsubid' :method

.annotate 'line', 6955
# Body
# {
.annotate 'line', 6957
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 6958

.end # getsubid


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 6959
# Body
# {
.annotate 'line', 6961
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 6962
unless_null $P1, __label_0
# {
.annotate 'line', 6965
getattribute $P8, self, 'owner'
$P1 = $P8.'getvar'(__ARG_1)
.annotate 'line', 6966
unless_null $P1, __label_1
# {
.annotate 'line', 6968
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 6969
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 6970
getattribute $P9, self, 'outer'
$P8 = $P9.'ismethod'()
if_null $P8, __label_4
unless $P8 goto __label_4
# {
.annotate 'line', 6971
# string lexself: $S1
$P10 = $P2.'makelexicalself'()
null $S1
if_null $P10, __label_5
set $S1, $P10
__label_5:
.annotate 'line', 6972
# var r2: $P3
$P3 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6973
# string reg: $S2
set $P9, $P3
null $S2
if_null $P9, __label_6
set $S2, $P9
__label_6:
.annotate 'line', 6974
self.'setusedlex'($S1, $S2)
set $P1, $P3
.annotate 'line', 6975
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 6979
$P10 = $P1['type']
$S5 = $P10
iseq $I1, $S5, 'P'
unless $I1 goto __label_8
$P11 = $P1['const']
isfalse $I1, $P11
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 6980
# var scope: $P4
$P4 = $P1['scope']
.annotate 'line', 6981
# var ownerscope: $P5
$P5 = $P4.'getouter'()
.annotate 'line', 6982
# var outer: $P6
getattribute $P6, self, 'outer'
.annotate 'line', 6983
isa $I1, $P5, 'FunctionStatement'
unless $I1 goto __label_9
# {
.annotate 'line', 6984
$P11 = $P5.'same_scope_as'($P6)
if_null $P11, __label_10
unless $P11 goto __label_10
# {
.annotate 'line', 6985
# string lexname: $S3
$P12 = $P4.'makelexical'($P1)
null $S3
if_null $P12, __label_11
set $S3, $P12
__label_11:
.annotate 'line', 6986
# var r2: $P7
$P7 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 6987
# string reg: $S4
set $P12, $P7
null $S4
if_null $P12, __label_12
set $S4, $P12
__label_12:
.annotate 'line', 6988
self.'setusedlex'($S3, $S4)
set $P1, $P7
.annotate 'line', 6989
# }
__label_10: # endif
# }
__label_9: # endif
# }
__label_7: # endif
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 6994
.return($P1)
# }
.annotate 'line', 6995

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 6937
get_class $P1, [ 'FunctionStatement' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'ismethod' :method

.annotate 'line', 7004
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7002
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

.annotate 'line', 7021
# Body
# {
.annotate 'line', 7023
setattribute self, 'owner', __ARG_1
.annotate 'line', 7024
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7025

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7026
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7028
# Body
# {
.annotate 'line', 7030
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7031

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7019
addattribute $P0, 'owner'
.annotate 'line', 7020
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7037
# Body
# {
.annotate 'line', 7039
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7040
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7041

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7042
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7044
# Body
# {
.annotate 'line', 7046
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7047
__ARG_1.'print'($S1)
# }
.annotate 'line', 7048

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7034
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7036
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7055
# Body
# {
.annotate 'line', 7057
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7058
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
set $P1, $P3
.annotate 'line', 7059
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7060
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7061
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7062
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7063
$P2 = __ARG_1.'get'()
.annotate 'line', 7064
$P5 = $P2.'isop'(']')
isfalse $I1, $P5
unless $I1 goto __label_1
# {
.annotate 'line', 7065
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
.annotate 'line', 7067
setattribute self, 'hll', $P7
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7071
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7073
# {
.annotate 'line', 7074
$P2 = __ARG_1.'get'()
.annotate 'line', 7075
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7076
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7077
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7078
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7079
$P8 = $P2.'isop'(']')
isfalse $I2, $P8
unless $I2 goto __label_10
.annotate 'line', 7080
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7082
setattribute self, 'key', $P1
# }
.annotate 'line', 7083

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7084
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7085
# Body
# {
.annotate 'line', 7087
getattribute $P1, self, 'hll'
isnull $I2, $P1
not $I2
# predefined int
$I1 = $I2
.return($I1)
# }
.annotate 'line', 7088

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7090
# Body
# {
.annotate 'line', 7092
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7093

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7051
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7053
addattribute $P0, 'key'
.annotate 'line', 7054
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7099
# Body
# {
.annotate 'line', 7101
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7102
# var key: $P1
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined string
$S1 = __ARG_3
box $P4, $S1
$P3.'push'($P4)
set $P1, $P3
.annotate 'line', 7103
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7104
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7105
$P2 = __ARG_1.'get'()
# predefined string
.annotate 'line', 7106
$S1 = $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7108
__ARG_1.'unget'($P2)
.annotate 'line', 7109
setattribute self, 'key', $P1
# }
.annotate 'line', 7110

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7111
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7113
# Body
# {
.annotate 'line', 7115
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7116
.return($P2)
# }
.annotate 'line', 7117

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7119
# Body
# {
.annotate 'line', 7121
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7122
unless_null $P1, __label_0
# {
.annotate 'line', 7123
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7124
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7126
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7127

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7096
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7098
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7130
# Body
# {
.annotate 'line', 7132
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7133
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7134
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7135
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7136
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7137
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7138
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7139
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7140

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7157
# Body
# {
.annotate 'line', 7159
setattribute self, 'parent', __ARG_2
.annotate 'line', 7160
setattribute self, 'owner', __ARG_2
.annotate 'line', 7161
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7162
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7163
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7164
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7166
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7167
setattribute self, 'name', $P1
.annotate 'line', 7168
$P1 = __ARG_1.'get'()
.annotate 'line', 7169
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7170
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7171
# {
.annotate 'line', 7172
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7173
$P2.'push'($P3)
.annotate 'line', 7174
$P1 = __ARG_1.'get'()
.annotate 'line', 7175
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
.annotate 'line', 7178
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7179
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7180
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7181
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7182
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7183
# var f: $P4
new $P21, [ 'MethodStatement' ]
$P4 = $P21.'parse'($P1, __ARG_1, self)
.annotate 'line', 7184
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7185
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7187
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7188
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7189
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7190
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7191
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7192
$P1 = __ARG_1.'get'()
.annotate 'line', 7193
$P22 = $P1.'isop'(';')
isfalse $I3, $P22
unless $I3 goto __label_12
.annotate 'line', 7194
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7196
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7197
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7198
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7199
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7202
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7203
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7205
# var classns: $P9
getattribute $P23, self, 'parent'
$P9 = $P23.'getpath'()
.annotate 'line', 7206
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7207
setattribute self, 'classns', $P9
# }
.annotate 'line', 7208

.end # ClassStatement


.sub 'createsubid' :method

.annotate 'line', 7209
# Body
# {
.annotate 'line', 7211
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7212

.end # createsubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7213
# Body
# {
.annotate 'line', 7215
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7216

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7217
# Body
# {
.annotate 'line', 7219
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7220

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7221
# Body
# {
.annotate 'line', 7223
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7224

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7225
# Body
# {
.annotate 'line', 7227
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7228
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7229
.return(self)
# }
.annotate 'line', 7230

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7231
# Body
# {
.annotate 'line', 7233
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7234

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7235
# Body
# {
.annotate 'line', 7237
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7238
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7239
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7240
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7242
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7244
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7245
# int n: $I1
set $I1, 1
.annotate 'line', 7246
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7247
$P3.'annotate'(__ARG_1)
.annotate 'line', 7248
# string reg: $S1
set $I2, $I1
inc $I1
$S2 = $I2
concat $S1, "$P", $S2
.annotate 'line', 7249
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7250
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7251
__ARG_1.'say'()
.annotate 'line', 7252
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7254
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7255
__ARG_1.'annotate'($P4)
.annotate 'line', 7256
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7259
__ARG_1.'say'('.end')
# }
.annotate 'line', 7260

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7146
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7148
addattribute $P0, 'parent'
.annotate 'line', 7149
addattribute $P0, 'owner'
.annotate 'line', 7150
addattribute $P0, 'name'
.annotate 'line', 7151
addattribute $P0, 'bases'
.annotate 'line', 7152
addattribute $P0, 'constants'
.annotate 'line', 7153
addattribute $P0, 'functions'
.annotate 'line', 7154
addattribute $P0, 'members'
.annotate 'line', 7155
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7267
# Body
# {
.annotate 'line', 7269
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7270
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7271
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7272
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7273
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7274
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7279
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7280
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7281
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7282
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7283
# string filepath: $S3
concat $S0, $S2, $S1
set $S3, $S0
.annotate 'line', 7284
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7285
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7286
# }
# try: end
goto __label_5
.annotate 'line', 7284
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
.annotate 'line', 7291
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7292
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7297
load_bytecode 'PGE.pbc'
.annotate 'line', 7298
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7299
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7301
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
.annotate 'line', 7302
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7303
$P8 = $P7($S4)
.annotate 'line', 7304
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7305
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7306
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7307
# int ivalue: $I1
null $I1
.annotate 'line', 7308
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7309
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7314
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7313
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7312
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7301
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7318
$P5.'close'()
# }
.annotate 'line', 7319

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7331
# Body
# {
.annotate 'line', 7333
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7334
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7335
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7336
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7337

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7338
# Body
# {
.annotate 'line', 7340
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7341
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7342
getattribute $P4, $P2, 'name'
$S1 = $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7343
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7344
.return($P4)
# }
.annotate 'line', 7345

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7346
# Body
# {
# predefined elements
.annotate 'line', 7350
elements $I1, __ARG_1
null $I2
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
null $P5
.annotate 'line', 7352
.return($P5)
__label_3: # case
.annotate 'line', 7355
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7360
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7361
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7362
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7363
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7364
getattribute $P9, $P3, 'name'
$S2 = $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7366
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7367
if_null $P4, __label_8
.annotate 'line', 7368
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7372
.return($P5)
# }
.annotate 'line', 7373

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7374
# Body
# {
.annotate 'line', 7376
# int balance1: $I1
null $I1
.annotate 'line', 7377
# int balance2: $I2
null $I2
.annotate 'line', 7378
# int balance3: $I3
null $I3
.annotate 'line', 7379
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7380
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7382
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7384
# var start: $P2
set $P2, $P1
.annotate 'line', 7385
$P1 = __ARG_1.'get'()
.annotate 'line', 7386
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7387
$P1 = __ARG_1.'get'()
.annotate 'line', 7389
# var modifier: $P3
null $P3
.annotate 'line', 7390
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7391
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7392
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7395
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7396
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7397
# var child: $P4
new $P12, [ 'NamespaceStatement' ]
$P12.'NamespaceStatement'(self, $P2, $S1, $P3)
set $P4, $P12
.annotate 'line', 7398
getattribute $P13, self, 'namespaces'
$P13.'push'($P4)
.annotate 'line', 7399
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7400
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7402
$P14 = $P1.'iskeyword'('const')
if_null $P14, __label_7
unless $P14 goto __label_7
# {
.annotate 'line', 7403
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7404
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7406
$P15 = $P1.'iskeyword'('function')
if_null $P15, __label_9
unless $P15 goto __label_9
# {
.annotate 'line', 7407
# var f: $P6
new $P16, [ 'FunctionStatement' ]
$P6 = $P16.'parse'($P1, __ARG_1, self)
.annotate 'line', 7408
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7409
$P7.'push'($P6)
.annotate 'line', 7410
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7412
$P16 = $P1.'iskeyword'('class')
if_null $P16, __label_11
unless $P16 goto __label_11
# {
.annotate 'line', 7413
# var c: $P8
new $P17, [ 'ClassStatement' ]
$P17.'ClassStatement'(__ARG_1, self)
set $P8, $P17
.annotate 'line', 7414
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7415
$P9.'push'($P8)
.annotate 'line', 7416
getattribute $P17, self, 'items'
$P17.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7418
$P18 = $P1.'iskeyword'('using')
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 7419
$P1 = __ARG_1.'get'()
.annotate 'line', 7420
$P18 = $P1.'iskeyword'('extern')
isfalse $I4, $P18
unless $I4 goto __label_15
.annotate 'line', 7421
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7422
$P1 = __ARG_1.'get'()
.annotate 'line', 7423
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_16
.annotate 'line', 7424
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7425
# string reqlib: $S2
set $P19, $P1
null $S2
if_null $P19, __label_17
set $S2, $P19
__label_17:
.annotate 'line', 7426
self.'addlib'($S2)
.annotate 'line', 7427
$P1 = __ARG_1.'get'()
.annotate 'line', 7428
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7430
$P20 = $P1.'iskeyword'('$include_const')
if_null $P20, __label_18
unless $P20 goto __label_18
# {
.annotate 'line', 7431
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7433
$P20 = $P1.'iskeyword'('$load')
if_null $P20, __label_20
unless $P20 goto __label_20
# {
.annotate 'line', 7434
$P1 = __ARG_1.'get'()
.annotate 'line', 7435
$P21 = $P1.'isstring'()
isfalse $I5, $P21
unless $I5 goto __label_22
.annotate 'line', 7436
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7437
# string reqload: $S3
set $P21, $P1
null $S3
if_null $P21, __label_23
set $S3, $P21
__label_23:
.annotate 'line', 7438
self.'addload'($S3)
.annotate 'line', 7439
$P1 = __ARG_1.'get'()
.annotate 'line', 7440
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7442
$P22 = $P1.'isop'('}')
if_null $P22, __label_24
unless $P22 goto __label_24
# {
.annotate 'line', 7443
self.'close_ns'($P1)
.annotate 'line', 7444
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7447
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
.annotate 'line', 7449
self.'unclosed_ns'()
# }
.annotate 'line', 7450

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7451
# Body
# {
.annotate 'line', 7453
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7454

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7455
# Body
# {
.annotate 'line', 7457
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7458
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7460
# int activate: $I1
set $I1, 1
.annotate 'line', 7461
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7462
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7463
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
.annotate 'line', 7466
unless $I1 goto __label_6
# {
.annotate 'line', 7467
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7468
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7470
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7472

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7323
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7325
addattribute $P0, 'namespaces'
.annotate 'line', 7326
addattribute $P0, 'classes'
.annotate 'line', 7327
addattribute $P0, 'functions'
.annotate 'line', 7328
addattribute $P0, 'items'
.annotate 'line', 7329
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7487
# Body
# {
.annotate 'line', 7490
setattribute self, 'parent', __ARG_1
.annotate 'line', 7491
setattribute self, 'start', __ARG_2
.annotate 'line', 7492
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7493
setattribute self, 'name', $P2
.annotate 'line', 7494
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7495
if_null __ARG_4, __label_0
# {
.annotate 'line', 7496
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7497
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7499

.end # NamespaceStatement


.sub 'createsubid' :method

.annotate 'line', 7500
# Body
# {
.annotate 'line', 7502
getattribute $P1, self, 'owner'
.tailcall $P1.'createsubid'()
# }
.annotate 'line', 7503

.end # createsubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7504
# Body
# {
.annotate 'line', 7506
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7507

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7508
# Body
# {
.annotate 'line', 7510
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7511
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7512
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7513
.return($P1)
# }
.annotate 'line', 7514

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7515
# Body
# {
.annotate 'line', 7517
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7518

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7519
# Body
# {
.annotate 'line', 7521
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7522

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7523
# Body
# {
.annotate 'line', 7525
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7526
unless_null $P1, __label_0
.annotate 'line', 7527
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7529
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7530

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7531
# Body
# {
.annotate 'line', 7535
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7536
unless_null $P1, __label_0
.annotate 'line', 7537
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7538
.return($P1)
# }
.annotate 'line', 7539

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7540
# Body
# {
.annotate 'line', 7542
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7543

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7544
# Body
# {
# }
.annotate 'line', 7547

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7548
# Body
# {
.annotate 'line', 7550
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7551
if_null $P1, __label_0
# {
.annotate 'line', 7552
$P1 = $P1.'optimize'()
.annotate 'line', 7553
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7555
self.'optimize_base'()
.annotate 'line', 7556
.return(self)
# }
.annotate 'line', 7557

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7558
# Body
# {
.annotate 'line', 7560
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7561
if_null $P1, __label_0
.annotate 'line', 7562
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7564
self.'emit_base'(__ARG_1)
.annotate 'line', 7566
if_null $P1, __label_1
.annotate 'line', 7567
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7568

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7479
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7481
addattribute $P0, 'parent'
.annotate 'line', 7482
addattribute $P0, 'start'
.annotate 'line', 7483
addattribute $P0, 'name'
.annotate 'line', 7484
addattribute $P0, 'modifier'
.annotate 'line', 7485
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7582
# Body
# {
.annotate 'line', 7584
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7585
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7586

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7587
# Body
# {
.annotate 'line', 7589
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7590
$P1[__ARG_1] = 1
# }
.annotate 'line', 7591

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7592
# Body
# {
.annotate 'line', 7594
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
$P2 = $P1[__ARG_1]
.annotate 'line', 7595
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7596

.end # predef_is_used


.sub 'createsubid' :method

.annotate 'line', 7598
# Body
# {
.annotate 'line', 7600
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7601
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7602
inc $I1
assign $P1, $I1
.annotate 'line', 7604
# string id: $S1
# predefined string
$S2 = $I1
concat $S0, 'WSubId_', $S2
set $S1, $S0
.annotate 'line', 7605
.return($S1)
# }
.annotate 'line', 7606

.end # createsubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7608
# Body
# {
.annotate 'line', 7610
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7611
unless_null $P1, __label_0
# {
.annotate 'line', 7612
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7613
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7615
$P1[__ARG_1] = 1
# }
.annotate 'line', 7616

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7617
# Body
# {
.annotate 'line', 7619
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7620
unless_null $P1, __label_0
# {
.annotate 'line', 7621
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7622
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7624
$P1[__ARG_1] = 1
# }
.annotate 'line', 7625

.end # addload


.sub 'getpath' :method

.annotate 'line', 7626
# Body
# {
.annotate 'line', 7628
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7629
.return($P1)
# }
.annotate 'line', 7630

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7631
# Body
# {
.annotate 'line', 7633
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7634

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7635
# Body
# {
.annotate 'line', 7638
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7639

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7640
# Body
# {
# }
.annotate 'line', 7643

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7644
# Body
# {
.annotate 'line', 7646
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7647

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7648
# Body
# {
.annotate 'line', 7650
self.'optimize_base'()
.annotate 'line', 7651
.return(self)
# }
.annotate 'line', 7652

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7653
# Body
# {
.annotate 'line', 7655
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7658
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7659
self.'addload'('String/Utils.pbc')
__label_0: # endif
.annotate 'line', 7662
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
.annotate 'line', 7665
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 7666
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 7667
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 7668
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 7671
# int somelib: $I1
null $I1
.annotate 'line', 7672
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 7673
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 7675
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 7676
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 7679
# int someload: $I2
null $I2
.annotate 'line', 7680
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 7681
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 7683
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 7684
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 7685
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 7686
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 7688
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 7689
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 7691
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 7692

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7575
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7577
addattribute $P0, 'predefs_used'
.annotate 'line', 7578
addattribute $P0, 'libs'
.annotate 'line', 7579
addattribute $P0, 'loads'
.annotate 'line', 7580
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 7704
# Body
# {
.annotate 'line', 7706
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 7709
# var taux: $P2
new $P3, [ 'TokenIdentifier' ]
$P3.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
set $P2, $P3
.annotate 'line', 7713
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 7712
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 7711
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 7717
new $P6, [ 'TokenInteger' ]
getattribute $P7, $P2, 'file'
getattribute $P8, $P2, 'line'
$P6.'TokenInteger'($P7, $P8, 'false')
set $P5, $P6
.annotate 'line', 7716
$P4 = 'integerValue'($P1, $P5, 1)
.annotate 'line', 7715
$P1.'createconst'('true', 'I', $P4, '')
.annotate 'line', 7723
new $P9, [ 'StringLiteral' ]
.annotate 'line', 7724
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
.annotate 'line', 7722
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 7727
setattribute self, 'rootns', $P1
# }
.annotate 'line', 7728

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7729
# Body
# {
.annotate 'line', 7731
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 7732

.end # parse


.sub 'optimize' :method

.annotate 'line', 7733
# Body
# {
.annotate 'line', 7735
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 7736

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7737
# Body
# {
.annotate 'line', 7739
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 7740
__ARG_1.'say'('')
.annotate 'line', 7742
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 7744
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 7745

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 7703
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 7752
# Body
# {
.annotate 'line', 7754
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 7756
$P1.'open'('__eval__', 'w')
.annotate 'line', 7757
$P1.'puts'(__ARG_1)
.annotate 'line', 7758
$P1.'close'()
.annotate 'line', 7759
$P1.'open'('__eval__', 'r')
.annotate 'line', 7760
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, '__eval__')
set $P2, $P8
.annotate 'line', 7761
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7762
$P3.'parse'($P2)
.annotate 'line', 7763
$P1.'close'()
.annotate 'line', 7764
$P3.'optimize'()
.annotate 'line', 7765
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7766
$P4.'open'('__eval__', 'w')
.annotate 'line', 7767
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7768
$P5.'initialize'($P4)
.annotate 'line', 7769
$P3.'emit'($P5)
.annotate 'line', 7770
$P5.'close'()
.annotate 'line', 7771
$P4.'close'()
.annotate 'line', 7772
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7773
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7774
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7775
.return($P7)
# }
.annotate 'line', 7776

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 7777
# Body
# {
.annotate 'line', 7779
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7780
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7781
$P1.'encoding'('utf8')
.annotate 'line', 7782
# var tk: $P2
new $P5, [ 'Tokenizer' ]
$P5.'Tokenizer'($P1, __ARG_1)
set $P2, $P5
.annotate 'line', 7783
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7784
$P3.'parse'($P2)
.annotate 'line', 7785
$P1.'close'()
.annotate 'line', 7786
$P3.'optimize'()
.annotate 'line', 7787
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 7788
$P4.'initialize'(__ARG_2)
.annotate 'line', 7789
$P3.'emit'($P4)
.annotate 'line', 7790
$P4.'close'()
# }
.annotate 'line', 7791

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 7792
# Body
# {
.annotate 'line', 7794
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 7795
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 7796
$P1.'encoding'('utf8')
.annotate 'line', 7797
# var tk: $P2
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P1, __ARG_1)
set $P2, $P8
.annotate 'line', 7798
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 7799
$P3.'parse'($P2)
.annotate 'line', 7800
$P1.'close'()
.annotate 'line', 7801
$P3.'optimize'()
.annotate 'line', 7802
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 7803
$P4.'open'('__eval__', 'w')
.annotate 'line', 7804
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 7805
$P5.'initialize'($P4)
.annotate 'line', 7806
$P3.'emit'($P5)
.annotate 'line', 7807
$P5.'close'()
.annotate 'line', 7808
$P4.'close'()
.annotate 'line', 7809
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 7810
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 7811
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 7812
.return($P7)
# }
.annotate 'line', 7813

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 7818
# Body
# {
.annotate 'line', 7820
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 7821
$P1.'parse'(__ARG_1)
.annotate 'line', 7823
$P1.'optimize'()
.annotate 'line', 7825
# var handle: $P2
null $P2
.annotate 'line', 7826
ne __ARG_2, '-', __label_0
.annotate 'line', 7827
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 7829
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 7830
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 7831
$P3.'initialize'($P2)
.annotate 'line', 7832
$P1.'emit'($P3)
.annotate 'line', 7833
$P3.'close'()
.annotate 'line', 7834
$P2.'close'()
# }
.annotate 'line', 7835

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 7841
# Body
# {
.annotate 'line', 7843
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
# predefined compreg
.annotate 'line', 7844
compreg 'winxed', $P1
# }
.annotate 'line', 7845

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 7847
# Body
# {
.annotate 'line', 7849
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 7850
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 7851
$P1.'notOptStop'(1)
.annotate 'line', 7852
$P1.'push_string'('o=s')
.annotate 'line', 7853
$P1.'push_string'('e=s')
.annotate 'line', 7854
$P1.'push_string'('c')
.annotate 'line', 7855
$P1.'push_string'('noan')
.annotate 'line', 7857
__ARG_1.'shift'()
.annotate 'line', 7858
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 7859
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 7860
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 7861
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 7862
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 7864
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 7865
# string filename: $S1
null $S1
.annotate 'line', 7866
# string expr: $S2
null $S2
.annotate 'line', 7867
# var file: $P7
null $P7
.annotate 'line', 7868
unless_null $P4, __label_0
# {
.annotate 'line', 7869
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 7870
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 7872
$S1 = __ARG_1[0]
.annotate 'line', 7873
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 7874
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, ';}'
set $S2, $S0
.annotate 'line', 7879
new $P7, [ 'StringHandle' ]
.annotate 'line', 7880
$P7.'open'('__eval__', 'w')
.annotate 'line', 7881
$P7.'puts'($S2)
.annotate 'line', 7882
$P7.'close'()
.annotate 'line', 7883
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 7886
# var t: $P8
new $P10, [ 'Tokenizer' ]
$P10.'Tokenizer'($P7, $S1)
set $P8, $P10
.annotate 'line', 7888
# string outputfile: $S3
set $S3, ''
.annotate 'line', 7889
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 7891
'winxed_parser'($P8, $S3)
.annotate 'line', 7893
$P7.'close'()
# }
.annotate 'line', 7894

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 7896
# Body
# {
.annotate 'line', 7898
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 7904
'stage1'(__ARG_1)
# try: end
goto __label_1
.annotate 'line', 7898
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 7907
# string msg: $S1
$S1 = $P1['message']
# predefined say
.annotate 'line', 7908
print 'Error: '
say $S1
.annotate 'line', 7909
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 7910
# int i: $I1
set $I1, 1
.annotate 'line', 7911
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 7912
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 7913
# string subname: $S2
null $S2
.annotate 'line', 7914
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 7916
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 7917
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
.annotate 'line', 7919
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 7920
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 7921
eq $S4, '', __label_8
# {
.annotate 'line', 7922
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 7923
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
.annotate 'line', 7927

.end # main

# End generated code
