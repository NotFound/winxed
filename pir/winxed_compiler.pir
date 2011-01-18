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
$P3 = __ARG_2.'show'()
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
concat $S1, "Expected '", __ARG_1
concat $S1, $S1, "'"
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
concat $S2, $S2, '"'
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
concat $S2, $S2, '"'
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
concat $S2, $S2, "'"
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
concat $S2, $S2, "'"
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
concat $S1, $S1, $S2
concat $S1, $S1, $S3
.annotate 'line', 322
# }
goto __label_6
__label_5: # else
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S4, $S4, $S2
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
concat $S3, $S3, $S4
concat $S3, $S3, '\n'
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, 'E'
.annotate 'line', 430
$P6 = __ARG_1.'getchar'()
set $S2, $P6
iseq $I4, $S2, '+'
if $I4 goto __label_16
iseq $I4, $S2, '-'
__label_16:
unless $I4 goto __label_15
# {
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, 'E'
.annotate 'line', 445
$P8 = __ARG_1.'getchar'()
set $S2, $P8
iseq $I5, $S2, '+'
if $I5 goto __label_23
iseq $I5, $S2, '-'
__label_23:
unless $I5 goto __label_22
# {
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, $S2
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
concat $S1, $S1, '/'
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
concat $S2, $S2, $S1
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
concat $S1, $S1, "\n"
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
concat $S1, $S1, ' goto '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ' goto '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ', '
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_1
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, "\n"
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
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_2
concat $S1, $S1, ", "
concat $S1, $S1, __ARG_3
concat $S1, $S1, "\n"
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
# Constant VAR_is_volatile evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 875
# Body
# {
.annotate 'line', 877
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 878
.return($S1)
# }
.annotate 'line', 879

.end # name


.sub 'result' :method

.annotate 'line', 880
# Body
# {
.annotate 'line', 882
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 883

.end # result


.sub 'params' :method

.annotate 'line', 884
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 885
# Body
# {
.annotate 'line', 887
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 888
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 889
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 890
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 891
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 893
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 895
.return($S1)
# }
.annotate 'line', 896

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 897
# Body
# {
box $P1, __ARG_1
.annotate 'line', 903
setattribute self, 'name', $P1
.annotate 'line', 904
setattribute self, 'body', __ARG_2
box $P2, __ARG_3
.annotate 'line', 905
setattribute self, 'typeresult', $P2
.annotate 'line', 906
# int n: $I1
null $I1
.annotate 'line', 907
if_null __ARG_4, __label_0
# {
box $P2, __ARG_4
.annotate 'line', 908
setattribute self, 'type0', $P2
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 909
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
.annotate 'line', 915
if_null __ARG_5, __label_5
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
.annotate 'line', 916
'InternalError'($S3)
__label_5: # endif
goto __label_1 # break
__label_2: # default
set $I1, 1
.annotate 'line', 920
if_null __ARG_5, __label_6
# {
box $P3, __ARG_5
.annotate 'line', 921
setattribute self, 'type1', $P3
.annotate 'line', 922
inc $I1
# }
__label_6: # endif
.annotate 'line', 924
if_null __ARG_6, __label_7
# {
box $P3, __ARG_6
.annotate 'line', 925
setattribute self, 'type2', $P3
.annotate 'line', 926
inc $I1
# }
__label_7: # endif
__label_1: # switch end
# }
__label_0: # endif
box $P4, $I1
.annotate 'line', 930
setattribute self, 'nparams', $P4
.annotate 'line', 931
.return(self)
# }
.annotate 'line', 932

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 933
# Body
# {
.annotate 'line', 941
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 942
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 943
.return(self)
# }
.annotate 'line', 944

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 945
# Body
# {
.annotate 'line', 947
# string name: $S1
getattribute $P3, self, 'name'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 948
# string typeresult: $S2
getattribute $P3, self, 'typeresult'
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
concat $S6, 'predefined ', $S1
.annotate 'line', 949
__ARG_1.'comment'($S6)
.annotate 'line', 951
getattribute $P4, self, 'nparams'
set $I4, $P4
ne $I4, -2, __label_2
# {
.annotate 'line', 952
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 953
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 954
.return()
# }
__label_2: # endif
.annotate 'line', 956
getattribute $P4, self, 'body'
isa $I4, $P4, 'String'
unless $I4 goto __label_3
# {
.annotate 'line', 957
# string body: $S3
getattribute $P5, self, 'body'
null $S3
if_null $P5, __label_5
set $S3, $P5
__label_5:
.annotate 'line', 958
# int pos: $I1
# predefined indexof
index $I1, $S3, '{res}'
.annotate 'line', 959
ne $S2, 'v', __label_6
# {
.annotate 'line', 960
isnull $I5, __ARG_4
not $I5
unless $I5 goto __label_9
isne $I5, __ARG_4, ''
__label_9:
unless $I5 goto __label_8
.annotate 'line', 961
'SyntaxError'('using return value from void predef')
__label_8: # endif
.annotate 'line', 962
eq $I1, -1, __label_10
.annotate 'line', 963
'InternalError'('void predef with {res}')
__label_10: # endif
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 966
ne $I1, -1, __label_11
.annotate 'line', 967
'InternalError'('non void predef without {res}')
__label_11: # endif
.annotate 'line', 968
isne $I5, $S2, 'v'
unless $I5 goto __label_13
isnull $I5, __ARG_4
if $I5 goto __label_14
iseq $I5, __ARG_4, ''
__label_14:
__label_13:
unless $I5 goto __label_12
.annotate 'line', 969
$P5 = __ARG_2.'tempreg'($S2)
set __ARG_4, $P5
__label_12: # endif
__label_15: # do
.annotate 'line', 970
# {
.annotate 'line', 971
# predefined substr
substr $S6, $S3, 0, $I1
add $I6, $I1, 5
# predefined substr
substr $S7, $S3, $I6
concat $S0, $S6, __ARG_4
concat $S0, $S0, $S7
set $S3, $S0
# }
.annotate 'line', 972
# predefined indexof
index $I1, $S3, '{res}'
ne $I1, -1, __label_15
__label_16: # enddo
# }
__label_7: # endif
.annotate 'line', 975
# int n: $I2
set $P6, __ARG_5
set $I2, $P6
# for loop
.annotate 'line', 976
# int i: $I3
null $I3
__label_20: # for condition
ge $I3, $I2, __label_19
# {
.annotate 'line', 977
# string argmark: $S4
set $S8, $I3
concat $S7, '{arg', $S8
concat $S4, $S7, '}'
.annotate 'line', 978
# string arg: $S5
$S5 = __ARG_5[$I3]
__label_22: # while
.annotate 'line', 979
# predefined indexof
index $I1, $S3, $S4
eq $I1, -1, __label_21
.annotate 'line', 980
# predefined substr
substr $S8, $S3, 0, $I1
add $I6, $I1, 6
# predefined substr
substr $S9, $S3, $I6
concat $S0, $S8, $S5
concat $S0, $S0, $S9
set $S3, $S0
goto __label_22
__label_21: # endwhile
# }
__label_18: # for iteration
.annotate 'line', 976
inc $I3
goto __label_20
__label_19: # for end
.annotate 'line', 982
__ARG_1.'annotate'(__ARG_3)
.annotate 'line', 983
__ARG_1.'say'($S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 986
# var fun: $P2
getattribute $P2, self, 'body'
.annotate 'line', 987
$P2(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
__label_4: # endif
# }
.annotate 'line', 989

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 866
addattribute $P0, 'name'
.annotate 'line', 867
addattribute $P0, 'body'
.annotate 'line', 868
addattribute $P0, 'evalfun'
.annotate 'line', 869
addattribute $P0, 'typeresult'
.annotate 'line', 870
addattribute $P0, 'type0'
.annotate 'line', 871
addattribute $P0, 'type1'
.annotate 'line', 872
addattribute $P0, 'type2'
.annotate 'line', 873
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 995
# Body
# {
box $P1, __ARG_1
.annotate 'line', 997
setattribute self, 'type', $P1
# }
.annotate 'line', 998

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 999
# Body
# {
.annotate 'line', 1001
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1002
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1003
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1004
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1005
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1006
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1007
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1009
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 1010
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1011
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1013

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 994
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1018
# Body
# {
.annotate 'line', 1020
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1021
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1022
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1023
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1024
$P1 = __ARG_4[$I2]
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 1023
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1025
$P1 = __ARG_4[$I1]
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1028
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 1029

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

.annotate 'line', 1034
# Body
# {
.annotate 'line', 1036
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1037
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1038
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1039
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1040
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1039
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1041
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1042

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

.annotate 'line', 1047
# Body
# {
.annotate 'line', 1049
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1050
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1051
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1052
$P1 = __ARG_4[$I2]
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 1051
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1053

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1056
# Body
# {
.annotate 'line', 1058
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1059
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1060
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1061

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1063
# Body
# {
.annotate 'line', 1065
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1066
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1067
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1068

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1070
# Body
# {
.annotate 'line', 1072
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1073
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1074
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1075

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1077
# Body
# {
.annotate 'line', 1079
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1080
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1081
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1082
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1083
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1084

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1086
# Body
# {
.annotate 'line', 1088
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1090
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1091
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1093
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
$P2.'TokenQuoted'($P4, $P5, $S1)
.annotate 'line', 1094
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1095

.end # predefeval_chr


.sub 'predefeval_substr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1097
# Body
# {
.annotate 'line', 1099
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1100
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1101
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1102
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1104
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P6, __ARG_2, 'file'
getattribute $P7, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P6, $P7, $S2)
.annotate 'line', 1105
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_1, $P3)
set $P6, $P7
.return($P6)
# }
.annotate 'line', 1106

.end # predefeval_substr


.sub 'predefeval_substr_l'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1108
# Body
# {
.annotate 'line', 1110
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1111
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1112
# var arglen: $P3
$P6 = __ARG_3[2]
getattribute $P3, $P6, 'arg'
.annotate 'line', 1113
# string str: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_0
set $S1, $P6
__label_0:
.annotate 'line', 1114
# int pos: $I1
getattribute $P7, $P2, 'numval'
set $I1, $P7
.annotate 'line', 1115
# int len: $I2
getattribute $P7, $P3, 'numval'
set $I2, $P7
.annotate 'line', 1117
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P8, __ARG_2, 'file'
getattribute $P9, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P8, $P9, $S2)
.annotate 'line', 1118
new $P9, [ 'StringLiteral' ]
$P9.'StringLiteral'(__ARG_1, $P4)
set $P8, $P9
.return($P8)
# }
.annotate 'line', 1119

.end # predefeval_substr_l


.sub 'predefeval_indexof'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1121
# Body
# {
.annotate 'line', 1123
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1124
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1125
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1126
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1127
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1128

.end # predefeval_indexof


.sub 'predefeval_indexof_pos'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1130
# Body
# {
.annotate 'line', 1132
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1133
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1134
# var argpos: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1135
# string strfrom: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1136
# string strsearch: $S2
$P6 = $P2.'get_value'()
null $S2
if_null $P6, __label_1
set $S2, $P6
__label_1:
.annotate 'line', 1137
# int pos: $I1
getattribute $P6, $P3, 'numval'
set $I1, $P6
.annotate 'line', 1138
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1139

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1141
# Body
# {
.annotate 'line', 1143
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1144
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1145
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1146
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1147
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1148
get_hll_global $P7, 'predefeval_substr'
.annotate 'line', 1149
get_hll_global $P8, 'predefeval_substr_l'
.annotate 'line', 1150
get_hll_global $P9, 'predefeval_indexof'
.annotate 'line', 1151
get_hll_global $P10, 'predefeval_indexof_pos'
.annotate 'line', 1153
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1154
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1155
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1154
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1153
$P1.'push'($P12)
.annotate 'line', 1158
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1159
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1158
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1153
$P1.'push'($P16)
.annotate 'line', 1162
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1163
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1162
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1153
$P1.'push'($P20)
.annotate 'line', 1166
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1153
$P1.'push'($P24)
.annotate 'line', 1170
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1153
$P1.'push'($P26)
.annotate 'line', 1174
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1153
$P1.'push'($P28)
.annotate 'line', 1178
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1153
$P1.'push'($P30)
.annotate 'line', 1182
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1153
$P1.'push'($P32)
.annotate 'line', 1186
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P34)
.annotate 'line', 1191
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P36)
.annotate 'line', 1196
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P38)
.annotate 'line', 1201
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1153
$P1.'push'($P40)
.annotate 'line', 1207
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1153
$P1.'push'($P42)
.annotate 'line', 1214
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1153
$P1.'push'($P44)
.annotate 'line', 1218
new $P47, [ 'PredefFunction' ]
.annotate 'line', 1218
$P46 = $P47.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1153
$P1.'push'($P46)
.annotate 'line', 1223
new $P49, [ 'PredefFunction' ]
.annotate 'line', 1223
$P48 = $P49.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1153
$P1.'push'($P48)
.annotate 'line', 1228
new $P51, [ 'PredefFunction' ]
.annotate 'line', 1228
$P50 = $P51.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1153
$P1.'push'($P50)
.annotate 'line', 1235
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1235
$P52 = $P53.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1153
$P1.'push'($P52)
.annotate 'line', 1240
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1240
$P54 = $P55.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1153
$P1.'push'($P54)
.annotate 'line', 1245
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1245
$P56 = $P57.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1153
$P1.'push'($P56)
.annotate 'line', 1250
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1250
$P58 = $P59.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1153
$P1.'push'($P58)
.annotate 'line', 1255
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1255
$P60 = $P61.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P60)
.annotate 'line', 1260
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1260
$P62 = $P63.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1153
$P1.'push'($P62)
.annotate 'line', 1265
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1153
$P1.'push'($P64)
.annotate 'line', 1269
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P66)
.annotate 'line', 1273
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P68)
.annotate 'line', 1277
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P70)
.annotate 'line', 1281
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P72)
.annotate 'line', 1285
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P74)
.annotate 'line', 1290
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P76)
.annotate 'line', 1295
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P78)
.annotate 'line', 1299
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P80)
.annotate 'line', 1303
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P82)
.annotate 'line', 1307
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P84)
.annotate 'line', 1311
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P86)
.annotate 'line', 1315
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P88)
.annotate 'line', 1319
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P90)
.annotate 'line', 1323
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P92)
.annotate 'line', 1327
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P94)
.annotate 'line', 1331
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P96)
.annotate 'line', 1335
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1153
$P1.'push'($P98)
.annotate 'line', 1339
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1153
$P1.'push'($P100)
.annotate 'line', 1343
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P102)
.annotate 'line', 1347
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P104)
.annotate 'line', 1351
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P106)
.annotate 'line', 1355
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1153
$P1.'push'($P108)
.annotate 'line', 1359
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1153
$P1.'push'($P110)
.annotate 'line', 1363
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P112)
.annotate 'line', 1367
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1153
$P1.'push'($P114)
.annotate 'line', 1371
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P116)
.annotate 'line', 1376
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P118)
.annotate 'line', 1381
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1153
$P1.'push'($P120)
.annotate 'line', 1385
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1153
$P1.'push'($P122)
.annotate 'line', 1389
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1153
$P1.'push'($P124)
.annotate 'line', 1393
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1153
$P1.'push'($P126)
.annotate 'line', 1397
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1153
$P1.'push'($P128)
.annotate 'line', 1401
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1402
new $P132, [ 'Predef_print' ]
.annotate 'line', 1401
$P130 = $P131.'set'('print', $P132, 'P', '*')
.annotate 'line', 1153
$P1.'push'($P130)
.annotate 'line', 1405
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1406
new $P135, [ 'Predef_say' ]
.annotate 'line', 1405
$P133 = $P134.'set'('say', $P135, 'P', '*')
.annotate 'line', 1153
$P1.'push'($P133)
.annotate 'line', 1409
new $P137, [ 'PredefFunction' ]
.annotate 'line', 1410
new $P138, [ 'Predef_cry' ]
.annotate 'line', 1409
$P136 = $P137.'set'('cry', $P138, 'P', '*')
.annotate 'line', 1153
$P1.'push'($P136)
__label_1: # Infinite loop
.annotate 'line', 1415
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1416

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1418
# Body
# {
.annotate 'line', 1420
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1421
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1422
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1423
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1424
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1425
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1426
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1428
.return($P2)
# }
.annotate 'line', 1429

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1435
# Body
# {
.annotate 'line', 1437
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1438
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1439
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1438
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1440

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1451
# Body
# {
.annotate 'line', 1453
setattribute self, 'start', __ARG_1
.annotate 'line', 1454
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1455

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1456
# Body
# {
.annotate 'line', 1458
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1459

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1460
# Body
# {
.annotate 'line', 1462
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1463

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1464
# Body
# {
.annotate 'line', 1466
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1467

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1468
# Body
# {
.annotate 'line', 1470
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1471

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1472
# Body
# {
.annotate 'line', 1474
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1475

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1448
addattribute $P0, 'start'
.annotate 'line', 1449
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1488
# Body
# {
.annotate 'line', 1490
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1491

.end # init


.sub 'numargs' :method

.annotate 'line', 1493
# Body
# {
.annotate 'line', 1495
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1496

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1497
# Body
# {
.annotate 'line', 1499
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1500
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1501

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1503
# Body
# {
.annotate 'line', 1505
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1506
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1507
# {
.annotate 'line', 1508
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1509
$P1.'push'($P3)
# }
.annotate 'line', 1510
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1511
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1512

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1514
# Body
# {
.annotate 'line', 1516
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1517
if_null $P1, __label_0
.annotate 'line', 1518
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1519

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1520
# Body
# {
.annotate 'line', 1522
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1523
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1524
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1525
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1526
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1527
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1528
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1525
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1530
.return($P2)
# }
.annotate 'line', 1531

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1532
# Body
# {
.annotate 'line', 1534
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1535
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1536

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1486
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1548
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1549
# Body
# {
.annotate 'line', 1551
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1552
.return($I1)
# }
.annotate 'line', 1553

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1554
# Body
# {
.annotate 'line', 1556
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1557
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1558
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1560
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1561

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1562
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1564
setattribute self, 'name', $P1
.annotate 'line', 1565
if_null __ARG_2, __label_0
.annotate 'line', 1566
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1567

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1568
# Body
# {
.annotate 'line', 1570
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1571

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1545
addattribute $P0, 'name'
.annotate 'line', 1546
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1578
# Body
# {
.annotate 'line', 1580
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1581
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1582
# {
.annotate 'line', 1583
$P2 = __ARG_1.'get'()
.annotate 'line', 1584
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1585
$P2 = __ARG_1.'get'()
.annotate 'line', 1586
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1587
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1588
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1589
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1591
new $P6, [ 'Modifier' ]
$P6.'Modifier'($S1, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
.annotate 'line', 1592
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1593
'RequireOp'(']', $P2)
.annotate 'line', 1594
setattribute self, 'list', $P1
# }
.annotate 'line', 1595

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1596
# Body
# {
.annotate 'line', 1598
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1599
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1600

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1601
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1602
# Body
# {
.annotate 'line', 1604
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1605
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1606
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1607
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1608
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1609
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1606
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1612
.return($P3)
# }
.annotate 'line', 1613

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1576
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1620
# Body
# {
.annotate 'line', 1622
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1623
.return($S2)
# }
.annotate 'line', 1624

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1626
# Body
# {
.annotate 'line', 1628
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1629
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1631
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1632
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1634

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1636
# Body
# {
.annotate 'line', 1638
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1639
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1640
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1641
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1642
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1644
__ARG_2.'unget'($P1)
.annotate 'line', 1645
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1647

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1649
# Body
# {
.annotate 'line', 1651
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1652
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1653
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1654
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1655
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1656
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1657
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1659
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1660
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1661
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
.annotate 'line', 1663
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1665
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1668
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1671
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1673
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1675
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1677
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1679
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_14: # case
.annotate 'line', 1681
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_15: # case
.annotate 'line', 1683
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_16: # case
.annotate 'line', 1685
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_17: # case
.annotate 'line', 1687
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_18: # case
.annotate 'line', 1689
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_19: # case
.annotate 'line', 1691
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_20: # case
.annotate 'line', 1693
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_21: # case
.annotate 'line', 1695
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_22: # case
.annotate 'line', 1697
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1699
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_24: # case
.annotate 'line', 1701
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1703
$P30 = $P1.'isidentifier'()
if_null $P30, __label_25
unless $P30 goto __label_25
# {
.annotate 'line', 1704
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1705
$P9 = $P3.'isop'(':')
if_null $P9, __label_26
unless $P9 goto __label_26
.annotate 'line', 1706
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_26: # endif
.annotate 'line', 1707
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1709
__ARG_1.'unget'($P1)
.annotate 'line', 1710
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1712
unless_null $P2, __label_27
.annotate 'line', 1713
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1714
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1715

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1723
# Body
# {
.annotate 'line', 1725
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1726

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1727
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1728
# Body
# {
.annotate 'line', 1730
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1731

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1732
# Body
# {
.annotate 'line', 1734
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1735

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1736
# Body
# {
.annotate 'line', 1738
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1739

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1740
# Body
# {
.annotate 'line', 1742
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1743

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1744
# Body
# {
.annotate 'line', 1746
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1747

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1748
# Body
# {
.annotate 'line', 1750
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1751

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1752
# Body
# {
.annotate 'line', 1754
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1755

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1756
# Body
# {
.annotate 'line', 1758
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1759

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1760
# Body
# {
.annotate 'line', 1762
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1763

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1764
# Body
# {
.annotate 'line', 1766
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1767

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1769
# Body
# {
.annotate 'line', 1774
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1775

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1776
# Body
# {
.annotate 'line', 1778
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1779

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1780
# Body
# {
.annotate 'line', 1782
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1783

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1784
# Body
# {
.annotate 'line', 1786
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1788
.return(self)
# }
.annotate 'line', 1789

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1721
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1794
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1795
# Body
# {
.annotate 'line', 1797
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1798

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1799
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1800
# Body
# {
# }
.annotate 'line', 1803

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1792
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1810
# Body
# {
.annotate 'line', 1812
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1813
$P1.'push'(__ARG_1)
.annotate 'line', 1814
$P1.'push'(__ARG_2)
.annotate 'line', 1815
setattribute self, 'statements', $P1
# }
.annotate 'line', 1816

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1817
# Body
# {
.annotate 'line', 1819
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1820
.return(self)
# }
.annotate 'line', 1821

.end # push


.sub 'optimize' :method

.annotate 'line', 1822
# Body
# {
.annotate 'line', 1824
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1825
.return(self)
# }
.annotate 'line', 1826

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1827
# Body
# {
.annotate 'line', 1829
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1830
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1831

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1808
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1834
# Body
# {
.annotate 'line', 1836
unless_null __ARG_1, __label_0
.annotate 'line', 1837
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1838
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1839
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1841
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1842

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1852
# Body
# {
.annotate 'line', 1854
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1855
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1856
# int dotted: $I1
null $I1
.annotate 'line', 1857
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1859
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1861
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
.annotate 'line', 1862
setattribute self, 'opname', $P3
.annotate 'line', 1863
$P1 = __ARG_2.'get'()
.annotate 'line', 1864
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1865
__ARG_2.'unget'($P1)
.annotate 'line', 1866
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1868
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1869

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1870
# Body
# {
.annotate 'line', 1872
self.'optimizeargs'()
.annotate 'line', 1873
.return(self)
# }
.annotate 'line', 1874

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1875
# Body
# {
.annotate 'line', 1877
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1878
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1879
__ARG_1.'comment'($S2)
.annotate 'line', 1880
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1881
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1883
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1884
self.'emitargs'(__ARG_1)
.annotate 'line', 1885
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1887

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1848
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1850
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1897
# Body
# {
.annotate 'line', 1899
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1900
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1901
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1902
# {
.annotate 'line', 1903
$P2 = __ARG_2.'get'()
.annotate 'line', 1904
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1905
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1906
'RequireOp'(';', $P2)
.annotate 'line', 1907
setattribute self, 'path', $P1
.annotate 'line', 1908
.return(self)
# }
.annotate 'line', 1909

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1910
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1911
# Body
# {
.annotate 'line', 1913
self.'annotate'(__ARG_1)
.annotate 'line', 1914
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1915

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1894
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1896
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1925
# Body
# {
.annotate 'line', 1927
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1928
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1929
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1930
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1931

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1932
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1933
# Body
# {
.annotate 'line', 1935
self.'annotate'(__ARG_1)
.annotate 'line', 1936
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1937
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1938

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1922
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1924
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1948
# Body
# {
.annotate 'line', 1950
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1951
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1952
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1953
# {
.annotate 'line', 1954
$P2 = __ARG_2.'get'()
.annotate 'line', 1955
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1956
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1957
'RequireOp'(';', $P2)
.annotate 'line', 1958
setattribute self, 'path', $P1
# }
.annotate 'line', 1959

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1960
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1961
# Body
# {
.annotate 'line', 1963
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1964
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1965
self.'annotate'(__ARG_1)
.annotate 'line', 1967
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 1968
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 1970
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 1971
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1973
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1976
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1978

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1945
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1947
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1988
# Body
# {
.annotate 'line', 1990
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1991
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1992
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1993

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1994
# Body
# {
.annotate 'line', 1996
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1997
.return(self)
# }
.annotate 'line', 1998

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1999
# Body
# {
.annotate 'line', 2001
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2002

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1985
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1987
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2019
# Body
# {
.annotate 'line', 2021
setattribute self, 'type', __ARG_1
.annotate 'line', 2022
setattribute self, 'reg', __ARG_2
.annotate 'line', 2023
setattribute self, 'scope', __ARG_3
box $P2, __ARG_4
.annotate 'line', 2024
setattribute self, 'flags', $P2
.annotate 'line', 2025
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2026

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2027
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2029
setattribute self, 'id', $P1
# }
.annotate 'line', 2030

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2031
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2033
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2034

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2035
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2036
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2037
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2038
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2039
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2040
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2041
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2042
# Body
# {
# predefined int
getattribute $P1, self, 'flags'
set $I2, $P1
set $I3, 1
band $I1, $I2, $I3
.return($I1)
# }

.end # isvolatile

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarData' ]
.annotate 'line', 2011
addattribute $P0, 'type'
.annotate 'line', 2012
addattribute $P0, 'reg'
.annotate 'line', 2013
addattribute $P0, 'scope'
.annotate 'line', 2014
addattribute $P0, 'flags'
.annotate 'line', 2015
addattribute $P0, 'value'
.annotate 'line', 2016
addattribute $P0, 'id'
.annotate 'line', 2017
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2048
# Body
# {
.annotate 'line', 2050
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2051

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2052
# Body
# {
.annotate 'line', 2054
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2055

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2047
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2062
# Body
# {
.annotate 'line', 2064
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2065

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2066
# Body
# {
.annotate 'line', 2068
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2069
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2070
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2071
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
.annotate 'line', 2072
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2073
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2074
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2075
$P1[$S1] = $P3
.annotate 'line', 2076
.return($P3)
# }
.annotate 'line', 2077

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2078
# Body
# {
.annotate 'line', 2080
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2081
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2082
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2083
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2084
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2085
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2086

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2087
# Body
# {
.annotate 'line', 2089
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2090
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2091
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2092
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2093
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2094
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2095
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2096
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2097
$P1[$S1] = $P3
# }
.annotate 'line', 2098

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2099
# Body
# {
.annotate 'line', 2101
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2102
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2103
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2104
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2105
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2106
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2107
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2108
.return($P2)
# }
.annotate 'line', 2109

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2110
# Body
# {
.annotate 'line', 2112
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2113
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2114
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2115
.return($P2)
# }
.annotate 'line', 2116

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2117
# Body
# {
.annotate 'line', 2119
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2120
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2121
.return($S1)
# }
.annotate 'line', 2122

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2123
# Body
# {
.annotate 'line', 2125
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2127
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2128
.return('__WLEX_self')
# }
.annotate 'line', 2129

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2061
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2138
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2148
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2149
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2150
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2151
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2152
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2153
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2154
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2155
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2156
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2157
# Body
# {
.annotate 'line', 2159
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2160

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2161
# Body
# {
.annotate 'line', 2163
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2164

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2165
# Body
# {
.annotate 'line', 2168
.return(self)
# }
.annotate 'line', 2169

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2170
# Body
# {
.annotate 'line', 2172
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2173
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2174
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2175
.return($S2)
# }
.annotate 'line', 2176

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2177
# Body
# {
.annotate 'line', 2179
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2180

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2146
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2185
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2183
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2193
# Body
# {
.annotate 'line', 2195
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2196
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2197
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2198
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2199
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2200

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2201
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2202
# Body
# {
.annotate 'line', 2204
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2205
.return(self)
# }
.annotate 'line', 2206

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2207
# Body
# {
.annotate 'line', 2209
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2210
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2211
self.'annotate'(__ARG_1)
.annotate 'line', 2212
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
set $S2, __ARG_2
.annotate 'line', 2213
eq $S2, '', __label_1
.annotate 'line', 2214
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2215

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2190
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2192
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2228
# Body
# {
.annotate 'line', 2230
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2231
.return(self)
# }
.annotate 'line', 2232

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2233
# Body
# {
.annotate 'line', 2235
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2236

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2237
# Body
# {
.annotate 'line', 2239
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2240
.return(self)
# }
.annotate 'line', 2241

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2242
# Body
# {
.annotate 'line', 2244
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2245
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2246
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2248
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2249
ne $I1, 0, __label_4
.annotate 'line', 2250
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2252
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2255
.return(0)
# }
.annotate 'line', 2256

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2257
# Body
# {
.annotate 'line', 2259
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2261
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2262
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2263
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2265
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2266
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2267
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
.annotate 'line', 2270
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2273
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2276
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2279

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2280
# Body
# {
.annotate 'line', 2282
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2284
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2285
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2286
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2288
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2289
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2290
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
.annotate 'line', 2293
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2296
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2299
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2302

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2227
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2309
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2310
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2307
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2318
# Body
# {
.annotate 'line', 2320
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2321
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2322

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2323
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2324
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2325
# Body
# {
.annotate 'line', 2327
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2328
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2329
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2330
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2331
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2332
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2334
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
unless $I2 goto __label_4
.annotate 'line', 2337
# {
unless $I1 goto __label_5
.annotate 'line', 2338
# {
null $I1
.annotate 'line', 2340
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2342
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2343
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2345
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2348
# string result: $S4
set $S4, ''
.annotate 'line', 2349
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2350
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2351
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2352
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2353
le $I6, 127, __label_12
# {
.annotate 'line', 2354
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
.annotate 'line', 2355
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2358
# }
__label_9: # for iteration
.annotate 'line', 2350
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2360
# }
__label_4: # endif
.annotate 'line', 2362
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
.annotate 'line', 2366
.return($S1)
# }
.annotate 'line', 2367

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2368
# Body
# {
.annotate 'line', 2370
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2371
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2372
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2373
# var s: $P2
box $P2, $S1
.annotate 'line', 2374
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2376
.return($S1)
# }
.annotate 'line', 2377

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2378
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2380
eq $S1, '', __label_0
.annotate 'line', 2381
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2382

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2383
# Body
# {
.annotate 'line', 2385
.tailcall self.'getPirString'()
# }
.annotate 'line', 2386

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2315
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2317
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2395
# Body
# {
.annotate 'line', 2398
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2399
setattribute self, 'pos', __ARG_2
.annotate 'line', 2400
# int n: $I1
null $I1
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2402
# {
.annotate 'line', 2404
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2405
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2407
setattribute self, 'numval', $P2
# }
.annotate 'line', 2408

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2409
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2410
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2411
# Body
# {
.annotate 'line', 2413
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2414
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2415
.return($I1)
# }
.annotate 'line', 2416

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2417
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2419
eq $S1, '', __label_0
# {
.annotate 'line', 2420
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2421
ne $I1, 0, __label_1
.annotate 'line', 2422
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2424
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2426

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2427
# Body
# {
.annotate 'line', 2429
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2430

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2391
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2393
addattribute $P0, 'pos'
.annotate 'line', 2394
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2438
# Body
# {
.annotate 'line', 2440
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2441
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2442

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2443
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2444
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2445
# Body
# {
.annotate 'line', 2447
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2448
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2450
.return($P1)
# }
.annotate 'line', 2451

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2452
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2454
eq $S1, '', __label_0
# {
.annotate 'line', 2455
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2456
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2458

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2459
# Body
# {
.annotate 'line', 2463
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2464
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2466
.return($S1)
# }
.annotate 'line', 2467

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2435
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2437
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2475
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2476
# Body
# {
.annotate 'line', 2478
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2479
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2480

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2481
# Body
# {
.annotate 'line', 2483
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2484

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2485
# Body
# {
.annotate 'line', 2487
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2488
if_null $P1, __label_0
.annotate 'line', 2489
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2491
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
.annotate 'line', 2494
.return('P')
__label_3: # default
.annotate 'line', 2496
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2499

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2500
# Body
# {
.annotate 'line', 2502
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2503
.return($S1)
# }
.annotate 'line', 2504

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2505
# Body
# {
.annotate 'line', 2507
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2508
unless_null $P1, __label_0
.annotate 'line', 2509
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2510
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2511
# string s: $S1
null $S1
.annotate 'line', 2512
unless_null $P2, __label_1
# {
.annotate 'line', 2513
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2514
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
.annotate 'line', 2520
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2524
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2525
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2527
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2529
.return($S1)
# }
.annotate 'line', 2530

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2531
# Body
# {
.annotate 'line', 2533
# var value: $P1
$P1 = self.'checkIdentifier'()
set $S2, $P1
.annotate 'line', 2534
ne $S2, '', __label_0
# {
.annotate 'line', 2535
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
.annotate 'line', 2536
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2538
.return($P1)
# }
.annotate 'line', 2539

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2540
# Body
# {
.annotate 'line', 2542
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2543
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2544
if_null $P2, __label_0
# {
.annotate 'line', 2545
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2546
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2548
.return(self)
# }
.annotate 'line', 2549

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2550
# Body
# {
.annotate 'line', 2552
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2553
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2554
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2555
# string lexname: $S2
$P3 = $P1.'getlex'()
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2556
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2557
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2559
.return($S1)
# }
.annotate 'line', 2560

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2561
# Body
# {
set $S2, __ARG_2
.annotate 'line', 2563
eq $S2, '', __label_0
# {
.annotate 'line', 2564
self.'annotate'(__ARG_1)
.annotate 'line', 2565
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2566
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2568

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2569
# Body
# {
.annotate 'line', 2571
self.'annotate'(__ARG_1)
.annotate 'line', 2572
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2573
.return($S1)
# }
.annotate 'line', 2574

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2575
# Body
# {
.annotate 'line', 2577
self.'annotate'(__ARG_1)
.annotate 'line', 2578
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2579
die "NO"
__label_0: # endif
.annotate 'line', 2580
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2581
# string lreg: $S2
$P3 = self.'getIdentifier'()
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 2582
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
# {
set $S6, $S1
set $S7, 'S'
.annotate 'line', 2583
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2586
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2589
getattribute $P4, self, 'start'
'SyntaxError'("Can't assign null to that type", $P4)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2592
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2593
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2595
# string typeright: $S3
$P4 = __ARG_2.'checkresult'()
null $S3
if_null $P4, __label_11
set $S3, $P4
__label_11:
.annotate 'line', 2596
ne $S1, $S3, __label_12
# {
.annotate 'line', 2597
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 2600
# string rreg: $S4
$P5 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_14
set $S4, $P5
__label_14:
.annotate 'line', 2601
self.'annotate'(__ARG_1)
.annotate 'line', 2602
iseq $I1, $S1, 'P'
unless $I1 goto __label_17
isne $I1, $S3, 'P'
__label_17:
unless $I1 goto __label_15
.annotate 'line', 2603
__ARG_1.'emitbox'($S2, $S4)
goto __label_16
__label_15: # else
.annotate 'line', 2605
__ARG_1.'emitset'($S2, $S4)
__label_16: # endif
# }
__label_13: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2608
# var desc: $P1
getattribute $P5, self, 'owner'
getattribute $P6, self, 'name'
$P1 = $P5.'getvar'($P6)
.annotate 'line', 2609
$P6 = $P1.'isvolatile'()
if_null $P6, __label_18
unless $P6 goto __label_18
# {
.annotate 'line', 2610
# string lexname: $S5
$P7 = $P1.'getlex'()
null $S5
if_null $P7, __label_19
set $S5, $P7
__label_19:
.annotate 'line', 2611
isnull $I2, $S5
not $I2
unless $I2 goto __label_21
isne $I2, $S5, ''
__label_21:
unless $I2 goto __label_20
.annotate 'line', 2612
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_20: # endif
# }
__label_18: # endif
.annotate 'line', 2614
.return($S2)
# }
.annotate 'line', 2615

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2472
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2474
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2622
# Body
# {
.annotate 'line', 2624
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2625

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2620
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2633
# Body
# {
.annotate 'line', 2635
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2636
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2637

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2638
# Body
# {
.annotate 'line', 2640
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2641

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2642
# Body
# {
.annotate 'line', 2644
self.'optimizearg'()
.annotate 'line', 2645
.return(self)
# }
.annotate 'line', 2646

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2630
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2632
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2655
# Body
# {
.annotate 'line', 2657
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2658
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2659
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2660

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2661
# Body
# {
.annotate 'line', 2663
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2664
.return(self)
# }
.annotate 'line', 2665

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2666
# Body
# {
.annotate 'line', 2668
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2669

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2670
# Body
# {
.annotate 'line', 2672
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2673
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2674

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2675
# Body
# {
.annotate 'line', 2677
self.'optimizearg'()
.annotate 'line', 2678
.return(self)
# }
.annotate 'line', 2679

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2651
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2653
addattribute $P0, 'lexpr'
.annotate 'line', 2654
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2686
# Body
# {
.annotate 'line', 2688
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2689

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2690
# Body
# {
.annotate 'line', 2692
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2693
.return(self)
# }
.annotate 'line', 2694

.end # set


.sub 'optimize' :method

.annotate 'line', 2695
# Body
# {
.annotate 'line', 2697
self.'optimizearg'()
.annotate 'line', 2698
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2699
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2700
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2701
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2704
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2705
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2706
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2707
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2710
.return(self)
# }
.annotate 'line', 2711

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2712
# Body
# {
.annotate 'line', 2714
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2715
self.'annotate'(__ARG_1)
.annotate 'line', 2716
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2717

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2684
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2724
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2725
# Body
# {
.annotate 'line', 2727
.return('I')
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


.sub 'optimize' :method

.annotate 'line', 2734
# Body
# {
.annotate 'line', 2736
self.'optimizearg'()
.annotate 'line', 2737
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2738
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2739
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2740
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2741
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2743
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2744
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2745
.return(self)
# }
.annotate 'line', 2746

.end # optimize


.sub 'negated' :method

.annotate 'line', 2747
# Body
# {
.annotate 'line', 2749
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2750

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2751
# Body
# {
.annotate 'line', 2753
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2754
self.'annotate'(__ARG_1)
.annotate 'line', 2755
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2756
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2758
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2761
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2764
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2766

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2722
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2773
# Body
# {
.annotate 'line', 2775
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2776

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2777
# Body
# {
.annotate 'line', 2779
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2780
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2781
.return(self)
# }
.annotate 'line', 2782

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2783
# Body
# {
.annotate 'line', 2785
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2786
eq $S2, '', __label_1
.annotate 'line', 2787
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2788

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2789
# Body
# {
.annotate 'line', 2791
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2792
self.'annotate'(__ARG_1)
.annotate 'line', 2793
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2794
.return($S1)
# }
.annotate 'line', 2795

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2771
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2802
# Body
# {
.annotate 'line', 2804
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2805
.return(self)
# }
.annotate 'line', 2806

.end # set


.sub 'checkresult' :method

.annotate 'line', 2807
# Body
# {
.annotate 'line', 2809
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2810

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2811
# Body
# {
.annotate 'line', 2813
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2814
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2815
eq $S2, '', __label_1
.annotate 'line', 2816
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2817
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2818
.return($S1)
# }
.annotate 'line', 2819

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2800
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2826
# Body
# {
.annotate 'line', 2828
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
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


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2838
eq $S2, '', __label_1
.annotate 'line', 2839
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2840

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2841
# Body
# {
.annotate 'line', 2843
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2844
self.'annotate'(__ARG_1)
.annotate 'line', 2845
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2846
.return($S1)
# }
.annotate 'line', 2847

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2824
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2854
# Body
# {
.annotate 'line', 2856
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2857
.return(self)
# }
.annotate 'line', 2858

.end # set


.sub 'checkresult' :method

.annotate 'line', 2859
# Body
# {
.annotate 'line', 2861
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2862

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2863
# Body
# {
.annotate 'line', 2865
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2866
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2867
eq $S2, '', __label_1
.annotate 'line', 2868
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2869
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2870
.return($S1)
# }
.annotate 'line', 2871

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2852
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2880
# Body
# {
.annotate 'line', 2882
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2883
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2884
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2885
.return(self)
# }
.annotate 'line', 2886

.end # set


.sub 'checkresult' :method

.annotate 'line', 2887
# Body
# {
.annotate 'line', 2889
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2890
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2892
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2893

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2894
# Body
# {
.annotate 'line', 2896
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2897
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2898
.return(self)
# }
.annotate 'line', 2899

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2900
# Body
# {
.annotate 'line', 2902
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2903

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2876
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2878
addattribute $P0, 'lexpr'
.annotate 'line', 2879
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2910
# Body
# {
.annotate 'line', 2912
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2913
eq $S2, '', __label_1
# {
.annotate 'line', 2914
self.'annotate'(__ARG_1)
.annotate 'line', 2915
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2917

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2918
# Body
# {
.annotate 'line', 2920
self.'annotate'(__ARG_1)
.annotate 'line', 2921
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2922
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2923

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2908
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2930
# Body
# {
.annotate 'line', 2932
self.'annotate'(__ARG_1)
.annotate 'line', 2933
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2934
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2935
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2936

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2937
# Body
# {
.annotate 'line', 2939
self.'annotate'(__ARG_1)
.annotate 'line', 2940
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2941
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2942
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2943
.return($S1)
# }
.annotate 'line', 2944

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2928
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2951
# Body
# {
.annotate 'line', 2953
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2954
eq $S2, '', __label_1
.annotate 'line', 2955
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2956

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2957
# Body
# {
.annotate 'line', 2959
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2960
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2961
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2962
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2963
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2964
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2966
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2967
self.'annotate'(__ARG_1)
.annotate 'line', 2968
ne $S1, 'S', __label_6
# {
.annotate 'line', 2969
$P4 = $P2.'checkresult'()
set $S5, $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2970
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2971
__ARG_1.'emitset'($S4, $S3)
set $S3, $S4
.annotate 'line', 2972
# }
__label_8: # endif
.annotate 'line', 2974
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2977
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2979
.return($S2)
# }
.annotate 'line', 2980

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2949
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2987
# Body
# {
.annotate 'line', 2989
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2990
eq $S2, '', __label_1
.annotate 'line', 2991
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2992

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2993
# Body
# {
.annotate 'line', 2995
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2996
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2997
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2998
self.'annotate'(__ARG_1)
.annotate 'line', 2999
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 3000
.return($S2)
# }
.annotate 'line', 3001

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2985
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3008
# Body
# {
.annotate 'line', 3010
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3011
eq $S2, '', __label_1
.annotate 'line', 3012
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3013

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3014
# Body
# {
.annotate 'line', 3016
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3017
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3018
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3019
self.'annotate'(__ARG_1)
.annotate 'line', 3020
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 3021
.return($S2)
# }
.annotate 'line', 3022

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3006
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3029
# Body
# {
.annotate 'line', 3031
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3032
eq $S2, '', __label_1
.annotate 'line', 3033
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3034

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3035
# Body
# {
.annotate 'line', 3037
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3038
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3039
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3040
self.'annotate'(__ARG_1)
.annotate 'line', 3041
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3042
.return($S2)
# }
.annotate 'line', 3043

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3027
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3050
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3051
# Body
# {
.annotate 'line', 3053
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3054
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3055
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3056
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3057
self.'annotate'(__ARG_1)
.annotate 'line', 3058
# string aux: $S5
null $S5
.annotate 'line', 3059
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3061
ne $S1, 'I', __label_7
# {
.annotate 'line', 3062
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3063
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3064
# }
__label_7: # endif
.annotate 'line', 3066
ne $S2, 'I', __label_8
# {
.annotate 'line', 3067
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3068
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3069
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3072
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3073
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3074
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3075
# }
goto __label_10
__label_9: # else
.annotate 'line', 3077
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3078
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3079
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3080
# }
goto __label_13
__label_12: # else
.annotate 'line', 3082
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 3083
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3084
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3085
# }
goto __label_16
__label_15: # else
.annotate 'line', 3087
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 3088
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3089
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3090
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 3093
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3095
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3098
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3101
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3102
# }
.annotate 'line', 3104

.end # emit_comparator


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


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3109
# Body
# {
.annotate 'line', 3111
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3112

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3113
# Body
# {
.annotate 'line', 3115
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3116

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3048
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3129
# Body
# {
.annotate 'line', 3131
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3132
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3133
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3134

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3135
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3136
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3137
# Body
# {
.annotate 'line', 3139
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3140
setattribute self, 'checknull', $P1
.annotate 'line', 3141
.return(self)
# }
.annotate 'line', 3142

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3143
# Body
# {
.annotate 'line', 3145
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3146
self.'annotate'(__ARG_1)
.annotate 'line', 3147
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3148
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3149
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3150

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3151
# Body
# {
.annotate 'line', 3153
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3154
self.'annotate'(__ARG_1)
.annotate 'line', 3155
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
.annotate 'line', 3156

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3124
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3126
addattribute $P0, 'expr'
.annotate 'line', 3127
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3163
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3164
# Body
# {
.annotate 'line', 3166
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3167

.end # negated


.sub 'optimize' :method

.annotate 'line', 3168
# Body
# {
.annotate 'line', 3170
self.'optimizearg'()
.annotate 'line', 3171
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3172
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3173
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3174
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3175
# {
unless $I2 goto __label_1
.annotate 'line', 3177
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3179
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3182
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3183
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3184
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3185
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3186
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3187
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3188
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3189
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3192
.return(self)
# }
.annotate 'line', 3193

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3194
# Body
# {
.annotate 'line', 3196
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3197

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3198
# Body
# {
.annotate 'line', 3200
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3201

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3202
# Body
# {
.annotate 'line', 3204
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3205

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3206
# Body
# {
.annotate 'line', 3208
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3209

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3161
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3216
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3217
# Body
# {
.annotate 'line', 3219
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3220

.end # negated


.sub 'optimize' :method

.annotate 'line', 3221
# Body
# {
.annotate 'line', 3223
self.'optimizearg'()
.annotate 'line', 3224
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3225
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3226
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3227
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3228
# {
unless $I2 goto __label_1
.annotate 'line', 3230
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3232
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3235
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3236
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3237
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3238
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3239
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3240
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3241
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3242
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3245
.return(self)
# }
.annotate 'line', 3246

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3247
# Body
# {
.annotate 'line', 3249
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3250

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3251
# Body
# {
.annotate 'line', 3253
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3254

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3255
# Body
# {
.annotate 'line', 3257
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3258

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3259
# Body
# {
.annotate 'line', 3261
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3262

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3214
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

.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3273
setattribute self, 'positive', $P1
# }
.annotate 'line', 3274

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3275
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3276
# Body
# {
.annotate 'line', 3278
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3279
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
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3284
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3285
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3286

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3287
# Body
# {
.annotate 'line', 3289
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3290

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3291
# Body
# {
.annotate 'line', 3293
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3294
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3295
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3296

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3297
# Body
# {
.annotate 'line', 3299
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3300
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3301
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3302

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3267
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3269
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3309
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3310
# Body
# {
.annotate 'line', 3312
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3313

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3314
# Body
# {
.annotate 'line', 3316
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3317

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3318
# Body
# {
.annotate 'line', 3320
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3321

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3322
# Body
# {
.annotate 'line', 3324
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3325

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3307
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3332
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3333
# Body
# {
.annotate 'line', 3335
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3336

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3337
# Body
# {
.annotate 'line', 3339
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3340

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3341
# Body
# {
.annotate 'line', 3343
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3344

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3345
# Body
# {
.annotate 'line', 3347
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3348

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3330
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3355
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3356
# Body
# {
.annotate 'line', 3358
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3359

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3360
# Body
# {
.annotate 'line', 3362
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3363

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3364
# Body
# {
.annotate 'line', 3366
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3367

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3368
# Body
# {
.annotate 'line', 3370
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3371

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3353
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3378
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3379
# Body
# {
.annotate 'line', 3381
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3382

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3383
# Body
# {
.annotate 'line', 3385
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3386

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3387
# Body
# {
.annotate 'line', 3389
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3390

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3391
# Body
# {
.annotate 'line', 3393
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3394

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3376
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3401
# Body
# {
.annotate 'line', 3403
.return('I')
# }
.annotate 'line', 3404

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3399
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3411
# Body
# {
.annotate 'line', 3413
self.'optimizearg'()
.annotate 'line', 3414
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3415
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3416
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3417
eq $I1, 0, __label_1
.annotate 'line', 3418
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3420
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3422
.return(self)
# }
.annotate 'line', 3423

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3424
# Body
# {
.annotate 'line', 3426
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
.annotate 'line', 3427
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3428
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3429
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3430
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3431
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3432
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3435
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3436
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3437
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3438
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3439
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3441

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3409
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3448
# Body
# {
.annotate 'line', 3450
self.'optimizearg'()
.annotate 'line', 3451
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3452
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3453
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3454
ne $I1, 0, __label_1
.annotate 'line', 3455
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3457
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3459
.return(self)
# }
.annotate 'line', 3460

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3461
# Body
# {
.annotate 'line', 3463
# string res: $S1
null $S1
.annotate 'line', 3464
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3467
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3468
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3469
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3470
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3471
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3472
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3473
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3476
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3477
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3478
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3479
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3480
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3482

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3446
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3489
# Body
# {
.annotate 'line', 3491
.return('I')
# }
.annotate 'line', 3492

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3487
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3499
# Body
# {
.annotate 'line', 3501
self.'optimizearg'()
.annotate 'line', 3502
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3503
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3504
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3505
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3506
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3507
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3509
.return(self)
# }
.annotate 'line', 3510

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3511
# Body
# {
.annotate 'line', 3513
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
.annotate 'line', 3514
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3515
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3516
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3517
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3518
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3519

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3497
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
self.'optimizearg'()
.annotate 'line', 3529
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3530
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3531
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3532
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3533
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3534
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3536
.return(self)
# }
.annotate 'line', 3537

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3538
# Body
# {
.annotate 'line', 3540
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
.annotate 'line', 3541
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3542
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3543
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3544
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3545
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3546

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3524
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3554
# Body
# {
.annotate 'line', 3556
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3557
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3558
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3559
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3560
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3562
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3564
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3565
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3566
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3569
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3570

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3571
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3572
# Body
# {
.annotate 'line', 3574
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3575
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3576
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3577
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3578
ge $I2, $I1, __label_1
.annotate 'line', 3579
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3578
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3580
.return($P2)
# }
.annotate 'line', 3581

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3582
# Body
# {
.annotate 'line', 3584
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3585
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3586
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3587
self.'annotate'(__ARG_1)
.annotate 'line', 3588
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3589
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3590
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3589
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3591
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3592

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3593
# Body
# {
.annotate 'line', 3595
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3596
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3597
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3598
self.'annotate'(__ARG_1)
.annotate 'line', 3599
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3600
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3601
$P3 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3600
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3602
.return($S1)
# }
.annotate 'line', 3603

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3604
# Body
# {
.annotate 'line', 3606
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3607
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3608
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3609
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3610
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3609
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3611

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3612
# Body
# {
.annotate 'line', 3614
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3615
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3616
self.'annotate'(__ARG_1)
.annotate 'line', 3617
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3618
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3619
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3618
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3620

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3551
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3553
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3627
# Body
# {
.annotate 'line', 3629
self.'optimizearg'()
.annotate 'line', 3630
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3631
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3632
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3633
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3634
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3635
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3636
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3637
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3638
# var t: $P5
null $P5
.annotate 'line', 3639
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3640
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3641
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3642
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3644
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3645
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3647
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3648
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3649
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3650
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3651
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3652
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3655
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3656
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3657
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3658
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3659
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3660
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3664
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3665
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3667
.return(self)
# }
.annotate 'line', 3668

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3669
# Body
# {
.annotate 'line', 3671
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3672
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3673
ne $S1, $S2, __label_2
.annotate 'line', 3674
.return($S1)
__label_2: # endif
.annotate 'line', 3675
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3676
.return('S')
__label_3: # endif
.annotate 'line', 3677
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3678
.return('S')
__label_5: # endif
.annotate 'line', 3679
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3680
.return('N')
__label_7: # endif
.annotate 'line', 3681
.return('I')
# }
.annotate 'line', 3682

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3683
# Body
# {
.annotate 'line', 3685
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3686
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3687
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3688
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3689
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3691
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3692
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3693
ne $S1, 'S', __label_5
# {
.annotate 'line', 3694
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3695
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3696
eq $S2, 'S', __label_10
# {
.annotate 'line', 3697
__ARG_1.'emitset'($S6, $S4)
set $S4, $S6
.annotate 'line', 3698
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3701
__ARG_1.'emitset'($S6, $S5)
set $S5, $S6
.annotate 'line', 3702
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3705
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3708
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3709
# string l: $S7
null $S7
.annotate 'line', 3710
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3712
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3713
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3715
# string r: $S8
null $S8
.annotate 'line', 3716
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3718
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3719
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3721
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3724
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3726

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3625
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3733
# Body
# {
.annotate 'line', 3735
self.'optimizearg'()
.annotate 'line', 3736
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3737
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3738
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3739
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3740
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3741
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3742
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3743
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3744
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3745
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3746
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3749
.return(self)
# }
.annotate 'line', 3750

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3751
# Body
# {
.annotate 'line', 3753
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3754
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3755
ne $S1, $S2, __label_2
.annotate 'line', 3756
.return($S1)
__label_2: # endif
.annotate 'line', 3757
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3758
.return('N')
__label_3: # endif
.annotate 'line', 3759
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3760
.return('N')
__label_5: # endif
.annotate 'line', 3761
.return('I')
# }
.annotate 'line', 3762

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3763
# Body
# {
.annotate 'line', 3765
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3766
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3767
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3768

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3731
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3775
# Body
# {
.annotate 'line', 3777
self.'optimizearg'()
.annotate 'line', 3778
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3779
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3780
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3781
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3782
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3783
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3784
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3785
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3786
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3787
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3788
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3791
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3792
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3793
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3794
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3795
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3796
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3800
.return(self)
# }
.annotate 'line', 3801

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3802
# Body
# {
.annotate 'line', 3804
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3805
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3806
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3807
ne $S1, $S2, __label_2
.annotate 'line', 3808
.return($S1)
__label_2: # endif
.annotate 'line', 3809
ne $S1, 'S', __label_3
.annotate 'line', 3810
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3812
.return('N')
__label_4: # endif
# }
.annotate 'line', 3813

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3814
# Body
# {
.annotate 'line', 3816
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3817
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3818
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3819
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3820
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3821
ne $S1, 'S', __label_2
# {
.annotate 'line', 3822
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3823
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3824
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3825
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3830
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3831
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3833
self.'annotate'(__ARG_1)
.annotate 'line', 3834
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3835
.return()
# }
__label_2: # endif
.annotate 'line', 3837
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
.annotate 'line', 3838
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3839
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3840
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3841
.return()
# }
__label_6: # endif
.annotate 'line', 3846
ne $S1, 'N', __label_10
# {
.annotate 'line', 3847
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3848
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3849
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3850
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3852
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3853
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3860
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3861
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3863
self.'annotate'(__ARG_1)
.annotate 'line', 3864
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3865
.return()
# }
__label_10: # endif
.annotate 'line', 3868
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3869
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3870
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3871
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3874
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3875
# }
__label_16: # endif
.annotate 'line', 3877
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3878
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3879
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3882
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3884
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3885
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3889
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3891
# }
__label_19: # endif
.annotate 'line', 3894
self.'annotate'(__ARG_1)
.annotate 'line', 3895
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3896

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3773
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3903
# Body
# {
.annotate 'line', 3905
self.'optimizearg'()
.annotate 'line', 3906
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3907
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3908
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3909
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3910
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3911
# var lval: $P3
null $P3
.annotate 'line', 3912
# var rval: $P4
null $P4
.annotate 'line', 3913
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3914
getattribute $P3, $P1, 'numval'
.annotate 'line', 3915
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3916
getattribute $P4, $P2, 'numval'
.annotate 'line', 3917
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3918
eq $I2, 0, __label_6
.annotate 'line', 3919
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
.annotate 'line', 3922
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3923
getattribute $P3, $P1, 'numval'
.annotate 'line', 3924
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3925
getattribute $P4, $P2, 'numval'
.annotate 'line', 3926
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3927
eq $N2, $N3, __label_8
.annotate 'line', 3928
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
.annotate 'line', 3932
.return(self)
# }
.annotate 'line', 3933

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3934
# Body
# {
.annotate 'line', 3936
.return('N')
# }
.annotate 'line', 3937

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3938
# Body
# {
.annotate 'line', 3940
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3941
# var lreg: $P2
null $P2
.annotate 'line', 3942
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 3943
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3945
$P2 = self.'tempreg'('N')
.annotate 'line', 3946
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3948
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3949
# var rreg: $P4
null $P4
.annotate 'line', 3950
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 3951
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3953
$P4 = self.'tempreg'('N')
.annotate 'line', 3954
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3956
self.'annotate'(__ARG_1)
.annotate 'line', 3957
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3958

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3901
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3965
# Body
# {
.annotate 'line', 3967
.return('I')
# }
.annotate 'line', 3968

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3969
# Body
# {
.annotate 'line', 3971
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3972
# var lreg: $P2
null $P2
.annotate 'line', 3973
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3974
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3976
$P2 = self.'tempreg'('I')
.annotate 'line', 3977
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3979
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3980
# var rreg: $P4
null $P4
.annotate 'line', 3981
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3982
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3984
$P4 = self.'tempreg'('I')
.annotate 'line', 3985
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3987
self.'annotate'(__ARG_1)
.annotate 'line', 3988
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3989

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3963
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3996
# Body
# {
.annotate 'line', 3998
.return('I')
# }
.annotate 'line', 3999

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4000
# Body
# {
.annotate 'line', 4002
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 4003
# var lreg: $P2
null $P2
.annotate 'line', 4004
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 4005
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 4007
$P2 = self.'tempreg'('I')
.annotate 'line', 4008
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 4010
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 4011
# var rreg: $P4
null $P4
.annotate 'line', 4012
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 4013
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4015
$P4 = self.'tempreg'('I')
.annotate 'line', 4016
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 4018
self.'annotate'(__ARG_1)
.annotate 'line', 4023
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 4024

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3994
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4033
# Body
# {
.annotate 'line', 4035
setattribute self, 'arg', __ARG_1
.annotate 'line', 4036
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4037

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4038
# Body
# {
.annotate 'line', 4040
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4041
.return(self)
# }
.annotate 'line', 4042

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4043
# Body
# {
.annotate 'line', 4045
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4046

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4031
addattribute $P0, 'arg'
.annotate 'line', 4032
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4049
# Body
# {
.annotate 'line', 4051
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4052
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4053
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4054
.return(1)
# }
.annotate 'line', 4055

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4064
# Body
# {
.annotate 'line', 4066
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4067
setattribute self, 'predef', __ARG_3
.annotate 'line', 4068
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4069

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4070
# Body
# {
.annotate 'line', 4072
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4073

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4074
# Body
# {
.annotate 'line', 4076
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4077
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4078
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4079
# var arg: $P4
null $P4
.annotate 'line', 4080
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 4081
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4083
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4084
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4085
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4089
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4090
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4091
getattribute $P10, $P4, 'arg'
$P5.'push'($P10)
goto __label_7
__label_8: # endfor
.annotate 'line', 4092
getattribute $P11, self, 'predef'
getattribute $P12, self, 'start'
$P11.'expand'(__ARG_1, self, $P12, __ARG_2, $P5)
.annotate 'line', 4093
.return()
__label_1: # default
.annotate 'line', 4095
# int n: $I2
getattribute $P13, self, 'args'
set $I2, $P13
# for loop
.annotate 'line', 4096
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4097
$P14 = $P2[$I3]
getattribute $P4, $P14, 'arg'
.annotate 'line', 4098
# string argtype: $S2
$P10 = $P4.'checkresult'()
null $S2
if_null $P10, __label_12
set $S2, $P10
__label_12:
.annotate 'line', 4099
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 4100
# string argr: $S4
null $S4
.annotate 'line', 4101
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4102
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 4104
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 4105
ne $S3, 'P', __label_17
# {
.annotate 'line', 4106
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 4107
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
.annotate 'line', 4112
eq $S5, '', __label_23
.annotate 'line', 4113
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4115
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4117
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 4096
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4120
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4121

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4059
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4061
addattribute $P0, 'predef'
.annotate 'line', 4062
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4131
# Body
# {
.annotate 'line', 4133
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4134
setattribute self, 'funref', __ARG_4
.annotate 'line', 4135
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4136
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4137
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4138
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4139
# {
.annotate 'line', 4140
# var modifier: $P2
null $P2
.annotate 'line', 4141
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4142
$P1 = __ARG_1.'get'()
.annotate 'line', 4143
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4144
$P1 = __ARG_1.'get'()
.annotate 'line', 4145
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4146
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4147
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4150
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4153
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4154
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4155
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4156
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4158

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4159
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4160
# Body
# {
.annotate 'line', 4162
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4163
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4164
'optimize_array'($P1)
.annotate 'line', 4167
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4168
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4169
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4170
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4171
if_null $P3, __label_2
# {
.annotate 'line', 4172
self.'use_predef'($S1)
.annotate 'line', 4175
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4176
if_null $P4, __label_3
# {
.annotate 'line', 4177
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4178
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4181
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
.annotate 'line', 4185
.return(self)
# }
.annotate 'line', 4186

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4187
# Body
# {
.annotate 'line', 4189
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4190
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4191
# string call: $S1
null $S1
.annotate 'line', 4192
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4193
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4194
ne $S1, '', __label_2
# {
.annotate 'line', 4195
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4196
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
unless $I1 goto __label_5
.annotate 'line', 4200
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4202
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4203
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4204
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4205
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4206
# string reg: $S3
null $S3
.annotate 'line', 4207
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4208
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4209
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4212
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4213
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4215
self.'annotate'(__ARG_1)
.annotate 'line', 4217
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
set $S9, __ARG_2
.annotate 'line', 4218
ne $S9, '.tailcall', __label_12
.annotate 'line', 4219
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4221
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
unless $I1 goto __label_14
.annotate 'line', 4225
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4227
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4229
__ARG_1.'print'('(')
.annotate 'line', 4231
# string sep: $S4
set $S4, ''
.annotate 'line', 4232
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4233
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4234
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4235
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4236
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4237
# string setname: $S6
set $S6, ''
.annotate 'line', 4238
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4239
if_null $P6, __label_19
# {
.annotate 'line', 4240
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4241
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4242
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4244
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4246
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
.annotate 'line', 4250
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4251
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4252
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4253
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4256
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
.annotate 'line', 4261
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4262
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
unless $I4 goto __label_32
.annotate 'line', 4264
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
unless $I5 goto __label_34
.annotate 'line', 4265
# {
.annotate 'line', 4266
__ARG_1.'print'(' :named')
.annotate 'line', 4267
eq $S6, '', __label_35
.annotate 'line', 4268
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4270
# }
__label_16: # for iteration
.annotate 'line', 4233
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4272
__ARG_1.'say'(')')
# }
.annotate 'line', 4273

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4126
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4128
addattribute $P0, 'funref'
.annotate 'line', 4129
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4283
# Body
# {
.annotate 'line', 4285
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4286
setattribute self, 'left', __ARG_4
.annotate 'line', 4287
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4288

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4289
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4290
# Body
# {
.annotate 'line', 4292
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4293
.return(self)
# }
.annotate 'line', 4294

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4295
# Body
# {
.annotate 'line', 4297
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4298

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4299
# Body
# {
.annotate 'line', 4301
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4302
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4303
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4304
eq $S1, 'P', __label_2
# {
.annotate 'line', 4305
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4306
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4307
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4309
.return($S2)
# }
.annotate 'line', 4310

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4311
# Body
# {
.annotate 'line', 4313
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4314
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4315
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4316
self.'annotate'(__ARG_1)
.annotate 'line', 4317
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4318
.return($S3)
# }
.annotate 'line', 4319

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4320
# Body
# {
.annotate 'line', 4322
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4323
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4324
self.'annotate'(__ARG_1)
.annotate 'line', 4325
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4326

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4327
# Body
# {
.annotate 'line', 4329
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4330

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4331
# Body
# {
.annotate 'line', 4333
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4334
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4335
# string value: $S3
null $S3
.annotate 'line', 4336
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4338
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4339
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4340
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4342
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4345
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4346
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4348
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4349

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4350
# Body
# {
.annotate 'line', 4352
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4353
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4354
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4355
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4356
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4358
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4359
$P4 = __ARG_2.'checkresult'()
set $S5, $P4
eq $S5, 'P', __label_6
.annotate 'line', 4360
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4362
# }
__label_4: # endif
.annotate 'line', 4364
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4365
.return($S3)
# }
.annotate 'line', 4366

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4278
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4280
addattribute $P0, 'left'
.annotate 'line', 4281
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4375
# Body
# {
.annotate 'line', 4377
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4378
setattribute self, 'left', __ARG_4
.annotate 'line', 4379
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4380

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4381
# Body
# {
.annotate 'line', 4383
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4384
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4386
.return('P')
__label_1: # endif
# }
.annotate 'line', 4387

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4388
# Body
# {
.annotate 'line', 4390
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4391
setattribute self, 'left', $P1
.annotate 'line', 4392
self.'optimizeargs'()
.annotate 'line', 4396
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P5 = self.'numargs'()
set $I3, $P5
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4397
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4398
$P5 = $P2.'isintegerliteral'()
if_null $P5, __label_2
unless $P5 goto __label_2
# {
.annotate 'line', 4399
# int ival: $I1
$P6 = $P2.'getIntegerValue'()
set $I1, $P6
.annotate 'line', 4400
# string sval: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_3
set $S1, $P6
__label_3:
.annotate 'line', 4401
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P7, self, 'start'
getattribute $P8, $P7, 'file'
getattribute $P9, self, 'start'
getattribute $P10, $P9, 'line'
.annotate 'line', 4402
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P8, $P10, $S2)
.annotate 'line', 4403
new $P8, [ 'StringLiteral' ]
getattribute $P9, self, 'owner'
$P8.'StringLiteral'($P9, $P3)
set $P7, $P8
.return($P7)
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4406
.return(self)
# }
.annotate 'line', 4407

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4408
# Body
# {
.annotate 'line', 4410
# var regleft: $P1
null $P1
.annotate 'line', 4411
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4412
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4414
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4415
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4416
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4417
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4418
ne $S1, 'S', __label_3
# {
.annotate 'line', 4419
eq $I1, 1, __label_5
.annotate 'line', 4420
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4421
$P6 = $P2[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4424
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
.annotate 'line', 4425
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4426
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4428

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4429
# Body
# {
.annotate 'line', 4431
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4432
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4433
self.'annotate'(__ARG_1)
.annotate 'line', 4434
__ARG_1.'print'($P1, '[')
.annotate 'line', 4435
# predefined join
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4436
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4437

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4438
# Body
# {
.annotate 'line', 4440
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4441
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4442
# string rreg: $S1
null $S1
.annotate 'line', 4443
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4444
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4445
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4448
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4449
self.'annotate'(__ARG_1)
.annotate 'line', 4450
__ARG_1.'print'($P1, '[')
.annotate 'line', 4451
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4452
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4453
.return($S1)
# }
.annotate 'line', 4454

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4371
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4373
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4463
# Body
# {
.annotate 'line', 4465
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4466
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4467
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4468
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4469
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4470
# {
.annotate 'line', 4471
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4472
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4473
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4474
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4475
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4477

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4478
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4479
# Body
# {
.annotate 'line', 4481
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4482
.return(self)
# }
.annotate 'line', 4483

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4484
# Body
# {
set $S2, __ARG_2
.annotate 'line', 4486
eq $S2, '', __label_0
# {
.annotate 'line', 4487
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4488
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4494
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4496

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4497
# Body
# {
.annotate 'line', 4499
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4500
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4501
.return($S1)
# }
.annotate 'line', 4502

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4503
# Body
# {
.annotate 'line', 4505
self.'annotate'(__ARG_1)
.annotate 'line', 4506
# string itemreg: $S1
null $S1
.annotate 'line', 4507
# string it_p: $S2
null $S2
.annotate 'line', 4508
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4509
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4510
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4512
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4513
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
set $S5, $S3
set $S6, 'I'
.annotate 'line', 4514
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
.annotate 'line', 4516
# string aux: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 4517
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4518
__ARG_1.'emitbox'($S2, $S4)
set $S1, $S2
.annotate 'line', 4519
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4523
$P5 = $P1.'isnull'()
if_null $P5, __label_11
unless $P5 goto __label_11
# {
.annotate 'line', 4524
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4525
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4526
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4530
$P5 = $P1.'emit_get'(__ARG_1)
set $S1, $P5
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4532
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4533
self.'annotate'(__ARG_1)
.annotate 'line', 4534
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4537

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4459
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4461
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4547
# Body
# {
.annotate 'line', 4549
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4550
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4551
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4552
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4553
$P7 = $P1.'isop'('}')
isfalse $I1, $P7
unless $I1 goto __label_0
# {
.annotate 'line', 4554
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4555
# {
.annotate 'line', 4556
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4557
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4558
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4559
$P2.'push'($P4)
.annotate 'line', 4560
$P3.'push'($P5)
# }
.annotate 'line', 4562
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'(',')
if_null $P7, __label_2
if $P7 goto __label_1
__label_2: # enddo
.annotate 'line', 4563
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_4
.annotate 'line', 4564
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4566
setattribute self, 'keys', $P2
.annotate 'line', 4567
setattribute self, 'values', $P3
# }
.annotate 'line', 4568

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4569
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4570
# Body
# {
.annotate 'line', 4572
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4573
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4574
.return(self)
# }
.annotate 'line', 4575

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4576
# Body
# {
.annotate 'line', 4578
self.'annotate'(__ARG_1)
set $S6, __ARG_2
.annotate 'line', 4583
eq $S6, '', __label_0
.annotate 'line', 4584
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4586
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4587
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4588
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4589
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4590
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4591
# string item: $S1
null $S1
.annotate 'line', 4592
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4593
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4594
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4595
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4598
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_5: # endif
.annotate 'line', 4600
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4601
# string itemreg: $S3
null $S3
.annotate 'line', 4602
$P7 = $P4.'isnull'()
if_null $P7, __label_7
unless $P7 goto __label_7
# {
set $S6, __ARG_2
.annotate 'line', 4603
eq $S6, '', __label_9
# {
.annotate 'line', 4604
$P8 = self.'tempreg'('P')
set $S3, $P8
.annotate 'line', 4605
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4608
$P8 = $P4.'isidentifier'()
if_null $P8, __label_10
unless $P8 goto __label_10
# {
.annotate 'line', 4609
# string s: $S4
$P9 = $P4.'checkIdentifier'()
null $S4
if_null $P9, __label_12
set $S4, $P9
__label_12:
.annotate 'line', 4610
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
set $S3, $S4
goto __label_14
__label_13: # else
.annotate 'line', 4611
# {
.annotate 'line', 4613
# string id: $S5
$P9 = $P4.'getName'()
null $S5
if_null $P9, __label_16
set $S5, $P9
__label_16:
.annotate 'line', 4614
getattribute $P11, self, 'owner'
$P10 = $P11.'getvar'($S5)
unless_null $P10, __label_17
# {
.annotate 'line', 4615
$P12 = self.'tempreg'('P')
set $S3, $P12
.annotate 'line', 4616
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4619
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4623
$P11 = $P4.'emit_get'(__ARG_1)
set $S3, $P11
__label_11: # endif
__label_8: # endif
set $S7, __ARG_2
.annotate 'line', 4624
eq $S7, '', __label_19
.annotate 'line', 4625
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 4589
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 4627

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4628
# Body
# {
.annotate 'line', 4630
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4631
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4632
.return($S1)
# }
.annotate 'line', 4633

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4542
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4544
addattribute $P0, 'keys'
.annotate 'line', 4545
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4642
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4643
# Body
# {
.annotate 'line', 4647
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4648
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4649
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4650
__ARG_1.'unget'($P2)
.annotate 'line', 4651
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4652
# {
.annotate 'line', 4653
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4654
$P3.'push'($P4)
# }
.annotate 'line', 4655
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4656
setattribute self, 'initializer', $P3
.annotate 'line', 4657
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4659

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4638
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4640
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4668
# Body
# {
.annotate 'line', 4670
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4672
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4673
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4674
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4675
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4676
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4677
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4678
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4679
# {
.annotate 'line', 4680
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4681
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4682
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4683
$P2.'push'($P3)
# }
.annotate 'line', 4684
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4685
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4688
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4691
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4693
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4694
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4696
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4697

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4698
# Body
# {
.annotate 'line', 4700
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4701
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4704
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4705
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4706
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4707
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4708
$P1 = $P3['value']
.annotate 'line', 4709
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4710
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4711
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4714
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4718
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4719
if_null $P4, __label_7
.annotate 'line', 4720
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4721
.return(self)
# }
.annotate 'line', 4722

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4723
# Body
# {
.annotate 'line', 4725
self.'annotate'(__ARG_1)
.annotate 'line', 4727
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4728
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
.annotate 'line', 4731
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4732
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4733
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
.annotate 'line', 4735
# string reginit: $S1
set $S1, ''
.annotate 'line', 4736
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4737
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4738
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4742
ne $I2, 1, __label_13
# {
.annotate 'line', 4743
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4744
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4747
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4748
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4749
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4753
isne $I4, $I2, 1
unless $I4 goto __label_17
isne $I4, $I2, 2
__label_17:
unless $I4 goto __label_16
.annotate 'line', 4754
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_16: # endif
.annotate 'line', 4755
not $I5, __ARG_3
unless $I5 goto __label_18
.annotate 'line', 4756
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_18: # endif
__label_9: # switch end
set $I6, $I2
null $I7
.annotate 'line', 4759
if $I6 == $I7 goto __label_21
set $I7, 2
if $I6 == $I7 goto __label_22
set $I7, 1
if $I6 == $I7 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 4762
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_24
set $S4, $P14
__label_24:
.annotate 'line', 4763
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4764
unless_null $P3, __label_25
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
.annotate 'line', 4765
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_25: # endif
.annotate 'line', 4769
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4770
le $I1, 1, __label_26
# {
.annotate 'line', 4771
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_26: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 4775
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4776
# predefined elements
elements $I7, $P4
sub $I6, $I7, 1
$S3 = $P4[$I6]
.annotate 'line', 4777
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 4780
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4781
unless_null $P5, __label_27
# {
.annotate 'line', 4783
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4784
if_null $P6, __label_29
# {
.annotate 'line', 4785
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_30
__label_29: # else
# {
.annotate 'line', 4788
'Warn'('Checking: new unknown type')
.annotate 'line', 4789
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_30: # endif
.annotate 'line', 4791
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4795
$P20 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_28: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 4799
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 4801
isgt $I8, $I1, 1
if $I8 goto __label_32
isgt $I8, $I1, 0
unless $I8 goto __label_33
iseq $I8, $I2, 1
__label_33:
__label_32:
unless $I8 goto __label_31
# {
.annotate 'line', 4802
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4803
iter $P21, $P1
set $P21, 0
__label_34: # for iteration
unless $P21 goto __label_35
shift $P8, $P21
# {
.annotate 'line', 4804
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_36
set $S5, $P22
__label_36:
.annotate 'line', 4805
$P7.'push'($S5)
# }
goto __label_34
__label_35: # endfor
.annotate 'line', 4807
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 4808
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4809
__ARG_1.'say'(")")
.annotate 'line', 4810
not $I8, __ARG_3
unless $I8 goto __label_37
.annotate 'line', 4811
__ARG_1.'emitset'(__ARG_2, $S2)
__label_37: # endif
# }
__label_31: # endif
# }
.annotate 'line', 4813

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4814
# Body
# {
.annotate 'line', 4816
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4817

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4664
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4666
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4826
# Body
# {
.annotate 'line', 4828
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4829
setattribute self, 'owner', __ARG_2
.annotate 'line', 4830
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4831
setattribute self, 'nskey', $P1
.annotate 'line', 4832
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4833
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4834
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4836
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4837

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4838
# Body
# {
.annotate 'line', 4840
# string reginit: $S1
null $S1
.annotate 'line', 4841
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4842
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
.annotate 'line', 4843
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4847
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4848
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4851
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4853
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4854
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4855
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4856
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4857
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4858
if_null $S1, __label_7
.annotate 'line', 4859
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4860
__ARG_1.'say'()
# }
.annotate 'line', 4861

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4822
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4824
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4870
# Body
# {
.annotate 'line', 4872
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4873
setattribute self, 'owner', __ARG_2
.annotate 'line', 4874
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4875
setattribute self, 'nskey', $P1
.annotate 'line', 4876
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4877
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4878
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4880
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4881

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4882
# Body
# {
.annotate 'line', 4884
# string reginit: $S1
null $S1
.annotate 'line', 4885
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4887
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4888
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4889
le $I1, 0, __label_3
.annotate 'line', 4890
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4891
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4892
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4893
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4894
__ARG_1.'say'()
.annotate 'line', 4896
le $I1, 0, __label_4
# {
.annotate 'line', 4897
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4898
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4899
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4900
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4902
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4903
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 4904
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4905
__ARG_1.'say'(")")
.annotate 'line', 4906
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4908

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4866
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4868
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4913
# Body
# {
.annotate 'line', 4915
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4917
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4919
new $P5, [ 'CallExpr' ]
.annotate 'line', 4920
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4919
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4922
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4924
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4926
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4929
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4930
__ARG_1.'unget'($P2)
.annotate 'line', 4931
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4933
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4937
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
.annotate 'line', 4942
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4944

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4953
# Body
# {
.annotate 'line', 4955
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4956
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4957
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4958

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4959
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4960
# Body
# {
.annotate 'line', 4962
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4963
# string checkedval: $S1
null $S1
.annotate 'line', 4964
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4965
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4966
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4970
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4971
self.'annotate'(__ARG_1)
.annotate 'line', 4972
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4973

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4948
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4950
addattribute $P0, 'lexpr'
.annotate 'line', 4951
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4988
# Body
# {
.annotate 'line', 4990
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4991
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4992
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4993
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4994
.return(self)
# }
.annotate 'line', 4995

.end # set


.sub 'optimize' :method

.annotate 'line', 4996
# Body
# {
.annotate 'line', 4998
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4999
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
.annotate 'line', 5001
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5003
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5005
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5006
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5007
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5009

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5010
# Body
# {
.annotate 'line', 5012
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5013

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5014
# Body
# {
.annotate 'line', 5016
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5017
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5018
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5019
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5020
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5021
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5022
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5023
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5024

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4978
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4984
addattribute $P0, 'condition'
.annotate 'line', 4985
addattribute $P0, 'etrue'
.annotate 'line', 4986
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

.annotate 'line', 5061
# Body
# {
.annotate 'line', 5063
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
.annotate 'line', 5064
.return(1)
__label_3: # case
.annotate 'line', 5065
.return(2)
__label_4: # case
.annotate 'line', 5066
.return(3)
__label_1: # default
.annotate 'line', 5067
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5069

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5071
# Body
# {
.annotate 'line', 5073
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
.annotate 'line', 5074
.return(8)
__label_3: # case
.annotate 'line', 5075
.return(11)
__label_4: # case
.annotate 'line', 5076
.return(9)
__label_5: # case
.annotate 'line', 5077
.return(10)
__label_1: # default
.annotate 'line', 5078
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5080

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5082
# Body
# {
.annotate 'line', 5084
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
.annotate 'line', 5085
.return(19)
__label_3: # case
.annotate 'line', 5086
.return(20)
__label_4: # case
.annotate 'line', 5087
.return(21)
__label_5: # case
.annotate 'line', 5088
.return(22)
__label_1: # default
.annotate 'line', 5089
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5091

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5093
# Body
# {
.annotate 'line', 5095
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
.annotate 'line', 5096
.return(12)
__label_3: # case
.annotate 'line', 5097
.return(13)
__label_4: # case
.annotate 'line', 5098
.return(25)
__label_5: # case
.annotate 'line', 5099
.return(26)
__label_1: # default
.annotate 'line', 5101
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5102
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5104

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5106
# Body
# {
.annotate 'line', 5108
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
.annotate 'line', 5109
.return(14)
__label_3: # case
.annotate 'line', 5110
.return(16)
__label_4: # case
.annotate 'line', 5111
.return(15)
__label_5: # case
.annotate 'line', 5112
.return(17)
__label_1: # default
.annotate 'line', 5113
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5115

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5117
# Body
# {
.annotate 'line', 5119
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
.annotate 'line', 5120
.return(4)
__label_3: # case
.annotate 'line', 5121
.return(5)
__label_4: # case
.annotate 'line', 5122
.return(6)
__label_5: # case
.annotate 'line', 5123
.return(18)
__label_6: # case
.annotate 'line', 5124
.return(23)
__label_7: # case
.annotate 'line', 5125
.return(24)
__label_1: # default
.annotate 'line', 5126
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5128

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5130
# Body
# {
.annotate 'line', 5132
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5134
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5135
# var expr: $P2
null $P2
.annotate 'line', 5136
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5137
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5138
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5139
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5141
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5142
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5143
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 5144
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 5145
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 5146
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5147
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 5148
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 5149
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 5150
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 5151
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 5152
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 5153
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 5154
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 5155
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 5156
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 5157
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5158

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5160
# Body
# {
.annotate 'line', 5162
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5163
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5165
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5166
# var t: $P2
null $P2
.annotate 'line', 5167
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5168
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 5169
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5171
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5174
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5177
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5180
'InternalError'('Unexpected code in parseExpr_2')
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

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5187
# Body
# {
.annotate 'line', 5189
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5191
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5192
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5193
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5194
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5195
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5196
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5199
__ARG_1.'unget'($P2)
.annotate 'line', 5200
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5202

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5204
# Body
# {
.annotate 'line', 5206
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5207
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5208
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5210
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5211
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5212
# var subexpr: $P2
null $P2
.annotate 'line', 5213
eq $I1, 0, __label_0
# {
.annotate 'line', 5214
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5215
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5216
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
.annotate 'line', 5218
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5221
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5224
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5227
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5230
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5232
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5235
__ARG_1.'unget'($P1)
.annotate 'line', 5236
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5238
.return($P2)
# }
.annotate 'line', 5239

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5241
# Body
# {
.annotate 'line', 5243
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5244
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5246
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5247
# var t: $P2
null $P2
.annotate 'line', 5248
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5249
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5250
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5251
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5252
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
.annotate 'line', 5254
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5257
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5260
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5263
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5266
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5268
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5269
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5271
__ARG_1.'unget'($P2)
.annotate 'line', 5272
.return($P1)
# }
.annotate 'line', 5273

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5275
# Body
# {
.annotate 'line', 5277
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5279
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5280
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5281
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5282
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5283
# var expr: $P4
null $P4
.annotate 'line', 5284
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5285
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5287
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5288
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5290
__ARG_1.'unget'($P2)
.annotate 'line', 5291
.return($P1)
# }
.annotate 'line', 5292

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5294
# Body
# {
.annotate 'line', 5296
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5297
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5299
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5300
# var rexpr: $P2
null $P2
.annotate 'line', 5301
# var t: $P3
null $P3
.annotate 'line', 5302
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5303
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5304
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
.annotate 'line', 5306
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5307
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5310
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5311
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5314
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5315
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5318
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5319
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5322
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5325
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5328
__ARG_1.'unget'($P3)
.annotate 'line', 5329
.return($P1)
# }
.annotate 'line', 5330

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5332
# Body
# {
.annotate 'line', 5334
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5335
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5337
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5338
# var t: $P2
null $P2
.annotate 'line', 5339
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5340
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5341
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5342
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
.annotate 'line', 5344
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5347
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5350
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5353
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5356
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5359
__ARG_1.'unget'($P2)
.annotate 'line', 5360
.return($P1)
# }
.annotate 'line', 5361

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5363
# Body
# {
.annotate 'line', 5365
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5367
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5368
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5369
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5370
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5371
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5373
__ARG_1.'unget'($P2)
.annotate 'line', 5374
.return($P1)
# }
.annotate 'line', 5375

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5377
# Body
# {
.annotate 'line', 5379
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5381
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5382
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5383
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5384
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5385
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5387
__ARG_1.'unget'($P2)
.annotate 'line', 5388
.return($P1)
# }
.annotate 'line', 5389

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5391
# Body
# {
.annotate 'line', 5393
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5395
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5396
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5397
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5398
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5399
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5401
__ARG_1.'unget'($P2)
.annotate 'line', 5402
.return($P1)
# }
.annotate 'line', 5403

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5405
# Body
# {
.annotate 'line', 5407
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5409
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5410
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5411
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5412
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5413
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5415
__ARG_1.'unget'($P2)
.annotate 'line', 5416
.return($P1)
# }
.annotate 'line', 5417

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5419
# Body
# {
.annotate 'line', 5421
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5422
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5424
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5425
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5426
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5427
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5428
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5429
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5430
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5433
__ARG_1.'unget'($P2)
.annotate 'line', 5434
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5436

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5438
# Body
# {
.annotate 'line', 5440
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5441
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5442
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5444
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5445
# var t: $P2
null $P2
.annotate 'line', 5446
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5447
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5448
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5449
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5450
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
.annotate 'line', 5452
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5455
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5458
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5461
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5464
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5467
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5470
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5472
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5473
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5475
__ARG_1.'unget'($P2)
.annotate 'line', 5476
.return($P1)
# }
.annotate 'line', 5477

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5479
# Body
# {
.annotate 'line', 5481
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5483
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5484

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5497
# Body
# {
.annotate 'line', 5499
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5500
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5501
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5502
setattribute self, 'brlabel', $P2
.annotate 'line', 5503
.return($S1)
# }
.annotate 'line', 5504

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5505
# Body
# {
.annotate 'line', 5507
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5508
unless_null $P1, __label_0
.annotate 'line', 5509
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5510
.return($P1)
# }
.annotate 'line', 5511

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5495
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5518
# Body
# {
.annotate 'line', 5520
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5521
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5522
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5523
setattribute self, 'cntlabel', $P2
.annotate 'line', 5524
.return($S1)
# }
.annotate 'line', 5525

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5526
# Body
# {
.annotate 'line', 5528
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5529
unless_null $P1, __label_0
.annotate 'line', 5530
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5531
.return($P1)
# }
.annotate 'line', 5532

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5514
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5516
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5546
# Body
# {
.annotate 'line', 5548
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5549
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5550
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5551
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5552
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5553
# {
.annotate 'line', 5554
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5555
$P2.'push'($P3)
# }
.annotate 'line', 5556
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5558
'RequireOp'(';', $P1)
.annotate 'line', 5559
setattribute self, 'values', $P2
# }
.annotate 'line', 5560

.end # parse


.sub 'optimize' :method

.annotate 'line', 5561
# Body
# {
.annotate 'line', 5563
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5564
.return(self)
# }
.annotate 'line', 5565

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5566
# Body
# {
.annotate 'line', 5568
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5569
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5570
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5573
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5574
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5576
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5577
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5578
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5579
self.'annotate'(__ARG_1)
.annotate 'line', 5580
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5584
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5585
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5586
# string reg: $S1
null $S1
.annotate 'line', 5587
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5588
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5589
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5592
$P7 = $P5.'emit_get'(__ARG_1)
set $S1, $P7
__label_9: # endif
.annotate 'line', 5593
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5584
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5595
self.'annotate'(__ARG_1)
.annotate 'line', 5596
self.'emitret'(__ARG_1)
.annotate 'line', 5597
# string sep: $S2
set $S2, ''
.annotate 'line', 5598
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5599
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5600
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5602
__ARG_1.'say'(')')
# }
.annotate 'line', 5603

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5542
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5544
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5608
# Body
# {
.annotate 'line', 5610
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5611

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5612
# Body
# {
.annotate 'line', 5614
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5615

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5606
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5620
# Body
# {
.annotate 'line', 5622
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5623

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5624
# Body
# {
.annotate 'line', 5626
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5627

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5618
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5638
# Body
# {
.annotate 'line', 5640
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5641
setattribute self, 'name', __ARG_1
.annotate 'line', 5642
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5643
setattribute self, 'value', $P2
# }
.annotate 'line', 5644

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5645
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5646
# Body
# {
.annotate 'line', 5648
self.'annotate'(__ARG_1)
.annotate 'line', 5649
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5650
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5651
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5652

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5634
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5636
addattribute $P0, 'name'
.annotate 'line', 5637
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5663
# Body
# {
.annotate 'line', 5665
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5666
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5667
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5668
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5669
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5670
setattribute self, 'label', $P1
.annotate 'line', 5671
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5672

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5673
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5674
# Body
# {
.annotate 'line', 5676
self.'annotate'(__ARG_1)
.annotate 'line', 5677
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5678
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5679
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5680

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5659
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5661
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5689
# Body
# {
.annotate 'line', 5691
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5692

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5693
# Body
# {
.annotate 'line', 5695
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5696
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5697
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5698

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5687
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

.annotate 'line', 5709
# Body
# {
.annotate 'line', 5711
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5712
self.'parsecondition'(__ARG_2)
.annotate 'line', 5713
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5714
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5715
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5716
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5718
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5719
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5721

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5722
# Body
# {
.annotate 'line', 5724
self.'optimize_condition'()
.annotate 'line', 5725
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5726
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5727
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5728
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5730
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5732
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5734
.return(self)
# }
.annotate 'line', 5735

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5736
# Body
# {
.annotate 'line', 5738
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5739
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5740
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5741
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5742
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5743
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5744
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5745
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5746
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5747
self.'annotate'(__ARG_1)
.annotate 'line', 5748
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5749
$P1.'emit'(__ARG_1)
.annotate 'line', 5751
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5752
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5753
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5754
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5756
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5757

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5705
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5707
addattribute $P0, 'truebranch'
.annotate 'line', 5708
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5767
# Body
# {
.annotate 'line', 5769
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5770

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5771
# Body
# {
.annotate 'line', 5773
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5774
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5776
self.'annotate'(__ARG_1)
.annotate 'line', 5777
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5778
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5779
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5780
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5781

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5764
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5766
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5790
# Body
# {
.annotate 'line', 5792
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5793
self.'parsecondition'(__ARG_2)
.annotate 'line', 5794
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5795

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5796
# Body
# {
.annotate 'line', 5798
self.'optimize_condition'()
.annotate 'line', 5799
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5800
.return(self)
# }
.annotate 'line', 5801

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5802
# Body
# {
.annotate 'line', 5804
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5806
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5809
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5812
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5813
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5815
self.'annotate'(__ARG_1)
.annotate 'line', 5816
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5817
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5818
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5819
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5820
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5822

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5788
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

.annotate 'line', 5831
# Body
# {
.annotate 'line', 5833
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5834
self.'parsebody'(__ARG_2)
.annotate 'line', 5835
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5836
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5837

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5838
# Body
# {
.annotate 'line', 5840
self.'optimize_condition'()
.annotate 'line', 5841
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5842
.return(self)
# }
.annotate 'line', 5843

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5844
# Body
# {
.annotate 'line', 5846
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5848
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5851
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5852
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5853
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5855
self.'annotate'(__ARG_1)
.annotate 'line', 5856
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5858
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5859
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5860
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5862

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5829
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

.annotate 'line', 5871
# Body
# {
.annotate 'line', 5873
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5874
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5875

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5876
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5877
# Body
# {
.annotate 'line', 5879
self.'annotate'(__ARG_1)
.annotate 'line', 5880
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5881
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5882

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5869
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5891
# Body
# {
.annotate 'line', 5893
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5894
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5895

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5896
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5897
# Body
# {
.annotate 'line', 5899
self.'annotate'(__ARG_1)
.annotate 'line', 5900
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5901
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5902

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5889
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5916
# Body
# {
.annotate 'line', 5918
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5919
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5920
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5921
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5922
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5923
$P1 = __ARG_2.'get'()
.annotate 'line', 5924
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5925
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5926
$P1 = __ARG_2.'get'()
.annotate 'line', 5927
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5928
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5929
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5930
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5931
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5932
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5933
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5934
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5935
$P1 = __ARG_2.'get'()
.annotate 'line', 5936
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5937
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5938
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 5939
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
.annotate 'line', 5940
__ARG_2.'unget'($P1)
.annotate 'line', 5941
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5943
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5944
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5947
$P1 = __ARG_2.'get'()
.annotate 'line', 5948
$P13 = $P1.'isop'(':')
isfalse $I4, $P13
unless $I4 goto __label_13
.annotate 'line', 5949
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5950
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
.annotate 'line', 5951
__ARG_2.'unget'($P1)
.annotate 'line', 5952
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5954
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5957

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5958
# Body
# {
.annotate 'line', 5960
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5961
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5962
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5963
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5964
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5965
.return(self)
# }
.annotate 'line', 5966

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5967
# Body
# {
.annotate 'line', 5970
# string type: $S1
set $S1, ''
.annotate 'line', 5971
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5972
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5973
ne $S2, 'N', __label_3
.annotate 'line', 5974
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5975
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5977
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5978
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5981
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5982
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
set $S9, $P11
ne $S9, $S1, __label_8
.annotate 'line', 5983
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5985
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5986
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5990
self.'genbreaklabel'()
.annotate 'line', 5991
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5992
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5993
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5994
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5995
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5996
$P2.'push'($S7)
.annotate 'line', 5997
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5998
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6000
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6003
__ARG_1.'comment'('switch')
.annotate 'line', 6004
self.'annotate'(__ARG_1)
.annotate 'line', 6005
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6006
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 6007
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6008
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6009
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6010
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6011
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 6012
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6007
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6015
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6016
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 6017
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6019
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 6020

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5909
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5911
addattribute $P0, 'condition'
.annotate 'line', 5912
addattribute $P0, 'case_value'
.annotate 'line', 5913
addattribute $P0, 'case_st'
.annotate 'line', 5914
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
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
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6037
__ARG_2.'unget'($P1)
.annotate 'line', 6038
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6040
$P1 = __ARG_2.'get'()
.annotate 'line', 6041
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6042
__ARG_2.'unget'($P1)
.annotate 'line', 6043
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6044
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6046
$P1 = __ARG_2.'get'()
.annotate 'line', 6047
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 6048
__ARG_2.'unget'($P1)
.annotate 'line', 6049
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 6050
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6052
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6053

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6054
# Body
# {
.annotate 'line', 6056
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6057
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6058
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6059
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6060
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 6061
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 6062
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 6063
.return(self)
# }
.annotate 'line', 6064

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6065
# Body
# {
.annotate 'line', 6067
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6068
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6069
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6070
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6071
.return()
# }
__label_0: # endif
.annotate 'line', 6073
__ARG_1.'comment'('for loop')
.annotate 'line', 6074
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6075
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 6076
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 6077
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 6078
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6080
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6081
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 6082
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6084
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 6085
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6086
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 6087
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 6088
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6090
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6091

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6027
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6029
addattribute $P0, 'initializer'
.annotate 'line', 6030
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6103
# Body
# {
.annotate 'line', 6105
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6106
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6107
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6108
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6109
eq $S2, '', __label_2
# {
.annotate 'line', 6110
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 6112
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 6114
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6115
setattribute self, 'varname', $P1
.annotate 'line', 6116
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 6117
$P2 = __ARG_2.'get'()
.annotate 'line', 6118
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6119
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 6120
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6121

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6122
# Body
# {
.annotate 'line', 6124
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6125
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6126
.return(self)
# }
.annotate 'line', 6127

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6128
# Body
# {
.annotate 'line', 6130
self.'annotate'(__ARG_1)
.annotate 'line', 6131
# string regcont: $S1
null $S1
.annotate 'line', 6132
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6133
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6134
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6135
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6138
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 6139
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 6140
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 6141
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 6142
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 6143
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6144
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6145
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6146
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6147
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 6148
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 6149
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6150
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6151

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6098
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6100
addattribute $P0, 'varname'
.annotate 'line', 6101
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6156
# Body
# {
.annotate 'line', 6158
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6159
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6160
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6161
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6162
__ARG_2.'unget'($P3)
.annotate 'line', 6163
__ARG_2.'unget'($P2)
.annotate 'line', 6164
__ARG_2.'unget'($P1)
.annotate 'line', 6165
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 6166
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 6168
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 6169

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6179
# Body
# {
.annotate 'line', 6181
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6182
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6183

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6184
# Body
# {
.annotate 'line', 6186
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6187
.return(self)
# }
.annotate 'line', 6188

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6189
# Body
# {
.annotate 'line', 6191
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6192
self.'annotate'(__ARG_1)
.annotate 'line', 6193
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6194

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6175
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6177
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6208
# Body
# {
.annotate 'line', 6210
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6211
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6212
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6213
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6216
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6218
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6219
$P1 = __ARG_2.'get'()
.annotate 'line', 6220
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6221
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6222
$P1 = __ARG_2.'get'()
.annotate 'line', 6223
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6224
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6225
$P1 = __ARG_2.'get'()
.annotate 'line', 6226
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6227
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6228
setattribute self, 'exname', $P1
.annotate 'line', 6229
self.'createvar'($S1, 'P')
.annotate 'line', 6230
$P1 = __ARG_2.'get'()
.annotate 'line', 6231
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6232
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6234
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6235

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6236
# Body
# {
.annotate 'line', 6238
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6239
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6240
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6241
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6242
.return(self)
# }
.annotate 'line', 6243

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6244
# Body
# {
.annotate 'line', 6246
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6247
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6248
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6249
# string exreg: $S4
null $S4
.annotate 'line', 6250
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6251
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6252
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6255
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6257
self.'annotate'(__ARG_1)
.annotate 'line', 6258
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6260
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6261
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6263
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6264
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6265
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6266
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6267
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6268
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6271
eq $I1, 1, __label_14
.annotate 'line', 6272
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6273
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6274
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6275
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6278
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6279
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6280
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6281
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_16: # for iteration
.annotate 'line', 6279
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6283
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6284
# string sep: $S7
set $S7, ''
.annotate 'line', 6285
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6286
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6287
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6289
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6292
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6297
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6298
__ARG_1.'comment'('try: begin')
.annotate 'line', 6299
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6300
__ARG_1.'comment'('try: end')
.annotate 'line', 6301
__ARG_1.'say'('pop_eh')
.annotate 'line', 6303
self.'annotate'(__ARG_1)
.annotate 'line', 6304
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6306
__ARG_1.'comment'('catch')
.annotate 'line', 6307
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6308
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6309
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6310
__ARG_1.'say'('pop_eh')
.annotate 'line', 6311
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6313
__ARG_1.'comment'('catch end')
.annotate 'line', 6314
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6315

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6201
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6203
addattribute $P0, 'stry'
.annotate 'line', 6204
addattribute $P0, 'modifiers'
.annotate 'line', 6205
addattribute $P0, 'exname'
.annotate 'line', 6206
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6326
# Body
# {
.annotate 'line', 6328
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6329
setattribute self, 'name', __ARG_3
.annotate 'line', 6330
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6331
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6332

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6322
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6324
addattribute $P0, 'name'
.annotate 'line', 6325
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6349
# Body
# {
.annotate 'line', 6351
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6352
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6353
$P4 = $P1.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 6354
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6355
setattribute self, 'name', $P1
.annotate 'line', 6356
# var vdata: $P2
null $P2
.annotate 'line', 6357
# string reg: $S1
null $S1
.annotate 'line', 6359
$P1 = __ARG_2.'get'()
.annotate 'line', 6360
$P5 = $P1.'isop'('[')
if_null $P5, __label_1
unless $P5 goto __label_1
# {
box $P6, 1
.annotate 'line', 6362
setattribute self, 'typearray', $P6
.annotate 'line', 6363
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6364
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6365
$P1 = __ARG_2.'get'()
.annotate 'line', 6366
$P7 = $P1.'isop'(']')
if_null $P7, __label_3
unless $P7 goto __label_3
# {
.annotate 'line', 6368
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6371
__ARG_2.'unget'($P1)
.annotate 'line', 6372
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6373
$P1 = __ARG_2.'get'()
.annotate 'line', 6374
$P8 = $P1.'isop'(']')
isfalse $I1, $P8
unless $I1 goto __label_5
.annotate 'line', 6375
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6376
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P9, 0
.annotate 'line', 6381
setattribute self, 'typearray', $P9
.annotate 'line', 6382
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P2 = self.'createvar'($P9, $P10)
.annotate 'line', 6383
$P10 = $P2.'getreg'()
set $S1, $P10
.annotate 'line', 6384
$P11 = $P1.'isop'('=')
if_null $P11, __label_6
unless $P11 goto __label_6
# {
.annotate 'line', 6386
$P13 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P13
.annotate 'line', 6387
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6391
setattribute self, 'reg', $P11
.annotate 'line', 6392
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6394
$P1 = __ARG_2.'get'()
.annotate 'line', 6395
$P13 = $P1.'isop'('[')
isfalse $I2, $P13
unless $I2 goto __label_8
.annotate 'line', 6396
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6397
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P15
.annotate 'line', 6398
$P1 = __ARG_2.'get'()
.annotate 'line', 6399
$P14 = $P1.'isop'(']')
isfalse $I2, $P14
unless $I2 goto __label_9
# {
.annotate 'line', 6400
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6401
# {
.annotate 'line', 6402
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6403
getattribute $P15, self, 'init'
$P15.'push'($P3)
# }
.annotate 'line', 6404
$P1 = __ARG_2.'get'()
$P16 = $P1.'isop'(',')
if_null $P16, __label_11
if $P16 goto __label_10
__label_11: # enddo
.annotate 'line', 6405
$P17 = $P1.'isop'(']')
isfalse $I3, $P17
unless $I3 goto __label_13
.annotate 'line', 6406
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6408
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6410
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6411

.end # parse


.sub 'optimize' :method

.annotate 'line', 6412
# Body
# {
.annotate 'line', 6414
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6415
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6416
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6417
if_null $P1, __label_1
# {
.annotate 'line', 6418
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6419
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6421
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6423
.return(self)
# }
.annotate 'line', 6424

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6425
# Body
# {
.annotate 'line', 6427
self.'annotate'(__ARG_1)
.annotate 'line', 6428
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6429
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6430
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6431
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6432
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
.annotate 'line', 6433
__ARG_1.'comment'($S10)
.annotate 'line', 6435
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6436
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6437
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6439
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6440
ne $S5, $S4, __label_10
# {
.annotate 'line', 6441
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6442
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6444
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6447
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_15
# {
.annotate 'line', 6449
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6452
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_17
set $S6, $P6
__label_17:
.annotate 'line', 6453
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6454
iseq $I5, $S4, 'S'
unless $I5 goto __label_20
iseq $I5, $S5, 'P'
__label_20:
unless $I5 goto __label_18
# {
.annotate 'line', 6455
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_21
set $S7, $P7
__label_21:
.annotate 'line', 6456
__ARG_1.'emitnull'($S3)
.annotate 'line', 6457
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6458
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6459
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6462
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
.annotate 'line', 6468
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6469
if_null $P2, __label_22
# {
.annotate 'line', 6471
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_24
set $S8, $P8
__label_24:
.annotate 'line', 6472
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6476
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_23: # endif
.annotate 'line', 6478
if_null $P1, __label_25
# {
.annotate 'line', 6479
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_26
set $S9, $P9
__label_26:
.annotate 'line', 6480
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6481
unless_null $P2, __label_27
# {
.annotate 'line', 6482
le $I1, 0, __label_28
# {
.annotate 'line', 6484
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6487
# int i: $I2
null $I2
.annotate 'line', 6488
iter $P10, $P1
set $P10, 0
__label_29: # for iteration
unless $P10 goto __label_30
shift $P3, $P10
# {
.annotate 'line', 6489
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6490
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6491
inc $I2
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6495

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6496
# Body
# {
.annotate 'line', 6498
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6499

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6339
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6341
addattribute $P0, 'name'
.annotate 'line', 6342
addattribute $P0, 't_reg'
.annotate 'line', 6343
addattribute $P0, 't_name'
.annotate 'line', 6344
addattribute $P0, 't_array'
.annotate 'line', 6345
addattribute $P0, 'reg'
.annotate 'line', 6346
addattribute $P0, 'typearray'
.annotate 'line', 6347
addattribute $P0, 'size'
.annotate 'line', 6348
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6502
# Body
# {
.annotate 'line', 6504
# var next: $P1
null $P1
.annotate 'line', 6505
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6506
# {
.annotate 'line', 6507
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6508
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6509
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6510
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6511
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6512
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6513
.return($P2)
# }
.annotate 'line', 6514

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6526
# Body
# {
.annotate 'line', 6529
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6530
setattribute self, 'type', $P1
.annotate 'line', 6531
setattribute self, 'name', __ARG_4
.annotate 'line', 6532
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6533

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6534
# Body
# {
.annotate 'line', 6536
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6537
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6538
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6539
$P1 = $P1.'optimize'()
.annotate 'line', 6540
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6542
getattribute $P4, self, 'start'
.annotate 'line', 6541
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6544
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6545
setattribute self, 'value', $P1
.annotate 'line', 6546
.return(self)
# }
.annotate 'line', 6547

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6548
# Body
# {
.annotate 'line', 6550
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6551

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6552
# Body
# {
.annotate 'line', 6554
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
.annotate 'line', 6555
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6556

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6520
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6522
addattribute $P0, 'type'
.annotate 'line', 6523
addattribute $P0, 'name'
.annotate 'line', 6524
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6559
# Body
# {
.annotate 'line', 6561
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6562
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6563
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6564
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6566
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6567
# {
.annotate 'line', 6568
$P1 = __ARG_2.'get'()
.annotate 'line', 6569
# var name: $P3
set $P3, $P1
.annotate 'line', 6570
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6571
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6573
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6572
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6574
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6575
.return($P2)
# }
.annotate 'line', 6576

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 6585
# Body
# {
.annotate 'line', 6587
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 6588
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6589
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6590
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6591
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6593
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6594
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6595

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6596
# Body
# {
.annotate 'line', 6598
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6599
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6600
.return(self)
# }
.annotate 'line', 6601

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6602
# Body
# {
.annotate 'line', 6604
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6605

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6606
# Body
# {
.annotate 'line', 6608
self.'annotate'(__ARG_1)
.annotate 'line', 6609
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6610
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6611
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
.annotate 'line', 6612
__ARG_1.'comment'($S5)
.annotate 'line', 6613
if_null $P1, __label_2
.annotate 'line', 6614
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6616
if_null $P1, __label_4
# {
.annotate 'line', 6617
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6618
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
.annotate 'line', 6620
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_16
isa $I1, $P1, 'ArrayExpr'
__label_16:
if $I1 goto __label_15
isa $I1, $P1, 'NewExpr'
__label_15:
unless $I1 goto __label_13
.annotate 'line', 6621
$P1.'emit_init'(__ARG_1, $S2)
goto __label_14
__label_13: # else
.annotate 'line', 6623
$P1.'emit'(__ARG_1, $S2)
__label_14: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6628
# string value: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_17
set $S4, $P4
__label_17:
.annotate 'line', 6629
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6632
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6636
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6637

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6582
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6584
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6642
# Body
# {
.annotate 'line', 6644
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6645
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6646
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6647
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6648

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6649
# Body
# {
.annotate 'line', 6651
self.'annotate'(__ARG_1)
.annotate 'line', 6652
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6653
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
.annotate 'line', 6654
__ARG_1.'comment'($S3)
.annotate 'line', 6655
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6656

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6640
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6663
# Body
# {
.annotate 'line', 6665
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6666
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6667
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6668
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6669
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6670
$P1 = __ARG_2.'get'()
.annotate 'line', 6671
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6672
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6673

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6674
# Body
# {
.annotate 'line', 6676
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6677
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6678

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6679
# Body
# {
.annotate 'line', 6681
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6682
self.'annotate'(__ARG_1)
.annotate 'line', 6683
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6684
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
.annotate 'line', 6685
__ARG_1.'comment'($S4)
.annotate 'line', 6686
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6687

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6659
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6661
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6690
# Body
# {
.annotate 'line', 6692
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6693
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6694
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6695
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6696
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6697
$P2 = __ARG_2.'get'()
.annotate 'line', 6698
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6699
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6701
__ARG_2.'unget'($P2)
.annotate 'line', 6702
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
.annotate 'line', 6706
__ARG_2.'unget'($P2)
.annotate 'line', 6707
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6709

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6711
# Body
# {
.annotate 'line', 6713
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6714
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6715
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 6716
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 6717

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6725
# Body
# {
box $P1, 'S'
.annotate 'line', 6727
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6728
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6729
setattribute self, 't_array', $P2
.annotate 'line', 6730
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6731

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6732
# Body
# {
.annotate 'line', 6734
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6735

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6723
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6738
# Body
# {
.annotate 'line', 6740
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6741

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6743
# Body
# {
.annotate 'line', 6745
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6746
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6747

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6755
# Body
# {
box $P1, 'I'
.annotate 'line', 6757
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6758
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6759
setattribute self, 't_array', $P2
.annotate 'line', 6760
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6761

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6762
# Body
# {
.annotate 'line', 6764
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6765

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6753
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6768
# Body
# {
.annotate 'line', 6770
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6771

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6773
# Body
# {
.annotate 'line', 6775
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6776
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6777

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6785
# Body
# {
box $P1, 'N'
.annotate 'line', 6787
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6789
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6790
setattribute self, 't_array', $P2
.annotate 'line', 6791
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6792

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6793
# Body
# {
.annotate 'line', 6795
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6796

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6783
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6799
# Body
# {
.annotate 'line', 6801
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6802

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6804
# Body
# {
.annotate 'line', 6806
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6807
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6808

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6821
# Body
# {
.annotate 'line', 6823
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6824
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6825
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6826
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6827
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6828
__ARG_2.'unget'($P1)
.annotate 'line', 6829
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6830
unless_null $P2, __label_2
.annotate 'line', 6831
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 6832
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6834
setattribute self, 'end', $P1
# }
.annotate 'line', 6835

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6836
# Body
# {
.annotate 'line', 6838
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6839
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6840
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6841
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6842
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6843
.return($S2)
# }
.annotate 'line', 6844

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6845
# Body
# {
.annotate 'line', 6847
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6848
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6849
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6850
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6851
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6852
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6853
$P1[$S1] = $S3
.annotate 'line', 6854
.return($S3)
# }
.annotate 'line', 6855

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6856
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6857
# Body
# {
.annotate 'line', 6859
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6860
.return(self)
# }
.annotate 'line', 6861

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6862
# Body
# {
.annotate 'line', 6864
__ARG_1.'comment'('{')
.annotate 'line', 6865
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6866
$P1.'emit'(__ARG_1)
.annotate 'line', 6867
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6869
__ARG_1.'comment'('}')
# }
.annotate 'line', 6870

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6814
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6816
addattribute $P0, 'statements'
.annotate 'line', 6817
addattribute $P0, 'end'
.annotate 'line', 6818
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6883
# Body
# {
box $P3, 1
.annotate 'line', 6886
setattribute self, 'nreg', $P3
.annotate 'line', 6887
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6888
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6889
setattribute self, 'tempreg', $P1
.annotate 'line', 6890
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6891

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6892
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6894
setattribute self, 'type', $P1
.annotate 'line', 6895
.return(self)
# }
.annotate 'line', 6896

.end # settype


.sub 'createreg' :method

.annotate 'line', 6897
# Body
# {
.annotate 'line', 6899
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6900
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6901
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6903
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 6905
.return($S1)
# }
.annotate 'line', 6906

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6907
# Body
# {
.annotate 'line', 6909
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6910
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6911
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6912
# string reg: $S1
null $S1
.annotate 'line', 6913
le $I1, 0, __label_0
.annotate 'line', 6914
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6916
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6917
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6919
.return($S1)
# }
.annotate 'line', 6920

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6921
# Body
# {
.annotate 'line', 6923
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6924
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6925
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6926
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6927

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6879
addattribute $P0, 'type'
.annotate 'line', 6880
addattribute $P0, 'nreg'
.annotate 'line', 6881
addattribute $P0, 'tempreg'
.annotate 'line', 6882
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6951
# Body
# {
.annotate 'line', 6953
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6954
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
box $P1, 0
.annotate 'line', 6955
setattribute self, 'nlabel', $P1
.annotate 'line', 6956
new $P4, [ 'RegisterStore' ]
$P3 = $P4.'settype'('I')
setattribute self, 'regstI', $P3
.annotate 'line', 6957
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('N')
setattribute self, 'regstN', $P5
.annotate 'line', 6958
new $P7, [ 'RegisterStore' ]
$P6 = $P7.'settype'('S')
setattribute self, 'regstS', $P6
.annotate 'line', 6959
new $P9, [ 'RegisterStore' ]
$P8 = $P9.'settype'('P')
setattribute self, 'regstP', $P8
# }
.annotate 'line', 6960

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 6962
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 6963
# Body
# {
.annotate 'line', 6966
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 6967
unless_null $P1, __label_0
# {
.annotate 'line', 6968
$P1 = self.'generatesubid'()
.annotate 'line', 6969
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 6971
.return($P1)
# }
.annotate 'line', 6972

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6974
# Body
# {
.annotate 'line', 6976
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6977
.return($I1)
# }
.annotate 'line', 6978

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6979
# Body
# {
.annotate 'line', 6981
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 6982
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6983
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6984
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 6985
# {
.annotate 'line', 6986
$P2 = __ARG_1.'get'()
.annotate 'line', 6987
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6988
eq $S1, '', __label_5
.annotate 'line', 6989
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6992
# string argname: $S2
# predefined string
$P6 = self.'getparamnum'()
set $S4, $P6
concat $S2, '__ARG_', $S4
.annotate 'line', 6993
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 6995
# string varname: $S3
set $P7, $P2
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6996
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6997
$P3['name'] = $S3
.annotate 'line', 6998
$P2 = __ARG_1.'get'()
.annotate 'line', 6999
$P7 = $P2.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 7000
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7001
$P3['modifiers'] = $P4
.annotate 'line', 7002
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7004
$P1.'push'($P3)
# }
.annotate 'line', 7005
$P8 = $P2.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 7006
$P8 = $P2.'isop'(')')
isfalse $I1, $P8
unless $I1 goto __label_9
.annotate 'line', 7007
'SyntaxError'("Expected ')'", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7009

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7011
# Body
# {
.annotate 'line', 7013
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7014
unless_null $P1, __label_0
.annotate 'line', 7015
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7017
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 7018

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7020
# Body
# {
.annotate 'line', 7022
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7023
.return(self)
# }
.annotate 'line', 7024

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7026
# Body
# {
.annotate 'line', 7028
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7029
unless_null $P1, __label_0
# {
.annotate 'line', 7030
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7031
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7033
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7034

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7035
# Body
# {
.annotate 'line', 7037
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7038
unless_null $P1, __label_0
# {
.annotate 'line', 7039
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7040
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7042
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7043

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7044
# Body
# {
.annotate 'line', 7048
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7049
# string lexname: $S1
null $S1
.annotate 'line', 7050
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 7051
# {
.annotate 'line', 7053
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7054
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7055
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7056
self.'setlex'($S1, $S2)
.annotate 'line', 7057
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7059
.return($S1)
# }
.annotate 'line', 7060

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7062
# Body
# {
.annotate 'line', 7064
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7065
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
.annotate 'line', 7067
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7069
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7071
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7073
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7075
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 7077
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7078
.return($S1)
# }
.annotate 'line', 7079

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7080
# Body
# {
.annotate 'line', 7082
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7083
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
.annotate 'line', 7085
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7087
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7089
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7091
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7093
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 7095
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7096
.return($S1)
# }
.annotate 'line', 7097

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7098
# Body
# {
.annotate 'line', 7100
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
.annotate 'line', 7101
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7102

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7103
# Body
# {
.annotate 'line', 7105
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7106
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7107
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 7109
.return($S1)
# }
.annotate 'line', 7110

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7111
# Body
# {
.annotate 'line', 7113
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7114

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7115
# Body
# {
.annotate 'line', 7117
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7118

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7120
# Body
# {
.annotate 'line', 7122
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 7123
__ARG_1.'say'()
.annotate 'line', 7124
__ARG_1.'print'(".sub ")
.annotate 'line', 7125
$P19 = self.'isanonymous'()
if_null $P19, __label_1
unless $P19 goto __label_1
.annotate 'line', 7126
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7128
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7129
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7130
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7131
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7132
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7133
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7134
if_null $P2, __label_5
.annotate 'line', 7135
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7139
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 7140
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7141
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7142
if_null $P3, __label_7
# {
.annotate 'line', 7143
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7144
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7145
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 7146
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 7147
le $I1, 0, __label_11
# {
.annotate 'line', 7148
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7149
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7150
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7151
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 7152
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 7153
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 7149
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7155
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
.annotate 'line', 7160
ne $S1, 'main', __label_16
.annotate 'line', 7161
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7163
__ARG_1.'say'()
.annotate 'line', 7165
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7166
# var param: $P8
null $P8
.annotate 'line', 7167
# string paramname: $S2
null $S2
.annotate 'line', 7168
# var a: $P9
null $P9
.annotate 'line', 7170
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7171
$S2 = $P8['name']
.annotate 'line', 7172
$P9 = self.'getvar'($S2)
.annotate 'line', 7173
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7174
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7175
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7176
if_null $P10, __label_20
# {
.annotate 'line', 7177
# var named: $P11
null $P11
.annotate 'line', 7178
# var slurpy: $P12
null $P12
.annotate 'line', 7179
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7180
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7181
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7182
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
.annotate 'line', 7190
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7193
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7198
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7201
if_null $P11, __label_31
# {
.annotate 'line', 7202
# string setname: $S5
null $S5
.annotate 'line', 7203
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7204
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
.annotate 'line', 7209
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7210
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7211
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7212
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7215
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7217
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7219
if_null $P12, __label_38
# {
.annotate 'line', 7220
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7224
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7226
__ARG_1.'say'()
.annotate 'line', 7227
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7230
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7231
if_null $P16, __label_39
# {
.annotate 'line', 7233
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
.annotate 'line', 7234
$P31 = $P16[$S6]
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7237
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7238
if_null $P16, __label_42
# {
.annotate 'line', 7240
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
.annotate 'line', 7241
$P32 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7244
__ARG_1.'comment'('Body')
.annotate 'line', 7245
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7247
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7248
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7251
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7252
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7254
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I6, $P17
ge $I4, $I6, __label_47
# {
.annotate 'line', 7255
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7256
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7254
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7259

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 6934
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6936
addattribute $P0, 'name'
.annotate 'line', 6937
addattribute $P0, 'subid'
.annotate 'line', 6938
addattribute $P0, 'modifiers'
.annotate 'line', 6939
addattribute $P0, 'params'
.annotate 'line', 6940
addattribute $P0, 'body'
.annotate 'line', 6941
addattribute $P0, 'regstI'
.annotate 'line', 6942
addattribute $P0, 'regstN'
.annotate 'line', 6943
addattribute $P0, 'regstS'
.annotate 'line', 6944
addattribute $P0, 'regstP'
.annotate 'line', 6945
addattribute $P0, 'nlabel'
.annotate 'line', 6946
addattribute $P0, 'localfun'
.annotate 'line', 6947
addattribute $P0, 'lexicals'
.annotate 'line', 6948
addattribute $P0, 'usedlexicals'
.annotate 'line', 6949
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7271
# Body
# {
.annotate 'line', 7273
self.'FunctionBase'(__ARG_1, __ARG_3)
box $P1, 0
.annotate 'line', 7274
setattribute self, 'paramnum', $P1
box $P1, 0
.annotate 'line', 7275
setattribute self, 'lexnum', $P1
.annotate 'line', 7276
self.'parse'(__ARG_2)
# }
.annotate 'line', 7277

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7279
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7280
# Body
# {
.annotate 'line', 7283
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7284
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7286
.return($I1)
# }
.annotate 'line', 7287

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7288
# Body
# {
.annotate 'line', 7291
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7292
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7294
.return($I1)
# }
.annotate 'line', 7295

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7296
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7298
# Body
# {
.annotate 'line', 7300
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7301
setattribute self, 'name', $P1
.annotate 'line', 7302
$P1 = __ARG_1.'get'()
.annotate 'line', 7303
$P3 = $P1.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7304
# var modifiers: $P2
new $P2, [ 'ModifierList' ]
$P2.'ModifierList'(__ARG_1, self)
.annotate 'line', 7305
setattribute self, 'modifiers', $P2
.annotate 'line', 7306
$P1 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7308
$P4 = $P1.'isop'('(')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 7309
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 7310
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7312
$P1 = __ARG_1.'get'()
.annotate 'line', 7313
$P5 = $P1.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 7314
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 7315
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P1, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7316
.return(self)
# }
.annotate 'line', 7317

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7266
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7268
addattribute $P0, 'paramnum'
.annotate 'line', 7269
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7326
# Body
# {
.annotate 'line', 7328
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7329
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7330
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7331
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7332
setattribute self, 'name', $P1
.annotate 'line', 7333
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7334
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7335
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_0
.annotate 'line', 7336
'Expected'('{', $P2)
__label_0: # endif
.annotate 'line', 7337
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_2, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7338
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7339

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7340
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7341
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7342
# Body
# {
.annotate 'line', 7344
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7345

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7346
# Body
# {
.annotate 'line', 7349
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7350

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7351
# Body
# {
.annotate 'line', 7354
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7355

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7356
# Body
# {
.annotate 'line', 7358
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7359
unless_null $P1, __label_0
# {
.annotate 'line', 7362
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7363
unless_null $P1, __label_1
# {
.annotate 'line', 7365
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7366
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7367
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7368
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7369
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7370
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7371
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7375
$P8 = $P1.'gettype'()
set $S5, $P8
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I2, $P9
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7376
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7377
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7378
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7379
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7380
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7381
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7382
# int flags: $I1
$P10 = $P1.'isvolatile'()
if_null $P10, __label_13
unless $P10 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7383
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
box $P11, $S3
.annotate 'line', 7384
setattribute $P1, 'lexname', $P11
.annotate 'line', 7385
# string reg: $S4
$P11 = $P1.'getreg'()
null $S4
if_null $P11, __label_14
set $S4, $P11
__label_14:
.annotate 'line', 7386
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
.annotate 'line', 7391
isnull $I3, $P1
not $I3
unless $I3 goto __label_16
isa $I4, $P1, 'VarData'
not $I3, $I4
__label_16:
unless $I3 goto __label_15
.annotate 'line', 7392
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7393
.return($P1)
# }
.annotate 'line', 7394

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7324
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7403
# Body
# {
.annotate 'line', 7405
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7406

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7407
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7401
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

.annotate 'line', 7424
# Body
# {
.annotate 'line', 7426
setattribute self, 'owner', __ARG_1
.annotate 'line', 7427
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7428

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7429
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7431
# Body
# {
.annotate 'line', 7433
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7434

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7422
addattribute $P0, 'owner'
.annotate 'line', 7423
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7440
# Body
# {
.annotate 'line', 7442
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7443
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7444

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7445
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7447
# Body
# {
.annotate 'line', 7449
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7450
__ARG_1.'print'($S1)
# }
.annotate 'line', 7451

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7437
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7439
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7458
# Body
# {
.annotate 'line', 7460
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7461
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7462
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7463
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7464
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7465
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7466
$P2 = __ARG_1.'get'()
.annotate 'line', 7467
$P4 = $P2.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 7468
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
.annotate 'line', 7470
setattribute self, 'hll', $P6
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7474
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7476
# {
.annotate 'line', 7477
$P2 = __ARG_1.'get'()
.annotate 'line', 7478
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7479
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7480
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7481
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7482
$P7 = $P2.'isop'(']')
isfalse $I2, $P7
unless $I2 goto __label_10
.annotate 'line', 7483
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7485
setattribute self, 'key', $P1
# }
.annotate 'line', 7486

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7487
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7488
# Body
# {
# predefined int
.annotate 'line', 7490
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7491

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7493
# Body
# {
.annotate 'line', 7495
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7496

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7454
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7456
addattribute $P0, 'key'
.annotate 'line', 7457
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7502
# Body
# {
.annotate 'line', 7504
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7505
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7506
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7507
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7508
$P2 = __ARG_1.'get'()
.annotate 'line', 7509
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7511
__ARG_1.'unget'($P2)
.annotate 'line', 7512
setattribute self, 'key', $P1
# }
.annotate 'line', 7513

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7514
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7516
# Body
# {
.annotate 'line', 7518
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7519
.return($P2)
# }
.annotate 'line', 7520

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7522
# Body
# {
.annotate 'line', 7524
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7525
unless_null $P1, __label_0
# {
.annotate 'line', 7526
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7527
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7529
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7530

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7499
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7501
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7533
# Body
# {
.annotate 'line', 7535
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7536
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7537
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7538
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7539
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7540
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7541
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7542
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7543

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7560
# Body
# {
.annotate 'line', 7562
setattribute self, 'parent', __ARG_2
.annotate 'line', 7563
setattribute self, 'owner', __ARG_2
.annotate 'line', 7564
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7565
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7566
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7567
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7569
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7570
setattribute self, 'name', $P1
.annotate 'line', 7571
$P1 = __ARG_1.'get'()
.annotate 'line', 7572
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7573
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7574
# {
.annotate 'line', 7575
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7576
$P2.'push'($P3)
.annotate 'line', 7577
$P1 = __ARG_1.'get'()
.annotate 'line', 7578
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
.annotate 'line', 7581
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7582
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7583
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7584
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7585
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7586
# var f: $P4
new $P4, [ 'MethodStatement' ]
$P4.'MethodStatement'($P1, __ARG_1, self)
.annotate 'line', 7587
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7588
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7590
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7591
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7592
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7593
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7594
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7595
$P1 = __ARG_1.'get'()
.annotate 'line', 7596
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 7597
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7599
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7600
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7601
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7602
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7605
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7606
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7608
# var classns: $P9
getattribute $P22, self, 'parent'
$P9 = $P22.'getpath'()
.annotate 'line', 7609
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7610
setattribute self, 'classns', $P9
# }
.annotate 'line', 7611

.end # ClassStatement


.sub 'generatesubid' :method

.annotate 'line', 7612
# Body
# {
.annotate 'line', 7614
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7615

.end # generatesubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7616
# Body
# {
.annotate 'line', 7618
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7619

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7620
# Body
# {
.annotate 'line', 7622
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7623

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7624
# Body
# {
.annotate 'line', 7626
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7627

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7628
# Body
# {
.annotate 'line', 7630
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7631
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7632
.return(self)
# }
.annotate 'line', 7633

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7634
# Body
# {
.annotate 'line', 7636
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7637

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7638
# Body
# {
.annotate 'line', 7640
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7641
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7642
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7643
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7645
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7647
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7648
# int n: $I1
set $I1, 1
.annotate 'line', 7649
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7650
$P3.'annotate'(__ARG_1)
.annotate 'line', 7651
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7652
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7653
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7654
__ARG_1.'say'()
.annotate 'line', 7655
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7657
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7658
__ARG_1.'annotate'($P4)
.annotate 'line', 7659
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7662
__ARG_1.'say'('.end')
# }
.annotate 'line', 7663

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7549
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7551
addattribute $P0, 'parent'
.annotate 'line', 7552
addattribute $P0, 'owner'
.annotate 'line', 7553
addattribute $P0, 'name'
.annotate 'line', 7554
addattribute $P0, 'bases'
.annotate 'line', 7555
addattribute $P0, 'constants'
.annotate 'line', 7556
addattribute $P0, 'functions'
.annotate 'line', 7557
addattribute $P0, 'members'
.annotate 'line', 7558
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7670
# Body
# {
.annotate 'line', 7672
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7673
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7674
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7675
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7676
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7677
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7682
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7683
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7684
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7685
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7686
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7687
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7688
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7689
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 7687
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
.annotate 'line', 7694
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7695
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7700
load_bytecode 'PGE.pbc'
.annotate 'line', 7701
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7702
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7704
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
.annotate 'line', 7705
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7706
$P8 = $P7($S4)
.annotate 'line', 7707
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7708
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7709
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7710
# int ivalue: $I1
null $I1
.annotate 'line', 7711
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7712
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7717
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7716
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7715
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7704
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7721
$P5.'close'()
# }
.annotate 'line', 7722

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7734
# Body
# {
.annotate 'line', 7736
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7737
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7738
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7739
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7740

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7741
# Body
# {
.annotate 'line', 7743
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7744
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7745
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7746
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7747
.return($P4)
# }
.annotate 'line', 7748

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7749
# Body
# {
.annotate 'line', 7753
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
.annotate 'line', 7755
.return($P5)
__label_3: # case
.annotate 'line', 7758
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7763
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7764
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7765
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7766
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7767
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7769
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7770
if_null $P4, __label_8
.annotate 'line', 7771
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7775
.return($P5)
# }
.annotate 'line', 7776

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7777
# Body
# {
.annotate 'line', 7779
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7780
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7781
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7783
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7785
# var start: $P2
set $P2, $P1
.annotate 'line', 7786
$P1 = __ARG_1.'get'()
.annotate 'line', 7787
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7788
$P1 = __ARG_1.'get'()
.annotate 'line', 7790
# var modifier: $P3
null $P3
.annotate 'line', 7791
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7792
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7793
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7796
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7797
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7798
# var child: $P4
new $P4, [ 'NamespaceStatement' ]
$P4.'NamespaceStatement'(self, $P2, $S1, $P3)
.annotate 'line', 7799
getattribute $P12, self, 'namespaces'
$P12.'push'($P4)
.annotate 'line', 7800
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7801
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7803
$P13 = $P1.'iskeyword'('const')
if_null $P13, __label_7
unless $P13 goto __label_7
# {
.annotate 'line', 7804
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7805
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7807
$P14 = $P1.'iskeyword'('function')
if_null $P14, __label_9
unless $P14 goto __label_9
# {
.annotate 'line', 7808
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P1, __ARG_1, self)
.annotate 'line', 7809
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7810
$P7.'push'($P6)
.annotate 'line', 7811
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7813
$P15 = $P1.'iskeyword'('class')
if_null $P15, __label_11
unless $P15 goto __label_11
# {
.annotate 'line', 7814
# var c: $P8
new $P8, [ 'ClassStatement' ]
$P8.'ClassStatement'(__ARG_1, self)
.annotate 'line', 7815
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7816
$P9.'push'($P8)
.annotate 'line', 7817
getattribute $P16, self, 'items'
$P16.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7819
$P16 = $P1.'iskeyword'('using')
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 7820
$P1 = __ARG_1.'get'()
.annotate 'line', 7821
$P17 = $P1.'iskeyword'('extern')
isfalse $I4, $P17
unless $I4 goto __label_15
.annotate 'line', 7822
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7823
$P1 = __ARG_1.'get'()
.annotate 'line', 7824
$P17 = $P1.'isstring'()
isfalse $I5, $P17
unless $I5 goto __label_16
.annotate 'line', 7825
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7826
# string reqlib: $S2
set $P18, $P1
null $S2
if_null $P18, __label_17
set $S2, $P18
__label_17:
.annotate 'line', 7827
self.'addlib'($S2)
.annotate 'line', 7828
$P1 = __ARG_1.'get'()
.annotate 'line', 7829
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7831
$P18 = $P1.'iskeyword'('$include_const')
if_null $P18, __label_18
unless $P18 goto __label_18
# {
.annotate 'line', 7832
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7834
$P19 = $P1.'iskeyword'('$load')
if_null $P19, __label_20
unless $P19 goto __label_20
# {
.annotate 'line', 7835
$P1 = __ARG_1.'get'()
.annotate 'line', 7836
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_22
.annotate 'line', 7837
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7838
# string reqload: $S3
set $P20, $P1
null $S3
if_null $P20, __label_23
set $S3, $P20
__label_23:
.annotate 'line', 7839
self.'addload'($S3)
.annotate 'line', 7840
$P1 = __ARG_1.'get'()
.annotate 'line', 7841
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7843
$P20 = $P1.'isop'('}')
if_null $P20, __label_24
unless $P20 goto __label_24
# {
.annotate 'line', 7844
self.'close_ns'($P1)
.annotate 'line', 7845
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7848
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
.annotate 'line', 7850
self.'unclosed_ns'()
# }
.annotate 'line', 7851

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7852
# Body
# {
.annotate 'line', 7854
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7855

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7856
# Body
# {
.annotate 'line', 7858
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7859
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7861
# int activate: $I1
set $I1, 1
.annotate 'line', 7862
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7863
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7864
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
unless $I1 goto __label_6
.annotate 'line', 7867
# {
.annotate 'line', 7868
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7869
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7871
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7873

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7726
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7728
addattribute $P0, 'namespaces'
.annotate 'line', 7729
addattribute $P0, 'classes'
.annotate 'line', 7730
addattribute $P0, 'functions'
.annotate 'line', 7731
addattribute $P0, 'items'
.annotate 'line', 7732
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7888
# Body
# {
.annotate 'line', 7891
setattribute self, 'parent', __ARG_1
.annotate 'line', 7892
setattribute self, 'start', __ARG_2
.annotate 'line', 7893
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7894
setattribute self, 'name', $P2
.annotate 'line', 7895
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7896
if_null __ARG_4, __label_0
# {
.annotate 'line', 7897
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7898
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7900

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 7901
# Body
# {
.annotate 'line', 7903
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7904

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7905
# Body
# {
.annotate 'line', 7907
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7908

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7909
# Body
# {
.annotate 'line', 7911
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7912
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7913
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7914
.return($P1)
# }
.annotate 'line', 7915

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7916
# Body
# {
.annotate 'line', 7918
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7919

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7920
# Body
# {
.annotate 'line', 7922
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7923

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7924
# Body
# {
.annotate 'line', 7926
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7927
unless_null $P1, __label_0
.annotate 'line', 7928
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7930
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7931

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7932
# Body
# {
.annotate 'line', 7936
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7937
unless_null $P1, __label_0
.annotate 'line', 7938
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7939
.return($P1)
# }
.annotate 'line', 7940

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7941
# Body
# {
.annotate 'line', 7943
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7944

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7945
# Body
# {
# }
.annotate 'line', 7948

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7949
# Body
# {
.annotate 'line', 7951
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7952
if_null $P1, __label_0
# {
.annotate 'line', 7953
$P1 = $P1.'optimize'()
.annotate 'line', 7954
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7956
self.'optimize_base'()
.annotate 'line', 7957
.return(self)
# }
.annotate 'line', 7958

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7959
# Body
# {
.annotate 'line', 7961
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7962
if_null $P1, __label_0
.annotate 'line', 7963
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7965
self.'emit_base'(__ARG_1)
.annotate 'line', 7967
if_null $P1, __label_1
.annotate 'line', 7968
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7969

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7880
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7882
addattribute $P0, 'parent'
.annotate 'line', 7883
addattribute $P0, 'start'
.annotate 'line', 7884
addattribute $P0, 'name'
.annotate 'line', 7885
addattribute $P0, 'modifier'
.annotate 'line', 7886
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7983
# Body
# {
.annotate 'line', 7985
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7986
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7987

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7988
# Body
# {
.annotate 'line', 7990
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7991
$P1[__ARG_1] = 1
# }
.annotate 'line', 7992

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7993
# Body
# {
.annotate 'line', 7995
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7996
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7997

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 7999
# Body
# {
.annotate 'line', 8001
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8002
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8003
inc $I1
assign $P1, $I1
.annotate 'line', 8005
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8006
.return($S1)
# }
.annotate 'line', 8007

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8009
# Body
# {
.annotate 'line', 8011
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8012
unless_null $P1, __label_0
# {
.annotate 'line', 8013
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8014
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8016
$P1[__ARG_1] = 1
# }
.annotate 'line', 8017

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8018
# Body
# {
.annotate 'line', 8020
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8021
unless_null $P1, __label_0
# {
.annotate 'line', 8022
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8023
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8025
$P1[__ARG_1] = 1
# }
.annotate 'line', 8026

.end # addload


.sub 'getpath' :method

.annotate 'line', 8027
# Body
# {
.annotate 'line', 8029
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8030
.return($P1)
# }
.annotate 'line', 8031

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8032
# Body
# {
.annotate 'line', 8034
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8035

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8036
# Body
# {
.annotate 'line', 8039
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8040

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8041
# Body
# {
# }
.annotate 'line', 8044

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8045
# Body
# {
.annotate 'line', 8047
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8048

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8049
# Body
# {
.annotate 'line', 8051
self.'optimize_base'()
.annotate 'line', 8052
.return(self)
# }
.annotate 'line', 8053

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8054
# Body
# {
.annotate 'line', 8056
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8059
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8060
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8063
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
.annotate 'line', 8066
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8067
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8068
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8069
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8072
# int somelib: $I1
null $I1
.annotate 'line', 8073
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8074
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 8076
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8077
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8080
# int someload: $I2
null $I2
.annotate 'line', 8081
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8082
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 8084
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8085
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8086
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8087
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 8089
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 8090
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8092
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8093

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7976
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7978
addattribute $P0, 'predefs_used'
.annotate 'line', 7979
addattribute $P0, 'libs'
.annotate 'line', 7980
addattribute $P0, 'loads'
.annotate 'line', 7981
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 8105
# Body
# {
.annotate 'line', 8107
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 8110
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8114
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8113
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8112
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8118
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8117
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8116
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8124
new $P9, [ 'StringLiteral' ]
.annotate 'line', 8125
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
.annotate 'line', 8123
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 8128
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8129

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8130
# Body
# {
.annotate 'line', 8132
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8133

.end # parse


.sub 'optimize' :method

.annotate 'line', 8134
# Body
# {
.annotate 'line', 8136
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8137

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8138
# Body
# {
.annotate 'line', 8140
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8141
__ARG_1.'say'('')
.annotate 'line', 8143
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8145
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8146

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 8104
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')

.annotate 'line', 8153
# Body
# {
.annotate 'line', 8155
unless_null __ARG_2, __label_0
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8157
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8159
$P1.'open'('__eval__', 'w')
.annotate 'line', 8160
$P1.'puts'(__ARG_1)
.annotate 'line', 8161
$P1.'close'()
.annotate 'line', 8162
$P1.'open'('__eval__', 'r')
.annotate 'line', 8163
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8164
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8165
$P3.'parse'($P2)
.annotate 'line', 8166
$P1.'close'()
.annotate 'line', 8167
$P3.'optimize'()
.annotate 'line', 8168
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8169
$P4.'open'('__eval__', 'w')
.annotate 'line', 8170
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8171
$P5.'initialize'($P4)
.annotate 'line', 8172
$P3.'emit'($P5)
.annotate 'line', 8173
$P5.'close'()
.annotate 'line', 8174
$P4.'close'()
.annotate 'line', 8175
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_1
set $S1, $P8
__label_1:
.annotate 'line', 8176
# var object: $P6
null $P6
set $S2, __ARG_2
set $S3, 'pir'
.annotate 'line', 8177
if $S2 == $S3 goto __label_4
set $S3, 'pbc'
if $S2 == $S3 goto __label_5
set $S3, ''
if $S2 == $S3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 8179
new $P6, [ 'String' ]
assign $P6, $S1
goto __label_2 # break
__label_5: # case
__label_6: # case
.annotate 'line', 8184
# var pircomp: $P7
# predefined compreg
compreg $P7, 'PIR'
.annotate 'line', 8185
$P6 = $P7($S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 8186
# predefined die
.annotate 'line', 8188
die 'Invalid target'
__label_2: # switch end
.annotate 'line', 8190
.return($P6)
# }
.annotate 'line', 8191

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 8192
# Body
# {
.annotate 'line', 8194
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8195
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8196
$P1.'encoding'('utf8')
.annotate 'line', 8197
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8198
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8199
$P3.'parse'($P2)
.annotate 'line', 8200
$P1.'close'()
.annotate 'line', 8201
$P3.'optimize'()
.annotate 'line', 8202
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8203
$P4.'initialize'(__ARG_2)
.annotate 'line', 8204
$P3.'emit'($P4)
.annotate 'line', 8205
$P4.'close'()
# }
.annotate 'line', 8206

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 8207
# Body
# {
.annotate 'line', 8209
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8210
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8211
$P1.'encoding'('utf8')
.annotate 'line', 8212
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8213
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8214
$P3.'parse'($P2)
.annotate 'line', 8215
$P1.'close'()
.annotate 'line', 8216
$P3.'optimize'()
.annotate 'line', 8217
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8218
$P4.'open'('__eval__', 'w')
.annotate 'line', 8219
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8220
$P5.'initialize'($P4)
.annotate 'line', 8221
$P3.'emit'($P5)
.annotate 'line', 8222
$P5.'close'()
.annotate 'line', 8223
$P4.'close'()
.annotate 'line', 8224
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8225
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8226
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8227
.return($P7)
# }
.annotate 'line', 8228

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 8233
# Body
# {
.annotate 'line', 8235
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 8236
$P1.'parse'(__ARG_1)
.annotate 'line', 8238
$P1.'optimize'()
.annotate 'line', 8240
# var handle: $P2
null $P2
.annotate 'line', 8241
ne __ARG_2, '-', __label_0
.annotate 'line', 8242
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 8244
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 8245
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8246
$P3.'initialize'($P2)
.annotate 'line', 8247
$P1.'emit'($P3)
.annotate 'line', 8248
$P3.'close'()
.annotate 'line', 8249
$P2.'close'()
# }
.annotate 'line', 8250

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8256
# Body
# {
.annotate 'line', 8258
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8259
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8260

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8262
# Body
# {
.annotate 'line', 8264
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8265
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8266
$P1.'notOptStop'(1)
.annotate 'line', 8267
$P1.'push_string'('o=s')
.annotate 'line', 8268
$P1.'push_string'('e=s')
.annotate 'line', 8269
$P1.'push_string'('c')
.annotate 'line', 8270
$P1.'push_string'('noan')
.annotate 'line', 8272
__ARG_1.'shift'()
.annotate 'line', 8273
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8274
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8275
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8276
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8277
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8279
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 8280
# string filename: $S1
null $S1
.annotate 'line', 8281
# string expr: $S2
null $S2
.annotate 'line', 8282
# var file: $P7
null $P7
.annotate 'line', 8283
unless_null $P4, __label_0
# {
.annotate 'line', 8284
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 8285
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 8287
$S1 = __ARG_1[0]
.annotate 'line', 8288
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 8289
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8294
new $P7, [ 'StringHandle' ]
.annotate 'line', 8295
$P7.'open'('__eval__', 'w')
.annotate 'line', 8296
$P7.'puts'($S2)
.annotate 'line', 8297
$P7.'close'()
.annotate 'line', 8298
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 8301
# var t: $P8
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P7, $S1)
.annotate 'line', 8303
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8304
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 8306
'winxed_parser'($P8, $S3)
.annotate 'line', 8308
$P7.'close'()
# }
.annotate 'line', 8309

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8311
# Body
# {
.annotate 'line', 8313
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8319
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8313
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8322
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8323
# predefined say
print 'Error: '
say $S1
.annotate 'line', 8324
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8325
# int i: $I1
set $I1, 1
.annotate 'line', 8326
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8327
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8328
# string subname: $S2
null $S2
.annotate 'line', 8329
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8331
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8332
isne $I3, $S3, ''
unless $I3 goto __label_7
isne $I3, $S3, 'parrot'
__label_7:
unless $I3 goto __label_6
concat $S0, $S3, '.'
concat $S0, $S0, $S2
set $S2, $S0
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 8334
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8335
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8336
eq $S4, '', __label_8
# {
.annotate 'line', 8337
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 8338
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
.annotate 'line', 8342

.end # main

# End generated code
