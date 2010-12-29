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


.sub 'getpredefs'

.annotate 'line', 1097
# Body
# {
.annotate 'line', 1099
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1100
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1101
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1102
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1103
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1105
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1106
new $P9, [ 'PredefFunction' ]
.annotate 'line', 1107
new $P11, [ 'Predef_typecast' ]
$P11.'Predef_typecast'('I')
set $P10, $P11
.annotate 'line', 1106
$P8 = $P9.'set'('int', $P10, 'I', '!')
.annotate 'line', 1105
$P1.'push'($P8)
.annotate 'line', 1110
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1111
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('N')
set $P14, $P15
.annotate 'line', 1110
$P12 = $P13.'set'('float', $P14, 'N', '!')
.annotate 'line', 1105
$P1.'push'($P12)
.annotate 'line', 1114
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1115
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('S')
set $P18, $P19
.annotate 'line', 1114
$P16 = $P17.'set'('string', $P18, 'S', '!')
.annotate 'line', 1105
$P1.'push'($P16)
.annotate 'line', 1118
new $P21, [ 'PredefFunction' ]
$P20 = $P21.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1105
$P1.'push'($P20)
.annotate 'line', 1122
new $P23, [ 'PredefFunction' ]
$P22 = $P23.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1105
$P1.'push'($P22)
.annotate 'line', 1126
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('time', 'time {res}', 'I')
.annotate 'line', 1105
$P1.'push'($P24)
.annotate 'line', 1130
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1105
$P1.'push'($P26)
.annotate 'line', 1134
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1105
$P1.'push'($P28)
.annotate 'line', 1138
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P30)
.annotate 'line', 1143
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P32)
.annotate 'line', 1148
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P34)
.annotate 'line', 1153
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1105
$P1.'push'($P36)
.annotate 'line', 1159
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1105
$P1.'push'($P38)
.annotate 'line', 1166
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1105
$P1.'push'($P40)
.annotate 'line', 1170
new $P43, [ 'PredefFunction' ]
.annotate 'line', 1170
$P42 = $P43.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1105
$P1.'push'($P42)
.annotate 'line', 1175
new $P45, [ 'PredefFunction' ]
.annotate 'line', 1175
$P44 = $P45.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1105
$P1.'push'($P44)
.annotate 'line', 1180
new $P47, [ 'PredefFunction' ]
.annotate 'line', 1180
$P46 = $P47.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1105
$P1.'push'($P46)
.annotate 'line', 1187
new $P49, [ 'PredefFunction' ]
.annotate 'line', 1187
$P48 = $P49.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1105
$P1.'push'($P48)
.annotate 'line', 1192
new $P51, [ 'PredefFunction' ]
.annotate 'line', 1192
$P50 = $P51.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1105
$P1.'push'($P50)
.annotate 'line', 1197
new $P53, [ 'PredefFunction' ]
$P52 = $P53.'set'('substr', 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1105
$P1.'push'($P52)
.annotate 'line', 1201
new $P55, [ 'PredefFunction' ]
$P54 = $P55.'set'('substr', 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1105
$P1.'push'($P54)
.annotate 'line', 1205
new $P57, [ 'PredefFunction' ]
$P56 = $P57.'set'('indexof', 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P56)
.annotate 'line', 1209
new $P59, [ 'PredefFunction' ]
$P58 = $P59.'set'('indexof', 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1105
$P1.'push'($P58)
.annotate 'line', 1213
new $P61, [ 'PredefFunction' ]
$P60 = $P61.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1105
$P1.'push'($P60)
.annotate 'line', 1217
new $P63, [ 'PredefFunction' ]
$P62 = $P63.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P62)
.annotate 'line', 1221
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P64)
.annotate 'line', 1225
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P66)
.annotate 'line', 1229
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P68)
.annotate 'line', 1233
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P70)
.annotate 'line', 1238
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P72)
.annotate 'line', 1243
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P74)
.annotate 'line', 1247
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P76)
.annotate 'line', 1251
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P78)
.annotate 'line', 1255
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P80)
.annotate 'line', 1259
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P82)
.annotate 'line', 1263
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P84)
.annotate 'line', 1267
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P86)
.annotate 'line', 1271
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P88)
.annotate 'line', 1275
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P90)
.annotate 'line', 1279
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P92)
.annotate 'line', 1283
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1105
$P1.'push'($P94)
.annotate 'line', 1287
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1105
$P1.'push'($P96)
.annotate 'line', 1291
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P98)
.annotate 'line', 1295
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P100)
.annotate 'line', 1299
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P102)
.annotate 'line', 1303
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1105
$P1.'push'($P104)
.annotate 'line', 1307
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1105
$P1.'push'($P106)
.annotate 'line', 1311
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P108)
.annotate 'line', 1315
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1105
$P1.'push'($P110)
.annotate 'line', 1319
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P112)
.annotate 'line', 1324
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P114)
.annotate 'line', 1329
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1105
$P1.'push'($P116)
.annotate 'line', 1333
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1105
$P1.'push'($P118)
.annotate 'line', 1337
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1105
$P1.'push'($P120)
.annotate 'line', 1341
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1105
$P1.'push'($P122)
.annotate 'line', 1345
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1105
$P1.'push'($P124)
.annotate 'line', 1349
new $P127, [ 'PredefFunction' ]
.annotate 'line', 1350
new $P128, [ 'Predef_print' ]
.annotate 'line', 1349
$P126 = $P127.'set'('print', $P128, 'P', '*')
.annotate 'line', 1105
$P1.'push'($P126)
.annotate 'line', 1353
new $P130, [ 'PredefFunction' ]
.annotate 'line', 1354
new $P131, [ 'Predef_say' ]
.annotate 'line', 1353
$P129 = $P130.'set'('say', $P131, 'P', '*')
.annotate 'line', 1105
$P1.'push'($P129)
.annotate 'line', 1357
new $P133, [ 'PredefFunction' ]
.annotate 'line', 1358
new $P134, [ 'Predef_cry' ]
.annotate 'line', 1357
$P132 = $P133.'set'('cry', $P134, 'P', '*')
.annotate 'line', 1105
$P1.'push'($P132)
__label_1: # Infinite loop
.annotate 'line', 1363
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1364

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1366
# Body
# {
.annotate 'line', 1368
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1369
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1370
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1371
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1372
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1373
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1374
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1376
.return($P2)
# }
.annotate 'line', 1377

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1383
# Body
# {
.annotate 'line', 1385
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1386
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1387
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1386
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1388

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1399
# Body
# {
.annotate 'line', 1401
setattribute self, 'start', __ARG_1
.annotate 'line', 1402
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1403

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1404
# Body
# {
.annotate 'line', 1406
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1407

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1408
# Body
# {
.annotate 'line', 1410
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1411

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1412
# Body
# {
.annotate 'line', 1414
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1415

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1416
# Body
# {
.annotate 'line', 1418
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1419

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1420
# Body
# {
.annotate 'line', 1422
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1423

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1396
addattribute $P0, 'start'
.annotate 'line', 1397
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1436
# Body
# {
.annotate 'line', 1438
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1439

.end # init


.sub 'numargs' :method

.annotate 'line', 1441
# Body
# {
.annotate 'line', 1443
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1444

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1445
# Body
# {
.annotate 'line', 1447
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1448
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1449

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1451
# Body
# {
.annotate 'line', 1453
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1454
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1455
# {
.annotate 'line', 1456
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1457
$P1.'push'($P3)
# }
.annotate 'line', 1458
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1459
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1460

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1462
# Body
# {
.annotate 'line', 1464
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1465
if_null $P1, __label_0
.annotate 'line', 1466
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1467

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1468
# Body
# {
.annotate 'line', 1470
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1471
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1472
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1473
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1474
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1475
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1476
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1473
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1478
.return($P2)
# }
.annotate 'line', 1479

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1480
# Body
# {
.annotate 'line', 1482
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1483
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1484

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1434
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1496
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1497
# Body
# {
.annotate 'line', 1499
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1500
.return($I1)
# }
.annotate 'line', 1501

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1502
# Body
# {
.annotate 'line', 1504
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1505
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1506
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1508
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1509

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1510
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1512
setattribute self, 'name', $P1
.annotate 'line', 1513
if_null __ARG_2, __label_0
.annotate 'line', 1514
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1515

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1516
# Body
# {
.annotate 'line', 1518
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1519

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1493
addattribute $P0, 'name'
.annotate 'line', 1494
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1526
# Body
# {
.annotate 'line', 1528
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1529
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1530
# {
.annotate 'line', 1531
$P2 = __ARG_1.'get'()
.annotate 'line', 1532
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1533
$P2 = __ARG_1.'get'()
.annotate 'line', 1534
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1535
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1536
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1537
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1539
new $P6, [ 'Modifier' ]
$P6.'Modifier'($S1, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
.annotate 'line', 1540
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1541
'RequireOp'(']', $P2)
.annotate 'line', 1542
setattribute self, 'list', $P1
# }
.annotate 'line', 1543

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1544
# Body
# {
.annotate 'line', 1546
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1547
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1548

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1549
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1553
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1554
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1555
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1556
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1557
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1554
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1560
.return($P3)
# }
.annotate 'line', 1561

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1524
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1568
# Body
# {
.annotate 'line', 1570
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1571
.return($S2)
# }
.annotate 'line', 1572

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1574
# Body
# {
.annotate 'line', 1576
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1577
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1579
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1580
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1582

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1584
# Body
# {
.annotate 'line', 1586
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1587
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1588
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1589
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1590
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1592
__ARG_2.'unget'($P1)
.annotate 'line', 1593
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1595

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1597
# Body
# {
.annotate 'line', 1599
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1600
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1601
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1602
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1603
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1604
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1605
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1607
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1608
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1609
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
.annotate 'line', 1611
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1613
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1616
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1619
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1621
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1623
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1625
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1627
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_14: # case
.annotate 'line', 1629
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_15: # case
.annotate 'line', 1631
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_16: # case
.annotate 'line', 1633
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_17: # case
.annotate 'line', 1635
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_18: # case
.annotate 'line', 1637
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_19: # case
.annotate 'line', 1639
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_20: # case
.annotate 'line', 1641
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_21: # case
.annotate 'line', 1643
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_22: # case
.annotate 'line', 1645
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1647
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_24: # case
.annotate 'line', 1649
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1651
$P30 = $P1.'isidentifier'()
if_null $P30, __label_25
unless $P30 goto __label_25
# {
.annotate 'line', 1652
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1653
$P9 = $P3.'isop'(':')
if_null $P9, __label_26
unless $P9 goto __label_26
.annotate 'line', 1654
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_26: # endif
.annotate 'line', 1655
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1657
__ARG_1.'unget'($P1)
.annotate 'line', 1658
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1660
unless_null $P2, __label_27
.annotate 'line', 1661
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1662
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1663

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1671
# Body
# {
.annotate 'line', 1673
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1674

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1675
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1676
# Body
# {
.annotate 'line', 1678
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1679

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1680
# Body
# {
.annotate 'line', 1682
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1683

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1684
# Body
# {
.annotate 'line', 1686
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1687

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1688
# Body
# {
.annotate 'line', 1690
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1691

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1692
# Body
# {
.annotate 'line', 1694
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1695

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1696
# Body
# {
.annotate 'line', 1698
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1699

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1700
# Body
# {
.annotate 'line', 1702
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1703

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1704
# Body
# {
.annotate 'line', 1706
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1707

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1708
# Body
# {
.annotate 'line', 1710
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1711

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1712
# Body
# {
.annotate 'line', 1714
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1715

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1717
# Body
# {
.annotate 'line', 1722
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1723

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1724
# Body
# {
.annotate 'line', 1726
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1727

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1728
# Body
# {
.annotate 'line', 1730
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1731

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1732
# Body
# {
.annotate 'line', 1734
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1736
.return(self)
# }
.annotate 'line', 1737

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1669
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1742
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1743
# Body
# {
.annotate 'line', 1745
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1746

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1747
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1748
# Body
# {
# }
.annotate 'line', 1751

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1740
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1758
# Body
# {
.annotate 'line', 1760
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1761
$P1.'push'(__ARG_1)
.annotate 'line', 1762
$P1.'push'(__ARG_2)
.annotate 'line', 1763
setattribute self, 'statements', $P1
# }
.annotate 'line', 1764

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1765
# Body
# {
.annotate 'line', 1767
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1768
.return(self)
# }
.annotate 'line', 1769

.end # push


.sub 'optimize' :method

.annotate 'line', 1770
# Body
# {
.annotate 'line', 1772
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1773
.return(self)
# }
.annotate 'line', 1774

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1775
# Body
# {
.annotate 'line', 1777
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1778
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1779

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1756
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1782
# Body
# {
.annotate 'line', 1784
unless_null __ARG_1, __label_0
.annotate 'line', 1785
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1786
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1787
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1789
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1790

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1800
# Body
# {
.annotate 'line', 1802
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1803
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1804
# int dotted: $I1
null $I1
.annotate 'line', 1805
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1807
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1809
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
.annotate 'line', 1810
setattribute self, 'opname', $P3
.annotate 'line', 1811
$P1 = __ARG_2.'get'()
.annotate 'line', 1812
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1813
__ARG_2.'unget'($P1)
.annotate 'line', 1814
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1816
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1817

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1818
# Body
# {
.annotate 'line', 1820
self.'optimizeargs'()
.annotate 'line', 1821
.return(self)
# }
.annotate 'line', 1822

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1823
# Body
# {
.annotate 'line', 1825
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1826
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1827
__ARG_1.'comment'($S2)
.annotate 'line', 1828
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1829
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1831
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1832
self.'emitargs'(__ARG_1)
.annotate 'line', 1833
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1835

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1796
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1798
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1845
# Body
# {
.annotate 'line', 1847
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1848
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1849
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1850
# {
.annotate 'line', 1851
$P2 = __ARG_2.'get'()
.annotate 'line', 1852
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1853
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1854
'RequireOp'(';', $P2)
.annotate 'line', 1855
setattribute self, 'path', $P1
.annotate 'line', 1856
.return(self)
# }
.annotate 'line', 1857

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1858
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1859
# Body
# {
.annotate 'line', 1861
self.'annotate'(__ARG_1)
.annotate 'line', 1862
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1863

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1842
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1844
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1873
# Body
# {
.annotate 'line', 1875
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1876
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1877
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1878
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1879

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1880
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1881
# Body
# {
.annotate 'line', 1883
self.'annotate'(__ARG_1)
.annotate 'line', 1884
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1885
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1886

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1870
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1872
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1896
# Body
# {
.annotate 'line', 1898
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1899
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1900
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1901
# {
.annotate 'line', 1902
$P2 = __ARG_2.'get'()
.annotate 'line', 1903
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1904
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1905
'RequireOp'(';', $P2)
.annotate 'line', 1906
setattribute self, 'path', $P1
# }
.annotate 'line', 1907

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1908
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1909
# Body
# {
.annotate 'line', 1911
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1912
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1913
self.'annotate'(__ARG_1)
.annotate 'line', 1915
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 1916
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 1918
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 1919
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1921
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1924
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1926

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1893
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1895
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1936
# Body
# {
.annotate 'line', 1938
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1939
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 1940
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1941

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 1942
# Body
# {
.annotate 'line', 1944
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 1945
.return(self)
# }
.annotate 'line', 1946

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1947
# Body
# {
.annotate 'line', 1949
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 1950

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1933
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1935
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 1967
# Body
# {
.annotate 'line', 1969
setattribute self, 'type', __ARG_1
.annotate 'line', 1970
setattribute self, 'reg', __ARG_2
.annotate 'line', 1971
setattribute self, 'scope', __ARG_3
box $P2, __ARG_4
.annotate 'line', 1972
setattribute self, 'flags', $P2
.annotate 'line', 1973
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 1974

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 1975
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1977
setattribute self, 'id', $P1
# }
.annotate 'line', 1978

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 1979
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1981
setattribute self, 'lexname', $P1
# }
.annotate 'line', 1982

.end # setlex


.sub 'gettype' :method

.annotate 'line', 1983
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 1984
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 1985
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 1986
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 1987
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 1988
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 1989
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 1990
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
.annotate 'line', 1959
addattribute $P0, 'type'
.annotate 'line', 1960
addattribute $P0, 'reg'
.annotate 'line', 1961
addattribute $P0, 'scope'
.annotate 'line', 1962
addattribute $P0, 'flags'
.annotate 'line', 1963
addattribute $P0, 'value'
.annotate 'line', 1964
addattribute $P0, 'id'
.annotate 'line', 1965
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 1996
# Body
# {
.annotate 'line', 1998
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 1999

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2000
# Body
# {
.annotate 'line', 2002
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2003

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 1995
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2010
# Body
# {
.annotate 'line', 2012
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2013

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2014
# Body
# {
.annotate 'line', 2016
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2017
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2018
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2019
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
.annotate 'line', 2020
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2021
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2022
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2023
$P1[$S1] = $P3
.annotate 'line', 2024
.return($P3)
# }
.annotate 'line', 2025

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2026
# Body
# {
.annotate 'line', 2028
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2029
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2030
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2031
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2032
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2033
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2034

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2035
# Body
# {
.annotate 'line', 2037
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2038
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2039
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2040
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2041
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2042
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2043
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2044
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2045
$P1[$S1] = $P3
# }
.annotate 'line', 2046

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2047
# Body
# {
.annotate 'line', 2049
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2050
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2051
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2052
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2053
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2054
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2055
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2056
.return($P2)
# }
.annotate 'line', 2057

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2058
# Body
# {
.annotate 'line', 2060
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2061
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2062
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2063
.return($P2)
# }
.annotate 'line', 2064

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2065
# Body
# {
.annotate 'line', 2067
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2068
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2069
.return($S1)
# }
.annotate 'line', 2070

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2071
# Body
# {
.annotate 'line', 2073
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2075
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2076
.return('__WLEX_self')
# }
.annotate 'line', 2077

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2009
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2086
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2096
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2097
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2098
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2099
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2100
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2101
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2102
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2103
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2104
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2105
# Body
# {
.annotate 'line', 2107
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2108

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2109
# Body
# {
.annotate 'line', 2111
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2112

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2113
# Body
# {
.annotate 'line', 2116
.return(self)
# }
.annotate 'line', 2117

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2118
# Body
# {
.annotate 'line', 2120
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2121
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2122
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2123
.return($S2)
# }
.annotate 'line', 2124

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2125
# Body
# {
.annotate 'line', 2127
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2128

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2094
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2133
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2131
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2141
# Body
# {
.annotate 'line', 2143
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2144
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2145
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2146
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2147
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2148

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2149
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2150
# Body
# {
.annotate 'line', 2152
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2153
.return(self)
# }
.annotate 'line', 2154

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2155
# Body
# {
.annotate 'line', 2157
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2158
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2159
self.'annotate'(__ARG_1)
.annotate 'line', 2160
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
set $S2, __ARG_2
.annotate 'line', 2161
eq $S2, '', __label_1
.annotate 'line', 2162
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2163

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2138
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2140
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2176
# Body
# {
.annotate 'line', 2178
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2179
.return(self)
# }
.annotate 'line', 2180

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2181
# Body
# {
.annotate 'line', 2183
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2184

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2185
# Body
# {
.annotate 'line', 2187
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2188
.return(self)
# }
.annotate 'line', 2189

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2190
# Body
# {
.annotate 'line', 2192
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2193
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2194
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2196
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2197
ne $I1, 0, __label_4
.annotate 'line', 2198
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2200
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2203
.return(0)
# }
.annotate 'line', 2204

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2205
# Body
# {
.annotate 'line', 2207
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2209
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2210
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2211
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2213
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2214
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2215
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
.annotate 'line', 2218
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2221
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2224
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2227

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2228
# Body
# {
.annotate 'line', 2230
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2232
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2233
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2234
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2236
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2237
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2238
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
.annotate 'line', 2241
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2244
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2247
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2250

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2175
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2257
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2258
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2255
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2266
# Body
# {
.annotate 'line', 2268
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2269
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2270

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2271
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2272
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2273
# Body
# {
.annotate 'line', 2275
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2276
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2277
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2278
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2279
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2280
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2282
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
unless $I2 goto __label_4
.annotate 'line', 2285
# {
unless $I1 goto __label_5
.annotate 'line', 2286
# {
null $I1
.annotate 'line', 2288
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2290
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2291
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2293
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2296
# string result: $S4
set $S4, ''
.annotate 'line', 2297
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2298
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2299
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2300
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2301
le $I6, 127, __label_12
# {
.annotate 'line', 2302
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
.annotate 'line', 2303
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2306
# }
__label_9: # for iteration
.annotate 'line', 2298
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2308
# }
__label_4: # endif
.annotate 'line', 2310
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
.annotate 'line', 2314
.return($S1)
# }
.annotate 'line', 2315

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2316
# Body
# {
.annotate 'line', 2318
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2319
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2320
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2321
# var s: $P2
box $P2, $S1
.annotate 'line', 2322
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2324
.return($S1)
# }
.annotate 'line', 2325

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2326
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2328
eq $S1, '', __label_0
.annotate 'line', 2329
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2330

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2331
# Body
# {
.annotate 'line', 2333
.tailcall self.'getPirString'()
# }
.annotate 'line', 2334

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2263
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2265
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2343
# Body
# {
.annotate 'line', 2346
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2347
setattribute self, 'pos', __ARG_2
.annotate 'line', 2348
# int n: $I1
null $I1
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2350
# {
.annotate 'line', 2352
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2353
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2355
setattribute self, 'numval', $P2
# }
.annotate 'line', 2356

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2357
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2358
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2359
# Body
# {
.annotate 'line', 2361
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2362
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2363
.return($I1)
# }
.annotate 'line', 2364

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2365
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2367
eq $S1, '', __label_0
# {
.annotate 'line', 2368
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2369
ne $I1, 0, __label_1
.annotate 'line', 2370
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2372
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2374

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2378

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2339
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2341
addattribute $P0, 'pos'
.annotate 'line', 2342
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2386
# Body
# {
.annotate 'line', 2388
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2389
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2390

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2391
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2392
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2393
# Body
# {
.annotate 'line', 2395
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2396
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2398
.return($P1)
# }
.annotate 'line', 2399

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2400
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2402
eq $S1, '', __label_0
# {
.annotate 'line', 2403
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2404
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2406

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2407
# Body
# {
.annotate 'line', 2411
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2412
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2414
.return($S1)
# }
.annotate 'line', 2415

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2383
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2385
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2423
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2424
# Body
# {
.annotate 'line', 2426
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2427
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2428

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2429
# Body
# {
.annotate 'line', 2431
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2432

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2433
# Body
# {
.annotate 'line', 2435
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2436
if_null $P1, __label_0
.annotate 'line', 2437
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2439
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
.annotate 'line', 2442
.return('P')
__label_3: # default
.annotate 'line', 2444
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2447

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2448
# Body
# {
.annotate 'line', 2450
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2451
.return($S1)
# }
.annotate 'line', 2452

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2453
# Body
# {
.annotate 'line', 2455
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2456
unless_null $P1, __label_0
.annotate 'line', 2457
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2458
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2459
# string s: $S1
null $S1
.annotate 'line', 2460
unless_null $P2, __label_1
# {
.annotate 'line', 2461
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2462
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
.annotate 'line', 2468
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2472
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2473
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2475
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2477
.return($S1)
# }
.annotate 'line', 2478

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2479
# Body
# {
.annotate 'line', 2481
# var value: $P1
$P1 = self.'checkIdentifier'()
set $S2, $P1
.annotate 'line', 2482
ne $S2, '', __label_0
# {
.annotate 'line', 2483
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
.annotate 'line', 2484
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2486
.return($P1)
# }
.annotate 'line', 2487

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2488
# Body
# {
.annotate 'line', 2490
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2491
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2492
if_null $P2, __label_0
# {
.annotate 'line', 2493
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2494
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2496
.return(self)
# }
.annotate 'line', 2497

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2498
# Body
# {
.annotate 'line', 2500
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2501
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2502
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2503
# string lexname: $S2
$P3 = $P1.'getlex'()
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2504
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2505
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2507
.return($S1)
# }
.annotate 'line', 2508

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2509
# Body
# {
set $S2, __ARG_2
.annotate 'line', 2511
eq $S2, '', __label_0
# {
.annotate 'line', 2512
self.'annotate'(__ARG_1)
.annotate 'line', 2513
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2514
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2516

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2517
# Body
# {
.annotate 'line', 2519
self.'annotate'(__ARG_1)
.annotate 'line', 2520
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2521
.return($S1)
# }
.annotate 'line', 2522

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2523
# Body
# {
.annotate 'line', 2525
self.'annotate'(__ARG_1)
.annotate 'line', 2526
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2527
die "NO"
__label_0: # endif
.annotate 'line', 2528
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2529
# string lreg: $S2
$P3 = self.'getIdentifier'()
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 2530
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
# {
set $S6, $S1
set $S7, 'S'
.annotate 'line', 2531
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2534
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2537
getattribute $P4, self, 'start'
'SyntaxError'("Can't assign null to that type", $P4)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2540
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2541
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2543
# string typeright: $S3
$P4 = __ARG_2.'checkresult'()
null $S3
if_null $P4, __label_11
set $S3, $P4
__label_11:
.annotate 'line', 2544
ne $S1, $S3, __label_12
# {
.annotate 'line', 2545
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_13
__label_12: # else
# {
.annotate 'line', 2548
# string rreg: $S4
$P5 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_14
set $S4, $P5
__label_14:
.annotate 'line', 2549
self.'annotate'(__ARG_1)
.annotate 'line', 2550
iseq $I1, $S1, 'P'
unless $I1 goto __label_17
isne $I1, $S3, 'P'
__label_17:
unless $I1 goto __label_15
.annotate 'line', 2551
__ARG_1.'emitbox'($S2, $S4)
goto __label_16
__label_15: # else
.annotate 'line', 2553
__ARG_1.'emitset'($S2, $S4)
__label_16: # endif
# }
__label_13: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2556
# var desc: $P1
getattribute $P5, self, 'owner'
getattribute $P6, self, 'name'
$P1 = $P5.'getvar'($P6)
.annotate 'line', 2557
$P6 = $P1.'isvolatile'()
if_null $P6, __label_18
unless $P6 goto __label_18
# {
.annotate 'line', 2558
# string lexname: $S5
$P7 = $P1.'getlex'()
null $S5
if_null $P7, __label_19
set $S5, $P7
__label_19:
.annotate 'line', 2559
isnull $I2, $S5
not $I2
unless $I2 goto __label_21
isne $I2, $S5, ''
__label_21:
unless $I2 goto __label_20
.annotate 'line', 2560
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_20: # endif
# }
__label_18: # endif
.annotate 'line', 2562
.return($S2)
# }
.annotate 'line', 2563

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2420
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2422
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2570
# Body
# {
.annotate 'line', 2572
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2573

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2568
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2581
# Body
# {
.annotate 'line', 2583
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2584
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2585

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2586
# Body
# {
.annotate 'line', 2588
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2589

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2590
# Body
# {
.annotate 'line', 2592
self.'optimizearg'()
.annotate 'line', 2593
.return(self)
# }
.annotate 'line', 2594

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2578
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2580
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2603
# Body
# {
.annotate 'line', 2605
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2606
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2607
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2608

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2609
# Body
# {
.annotate 'line', 2611
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2612
.return(self)
# }
.annotate 'line', 2613

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2614
# Body
# {
.annotate 'line', 2616
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2617

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2618
# Body
# {
.annotate 'line', 2620
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2621
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2622

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2623
# Body
# {
.annotate 'line', 2625
self.'optimizearg'()
.annotate 'line', 2626
.return(self)
# }
.annotate 'line', 2627

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2599
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2601
addattribute $P0, 'lexpr'
.annotate 'line', 2602
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2634
# Body
# {
.annotate 'line', 2636
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2637

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2638
# Body
# {
.annotate 'line', 2640
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2641
.return(self)
# }
.annotate 'line', 2642

.end # set


.sub 'optimize' :method

.annotate 'line', 2643
# Body
# {
.annotate 'line', 2645
self.'optimizearg'()
.annotate 'line', 2646
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2647
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2648
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2649
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2652
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2653
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2654
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2655
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2658
.return(self)
# }
.annotate 'line', 2659

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

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
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2665

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2632
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2672
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2673
# Body
# {
.annotate 'line', 2675
.return('I')
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
.return(self)
# }
.annotate 'line', 2681

.end # set


.sub 'optimize' :method

.annotate 'line', 2682
# Body
# {
.annotate 'line', 2684
self.'optimizearg'()
.annotate 'line', 2685
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2686
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2687
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2688
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2689
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2691
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2692
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2693
.return(self)
# }
.annotate 'line', 2694

.end # optimize


.sub 'negated' :method

.annotate 'line', 2695
# Body
# {
.annotate 'line', 2697
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2698

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2699
# Body
# {
.annotate 'line', 2701
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2702
self.'annotate'(__ARG_1)
.annotate 'line', 2703
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2704
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2706
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2709
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2712
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2714

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2670
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2721
# Body
# {
.annotate 'line', 2723
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2724

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2725
# Body
# {
.annotate 'line', 2727
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2728
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2729
.return(self)
# }
.annotate 'line', 2730

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2731
# Body
# {
.annotate 'line', 2733
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2734
eq $S2, '', __label_1
.annotate 'line', 2735
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2736

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2737
# Body
# {
.annotate 'line', 2739
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2740
self.'annotate'(__ARG_1)
.annotate 'line', 2741
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2742
.return($S1)
# }
.annotate 'line', 2743

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2719
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2750
# Body
# {
.annotate 'line', 2752
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2753
.return(self)
# }
.annotate 'line', 2754

.end # set


.sub 'checkresult' :method

.annotate 'line', 2755
# Body
# {
.annotate 'line', 2757
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2758

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2759
# Body
# {
.annotate 'line', 2761
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2762
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2763
eq $S2, '', __label_1
.annotate 'line', 2764
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2765
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2766
.return($S1)
# }
.annotate 'line', 2767

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2748
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2774
# Body
# {
.annotate 'line', 2776
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2777

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2778
# Body
# {
.annotate 'line', 2780
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
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
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2794
.return($S1)
# }
.annotate 'line', 2795

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2772
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

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
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2818
.return($S1)
# }
.annotate 'line', 2819

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2800
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2828
# Body
# {
.annotate 'line', 2830
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2831
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2832
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2833
.return(self)
# }
.annotate 'line', 2834

.end # set


.sub 'checkresult' :method

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2838
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2840
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2841

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2842
# Body
# {
.annotate 'line', 2844
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2845
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2846
.return(self)
# }
.annotate 'line', 2847

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2848
# Body
# {
.annotate 'line', 2850
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2851

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2824
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2826
addattribute $P0, 'lexpr'
.annotate 'line', 2827
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2858
# Body
# {
.annotate 'line', 2860
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2861
eq $S2, '', __label_1
# {
.annotate 'line', 2862
self.'annotate'(__ARG_1)
.annotate 'line', 2863
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2865

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2866
# Body
# {
.annotate 'line', 2868
self.'annotate'(__ARG_1)
.annotate 'line', 2869
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2870
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2871

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2856
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2878
# Body
# {
.annotate 'line', 2880
self.'annotate'(__ARG_1)
.annotate 'line', 2881
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2882
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2883
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2884

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2885
# Body
# {
.annotate 'line', 2887
self.'annotate'(__ARG_1)
.annotate 'line', 2888
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2889
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2890
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2891
.return($S1)
# }
.annotate 'line', 2892

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2876
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2899
# Body
# {
.annotate 'line', 2901
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2902
eq $S2, '', __label_1
.annotate 'line', 2903
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2904

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2905
# Body
# {
.annotate 'line', 2907
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2908
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2909
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2910
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2911
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2912
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2914
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2915
self.'annotate'(__ARG_1)
.annotate 'line', 2916
ne $S1, 'S', __label_6
# {
.annotate 'line', 2917
$P4 = $P2.'checkresult'()
set $S5, $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2918
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2919
__ARG_1.'emitset'($S4, $S3)
set $S3, $S4
.annotate 'line', 2920
# }
__label_8: # endif
.annotate 'line', 2922
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2925
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2927
.return($S2)
# }
.annotate 'line', 2928

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2897
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2935
# Body
# {
.annotate 'line', 2937
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2938
eq $S2, '', __label_1
.annotate 'line', 2939
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2940

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2941
# Body
# {
.annotate 'line', 2943
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2944
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2945
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2946
self.'annotate'(__ARG_1)
.annotate 'line', 2947
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 2948
.return($S2)
# }
.annotate 'line', 2949

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2933
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2956
# Body
# {
.annotate 'line', 2958
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2959
eq $S2, '', __label_1
.annotate 'line', 2960
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2961

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2962
# Body
# {
.annotate 'line', 2964
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2965
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2966
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2967
self.'annotate'(__ARG_1)
.annotate 'line', 2968
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 2969
.return($S2)
# }
.annotate 'line', 2970

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 2954
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2977
# Body
# {
.annotate 'line', 2979
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2980
eq $S2, '', __label_1
.annotate 'line', 2981
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2982

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2983
# Body
# {
.annotate 'line', 2985
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2986
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2987
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 2988
self.'annotate'(__ARG_1)
.annotate 'line', 2989
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 2990
.return($S2)
# }
.annotate 'line', 2991

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 2975
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2998
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2999
# Body
# {
.annotate 'line', 3001
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3002
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3003
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3004
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3005
self.'annotate'(__ARG_1)
.annotate 'line', 3006
# string aux: $S5
null $S5
.annotate 'line', 3007
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3009
ne $S1, 'I', __label_7
# {
.annotate 'line', 3010
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3011
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3012
# }
__label_7: # endif
.annotate 'line', 3014
ne $S2, 'I', __label_8
# {
.annotate 'line', 3015
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3016
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3017
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3020
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3021
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3022
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3023
# }
goto __label_10
__label_9: # else
.annotate 'line', 3025
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3026
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3027
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3028
# }
goto __label_13
__label_12: # else
.annotate 'line', 3030
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 3031
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3032
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3033
# }
goto __label_16
__label_15: # else
.annotate 'line', 3035
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 3036
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3037
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3038
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 3041
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3043
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3046
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3049
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3050
# }
.annotate 'line', 3052

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3053
# Body
# {
.annotate 'line', 3055
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3056

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3057
# Body
# {
.annotate 'line', 3059
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3060

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3061
# Body
# {
.annotate 'line', 3063
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3064

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 2996
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3077
# Body
# {
.annotate 'line', 3079
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3080
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3081
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3082

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3083
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3084
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3085
# Body
# {
.annotate 'line', 3087
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3088
setattribute self, 'checknull', $P1
.annotate 'line', 3089
.return(self)
# }
.annotate 'line', 3090

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3091
# Body
# {
.annotate 'line', 3093
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3094
self.'annotate'(__ARG_1)
.annotate 'line', 3095
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3096
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3097
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3098

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3099
# Body
# {
.annotate 'line', 3101
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3102
self.'annotate'(__ARG_1)
.annotate 'line', 3103
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
.annotate 'line', 3104

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3072
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3074
addattribute $P0, 'expr'
.annotate 'line', 3075
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3111
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3112
# Body
# {
.annotate 'line', 3114
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3115

.end # negated


.sub 'optimize' :method

.annotate 'line', 3116
# Body
# {
.annotate 'line', 3118
self.'optimizearg'()
.annotate 'line', 3119
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3120
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3121
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3122
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3123
# {
unless $I2 goto __label_1
.annotate 'line', 3125
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3127
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3130
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3131
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3132
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3133
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3134
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3135
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3136
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3137
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3140
.return(self)
# }
.annotate 'line', 3141

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3142
# Body
# {
.annotate 'line', 3144
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3145

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3146
# Body
# {
.annotate 'line', 3148
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3149

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3150
# Body
# {
.annotate 'line', 3152
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3153

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3154
# Body
# {
.annotate 'line', 3156
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3157

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3109
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3164
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3165
# Body
# {
.annotate 'line', 3167
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3168

.end # negated


.sub 'optimize' :method

.annotate 'line', 3169
# Body
# {
.annotate 'line', 3171
self.'optimizearg'()
.annotate 'line', 3172
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3173
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3174
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3175
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3176
# {
unless $I2 goto __label_1
.annotate 'line', 3178
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3180
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3183
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3184
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3185
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3186
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3187
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3188
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3189
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3190
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3193
.return(self)
# }
.annotate 'line', 3194

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3195
# Body
# {
.annotate 'line', 3197
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3198

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3199
# Body
# {
.annotate 'line', 3201
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3202

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3203
# Body
# {
.annotate 'line', 3205
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3206

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3207
# Body
# {
.annotate 'line', 3209
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3210

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3162
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

.annotate 'line', 3218
# Body
# {
.annotate 'line', 3220
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3221
setattribute self, 'positive', $P1
# }
.annotate 'line', 3222

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3223
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3224
# Body
# {
.annotate 'line', 3226
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3227
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
.annotate 'line', 3228

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3229
# Body
# {
.annotate 'line', 3231
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3232
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3233
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3234

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3235
# Body
# {
.annotate 'line', 3237
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3238

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3239
# Body
# {
.annotate 'line', 3241
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3242
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3243
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3244

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3245
# Body
# {
.annotate 'line', 3247
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3248
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3249
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3250

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3215
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3217
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3257
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3258
# Body
# {
.annotate 'line', 3260
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3261

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3262
# Body
# {
.annotate 'line', 3264
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3265

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3269

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3273

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3255
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3280
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3281
# Body
# {
.annotate 'line', 3283
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3284

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3285
# Body
# {
.annotate 'line', 3287
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3288

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3289
# Body
# {
.annotate 'line', 3291
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3292

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3293
# Body
# {
.annotate 'line', 3295
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3296

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3278
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3303
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3304
# Body
# {
.annotate 'line', 3306
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3307

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3308
# Body
# {
.annotate 'line', 3310
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3311

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3312
# Body
# {
.annotate 'line', 3314
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3315

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3316
# Body
# {
.annotate 'line', 3318
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3319

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3301
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3326
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3327
# Body
# {
.annotate 'line', 3329
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3330

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3331
# Body
# {
.annotate 'line', 3333
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3334

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3335
# Body
# {
.annotate 'line', 3337
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3338

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3339
# Body
# {
.annotate 'line', 3341
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3342

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3324
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3349
# Body
# {
.annotate 'line', 3351
.return('I')
# }
.annotate 'line', 3352

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3347
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3359
# Body
# {
.annotate 'line', 3361
self.'optimizearg'()
.annotate 'line', 3362
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3363
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3364
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3365
eq $I1, 0, __label_1
.annotate 'line', 3366
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3368
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3370
.return(self)
# }
.annotate 'line', 3371

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3372
# Body
# {
.annotate 'line', 3374
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
.annotate 'line', 3375
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3376
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3377
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3378
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3379
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3380
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3383
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3384
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3385
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3386
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3387
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3389

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3357
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3396
# Body
# {
.annotate 'line', 3398
self.'optimizearg'()
.annotate 'line', 3399
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3400
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3401
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3402
ne $I1, 0, __label_1
.annotate 'line', 3403
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3405
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
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
null $S1
.annotate 'line', 3412
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3415
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3416
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3417
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3418
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3419
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3420
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3421
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3424
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3425
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3426
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3427
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3428
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3430

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3394
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3437
# Body
# {
.annotate 'line', 3439
.return('I')
# }
.annotate 'line', 3440

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3435
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3447
# Body
# {
.annotate 'line', 3449
self.'optimizearg'()
.annotate 'line', 3450
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3451
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3452
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3453
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3454
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3455
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3457
.return(self)
# }
.annotate 'line', 3458

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3459
# Body
# {
.annotate 'line', 3461
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
.annotate 'line', 3462
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3463
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3464
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3465
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3466
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3467

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3445
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3474
# Body
# {
.annotate 'line', 3476
self.'optimizearg'()
.annotate 'line', 3477
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3478
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3479
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3480
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3481
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3482
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3484
.return(self)
# }
.annotate 'line', 3485

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3486
# Body
# {
.annotate 'line', 3488
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
.annotate 'line', 3489
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3490
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3491
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3492
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3493
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3494

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3472
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3502
# Body
# {
.annotate 'line', 3504
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3505
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3506
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3507
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3508
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3510
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3512
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3513
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3514
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3517
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3518

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3519
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3520
# Body
# {
.annotate 'line', 3522
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3523
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3524
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3525
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3526
ge $I2, $I1, __label_1
.annotate 'line', 3527
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3526
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3528
.return($P2)
# }
.annotate 'line', 3529

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3530
# Body
# {
.annotate 'line', 3532
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3533
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3534
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3535
self.'annotate'(__ARG_1)
.annotate 'line', 3536
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3537
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3538
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3537
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3539
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3540

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3541
# Body
# {
.annotate 'line', 3543
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3544
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3545
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3546
self.'annotate'(__ARG_1)
.annotate 'line', 3547
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3548
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3549
$P3 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3548
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3550
.return($S1)
# }
.annotate 'line', 3551

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3552
# Body
# {
.annotate 'line', 3554
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3555
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3556
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3557
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3558
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3557
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3559

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3560
# Body
# {
.annotate 'line', 3562
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3563
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3564
self.'annotate'(__ARG_1)
.annotate 'line', 3565
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3566
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3567
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3566
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3568

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3499
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3501
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3575
# Body
# {
.annotate 'line', 3577
self.'optimizearg'()
.annotate 'line', 3578
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3579
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3580
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3581
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3582
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3583
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3584
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3585
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3586
# var t: $P5
null $P5
.annotate 'line', 3587
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3588
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3589
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3590
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3592
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3593
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3595
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3596
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3597
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3598
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3599
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3600
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3603
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3604
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3605
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3606
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3607
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3608
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3612
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3613
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3615
.return(self)
# }
.annotate 'line', 3616

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3617
# Body
# {
.annotate 'line', 3619
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3620
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3621
ne $S1, $S2, __label_2
.annotate 'line', 3622
.return($S1)
__label_2: # endif
.annotate 'line', 3623
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3624
.return('S')
__label_3: # endif
.annotate 'line', 3625
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3626
.return('S')
__label_5: # endif
.annotate 'line', 3627
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3628
.return('N')
__label_7: # endif
.annotate 'line', 3629
.return('I')
# }
.annotate 'line', 3630

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3631
# Body
# {
.annotate 'line', 3633
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3634
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3635
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3636
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3637
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3639
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3640
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3641
ne $S1, 'S', __label_5
# {
.annotate 'line', 3642
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3643
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3644
eq $S2, 'S', __label_10
# {
.annotate 'line', 3645
__ARG_1.'emitset'($S6, $S4)
set $S4, $S6
.annotate 'line', 3646
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3649
__ARG_1.'emitset'($S6, $S5)
set $S5, $S6
.annotate 'line', 3650
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3653
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3656
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3657
# string l: $S7
null $S7
.annotate 'line', 3658
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3660
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3661
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3663
# string r: $S8
null $S8
.annotate 'line', 3664
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3666
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3667
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3669
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3672
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3674

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3573
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3681
# Body
# {
.annotate 'line', 3683
self.'optimizearg'()
.annotate 'line', 3684
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3685
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3686
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3687
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3688
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3689
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3690
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3691
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3692
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3693
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3694
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3697
.return(self)
# }
.annotate 'line', 3698

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3699
# Body
# {
.annotate 'line', 3701
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3702
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3703
ne $S1, $S2, __label_2
.annotate 'line', 3704
.return($S1)
__label_2: # endif
.annotate 'line', 3705
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3706
.return('N')
__label_3: # endif
.annotate 'line', 3707
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3708
.return('N')
__label_5: # endif
.annotate 'line', 3709
.return('I')
# }
.annotate 'line', 3710

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3711
# Body
# {
.annotate 'line', 3713
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3714
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3715
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3716

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3679
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3723
# Body
# {
.annotate 'line', 3725
self.'optimizearg'()
.annotate 'line', 3726
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3727
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3728
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3729
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3730
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3731
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3732
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3733
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3734
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3735
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3736
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3739
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3740
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3741
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3742
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3743
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3744
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3748
.return(self)
# }
.annotate 'line', 3749

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3750
# Body
# {
.annotate 'line', 3752
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3753
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3754
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3755
ne $S1, $S2, __label_2
.annotate 'line', 3756
.return($S1)
__label_2: # endif
.annotate 'line', 3757
ne $S1, 'S', __label_3
.annotate 'line', 3758
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3760
.return('N')
__label_4: # endif
# }
.annotate 'line', 3761

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3762
# Body
# {
.annotate 'line', 3764
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3765
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3766
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3767
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3768
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3769
ne $S1, 'S', __label_2
# {
.annotate 'line', 3770
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3771
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3772
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3773
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3778
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3779
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3781
self.'annotate'(__ARG_1)
.annotate 'line', 3782
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3783
.return()
# }
__label_2: # endif
.annotate 'line', 3785
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
.annotate 'line', 3786
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3787
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3788
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3789
.return()
# }
__label_6: # endif
.annotate 'line', 3794
ne $S1, 'N', __label_10
# {
.annotate 'line', 3795
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3796
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3797
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3798
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3800
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3801
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3808
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3809
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3811
self.'annotate'(__ARG_1)
.annotate 'line', 3812
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3813
.return()
# }
__label_10: # endif
.annotate 'line', 3816
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3817
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3818
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3819
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3822
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3823
# }
__label_16: # endif
.annotate 'line', 3825
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3826
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3827
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3830
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3832
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3833
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3837
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3839
# }
__label_19: # endif
.annotate 'line', 3842
self.'annotate'(__ARG_1)
.annotate 'line', 3843
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3844

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3721
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3851
# Body
# {
.annotate 'line', 3853
self.'optimizearg'()
.annotate 'line', 3854
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3855
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3856
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3857
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3858
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3859
# var lval: $P3
null $P3
.annotate 'line', 3860
# var rval: $P4
null $P4
.annotate 'line', 3861
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3862
getattribute $P3, $P1, 'numval'
.annotate 'line', 3863
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3864
getattribute $P4, $P2, 'numval'
.annotate 'line', 3865
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3866
eq $I2, 0, __label_6
.annotate 'line', 3867
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
.annotate 'line', 3870
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3871
getattribute $P3, $P1, 'numval'
.annotate 'line', 3872
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3873
getattribute $P4, $P2, 'numval'
.annotate 'line', 3874
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3875
eq $N2, $N3, __label_8
.annotate 'line', 3876
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
.annotate 'line', 3880
.return(self)
# }
.annotate 'line', 3881

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3882
# Body
# {
.annotate 'line', 3884
.return('N')
# }
.annotate 'line', 3885

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3886
# Body
# {
.annotate 'line', 3888
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3889
# var lreg: $P2
null $P2
.annotate 'line', 3890
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 3891
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3893
$P2 = self.'tempreg'('N')
.annotate 'line', 3894
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3896
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3897
# var rreg: $P4
null $P4
.annotate 'line', 3898
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 3899
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3901
$P4 = self.'tempreg'('N')
.annotate 'line', 3902
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3904
self.'annotate'(__ARG_1)
.annotate 'line', 3905
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3906

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3849
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3913
# Body
# {
.annotate 'line', 3915
.return('I')
# }
.annotate 'line', 3916

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3917
# Body
# {
.annotate 'line', 3919
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3920
# var lreg: $P2
null $P2
.annotate 'line', 3921
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3922
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3924
$P2 = self.'tempreg'('I')
.annotate 'line', 3925
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3927
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3928
# var rreg: $P4
null $P4
.annotate 'line', 3929
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3930
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3932
$P4 = self.'tempreg'('I')
.annotate 'line', 3933
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3935
self.'annotate'(__ARG_1)
.annotate 'line', 3936
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3937

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3911
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3944
# Body
# {
.annotate 'line', 3946
.return('I')
# }
.annotate 'line', 3947

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3948
# Body
# {
.annotate 'line', 3950
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3951
# var lreg: $P2
null $P2
.annotate 'line', 3952
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3953
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3955
$P2 = self.'tempreg'('I')
.annotate 'line', 3956
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3958
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3959
# var rreg: $P4
null $P4
.annotate 'line', 3960
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3961
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3963
$P4 = self.'tempreg'('I')
.annotate 'line', 3964
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3966
self.'annotate'(__ARG_1)
.annotate 'line', 3971
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3972

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 3942
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3981
# Body
# {
.annotate 'line', 3983
setattribute self, 'arg', __ARG_1
.annotate 'line', 3984
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 3985

.end # Argument


.sub 'optimize' :method

.annotate 'line', 3986
# Body
# {
.annotate 'line', 3988
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 3989
.return(self)
# }
.annotate 'line', 3990

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 3991
# Body
# {
.annotate 'line', 3993
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 3994

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 3979
addattribute $P0, 'arg'
.annotate 'line', 3980
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 3997
# Body
# {
.annotate 'line', 3999
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4000
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4001
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4002
.return(1)
# }
.annotate 'line', 4003

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4012
# Body
# {
.annotate 'line', 4014
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4015
setattribute self, 'predef', __ARG_3
.annotate 'line', 4016
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4017

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4018
# Body
# {
.annotate 'line', 4020
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4021

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4022
# Body
# {
.annotate 'line', 4024
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4025
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4026
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4027
# var arg: $P4
null $P4
.annotate 'line', 4028
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 4029
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4031
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4032
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4033
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4037
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4038
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4039
getattribute $P10, $P4, 'arg'
$P5.'push'($P10)
goto __label_7
__label_8: # endfor
.annotate 'line', 4040
getattribute $P11, self, 'predef'
getattribute $P12, self, 'start'
$P11.'expand'(__ARG_1, self, $P12, __ARG_2, $P5)
.annotate 'line', 4041
.return()
__label_1: # default
.annotate 'line', 4043
# int n: $I2
getattribute $P13, self, 'args'
set $I2, $P13
# for loop
.annotate 'line', 4044
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4045
$P14 = $P2[$I3]
getattribute $P4, $P14, 'arg'
.annotate 'line', 4046
# string argtype: $S2
$P10 = $P4.'checkresult'()
null $S2
if_null $P10, __label_12
set $S2, $P10
__label_12:
.annotate 'line', 4047
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 4048
# string argr: $S4
null $S4
.annotate 'line', 4049
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4050
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 4052
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 4053
ne $S3, 'P', __label_17
# {
.annotate 'line', 4054
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 4055
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
.annotate 'line', 4060
eq $S5, '', __label_23
.annotate 'line', 4061
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4063
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4065
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 4044
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4068
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4069

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4007
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4009
addattribute $P0, 'predef'
.annotate 'line', 4010
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4079
# Body
# {
.annotate 'line', 4081
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4082
setattribute self, 'funref', __ARG_4
.annotate 'line', 4083
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4084
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4085
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4086
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4087
# {
.annotate 'line', 4088
# var modifier: $P2
null $P2
.annotate 'line', 4089
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4090
$P1 = __ARG_1.'get'()
.annotate 'line', 4091
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4092
$P1 = __ARG_1.'get'()
.annotate 'line', 4093
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4094
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4095
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4098
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4101
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4102
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4103
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4104
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4106

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4107
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4108
# Body
# {
.annotate 'line', 4110
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4111
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4112
'optimize_array'($P1)
.annotate 'line', 4115
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4116
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4117
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4118
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4119
if_null $P3, __label_2
# {
.annotate 'line', 4120
self.'use_predef'($S1)
.annotate 'line', 4123
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4124
if_null $P4, __label_3
# {
.annotate 'line', 4125
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4126
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4129
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
.annotate 'line', 4133
.return(self)
# }
.annotate 'line', 4134

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4135
# Body
# {
.annotate 'line', 4137
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4138
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4139
# string call: $S1
null $S1
.annotate 'line', 4140
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4141
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4142
ne $S1, '', __label_2
# {
.annotate 'line', 4143
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4144
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
unless $I1 goto __label_5
.annotate 'line', 4148
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4150
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4151
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4152
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4153
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4154
# string reg: $S3
null $S3
.annotate 'line', 4155
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4156
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4157
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4160
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4161
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4163
self.'annotate'(__ARG_1)
.annotate 'line', 4165
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
set $S9, __ARG_2
.annotate 'line', 4166
ne $S9, '.tailcall', __label_12
.annotate 'line', 4167
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4169
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
unless $I1 goto __label_14
.annotate 'line', 4173
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4175
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4177
__ARG_1.'print'('(')
.annotate 'line', 4179
# string sep: $S4
set $S4, ''
.annotate 'line', 4180
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4181
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4182
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4183
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4184
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4185
# string setname: $S6
set $S6, ''
.annotate 'line', 4186
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4187
if_null $P6, __label_19
# {
.annotate 'line', 4188
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4189
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4190
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4192
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4194
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
.annotate 'line', 4198
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4199
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4200
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4201
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4204
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
.annotate 'line', 4209
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4210
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
unless $I4 goto __label_32
.annotate 'line', 4212
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
unless $I5 goto __label_34
.annotate 'line', 4213
# {
.annotate 'line', 4214
__ARG_1.'print'(' :named')
.annotate 'line', 4215
eq $S6, '', __label_35
.annotate 'line', 4216
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4218
# }
__label_16: # for iteration
.annotate 'line', 4181
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4220
__ARG_1.'say'(')')
# }
.annotate 'line', 4221

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4074
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4076
addattribute $P0, 'funref'
.annotate 'line', 4077
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4231
# Body
# {
.annotate 'line', 4233
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4234
setattribute self, 'left', __ARG_4
.annotate 'line', 4235
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4236

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4237
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4238
# Body
# {
.annotate 'line', 4240
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4241
.return(self)
# }
.annotate 'line', 4242

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4243
# Body
# {
.annotate 'line', 4245
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4246

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4247
# Body
# {
.annotate 'line', 4249
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4250
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4251
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4252
eq $S1, 'P', __label_2
# {
.annotate 'line', 4253
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4254
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4255
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4257
.return($S2)
# }
.annotate 'line', 4258

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4259
# Body
# {
.annotate 'line', 4261
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4262
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4263
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4264
self.'annotate'(__ARG_1)
.annotate 'line', 4265
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4266
.return($S3)
# }
.annotate 'line', 4267

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4268
# Body
# {
.annotate 'line', 4270
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4271
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4272
self.'annotate'(__ARG_1)
.annotate 'line', 4273
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4274

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4275
# Body
# {
.annotate 'line', 4277
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4278

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4279
# Body
# {
.annotate 'line', 4281
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4282
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4283
# string value: $S3
null $S3
.annotate 'line', 4284
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4286
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4287
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4288
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4290
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4293
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4294
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4296
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4297

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4298
# Body
# {
.annotate 'line', 4300
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4301
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4302
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4303
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4304
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4306
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4307
$P4 = __ARG_2.'checkresult'()
set $S5, $P4
eq $S5, 'P', __label_6
.annotate 'line', 4308
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4310
# }
__label_4: # endif
.annotate 'line', 4312
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4313
.return($S3)
# }
.annotate 'line', 4314

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4226
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4228
addattribute $P0, 'left'
.annotate 'line', 4229
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4323
# Body
# {
.annotate 'line', 4325
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4326
setattribute self, 'left', __ARG_4
.annotate 'line', 4327
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4328

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4329
# Body
# {
.annotate 'line', 4331
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4332
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4334
.return('P')
__label_1: # endif
# }
.annotate 'line', 4335

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4336
# Body
# {
.annotate 'line', 4338
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4339
self.'optimizeargs'()
.annotate 'line', 4340
.return(self)
# }
.annotate 'line', 4341

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4342
# Body
# {
.annotate 'line', 4344
# var regleft: $P1
null $P1
.annotate 'line', 4345
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4346
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4348
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4349
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4350
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4351
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4352
ne $S1, 'S', __label_3
# {
.annotate 'line', 4353
eq $I1, 1, __label_5
.annotate 'line', 4354
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4355
$P6 = $P2[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4358
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
.annotate 'line', 4359
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4360
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4362

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4363
# Body
# {
.annotate 'line', 4365
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4366
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4367
self.'annotate'(__ARG_1)
.annotate 'line', 4368
__ARG_1.'print'($P1, '[')
.annotate 'line', 4369
# predefined join
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4370
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4371

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4372
# Body
# {
.annotate 'line', 4374
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4375
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4376
# string rreg: $S1
null $S1
.annotate 'line', 4377
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4378
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4379
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4382
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4383
self.'annotate'(__ARG_1)
.annotate 'line', 4384
__ARG_1.'print'($P1, '[')
.annotate 'line', 4385
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4386
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4387
.return($S1)
# }
.annotate 'line', 4388

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4319
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4321
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4397
# Body
# {
.annotate 'line', 4399
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4400
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4401
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4402
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4403
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4404
# {
.annotate 'line', 4405
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4406
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4407
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4408
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4409
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4411

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4412
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4413
# Body
# {
.annotate 'line', 4415
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4416
.return(self)
# }
.annotate 'line', 4417

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4418
# Body
# {
set $S2, __ARG_2
.annotate 'line', 4420
eq $S2, '', __label_0
# {
.annotate 'line', 4421
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4422
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4428
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4430

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4431
# Body
# {
.annotate 'line', 4433
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4434
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4435
.return($S1)
# }
.annotate 'line', 4436

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4437
# Body
# {
.annotate 'line', 4439
self.'annotate'(__ARG_1)
.annotate 'line', 4440
# string itemreg: $S1
null $S1
.annotate 'line', 4441
# string it_p: $S2
null $S2
.annotate 'line', 4442
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4443
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4444
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4446
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4447
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
set $S5, $S3
set $S6, 'I'
.annotate 'line', 4448
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
.annotate 'line', 4450
# string aux: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 4451
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4452
__ARG_1.'emitbox'($S2, $S4)
set $S1, $S2
.annotate 'line', 4453
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4457
$P5 = $P1.'isnull'()
if_null $P5, __label_11
unless $P5 goto __label_11
# {
.annotate 'line', 4458
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4459
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4460
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4464
$P5 = $P1.'emit_get'(__ARG_1)
set $S1, $P5
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4466
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4467
self.'annotate'(__ARG_1)
.annotate 'line', 4468
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4471

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4393
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4395
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4481
# Body
# {
.annotate 'line', 4483
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4484
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4485
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4486
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4487
$P7 = $P1.'isop'('}')
isfalse $I1, $P7
unless $I1 goto __label_0
# {
.annotate 'line', 4488
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4489
# {
.annotate 'line', 4490
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4491
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4492
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4493
$P2.'push'($P4)
.annotate 'line', 4494
$P3.'push'($P5)
# }
.annotate 'line', 4496
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'(',')
if_null $P7, __label_2
if $P7 goto __label_1
__label_2: # enddo
.annotate 'line', 4497
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_4
.annotate 'line', 4498
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4500
setattribute self, 'keys', $P2
.annotate 'line', 4501
setattribute self, 'values', $P3
# }
.annotate 'line', 4502

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4503
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4504
# Body
# {
.annotate 'line', 4506
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4507
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4508
.return(self)
# }
.annotate 'line', 4509

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4510
# Body
# {
.annotate 'line', 4512
self.'annotate'(__ARG_1)
set $S6, __ARG_2
.annotate 'line', 4517
eq $S6, '', __label_0
.annotate 'line', 4518
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4520
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4521
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4522
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4523
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4524
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4525
# string item: $S1
null $S1
.annotate 'line', 4526
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4527
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4528
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4529
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4532
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_5: # endif
.annotate 'line', 4534
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4535
# string itemreg: $S3
null $S3
.annotate 'line', 4536
$P7 = $P4.'isnull'()
if_null $P7, __label_7
unless $P7 goto __label_7
# {
set $S6, __ARG_2
.annotate 'line', 4537
eq $S6, '', __label_9
# {
.annotate 'line', 4538
$P8 = self.'tempreg'('P')
set $S3, $P8
.annotate 'line', 4539
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4542
$P8 = $P4.'isidentifier'()
if_null $P8, __label_10
unless $P8 goto __label_10
# {
.annotate 'line', 4543
# string s: $S4
$P9 = $P4.'checkIdentifier'()
null $S4
if_null $P9, __label_12
set $S4, $P9
__label_12:
.annotate 'line', 4544
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
set $S3, $S4
goto __label_14
__label_13: # else
.annotate 'line', 4545
# {
.annotate 'line', 4547
# string id: $S5
$P9 = $P4.'getName'()
null $S5
if_null $P9, __label_16
set $S5, $P9
__label_16:
.annotate 'line', 4548
getattribute $P11, self, 'owner'
$P10 = $P11.'getvar'($S5)
unless_null $P10, __label_17
# {
.annotate 'line', 4549
$P12 = self.'tempreg'('P')
set $S3, $P12
.annotate 'line', 4550
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4553
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4557
$P11 = $P4.'emit_get'(__ARG_1)
set $S3, $P11
__label_11: # endif
__label_8: # endif
set $S7, __ARG_2
.annotate 'line', 4558
eq $S7, '', __label_19
.annotate 'line', 4559
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 4523
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 4561

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4562
# Body
# {
.annotate 'line', 4564
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4565
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4566
.return($S1)
# }
.annotate 'line', 4567

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4476
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4478
addattribute $P0, 'keys'
.annotate 'line', 4479
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4576
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4577
# Body
# {
.annotate 'line', 4581
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4582
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4583
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4584
__ARG_1.'unget'($P2)
.annotate 'line', 4585
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4586
# {
.annotate 'line', 4587
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4588
$P3.'push'($P4)
# }
.annotate 'line', 4589
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4590
setattribute self, 'initializer', $P3
.annotate 'line', 4591
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4593

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4572
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4574
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4602
# Body
# {
.annotate 'line', 4604
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4606
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4607
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4608
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4609
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4610
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4611
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4612
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4613
# {
.annotate 'line', 4614
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4615
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4616
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4617
$P2.'push'($P3)
# }
.annotate 'line', 4618
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4619
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4622
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4625
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4627
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4628
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4630
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4631

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4632
# Body
# {
.annotate 'line', 4634
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4635
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4638
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4639
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4640
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4641
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4642
$P1 = $P3['value']
.annotate 'line', 4643
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4644
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4645
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4648
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4652
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4653
if_null $P4, __label_7
.annotate 'line', 4654
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4655
.return(self)
# }
.annotate 'line', 4656

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4657
# Body
# {
.annotate 'line', 4659
self.'annotate'(__ARG_1)
.annotate 'line', 4661
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4662
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
.annotate 'line', 4665
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4666
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4667
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
.annotate 'line', 4669
# string reginit: $S1
set $S1, ''
.annotate 'line', 4670
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4671
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4672
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4676
ne $I2, 1, __label_13
# {
.annotate 'line', 4677
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4678
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4681
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4682
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4683
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4687
isne $I4, $I2, 1
unless $I4 goto __label_17
isne $I4, $I2, 2
__label_17:
unless $I4 goto __label_16
.annotate 'line', 4688
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_16: # endif
.annotate 'line', 4689
not $I5, __ARG_3
unless $I5 goto __label_18
.annotate 'line', 4690
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_18: # endif
__label_9: # switch end
set $I6, $I2
null $I7
.annotate 'line', 4693
if $I6 == $I7 goto __label_21
set $I7, 2
if $I6 == $I7 goto __label_22
set $I7, 1
if $I6 == $I7 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 4696
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_24
set $S4, $P14
__label_24:
.annotate 'line', 4697
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4698
unless_null $P3, __label_25
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
.annotate 'line', 4699
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_25: # endif
.annotate 'line', 4703
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4704
le $I1, 1, __label_26
# {
.annotate 'line', 4705
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_26: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 4709
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4710
# predefined elements
elements $I7, $P4
sub $I6, $I7, 1
$S3 = $P4[$I6]
.annotate 'line', 4711
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 4714
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4715
unless_null $P5, __label_27
# {
.annotate 'line', 4717
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4718
if_null $P6, __label_29
# {
.annotate 'line', 4719
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_30
__label_29: # else
# {
.annotate 'line', 4722
'Warn'('Checking: new unknown type')
.annotate 'line', 4723
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_30: # endif
.annotate 'line', 4725
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4729
$P20 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_28: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 4733
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 4735
isgt $I8, $I1, 1
if $I8 goto __label_32
isgt $I8, $I1, 0
unless $I8 goto __label_33
iseq $I8, $I2, 1
__label_33:
__label_32:
unless $I8 goto __label_31
# {
.annotate 'line', 4736
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4737
iter $P21, $P1
set $P21, 0
__label_34: # for iteration
unless $P21 goto __label_35
shift $P8, $P21
# {
.annotate 'line', 4738
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_36
set $S5, $P22
__label_36:
.annotate 'line', 4739
$P7.'push'($S5)
# }
goto __label_34
__label_35: # endfor
.annotate 'line', 4741
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 4742
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4743
__ARG_1.'say'(")")
.annotate 'line', 4744
not $I8, __ARG_3
unless $I8 goto __label_37
.annotate 'line', 4745
__ARG_1.'emitset'(__ARG_2, $S2)
__label_37: # endif
# }
__label_31: # endif
# }
.annotate 'line', 4747

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4748
# Body
# {
.annotate 'line', 4750
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4751

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4598
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4600
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4760
# Body
# {
.annotate 'line', 4762
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4763
setattribute self, 'owner', __ARG_2
.annotate 'line', 4764
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4765
setattribute self, 'nskey', $P1
.annotate 'line', 4766
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4767
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4768
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4770
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4771

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4772
# Body
# {
.annotate 'line', 4774
# string reginit: $S1
null $S1
.annotate 'line', 4775
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4776
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
.annotate 'line', 4777
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4781
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4782
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4785
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4787
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4788
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4789
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4790
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4791
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4792
if_null $S1, __label_7
.annotate 'line', 4793
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4794
__ARG_1.'say'()
# }
.annotate 'line', 4795

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4756
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4758
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4804
# Body
# {
.annotate 'line', 4806
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4807
setattribute self, 'owner', __ARG_2
.annotate 'line', 4808
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4809
setattribute self, 'nskey', $P1
.annotate 'line', 4810
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4811
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4812
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4814
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4815

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4816
# Body
# {
.annotate 'line', 4818
# string reginit: $S1
null $S1
.annotate 'line', 4819
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4821
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4822
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4823
le $I1, 0, __label_3
.annotate 'line', 4824
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4825
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4826
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4827
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4828
__ARG_1.'say'()
.annotate 'line', 4830
le $I1, 0, __label_4
# {
.annotate 'line', 4831
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4832
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4833
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4834
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4836
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4837
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 4838
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4839
__ARG_1.'say'(")")
.annotate 'line', 4840
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4842

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4800
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4802
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4847
# Body
# {
.annotate 'line', 4849
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4851
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4853
new $P5, [ 'CallExpr' ]
.annotate 'line', 4854
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4853
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4856
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4858
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4860
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4863
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4864
__ARG_1.'unget'($P2)
.annotate 'line', 4865
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4867
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4871
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
.annotate 'line', 4876
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4878

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4887
# Body
# {
.annotate 'line', 4889
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4890
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4891
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4892

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4893
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4894
# Body
# {
.annotate 'line', 4896
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4897
# string checkedval: $S1
null $S1
.annotate 'line', 4898
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4899
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4900
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4904
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4905
self.'annotate'(__ARG_1)
.annotate 'line', 4906
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4907

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4882
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4884
addattribute $P0, 'lexpr'
.annotate 'line', 4885
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 4922
# Body
# {
.annotate 'line', 4924
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4925
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 4926
setattribute self, 'etrue', __ARG_4
.annotate 'line', 4927
setattribute self, 'efalse', __ARG_5
.annotate 'line', 4928
.return(self)
# }
.annotate 'line', 4929

.end # set


.sub 'optimize' :method

.annotate 'line', 4930
# Body
# {
.annotate 'line', 4932
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 4933
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
.annotate 'line', 4935
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 4937
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 4939
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 4940
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 4941
.return(self)
__label_0: # switch end
# }
.annotate 'line', 4943

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4944
# Body
# {
.annotate 'line', 4946
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 4947

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4948
# Body
# {
.annotate 'line', 4950
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4951
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4952
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 4953
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4954
__ARG_1.'emitgoto'($S1)
.annotate 'line', 4955
__ARG_1.'emitlabel'($S2)
.annotate 'line', 4956
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 4957
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 4958

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4912
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4918
addattribute $P0, 'condition'
.annotate 'line', 4919
addattribute $P0, 'etrue'
.annotate 'line', 4920
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

.annotate 'line', 4995
# Body
# {
.annotate 'line', 4997
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
.annotate 'line', 4998
.return(1)
__label_3: # case
.annotate 'line', 4999
.return(2)
__label_4: # case
.annotate 'line', 5000
.return(3)
__label_1: # default
.annotate 'line', 5001
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5003

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5005
# Body
# {
.annotate 'line', 5007
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
.annotate 'line', 5008
.return(8)
__label_3: # case
.annotate 'line', 5009
.return(11)
__label_4: # case
.annotate 'line', 5010
.return(9)
__label_5: # case
.annotate 'line', 5011
.return(10)
__label_1: # default
.annotate 'line', 5012
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5014

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5016
# Body
# {
.annotate 'line', 5018
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
.annotate 'line', 5019
.return(19)
__label_3: # case
.annotate 'line', 5020
.return(20)
__label_4: # case
.annotate 'line', 5021
.return(21)
__label_5: # case
.annotate 'line', 5022
.return(22)
__label_1: # default
.annotate 'line', 5023
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5025

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5027
# Body
# {
.annotate 'line', 5029
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
.annotate 'line', 5030
.return(12)
__label_3: # case
.annotate 'line', 5031
.return(13)
__label_4: # case
.annotate 'line', 5032
.return(25)
__label_5: # case
.annotate 'line', 5033
.return(26)
__label_1: # default
.annotate 'line', 5035
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5036
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5038

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5040
# Body
# {
.annotate 'line', 5042
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
.annotate 'line', 5043
.return(14)
__label_3: # case
.annotate 'line', 5044
.return(16)
__label_4: # case
.annotate 'line', 5045
.return(15)
__label_5: # case
.annotate 'line', 5046
.return(17)
__label_1: # default
.annotate 'line', 5047
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5049

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5051
# Body
# {
.annotate 'line', 5053
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
.annotate 'line', 5054
.return(4)
__label_3: # case
.annotate 'line', 5055
.return(5)
__label_4: # case
.annotate 'line', 5056
.return(6)
__label_5: # case
.annotate 'line', 5057
.return(18)
__label_6: # case
.annotate 'line', 5058
.return(23)
__label_7: # case
.annotate 'line', 5059
.return(24)
__label_1: # default
.annotate 'line', 5060
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5062

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5064
# Body
# {
.annotate 'line', 5066
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5068
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5069
# var expr: $P2
null $P2
.annotate 'line', 5070
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5071
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5072
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5073
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5075
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5076
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5077
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 5078
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 5079
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 5080
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5081
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 5082
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 5083
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 5084
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 5085
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 5086
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 5087
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 5088
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 5089
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 5090
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 5091
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5092

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5094
# Body
# {
.annotate 'line', 5096
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5097
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5099
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5100
# var t: $P2
null $P2
.annotate 'line', 5101
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5102
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 5103
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5105
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5108
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5111
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5114
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5117
__ARG_1.'unget'($P2)
.annotate 'line', 5118
.return($P1)
# }
.annotate 'line', 5119

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5121
# Body
# {
.annotate 'line', 5123
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5125
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5126
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5127
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5128
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5129
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5130
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5133
__ARG_1.'unget'($P2)
.annotate 'line', 5134
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5136

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5138
# Body
# {
.annotate 'line', 5140
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5141
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5142
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5144
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5145
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5146
# var subexpr: $P2
null $P2
.annotate 'line', 5147
eq $I1, 0, __label_0
# {
.annotate 'line', 5148
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5149
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5150
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
.annotate 'line', 5152
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5155
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5158
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5161
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5164
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5166
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5169
__ARG_1.'unget'($P1)
.annotate 'line', 5170
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5172
.return($P2)
# }
.annotate 'line', 5173

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5175
# Body
# {
.annotate 'line', 5177
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5178
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5180
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5181
# var t: $P2
null $P2
.annotate 'line', 5182
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5183
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5184
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5185
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5186
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
.annotate 'line', 5188
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5191
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5194
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5197
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5200
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5202
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5203
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5205
__ARG_1.'unget'($P2)
.annotate 'line', 5206
.return($P1)
# }
.annotate 'line', 5207

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5209
# Body
# {
.annotate 'line', 5211
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5213
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5214
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5215
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5216
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5217
# var expr: $P4
null $P4
.annotate 'line', 5218
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5219
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5221
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5222
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5224
__ARG_1.'unget'($P2)
.annotate 'line', 5225
.return($P1)
# }
.annotate 'line', 5226

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5228
# Body
# {
.annotate 'line', 5230
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5231
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5233
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5234
# var rexpr: $P2
null $P2
.annotate 'line', 5235
# var t: $P3
null $P3
.annotate 'line', 5236
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5237
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5238
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
.annotate 'line', 5240
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5241
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5244
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5245
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5248
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5249
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5252
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5253
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5256
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5259
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5262
__ARG_1.'unget'($P3)
.annotate 'line', 5263
.return($P1)
# }
.annotate 'line', 5264

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5266
# Body
# {
.annotate 'line', 5268
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5269
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5271
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5272
# var t: $P2
null $P2
.annotate 'line', 5273
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5274
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5275
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5276
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
.annotate 'line', 5278
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5281
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5284
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5287
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5290
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5293
__ARG_1.'unget'($P2)
.annotate 'line', 5294
.return($P1)
# }
.annotate 'line', 5295

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5297
# Body
# {
.annotate 'line', 5299
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5301
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5302
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5303
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5304
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5305
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5307
__ARG_1.'unget'($P2)
.annotate 'line', 5308
.return($P1)
# }
.annotate 'line', 5309

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5311
# Body
# {
.annotate 'line', 5313
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5315
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5316
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5317
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5318
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5319
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5321
__ARG_1.'unget'($P2)
.annotate 'line', 5322
.return($P1)
# }
.annotate 'line', 5323

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5325
# Body
# {
.annotate 'line', 5327
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5329
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5330
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5331
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5332
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5333
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5335
__ARG_1.'unget'($P2)
.annotate 'line', 5336
.return($P1)
# }
.annotate 'line', 5337

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5339
# Body
# {
.annotate 'line', 5341
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5343
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5344
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5345
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5346
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5347
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5349
__ARG_1.'unget'($P2)
.annotate 'line', 5350
.return($P1)
# }
.annotate 'line', 5351

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5353
# Body
# {
.annotate 'line', 5355
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5356
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5358
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5359
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5360
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5361
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5362
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5363
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5364
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5367
__ARG_1.'unget'($P2)
.annotate 'line', 5368
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5370

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5372
# Body
# {
.annotate 'line', 5374
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5375
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5376
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5378
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5379
# var t: $P2
null $P2
.annotate 'line', 5380
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5381
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5382
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5383
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5384
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
.annotate 'line', 5386
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5389
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5392
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5395
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5398
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5401
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5404
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5406
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5407
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5409
__ARG_1.'unget'($P2)
.annotate 'line', 5410
.return($P1)
# }
.annotate 'line', 5411

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5413
# Body
# {
.annotate 'line', 5415
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5417
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5418

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5431
# Body
# {
.annotate 'line', 5433
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5434
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5435
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5436
setattribute self, 'brlabel', $P2
.annotate 'line', 5437
.return($S1)
# }
.annotate 'line', 5438

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5439
# Body
# {
.annotate 'line', 5441
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5442
unless_null $P1, __label_0
.annotate 'line', 5443
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5444
.return($P1)
# }
.annotate 'line', 5445

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5429
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5452
# Body
# {
.annotate 'line', 5454
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5455
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5456
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5457
setattribute self, 'cntlabel', $P2
.annotate 'line', 5458
.return($S1)
# }
.annotate 'line', 5459

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5460
# Body
# {
.annotate 'line', 5462
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5463
unless_null $P1, __label_0
.annotate 'line', 5464
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5465
.return($P1)
# }
.annotate 'line', 5466

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5448
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5450
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5480
# Body
# {
.annotate 'line', 5482
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5483
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5484
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5485
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5486
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5487
# {
.annotate 'line', 5488
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5489
$P2.'push'($P3)
# }
.annotate 'line', 5490
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5492
'RequireOp'(';', $P1)
.annotate 'line', 5493
setattribute self, 'values', $P2
# }
.annotate 'line', 5494

.end # parse


.sub 'optimize' :method

.annotate 'line', 5495
# Body
# {
.annotate 'line', 5497
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 5498
.return(self)
# }
.annotate 'line', 5499

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5500
# Body
# {
.annotate 'line', 5502
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5503
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5504
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5507
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5508
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5510
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5511
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5512
$I4 = $P4.'isidentifier'()
if $I4 goto __label_4
isa $I4, $P4, 'MemberExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5513
self.'annotate'(__ARG_1)
.annotate 'line', 5514
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5518
# int i: $I2
null $I2
__label_7: # for condition
ge $I2, $I1, __label_6
# {
.annotate 'line', 5519
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5520
# string reg: $S1
null $S1
.annotate 'line', 5521
$P7 = $P5.'isnull'()
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 5522
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5523
__ARG_1.'emitnull'($S1)
# }
goto __label_9
__label_8: # else
.annotate 'line', 5526
$P7 = $P5.'emit_get'(__ARG_1)
set $S1, $P7
__label_9: # endif
.annotate 'line', 5527
$P1.'push'($S1)
# }
__label_5: # for iteration
.annotate 'line', 5518
inc $I2
goto __label_7
__label_6: # for end
.annotate 'line', 5529
self.'annotate'(__ARG_1)
.annotate 'line', 5530
self.'emitret'(__ARG_1)
.annotate 'line', 5531
# string sep: $S2
set $S2, ''
.annotate 'line', 5532
iter $P9, $P1
set $P9, 0
__label_10: # for iteration
unless $P9 goto __label_11
shift $S3, $P9
# {
.annotate 'line', 5533
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5534
# }
goto __label_10
__label_11: # endfor
.annotate 'line', 5536
__ARG_1.'say'(')')
# }
.annotate 'line', 5537

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5476
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5478
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5542
# Body
# {
.annotate 'line', 5544
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5545

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5546
# Body
# {
.annotate 'line', 5548
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5549

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5540
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5554
# Body
# {
.annotate 'line', 5556
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5557

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5558
# Body
# {
.annotate 'line', 5560
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5561

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5552
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5572
# Body
# {
.annotate 'line', 5574
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5575
setattribute self, 'name', __ARG_1
.annotate 'line', 5576
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5577
setattribute self, 'value', $P2
# }
.annotate 'line', 5578

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5579
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5580
# Body
# {
.annotate 'line', 5582
self.'annotate'(__ARG_1)
.annotate 'line', 5583
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5584
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5585
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5586

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5568
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5570
addattribute $P0, 'name'
.annotate 'line', 5571
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5597
# Body
# {
.annotate 'line', 5599
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5600
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5601
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5602
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5603
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5604
setattribute self, 'label', $P1
.annotate 'line', 5605
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5606

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5607
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5608
# Body
# {
.annotate 'line', 5610
self.'annotate'(__ARG_1)
.annotate 'line', 5611
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5612
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5613
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5614

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5593
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5595
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5623
# Body
# {
.annotate 'line', 5625
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5626

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5627
# Body
# {
.annotate 'line', 5629
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5630
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5631
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5632

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5621
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

.annotate 'line', 5643
# Body
# {
.annotate 'line', 5645
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5646
self.'parsecondition'(__ARG_2)
.annotate 'line', 5647
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5648
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5649
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5650
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5652
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5653
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5655

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5656
# Body
# {
.annotate 'line', 5658
self.'optimize_condition'()
.annotate 'line', 5659
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5660
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5661
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5662
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5664
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5666
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5668
.return(self)
# }
.annotate 'line', 5669

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5670
# Body
# {
.annotate 'line', 5672
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5673
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5674
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5675
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5676
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5677
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5678
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5679
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5680
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5681
self.'annotate'(__ARG_1)
.annotate 'line', 5682
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5683
$P1.'emit'(__ARG_1)
.annotate 'line', 5685
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5686
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5687
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5688
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5690
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5691

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5639
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5641
addattribute $P0, 'truebranch'
.annotate 'line', 5642
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5701
# Body
# {
.annotate 'line', 5703
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5704

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5705
# Body
# {
.annotate 'line', 5707
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5708
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5710
self.'annotate'(__ARG_1)
.annotate 'line', 5711
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5712
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5713
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5714
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5715

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5698
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5700
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5724
# Body
# {
.annotate 'line', 5726
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5727
self.'parsecondition'(__ARG_2)
.annotate 'line', 5728
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5729

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5730
# Body
# {
.annotate 'line', 5732
self.'optimize_condition'()
.annotate 'line', 5733
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
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
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5740
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5743
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5746
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5747
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5749
self.'annotate'(__ARG_1)
.annotate 'line', 5750
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5751
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5752
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5753
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5754
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5756

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5722
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

.annotate 'line', 5765
# Body
# {
.annotate 'line', 5767
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5768
self.'parsebody'(__ARG_2)
.annotate 'line', 5769
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5770
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5771

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5772
# Body
# {
.annotate 'line', 5774
self.'optimize_condition'()
.annotate 'line', 5775
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5776
.return(self)
# }
.annotate 'line', 5777

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5778
# Body
# {
.annotate 'line', 5780
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5782
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5785
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5786
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5787
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5789
self.'annotate'(__ARG_1)
.annotate 'line', 5790
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5792
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5793
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5794
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5796

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5763
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

.annotate 'line', 5805
# Body
# {
.annotate 'line', 5807
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5808
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5809

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5810
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5811
# Body
# {
.annotate 'line', 5813
self.'annotate'(__ARG_1)
.annotate 'line', 5814
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5815
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5816

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5803
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5825
# Body
# {
.annotate 'line', 5827
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5828
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5829

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5830
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5831
# Body
# {
.annotate 'line', 5833
self.'annotate'(__ARG_1)
.annotate 'line', 5834
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5835
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5836

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5823
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5850
# Body
# {
.annotate 'line', 5852
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5853
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5854
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5855
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5856
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5857
$P1 = __ARG_2.'get'()
.annotate 'line', 5858
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5859
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5860
$P1 = __ARG_2.'get'()
.annotate 'line', 5861
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5862
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5863
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5864
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5865
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5866
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5867
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5868
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5869
$P1 = __ARG_2.'get'()
.annotate 'line', 5870
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5871
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5872
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 5873
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
.annotate 'line', 5874
__ARG_2.'unget'($P1)
.annotate 'line', 5875
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5877
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5878
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5881
$P1 = __ARG_2.'get'()
.annotate 'line', 5882
$P13 = $P1.'isop'(':')
isfalse $I4, $P13
unless $I4 goto __label_13
.annotate 'line', 5883
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5884
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
.annotate 'line', 5885
__ARG_2.'unget'($P1)
.annotate 'line', 5886
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5888
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5891

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5892
# Body
# {
.annotate 'line', 5894
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5895
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5896
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5897
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5898
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5899
.return(self)
# }
.annotate 'line', 5900

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5901
# Body
# {
.annotate 'line', 5904
# string type: $S1
set $S1, ''
.annotate 'line', 5905
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5906
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5907
ne $S2, 'N', __label_3
.annotate 'line', 5908
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5909
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5911
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5912
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5915
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5916
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
set $S9, $P11
ne $S9, $S1, __label_8
.annotate 'line', 5917
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 5919
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 5920
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 5924
self.'genbreaklabel'()
.annotate 'line', 5925
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 5926
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 5927
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 5928
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 5929
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 5930
$P2.'push'($S7)
.annotate 'line', 5931
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 5932
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 5934
__ARG_1.'emitgoto'($S5)
.annotate 'line', 5937
__ARG_1.'comment'('switch')
.annotate 'line', 5938
self.'annotate'(__ARG_1)
.annotate 'line', 5939
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 5940
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 5941
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 5942
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 5943
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 5944
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 5945
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 5946
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 5941
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 5949
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 5950
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 5951
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 5953
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 5954

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5843
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5845
addattribute $P0, 'condition'
.annotate 'line', 5846
addattribute $P0, 'case_value'
.annotate 'line', 5847
addattribute $P0, 'case_st'
.annotate 'line', 5848
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5966
# Body
# {
.annotate 'line', 5968
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5969
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5970
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 5971
__ARG_2.'unget'($P1)
.annotate 'line', 5972
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 5974
$P1 = __ARG_2.'get'()
.annotate 'line', 5975
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 5976
__ARG_2.'unget'($P1)
.annotate 'line', 5977
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 5978
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5980
$P1 = __ARG_2.'get'()
.annotate 'line', 5981
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 5982
__ARG_2.'unget'($P1)
.annotate 'line', 5983
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 5984
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 5986
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5987

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 5988
# Body
# {
.annotate 'line', 5990
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 5991
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 5992
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 5993
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 5994
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 5995
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 5996
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 5997
.return(self)
# }
.annotate 'line', 5998

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5999
# Body
# {
.annotate 'line', 6001
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6002
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6003
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6004
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6005
.return()
# }
__label_0: # endif
.annotate 'line', 6007
__ARG_1.'comment'('for loop')
.annotate 'line', 6008
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6009
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 6010
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 6011
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 6012
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6014
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6015
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 6016
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6018
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 6019
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6020
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 6021
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 6022
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6024
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6025

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 5961
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 5963
addattribute $P0, 'initializer'
.annotate 'line', 5964
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6037
# Body
# {
.annotate 'line', 6039
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6040
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6041
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6042
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6043
eq $S2, '', __label_2
# {
.annotate 'line', 6044
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 6046
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 6048
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6049
setattribute self, 'varname', $P1
.annotate 'line', 6050
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 6051
$P2 = __ARG_2.'get'()
.annotate 'line', 6052
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6053
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 6054
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6055

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6056
# Body
# {
.annotate 'line', 6058
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6059
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6060
.return(self)
# }
.annotate 'line', 6061

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6062
# Body
# {
.annotate 'line', 6064
self.'annotate'(__ARG_1)
.annotate 'line', 6065
# string regcont: $S1
null $S1
.annotate 'line', 6066
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6067
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6068
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6069
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6072
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 6073
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 6074
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 6075
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 6076
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 6077
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6078
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6079
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6080
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6081
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 6082
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 6083
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6084
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6085

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6032
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6034
addattribute $P0, 'varname'
.annotate 'line', 6035
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6090
# Body
# {
.annotate 'line', 6092
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6093
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6094
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6095
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6096
__ARG_2.'unget'($P3)
.annotate 'line', 6097
__ARG_2.'unget'($P2)
.annotate 'line', 6098
__ARG_2.'unget'($P1)
.annotate 'line', 6099
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 6100
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 6102
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 6103

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6113
# Body
# {
.annotate 'line', 6115
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6116
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6117

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6118
# Body
# {
.annotate 'line', 6120
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6121
.return(self)
# }
.annotate 'line', 6122

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6123
# Body
# {
.annotate 'line', 6125
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6126
self.'annotate'(__ARG_1)
.annotate 'line', 6127
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6128

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6109
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6111
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6142
# Body
# {
.annotate 'line', 6144
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6145
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6146
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6147
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6150
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6152
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6153
$P1 = __ARG_2.'get'()
.annotate 'line', 6154
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6155
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6156
$P1 = __ARG_2.'get'()
.annotate 'line', 6157
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6158
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6159
$P1 = __ARG_2.'get'()
.annotate 'line', 6160
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6161
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6162
setattribute self, 'exname', $P1
.annotate 'line', 6163
self.'createvar'($S1, 'P')
.annotate 'line', 6164
$P1 = __ARG_2.'get'()
.annotate 'line', 6165
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6166
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6168
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6169

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6170
# Body
# {
.annotate 'line', 6172
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6173
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6174
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6175
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6176
.return(self)
# }
.annotate 'line', 6177

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6178
# Body
# {
.annotate 'line', 6180
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6181
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6182
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6183
# string exreg: $S4
null $S4
.annotate 'line', 6184
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6185
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6186
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6189
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6191
self.'annotate'(__ARG_1)
.annotate 'line', 6192
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6194
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6195
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6197
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6198
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6199
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6200
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6201
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6202
if $S9 == $S10 goto __label_11
set $S10, 'max_severity'
if $S9 == $S10 goto __label_12
set $S10, 'handle_types'
if $S9 == $S10 goto __label_13
goto __label_10
# switch
__label_11: # case
__label_12: # case
.annotate 'line', 6205
eq $I1, 1, __label_14
.annotate 'line', 6206
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_14: # endif
.annotate 'line', 6207
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6208
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_15
set $S6, $P14
__label_15:
.annotate 'line', 6209
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
.annotate 'line', 6212
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6213
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6214
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6215
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_16: # for iteration
.annotate 'line', 6213
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6217
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6218
# string sep: $S7
set $S7, ''
.annotate 'line', 6219
iter $P15, $P5
set $P15, 0
__label_19: # for iteration
unless $P15 goto __label_20
shift $S8, $P15
# {
.annotate 'line', 6220
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6221
# }
goto __label_19
__label_20: # endfor
.annotate 'line', 6223
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6226
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6231
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6232
__ARG_1.'comment'('try: begin')
.annotate 'line', 6233
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6234
__ARG_1.'comment'('try: end')
.annotate 'line', 6235
__ARG_1.'say'('pop_eh')
.annotate 'line', 6237
self.'annotate'(__ARG_1)
.annotate 'line', 6238
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6240
__ARG_1.'comment'('catch')
.annotate 'line', 6241
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6242
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6243
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6244
__ARG_1.'say'('pop_eh')
.annotate 'line', 6245
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6247
__ARG_1.'comment'('catch end')
.annotate 'line', 6248
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6249

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6135
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6137
addattribute $P0, 'stry'
.annotate 'line', 6138
addattribute $P0, 'modifiers'
.annotate 'line', 6139
addattribute $P0, 'exname'
.annotate 'line', 6140
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6260
# Body
# {
.annotate 'line', 6262
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6263
setattribute self, 'name', __ARG_3
.annotate 'line', 6264
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6265
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6266

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6256
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6258
addattribute $P0, 'name'
.annotate 'line', 6259
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6283
# Body
# {
.annotate 'line', 6285
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6286
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6287
$P4 = $P1.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 6288
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6289
setattribute self, 'name', $P1
.annotate 'line', 6290
# var vdata: $P2
null $P2
.annotate 'line', 6291
# string reg: $S1
null $S1
.annotate 'line', 6293
$P1 = __ARG_2.'get'()
.annotate 'line', 6294
$P5 = $P1.'isop'('[')
if_null $P5, __label_1
unless $P5 goto __label_1
# {
box $P6, 1
.annotate 'line', 6296
setattribute self, 'typearray', $P6
.annotate 'line', 6297
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6298
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6299
$P1 = __ARG_2.'get'()
.annotate 'line', 6300
$P7 = $P1.'isop'(']')
if_null $P7, __label_3
unless $P7 goto __label_3
# {
.annotate 'line', 6302
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6305
__ARG_2.'unget'($P1)
.annotate 'line', 6306
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6307
$P1 = __ARG_2.'get'()
.annotate 'line', 6308
$P8 = $P1.'isop'(']')
isfalse $I1, $P8
unless $I1 goto __label_5
.annotate 'line', 6309
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6310
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P9, 0
.annotate 'line', 6315
setattribute self, 'typearray', $P9
.annotate 'line', 6316
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P2 = self.'createvar'($P9, $P10)
.annotate 'line', 6317
$P10 = $P2.'getreg'()
set $S1, $P10
.annotate 'line', 6318
$P11 = $P1.'isop'('=')
if_null $P11, __label_6
unless $P11 goto __label_6
# {
.annotate 'line', 6320
$P13 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P13
.annotate 'line', 6321
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6325
setattribute self, 'reg', $P11
.annotate 'line', 6326
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6328
$P1 = __ARG_2.'get'()
.annotate 'line', 6329
$P13 = $P1.'isop'('[')
isfalse $I2, $P13
unless $I2 goto __label_8
.annotate 'line', 6330
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6331
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P15
.annotate 'line', 6332
$P1 = __ARG_2.'get'()
.annotate 'line', 6333
$P14 = $P1.'isop'(']')
isfalse $I2, $P14
unless $I2 goto __label_9
# {
.annotate 'line', 6334
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6335
# {
.annotate 'line', 6336
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6337
getattribute $P15, self, 'init'
$P15.'push'($P3)
# }
.annotate 'line', 6338
$P1 = __ARG_2.'get'()
$P16 = $P1.'isop'(',')
if_null $P16, __label_11
if $P16 goto __label_10
__label_11: # enddo
.annotate 'line', 6339
$P17 = $P1.'isop'(']')
isfalse $I3, $P17
unless $I3 goto __label_13
.annotate 'line', 6340
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6342
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6344
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6345

.end # parse


.sub 'optimize' :method

.annotate 'line', 6346
# Body
# {
.annotate 'line', 6348
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6349
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6350
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6351
if_null $P1, __label_1
# {
.annotate 'line', 6352
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6353
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6355
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6357
.return(self)
# }
.annotate 'line', 6358

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6359
# Body
# {
.annotate 'line', 6361
self.'annotate'(__ARG_1)
.annotate 'line', 6362
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6363
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6364
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6365
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6366
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
.annotate 'line', 6367
__ARG_1.'comment'($S10)
.annotate 'line', 6369
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6370
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6371
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6373
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6374
ne $S5, $S4, __label_10
# {
.annotate 'line', 6375
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6376
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6378
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6381
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_15
# {
.annotate 'line', 6383
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6386
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_17
set $S6, $P6
__label_17:
.annotate 'line', 6387
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6388
iseq $I5, $S4, 'S'
unless $I5 goto __label_20
iseq $I5, $S5, 'P'
__label_20:
unless $I5 goto __label_18
# {
.annotate 'line', 6389
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_21
set $S7, $P7
__label_21:
.annotate 'line', 6390
__ARG_1.'emitnull'($S3)
.annotate 'line', 6391
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6392
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6393
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6396
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
.annotate 'line', 6402
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6403
if_null $P2, __label_22
# {
.annotate 'line', 6405
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_24
set $S8, $P8
__label_24:
.annotate 'line', 6406
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6410
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_23: # endif
.annotate 'line', 6412
if_null $P1, __label_25
# {
.annotate 'line', 6413
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_26
set $S9, $P9
__label_26:
.annotate 'line', 6414
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6415
unless_null $P2, __label_27
# {
.annotate 'line', 6416
le $I1, 0, __label_28
# {
.annotate 'line', 6418
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6421
# int i: $I2
null $I2
.annotate 'line', 6422
iter $P10, $P1
set $P10, 0
__label_29: # for iteration
unless $P10 goto __label_30
shift $P3, $P10
# {
.annotate 'line', 6423
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6424
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6425
inc $I2
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6429

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6430
# Body
# {
.annotate 'line', 6432
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6433

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6273
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6275
addattribute $P0, 'name'
.annotate 'line', 6276
addattribute $P0, 't_reg'
.annotate 'line', 6277
addattribute $P0, 't_name'
.annotate 'line', 6278
addattribute $P0, 't_array'
.annotate 'line', 6279
addattribute $P0, 'reg'
.annotate 'line', 6280
addattribute $P0, 'typearray'
.annotate 'line', 6281
addattribute $P0, 'size'
.annotate 'line', 6282
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6436
# Body
# {
.annotate 'line', 6438
# var next: $P1
null $P1
.annotate 'line', 6439
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6440
# {
.annotate 'line', 6441
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6442
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6443
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6444
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6445
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6446
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6447
.return($P2)
# }
.annotate 'line', 6448

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6460
# Body
# {
.annotate 'line', 6463
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6464
setattribute self, 'type', $P1
.annotate 'line', 6465
setattribute self, 'name', __ARG_4
.annotate 'line', 6466
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6467

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6468
# Body
# {
.annotate 'line', 6470
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6471
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6472
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6473
$P1 = $P1.'optimize'()
.annotate 'line', 6474
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6476
getattribute $P4, self, 'start'
.annotate 'line', 6475
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6478
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6479
setattribute self, 'value', $P1
.annotate 'line', 6480
.return(self)
# }
.annotate 'line', 6481

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6482
# Body
# {
.annotate 'line', 6484
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6485

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6486
# Body
# {
.annotate 'line', 6488
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
.annotate 'line', 6489
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6490

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6454
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6456
addattribute $P0, 'type'
.annotate 'line', 6457
addattribute $P0, 'name'
.annotate 'line', 6458
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6493
# Body
# {
.annotate 'line', 6495
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6496
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6497
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6498
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6500
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6501
# {
.annotate 'line', 6502
$P1 = __ARG_2.'get'()
.annotate 'line', 6503
# var name: $P3
set $P3, $P1
.annotate 'line', 6504
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6505
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6507
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6506
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6508
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6509
.return($P2)
# }
.annotate 'line', 6510

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 6519
# Body
# {
.annotate 'line', 6521
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 6522
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6523
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6524
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6525
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6527
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6528
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6529

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6530
# Body
# {
.annotate 'line', 6532
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6533
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6534
.return(self)
# }
.annotate 'line', 6535

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6536
# Body
# {
.annotate 'line', 6538
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6539

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6540
# Body
# {
.annotate 'line', 6542
self.'annotate'(__ARG_1)
.annotate 'line', 6543
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6544
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6545
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
.annotate 'line', 6546
__ARG_1.'comment'($S5)
.annotate 'line', 6547
if_null $P1, __label_2
.annotate 'line', 6548
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6550
if_null $P1, __label_4
# {
.annotate 'line', 6551
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6552
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
.annotate 'line', 6554
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_16
isa $I1, $P1, 'ArrayExpr'
__label_16:
if $I1 goto __label_15
isa $I1, $P1, 'NewExpr'
__label_15:
unless $I1 goto __label_13
.annotate 'line', 6555
$P1.'emit_init'(__ARG_1, $S2)
goto __label_14
__label_13: # else
.annotate 'line', 6557
$P1.'emit'(__ARG_1, $S2)
__label_14: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6562
# string value: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_17
set $S4, $P4
__label_17:
.annotate 'line', 6563
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_8: # default
.annotate 'line', 6566
getattribute $P5, self, 'name'
'SyntaxError'("Invalid var initializer", $P5)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6570
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6571

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6516
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6518
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6576
# Body
# {
.annotate 'line', 6578
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6579
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6580
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6581
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6582

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6583
# Body
# {
.annotate 'line', 6585
self.'annotate'(__ARG_1)
.annotate 'line', 6586
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6587
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
.annotate 'line', 6588
__ARG_1.'comment'($S3)
.annotate 'line', 6589
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6590

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6574
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6597
# Body
# {
.annotate 'line', 6599
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6600
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6601
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6602
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6603
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6604
$P1 = __ARG_2.'get'()
.annotate 'line', 6605
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6606
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6607

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6608
# Body
# {
.annotate 'line', 6610
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6611
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6612

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6613
# Body
# {
.annotate 'line', 6615
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6616
self.'annotate'(__ARG_1)
.annotate 'line', 6617
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6618
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
.annotate 'line', 6619
__ARG_1.'comment'($S4)
.annotate 'line', 6620
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6621

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6593
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6595
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6624
# Body
# {
.annotate 'line', 6626
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6627
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6628
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6629
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6630
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6631
$P2 = __ARG_2.'get'()
.annotate 'line', 6632
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6633
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6635
__ARG_2.'unget'($P2)
.annotate 'line', 6636
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
.annotate 'line', 6640
__ARG_2.'unget'($P2)
.annotate 'line', 6641
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6643

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6645
# Body
# {
.annotate 'line', 6647
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6648
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6649
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 6650
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 6651

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6659
# Body
# {
box $P1, 'S'
.annotate 'line', 6661
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6662
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6663
setattribute self, 't_array', $P2
.annotate 'line', 6664
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6665

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6666
# Body
# {
.annotate 'line', 6668
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6669

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6657
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6672
# Body
# {
.annotate 'line', 6674
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6675

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6677
# Body
# {
.annotate 'line', 6679
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6680
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6681

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6689
# Body
# {
box $P1, 'I'
.annotate 'line', 6691
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6692
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6693
setattribute self, 't_array', $P2
.annotate 'line', 6694
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6695

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6696
# Body
# {
.annotate 'line', 6698
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6699

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6687
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6702
# Body
# {
.annotate 'line', 6704
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6705

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6707
# Body
# {
.annotate 'line', 6709
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6710
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6711

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6719
# Body
# {
box $P1, 'N'
.annotate 'line', 6721
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6723
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6724
setattribute self, 't_array', $P2
.annotate 'line', 6725
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6726

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6727
# Body
# {
.annotate 'line', 6729
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6730

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6717
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6733
# Body
# {
.annotate 'line', 6735
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6736

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6738
# Body
# {
.annotate 'line', 6740
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6741
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6742

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6755
# Body
# {
.annotate 'line', 6757
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6758
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6759
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6760
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6761
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6762
__ARG_2.'unget'($P1)
.annotate 'line', 6763
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6764
unless_null $P2, __label_2
.annotate 'line', 6765
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 6766
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6768
setattribute self, 'end', $P1
# }
.annotate 'line', 6769

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6770
# Body
# {
.annotate 'line', 6772
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6773
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6774
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6775
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6776
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6777
.return($S2)
# }
.annotate 'line', 6778

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6779
# Body
# {
.annotate 'line', 6781
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6782
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6783
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6784
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6785
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6786
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6787
$P1[$S1] = $S3
.annotate 'line', 6788
.return($S3)
# }
.annotate 'line', 6789

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6790
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6791
# Body
# {
.annotate 'line', 6793
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6794
.return(self)
# }
.annotate 'line', 6795

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6796
# Body
# {
.annotate 'line', 6798
__ARG_1.'comment'('{')
.annotate 'line', 6799
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6800
$P1.'emit'(__ARG_1)
.annotate 'line', 6801
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6803
__ARG_1.'comment'('}')
# }
.annotate 'line', 6804

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6748
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6750
addattribute $P0, 'statements'
.annotate 'line', 6751
addattribute $P0, 'end'
.annotate 'line', 6752
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6817
# Body
# {
box $P3, 1
.annotate 'line', 6820
setattribute self, 'nreg', $P3
.annotate 'line', 6821
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6822
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6823
setattribute self, 'tempreg', $P1
.annotate 'line', 6824
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6825

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6826
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6828
setattribute self, 'type', $P1
.annotate 'line', 6829
.return(self)
# }
.annotate 'line', 6830

.end # settype


.sub 'createreg' :method

.annotate 'line', 6831
# Body
# {
.annotate 'line', 6833
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6834
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6835
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6837
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 6839
.return($S1)
# }
.annotate 'line', 6840

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6841
# Body
# {
.annotate 'line', 6843
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6844
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6845
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6846
# string reg: $S1
null $S1
.annotate 'line', 6847
le $I1, 0, __label_0
.annotate 'line', 6848
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6850
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6851
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6853
.return($S1)
# }
.annotate 'line', 6854

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6855
# Body
# {
.annotate 'line', 6857
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6858
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6859
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6860
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6861

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6813
addattribute $P0, 'type'
.annotate 'line', 6814
addattribute $P0, 'nreg'
.annotate 'line', 6815
addattribute $P0, 'tempreg'
.annotate 'line', 6816
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6885
# Body
# {
.annotate 'line', 6887
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6888
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
box $P1, 0
.annotate 'line', 6889
setattribute self, 'nlabel', $P1
.annotate 'line', 6890
new $P4, [ 'RegisterStore' ]
$P3 = $P4.'settype'('I')
setattribute self, 'regstI', $P3
.annotate 'line', 6891
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('N')
setattribute self, 'regstN', $P5
.annotate 'line', 6892
new $P7, [ 'RegisterStore' ]
$P6 = $P7.'settype'('S')
setattribute self, 'regstS', $P6
.annotate 'line', 6893
new $P9, [ 'RegisterStore' ]
$P8 = $P9.'settype'('P')
setattribute self, 'regstP', $P8
# }
.annotate 'line', 6894

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 6896
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 6897
# Body
# {
.annotate 'line', 6900
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 6901
unless_null $P1, __label_0
# {
.annotate 'line', 6902
$P1 = self.'generatesubid'()
.annotate 'line', 6903
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 6905
.return($P1)
# }
.annotate 'line', 6906

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6908
# Body
# {
.annotate 'line', 6910
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6911
.return($I1)
# }
.annotate 'line', 6912

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6913
# Body
# {
.annotate 'line', 6915
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 6916
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6917
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6918
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 6919
# {
.annotate 'line', 6920
$P2 = __ARG_1.'get'()
.annotate 'line', 6921
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 6922
eq $S1, '', __label_5
.annotate 'line', 6923
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 6926
# string argname: $S2
# predefined string
$P6 = self.'getparamnum'()
set $S4, $P6
concat $S2, '__ARG_', $S4
.annotate 'line', 6927
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 6929
# string varname: $S3
set $P7, $P2
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 6930
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 6931
$P3['name'] = $S3
.annotate 'line', 6932
$P2 = __ARG_1.'get'()
.annotate 'line', 6933
$P7 = $P2.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 6934
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 6935
$P3['modifiers'] = $P4
.annotate 'line', 6936
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 6938
$P1.'push'($P3)
# }
.annotate 'line', 6939
$P8 = $P2.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 6940
$P8 = $P2.'isop'(')')
isfalse $I1, $P8
unless $I1 goto __label_9
.annotate 'line', 6941
'SyntaxError'("Expected ')'", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 6943

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 6945
# Body
# {
.annotate 'line', 6947
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 6948
unless_null $P1, __label_0
.annotate 'line', 6949
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 6951
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 6952

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 6954
# Body
# {
.annotate 'line', 6956
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6957
.return(self)
# }
.annotate 'line', 6958

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6960
# Body
# {
.annotate 'line', 6962
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 6963
unless_null $P1, __label_0
# {
.annotate 'line', 6964
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6965
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6967
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6968

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 6969
# Body
# {
.annotate 'line', 6971
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 6972
unless_null $P1, __label_0
# {
.annotate 'line', 6973
root_new $P1, ['parrot';'Hash']
.annotate 'line', 6974
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 6976
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 6977

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 6978
# Body
# {
.annotate 'line', 6982
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 6983
# string lexname: $S1
null $S1
.annotate 'line', 6984
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 6985
# {
.annotate 'line', 6987
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 6988
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 6989
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 6990
self.'setlex'($S1, $S2)
.annotate 'line', 6991
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 6993
.return($S1)
# }
.annotate 'line', 6994

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 6996
# Body
# {
.annotate 'line', 6998
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 6999
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
.annotate 'line', 7001
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7003
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7005
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7007
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7009
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 7011
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7012
.return($S1)
# }
.annotate 'line', 7013

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7014
# Body
# {
.annotate 'line', 7016
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7017
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
.annotate 'line', 7019
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7021
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7023
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7025
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7027
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 7029
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7030
.return($S1)
# }
.annotate 'line', 7031

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7032
# Body
# {
.annotate 'line', 7034
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
.annotate 'line', 7035
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7036

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7037
# Body
# {
.annotate 'line', 7039
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7040
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7041
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 7043
.return($S1)
# }
.annotate 'line', 7044

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7045
# Body
# {
.annotate 'line', 7047
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7048

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7049
# Body
# {
.annotate 'line', 7051
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7052

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7054
# Body
# {
.annotate 'line', 7056
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 7057
__ARG_1.'say'()
.annotate 'line', 7058
__ARG_1.'print'(".sub ")
.annotate 'line', 7059
$P19 = self.'isanonymous'()
if_null $P19, __label_1
unless $P19 goto __label_1
.annotate 'line', 7060
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7062
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7063
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7064
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7065
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7066
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7067
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7068
if_null $P2, __label_5
.annotate 'line', 7069
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7073
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 7074
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7075
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7076
if_null $P3, __label_7
# {
.annotate 'line', 7077
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7078
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7079
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 7080
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 7081
le $I1, 0, __label_11
# {
.annotate 'line', 7082
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7083
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7084
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7085
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 7086
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 7087
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 7083
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7089
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
.annotate 'line', 7094
ne $S1, 'main', __label_16
.annotate 'line', 7095
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7097
__ARG_1.'say'()
.annotate 'line', 7099
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7100
# var param: $P8
null $P8
.annotate 'line', 7101
# string paramname: $S2
null $S2
.annotate 'line', 7102
# var a: $P9
null $P9
.annotate 'line', 7104
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7105
$S2 = $P8['name']
.annotate 'line', 7106
$P9 = self.'getvar'($S2)
.annotate 'line', 7107
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7108
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7109
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7110
if_null $P10, __label_20
# {
.annotate 'line', 7111
# var named: $P11
null $P11
.annotate 'line', 7112
# var slurpy: $P12
null $P12
.annotate 'line', 7113
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7114
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7115
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7116
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
.annotate 'line', 7124
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7127
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7132
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7135
if_null $P11, __label_31
# {
.annotate 'line', 7136
# string setname: $S5
null $S5
.annotate 'line', 7137
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7138
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
.annotate 'line', 7143
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7144
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7145
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7146
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7149
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7151
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7153
if_null $P12, __label_38
# {
.annotate 'line', 7154
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7158
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7160
__ARG_1.'say'()
.annotate 'line', 7161
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7164
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7165
if_null $P16, __label_39
# {
.annotate 'line', 7167
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
.annotate 'line', 7168
$P31 = $P16[$S6]
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7171
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7172
if_null $P16, __label_42
# {
.annotate 'line', 7174
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
.annotate 'line', 7175
$P32 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7178
__ARG_1.'comment'('Body')
.annotate 'line', 7179
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7181
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7182
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7185
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7186
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7188
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I6, $P17
ge $I4, $I6, __label_47
# {
.annotate 'line', 7189
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7190
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7188
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7193

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 6868
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6870
addattribute $P0, 'name'
.annotate 'line', 6871
addattribute $P0, 'subid'
.annotate 'line', 6872
addattribute $P0, 'modifiers'
.annotate 'line', 6873
addattribute $P0, 'params'
.annotate 'line', 6874
addattribute $P0, 'body'
.annotate 'line', 6875
addattribute $P0, 'regstI'
.annotate 'line', 6876
addattribute $P0, 'regstN'
.annotate 'line', 6877
addattribute $P0, 'regstS'
.annotate 'line', 6878
addattribute $P0, 'regstP'
.annotate 'line', 6879
addattribute $P0, 'nlabel'
.annotate 'line', 6880
addattribute $P0, 'localfun'
.annotate 'line', 6881
addattribute $P0, 'lexicals'
.annotate 'line', 6882
addattribute $P0, 'usedlexicals'
.annotate 'line', 6883
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7205
# Body
# {
.annotate 'line', 7207
self.'FunctionBase'(__ARG_1, __ARG_3)
box $P1, 0
.annotate 'line', 7208
setattribute self, 'paramnum', $P1
box $P1, 0
.annotate 'line', 7209
setattribute self, 'lexnum', $P1
.annotate 'line', 7210
self.'parse'(__ARG_2)
# }
.annotate 'line', 7211

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7213
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7214
# Body
# {
.annotate 'line', 7217
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7218
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7220
.return($I1)
# }
.annotate 'line', 7221

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7222
# Body
# {
.annotate 'line', 7225
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7226
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7228
.return($I1)
# }
.annotate 'line', 7229

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7230
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7232
# Body
# {
.annotate 'line', 7234
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7235
setattribute self, 'name', $P1
.annotate 'line', 7236
$P1 = __ARG_1.'get'()
.annotate 'line', 7237
$P3 = $P1.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7238
# var modifiers: $P2
new $P2, [ 'ModifierList' ]
$P2.'ModifierList'(__ARG_1, self)
.annotate 'line', 7239
setattribute self, 'modifiers', $P2
.annotate 'line', 7240
$P1 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7242
$P4 = $P1.'isop'('(')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 7243
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 7244
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7246
$P1 = __ARG_1.'get'()
.annotate 'line', 7247
$P5 = $P1.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 7248
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 7249
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P1, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7250
.return(self)
# }
.annotate 'line', 7251

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7200
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7202
addattribute $P0, 'paramnum'
.annotate 'line', 7203
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7260
# Body
# {
.annotate 'line', 7262
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7263
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7264
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7265
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7266
setattribute self, 'name', $P1
.annotate 'line', 7267
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7268
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7269
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_0
.annotate 'line', 7270
'Expected'('{', $P2)
__label_0: # endif
.annotate 'line', 7271
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_2, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7272
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7273

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7274
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7275
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7276
# Body
# {
.annotate 'line', 7278
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7279

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7280
# Body
# {
.annotate 'line', 7283
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7284

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7285
# Body
# {
.annotate 'line', 7288
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7289

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7290
# Body
# {
.annotate 'line', 7292
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7293
unless_null $P1, __label_0
# {
.annotate 'line', 7296
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7297
unless_null $P1, __label_1
# {
.annotate 'line', 7299
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7300
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7301
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7302
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7303
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7304
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7305
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7309
$P8 = $P1.'gettype'()
set $S5, $P8
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I2, $P9
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7310
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7311
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7312
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7313
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7314
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7315
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7316
# int flags: $I1
$P10 = $P1.'isvolatile'()
if_null $P10, __label_13
unless $P10 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7317
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
box $P11, $S3
.annotate 'line', 7318
setattribute $P1, 'lexname', $P11
.annotate 'line', 7319
# string reg: $S4
$P11 = $P1.'getreg'()
null $S4
if_null $P11, __label_14
set $S4, $P11
__label_14:
.annotate 'line', 7320
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
.annotate 'line', 7325
isnull $I3, $P1
not $I3
unless $I3 goto __label_16
isa $I4, $P1, 'VarData'
not $I3, $I4
__label_16:
unless $I3 goto __label_15
.annotate 'line', 7326
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7327
.return($P1)
# }
.annotate 'line', 7328

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7258
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7337
# Body
# {
.annotate 'line', 7339
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7340

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7341
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7335
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

.annotate 'line', 7358
# Body
# {
.annotate 'line', 7360
setattribute self, 'owner', __ARG_1
.annotate 'line', 7361
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7362

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7363
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7365
# Body
# {
.annotate 'line', 7367
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7368

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7356
addattribute $P0, 'owner'
.annotate 'line', 7357
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7374
# Body
# {
.annotate 'line', 7376
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7377
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7378

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7379
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7381
# Body
# {
.annotate 'line', 7383
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7384
__ARG_1.'print'($S1)
# }
.annotate 'line', 7385

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7371
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7373
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7392
# Body
# {
.annotate 'line', 7394
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7395
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7396
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7397
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7398
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7399
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7400
$P2 = __ARG_1.'get'()
.annotate 'line', 7401
$P4 = $P2.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 7402
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
.annotate 'line', 7404
setattribute self, 'hll', $P6
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7408
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7410
# {
.annotate 'line', 7411
$P2 = __ARG_1.'get'()
.annotate 'line', 7412
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7413
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7414
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7415
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7416
$P7 = $P2.'isop'(']')
isfalse $I2, $P7
unless $I2 goto __label_10
.annotate 'line', 7417
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7419
setattribute self, 'key', $P1
# }
.annotate 'line', 7420

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7421
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7422
# Body
# {
# predefined int
.annotate 'line', 7424
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7425

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7427
# Body
# {
.annotate 'line', 7429
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7430

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7388
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7390
addattribute $P0, 'key'
.annotate 'line', 7391
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7436
# Body
# {
.annotate 'line', 7438
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7439
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7440
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7441
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7442
$P2 = __ARG_1.'get'()
.annotate 'line', 7443
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7445
__ARG_1.'unget'($P2)
.annotate 'line', 7446
setattribute self, 'key', $P1
# }
.annotate 'line', 7447

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7448
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7450
# Body
# {
.annotate 'line', 7452
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7453
.return($P2)
# }
.annotate 'line', 7454

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7456
# Body
# {
.annotate 'line', 7458
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7459
unless_null $P1, __label_0
# {
.annotate 'line', 7460
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7461
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7463
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7464

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7433
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7435
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7467
# Body
# {
.annotate 'line', 7469
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7470
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7471
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7472
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7473
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7474
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7475
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7476
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7477

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7494
# Body
# {
.annotate 'line', 7496
setattribute self, 'parent', __ARG_2
.annotate 'line', 7497
setattribute self, 'owner', __ARG_2
.annotate 'line', 7498
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7499
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7500
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7501
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7503
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7504
setattribute self, 'name', $P1
.annotate 'line', 7505
$P1 = __ARG_1.'get'()
.annotate 'line', 7506
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7507
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7508
# {
.annotate 'line', 7509
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7510
$P2.'push'($P3)
.annotate 'line', 7511
$P1 = __ARG_1.'get'()
.annotate 'line', 7512
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
.annotate 'line', 7515
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7516
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7517
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7518
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7519
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7520
# var f: $P4
new $P4, [ 'MethodStatement' ]
$P4.'MethodStatement'($P1, __ARG_1, self)
.annotate 'line', 7521
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7522
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7524
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7525
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7526
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7527
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7528
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7529
$P1 = __ARG_1.'get'()
.annotate 'line', 7530
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 7531
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7533
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7534
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7535
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7536
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7539
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7540
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7542
# var classns: $P9
getattribute $P22, self, 'parent'
$P9 = $P22.'getpath'()
.annotate 'line', 7543
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7544
setattribute self, 'classns', $P9
# }
.annotate 'line', 7545

.end # ClassStatement


.sub 'generatesubid' :method

.annotate 'line', 7546
# Body
# {
.annotate 'line', 7548
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7549

.end # generatesubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7550
# Body
# {
.annotate 'line', 7552
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7553

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7554
# Body
# {
.annotate 'line', 7556
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7557

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7558
# Body
# {
.annotate 'line', 7560
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7561

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7562
# Body
# {
.annotate 'line', 7564
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7565
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7566
.return(self)
# }
.annotate 'line', 7567

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7568
# Body
# {
.annotate 'line', 7570
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7571

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7572
# Body
# {
.annotate 'line', 7574
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7575
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7576
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7577
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7579
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7581
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7582
# int n: $I1
set $I1, 1
.annotate 'line', 7583
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7584
$P3.'annotate'(__ARG_1)
.annotate 'line', 7585
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7586
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7587
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7588
__ARG_1.'say'()
.annotate 'line', 7589
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7591
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7592
__ARG_1.'annotate'($P4)
.annotate 'line', 7593
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7596
__ARG_1.'say'('.end')
# }
.annotate 'line', 7597

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7483
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7485
addattribute $P0, 'parent'
.annotate 'line', 7486
addattribute $P0, 'owner'
.annotate 'line', 7487
addattribute $P0, 'name'
.annotate 'line', 7488
addattribute $P0, 'bases'
.annotate 'line', 7489
addattribute $P0, 'constants'
.annotate 'line', 7490
addattribute $P0, 'functions'
.annotate 'line', 7491
addattribute $P0, 'members'
.annotate 'line', 7492
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7604
# Body
# {
.annotate 'line', 7606
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7607
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7608
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7609
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7610
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7611
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7616
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7617
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7618
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7619
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7620
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7621
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7622
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7623
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 7621
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
.annotate 'line', 7628
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7629
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7634
load_bytecode 'PGE.pbc'
.annotate 'line', 7635
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7636
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7638
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
.annotate 'line', 7639
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7640
$P8 = $P7($S4)
.annotate 'line', 7641
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7642
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7643
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7644
# int ivalue: $I1
null $I1
.annotate 'line', 7645
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7646
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7651
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7650
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7649
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7638
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7655
$P5.'close'()
# }
.annotate 'line', 7656

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7668
# Body
# {
.annotate 'line', 7670
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7671
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7672
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7673
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7674

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7675
# Body
# {
.annotate 'line', 7677
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7678
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7679
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7680
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7681
.return($P4)
# }
.annotate 'line', 7682

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7683
# Body
# {
.annotate 'line', 7687
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
.annotate 'line', 7689
.return($P5)
__label_3: # case
.annotate 'line', 7692
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7697
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7698
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7699
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7700
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7701
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7703
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7704
if_null $P4, __label_8
.annotate 'line', 7705
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7709
.return($P5)
# }
.annotate 'line', 7710

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7711
# Body
# {
.annotate 'line', 7713
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7714
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7715
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7717
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7719
# var start: $P2
set $P2, $P1
.annotate 'line', 7720
$P1 = __ARG_1.'get'()
.annotate 'line', 7721
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7722
$P1 = __ARG_1.'get'()
.annotate 'line', 7724
# var modifier: $P3
null $P3
.annotate 'line', 7725
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7726
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7727
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7730
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7731
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7732
# var child: $P4
new $P4, [ 'NamespaceStatement' ]
$P4.'NamespaceStatement'(self, $P2, $S1, $P3)
.annotate 'line', 7733
getattribute $P12, self, 'namespaces'
$P12.'push'($P4)
.annotate 'line', 7734
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7735
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7737
$P13 = $P1.'iskeyword'('const')
if_null $P13, __label_7
unless $P13 goto __label_7
# {
.annotate 'line', 7738
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7739
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7741
$P14 = $P1.'iskeyword'('function')
if_null $P14, __label_9
unless $P14 goto __label_9
# {
.annotate 'line', 7742
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P1, __ARG_1, self)
.annotate 'line', 7743
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7744
$P7.'push'($P6)
.annotate 'line', 7745
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7747
$P15 = $P1.'iskeyword'('class')
if_null $P15, __label_11
unless $P15 goto __label_11
# {
.annotate 'line', 7748
# var c: $P8
new $P8, [ 'ClassStatement' ]
$P8.'ClassStatement'(__ARG_1, self)
.annotate 'line', 7749
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7750
$P9.'push'($P8)
.annotate 'line', 7751
getattribute $P16, self, 'items'
$P16.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7753
$P16 = $P1.'iskeyword'('using')
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 7754
$P1 = __ARG_1.'get'()
.annotate 'line', 7755
$P17 = $P1.'iskeyword'('extern')
isfalse $I4, $P17
unless $I4 goto __label_15
.annotate 'line', 7756
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7757
$P1 = __ARG_1.'get'()
.annotate 'line', 7758
$P17 = $P1.'isstring'()
isfalse $I5, $P17
unless $I5 goto __label_16
.annotate 'line', 7759
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7760
# string reqlib: $S2
set $P18, $P1
null $S2
if_null $P18, __label_17
set $S2, $P18
__label_17:
.annotate 'line', 7761
self.'addlib'($S2)
.annotate 'line', 7762
$P1 = __ARG_1.'get'()
.annotate 'line', 7763
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7765
$P18 = $P1.'iskeyword'('$include_const')
if_null $P18, __label_18
unless $P18 goto __label_18
# {
.annotate 'line', 7766
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7768
$P19 = $P1.'iskeyword'('$load')
if_null $P19, __label_20
unless $P19 goto __label_20
# {
.annotate 'line', 7769
$P1 = __ARG_1.'get'()
.annotate 'line', 7770
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_22
.annotate 'line', 7771
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7772
# string reqload: $S3
set $P20, $P1
null $S3
if_null $P20, __label_23
set $S3, $P20
__label_23:
.annotate 'line', 7773
self.'addload'($S3)
.annotate 'line', 7774
$P1 = __ARG_1.'get'()
.annotate 'line', 7775
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7777
$P20 = $P1.'isop'('}')
if_null $P20, __label_24
unless $P20 goto __label_24
# {
.annotate 'line', 7778
self.'close_ns'($P1)
.annotate 'line', 7779
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7782
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
.annotate 'line', 7784
self.'unclosed_ns'()
# }
.annotate 'line', 7785

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7786
# Body
# {
.annotate 'line', 7788
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7789

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7790
# Body
# {
.annotate 'line', 7792
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7793
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7795
# int activate: $I1
set $I1, 1
.annotate 'line', 7796
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7797
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7798
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
unless $I1 goto __label_6
.annotate 'line', 7801
# {
.annotate 'line', 7802
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7803
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7805
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7807

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7660
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7662
addattribute $P0, 'namespaces'
.annotate 'line', 7663
addattribute $P0, 'classes'
.annotate 'line', 7664
addattribute $P0, 'functions'
.annotate 'line', 7665
addattribute $P0, 'items'
.annotate 'line', 7666
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7822
# Body
# {
.annotate 'line', 7825
setattribute self, 'parent', __ARG_1
.annotate 'line', 7826
setattribute self, 'start', __ARG_2
.annotate 'line', 7827
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7828
setattribute self, 'name', $P2
.annotate 'line', 7829
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7830
if_null __ARG_4, __label_0
# {
.annotate 'line', 7831
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7832
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7834

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 7835
# Body
# {
.annotate 'line', 7837
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7838

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7839
# Body
# {
.annotate 'line', 7841
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7842

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7843
# Body
# {
.annotate 'line', 7845
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7846
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7847
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7848
.return($P1)
# }
.annotate 'line', 7849

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7850
# Body
# {
.annotate 'line', 7852
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7853

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7854
# Body
# {
.annotate 'line', 7856
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7857

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7858
# Body
# {
.annotate 'line', 7860
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7861
unless_null $P1, __label_0
.annotate 'line', 7862
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7864
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7865

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7866
# Body
# {
.annotate 'line', 7870
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7871
unless_null $P1, __label_0
.annotate 'line', 7872
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7873
.return($P1)
# }
.annotate 'line', 7874

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7875
# Body
# {
.annotate 'line', 7877
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7878

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7879
# Body
# {
# }
.annotate 'line', 7882

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7883
# Body
# {
.annotate 'line', 7885
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7886
if_null $P1, __label_0
# {
.annotate 'line', 7887
$P1 = $P1.'optimize'()
.annotate 'line', 7888
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7890
self.'optimize_base'()
.annotate 'line', 7891
.return(self)
# }
.annotate 'line', 7892

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7893
# Body
# {
.annotate 'line', 7895
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7896
if_null $P1, __label_0
.annotate 'line', 7897
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7899
self.'emit_base'(__ARG_1)
.annotate 'line', 7901
if_null $P1, __label_1
.annotate 'line', 7902
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7903

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7814
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7816
addattribute $P0, 'parent'
.annotate 'line', 7817
addattribute $P0, 'start'
.annotate 'line', 7818
addattribute $P0, 'name'
.annotate 'line', 7819
addattribute $P0, 'modifier'
.annotate 'line', 7820
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7917
# Body
# {
.annotate 'line', 7919
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 7920
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 7921

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7922
# Body
# {
.annotate 'line', 7924
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7925
$P1[__ARG_1] = 1
# }
.annotate 'line', 7926

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 7927
# Body
# {
.annotate 'line', 7929
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7930
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 7931

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 7933
# Body
# {
.annotate 'line', 7935
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 7936
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7937
inc $I1
assign $P1, $I1
.annotate 'line', 7939
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 7940
.return($S1)
# }
.annotate 'line', 7941

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7943
# Body
# {
.annotate 'line', 7945
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 7946
unless_null $P1, __label_0
# {
.annotate 'line', 7947
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7948
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 7950
$P1[__ARG_1] = 1
# }
.annotate 'line', 7951

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 7952
# Body
# {
.annotate 'line', 7954
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 7955
unless_null $P1, __label_0
# {
.annotate 'line', 7956
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7957
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 7959
$P1[__ARG_1] = 1
# }
.annotate 'line', 7960

.end # addload


.sub 'getpath' :method

.annotate 'line', 7961
# Body
# {
.annotate 'line', 7963
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7964
.return($P1)
# }
.annotate 'line', 7965

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7966
# Body
# {
.annotate 'line', 7968
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 7969

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7970
# Body
# {
.annotate 'line', 7973
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 7974

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7975
# Body
# {
# }
.annotate 'line', 7978

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7979
# Body
# {
.annotate 'line', 7981
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 7982

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7983
# Body
# {
.annotate 'line', 7985
self.'optimize_base'()
.annotate 'line', 7986
.return(self)
# }
.annotate 'line', 7987

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7988
# Body
# {
.annotate 'line', 7990
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 7993
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 7994
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 7997
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
.annotate 'line', 8000
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8001
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8002
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8003
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8006
# int somelib: $I1
null $I1
.annotate 'line', 8007
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8008
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 8010
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8011
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8014
# int someload: $I2
null $I2
.annotate 'line', 8015
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8016
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 8018
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8019
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8020
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8021
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 8023
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 8024
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8026
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8027

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7910
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7912
addattribute $P0, 'predefs_used'
.annotate 'line', 7913
addattribute $P0, 'libs'
.annotate 'line', 7914
addattribute $P0, 'loads'
.annotate 'line', 7915
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 8039
# Body
# {
.annotate 'line', 8041
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 8044
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8048
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8047
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8046
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8052
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8051
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8050
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8058
new $P9, [ 'StringLiteral' ]
.annotate 'line', 8059
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
.annotate 'line', 8057
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 8062
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8063

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8064
# Body
# {
.annotate 'line', 8066
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8067

.end # parse


.sub 'optimize' :method

.annotate 'line', 8068
# Body
# {
.annotate 'line', 8070
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8071

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8072
# Body
# {
.annotate 'line', 8074
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8075
__ARG_1.'say'('')
.annotate 'line', 8077
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8079
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8080

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 8038
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1

.annotate 'line', 8087
# Body
# {
.annotate 'line', 8089
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8091
$P1.'open'('__eval__', 'w')
.annotate 'line', 8092
$P1.'puts'(__ARG_1)
.annotate 'line', 8093
$P1.'close'()
.annotate 'line', 8094
$P1.'open'('__eval__', 'r')
.annotate 'line', 8095
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8096
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8097
$P3.'parse'($P2)
.annotate 'line', 8098
$P1.'close'()
.annotate 'line', 8099
$P3.'optimize'()
.annotate 'line', 8100
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8101
$P4.'open'('__eval__', 'w')
.annotate 'line', 8102
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8103
$P5.'initialize'($P4)
.annotate 'line', 8104
$P3.'emit'($P5)
.annotate 'line', 8105
$P5.'close'()
.annotate 'line', 8106
$P4.'close'()
.annotate 'line', 8107
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8108
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8109
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8110
.return($P7)
# }
.annotate 'line', 8111

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 8112
# Body
# {
.annotate 'line', 8114
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8115
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8116
$P1.'encoding'('utf8')
.annotate 'line', 8117
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8118
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8119
$P3.'parse'($P2)
.annotate 'line', 8120
$P1.'close'()
.annotate 'line', 8121
$P3.'optimize'()
.annotate 'line', 8122
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8123
$P4.'initialize'(__ARG_2)
.annotate 'line', 8124
$P3.'emit'($P4)
.annotate 'line', 8125
$P4.'close'()
# }
.annotate 'line', 8126

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 8127
# Body
# {
.annotate 'line', 8129
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8130
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8131
$P1.'encoding'('utf8')
.annotate 'line', 8132
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8133
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8134
$P3.'parse'($P2)
.annotate 'line', 8135
$P1.'close'()
.annotate 'line', 8136
$P3.'optimize'()
.annotate 'line', 8137
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8138
$P4.'open'('__eval__', 'w')
.annotate 'line', 8139
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8140
$P5.'initialize'($P4)
.annotate 'line', 8141
$P3.'emit'($P5)
.annotate 'line', 8142
$P5.'close'()
.annotate 'line', 8143
$P4.'close'()
.annotate 'line', 8144
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8145
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8146
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8147
.return($P7)
# }
.annotate 'line', 8148

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 8153
# Body
# {
.annotate 'line', 8155
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 8156
$P1.'parse'(__ARG_1)
.annotate 'line', 8158
$P1.'optimize'()
.annotate 'line', 8160
# var handle: $P2
null $P2
.annotate 'line', 8161
ne __ARG_2, '-', __label_0
.annotate 'line', 8162
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 8164
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 8165
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8166
$P3.'initialize'($P2)
.annotate 'line', 8167
$P1.'emit'($P3)
.annotate 'line', 8168
$P3.'close'()
.annotate 'line', 8169
$P2.'close'()
# }
.annotate 'line', 8170

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8176
# Body
# {
.annotate 'line', 8178
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8179
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8180

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8182
# Body
# {
.annotate 'line', 8184
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8185
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8186
$P1.'notOptStop'(1)
.annotate 'line', 8187
$P1.'push_string'('o=s')
.annotate 'line', 8188
$P1.'push_string'('e=s')
.annotate 'line', 8189
$P1.'push_string'('c')
.annotate 'line', 8190
$P1.'push_string'('noan')
.annotate 'line', 8192
__ARG_1.'shift'()
.annotate 'line', 8193
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8194
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8195
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8196
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8197
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8199
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 8200
# string filename: $S1
null $S1
.annotate 'line', 8201
# string expr: $S2
null $S2
.annotate 'line', 8202
# var file: $P7
null $P7
.annotate 'line', 8203
unless_null $P4, __label_0
# {
.annotate 'line', 8204
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 8205
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 8207
$S1 = __ARG_1[0]
.annotate 'line', 8208
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 8209
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8214
new $P7, [ 'StringHandle' ]
.annotate 'line', 8215
$P7.'open'('__eval__', 'w')
.annotate 'line', 8216
$P7.'puts'($S2)
.annotate 'line', 8217
$P7.'close'()
.annotate 'line', 8218
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 8221
# var t: $P8
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P7, $S1)
.annotate 'line', 8223
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8224
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 8226
'winxed_parser'($P8, $S3)
.annotate 'line', 8228
$P7.'close'()
# }
.annotate 'line', 8229

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8231
# Body
# {
.annotate 'line', 8233
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8239
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8233
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8242
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8243
# predefined say
print 'Error: '
say $S1
.annotate 'line', 8244
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8245
# int i: $I1
set $I1, 1
.annotate 'line', 8246
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8247
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8248
# string subname: $S2
null $S2
.annotate 'line', 8249
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8251
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8252
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
.annotate 'line', 8254
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8255
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8256
eq $S4, '', __label_8
# {
.annotate 'line', 8257
# int line: $I2
$I2 = $P5['line']
set $I4, $I1
.annotate 'line', 8258
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
.annotate 'line', 8262

.end # main

# End generated code
