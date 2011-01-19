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
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 869
# Body
# {
.annotate 'line', 871
# int pos: $I1
# predefined indexof
index $I1, __ARG_2, '{res}'
.annotate 'line', 872
iseq $I2, __ARG_1, 'v'
unless $I2 goto __label_1
isne $I2, $I1, -1
__label_1:
unless $I2 goto __label_0
.annotate 'line', 873
'InternalError'('void predef with {res}')
__label_0: # endif
.annotate 'line', 874
isne $I2, __ARG_1, 'v'
unless $I2 goto __label_3
iseq $I2, $I1, -1
__label_3:
unless $I2 goto __label_2
.annotate 'line', 875
'InternalError'('non void predef without {res}')
__label_2: # endif
box $P1, __ARG_2
.annotate 'line', 876
setattribute self, 'body', $P1
box $P1, __ARG_1
.annotate 'line', 877
setattribute self, 'typeresult', $P1
# }
.annotate 'line', 878

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 879
# Body
# {
.annotate 'line', 881
# string body: $S1
getattribute $P1, self, 'body'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 882
# string typeresult: $S2
getattribute $P1, self, 'typeresult'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 884
# int pos: $I1
null $I1
.annotate 'line', 885
ne $S2, 'v', __label_2
# {
.annotate 'line', 886
isnull $I4, __ARG_3
not $I4
unless $I4 goto __label_5
isne $I4, __ARG_3, ''
__label_5:
unless $I4 goto __label_4
.annotate 'line', 887
'SyntaxError'('using return value from void predef')
__label_4: # endif
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 890
isnull $I4, __ARG_3
if $I4 goto __label_7
iseq $I4, __ARG_3, ''
__label_7:
unless $I4 goto __label_6
.annotate 'line', 891
'InternalError'('Bad result in non void predef')
__label_6: # endif
__label_9: # while
.annotate 'line', 892
# predefined indexof
index $I1, $S1, '{res}'
eq $I1, -1, __label_8
.annotate 'line', 893
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
.annotate 'line', 896
# int n: $I2
set $P2, __ARG_4
set $I2, $P2
# for loop
.annotate 'line', 897
# int i: $I3
null $I3
__label_12: # for condition
ge $I3, $I2, __label_11
# {
.annotate 'line', 898
# string argmark: $S3
set $S6, $I3
concat $S5, '{arg', $S6
concat $S3, $S5, '}'
.annotate 'line', 899
# string arg: $S4
$S4 = __ARG_4[$I3]
__label_14: # while
.annotate 'line', 900
# predefined indexof
index $I1, $S1, $S3
eq $I1, -1, __label_13
.annotate 'line', 901
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
.annotate 'line', 897
inc $I3
goto __label_12
__label_11: # for end
.annotate 'line', 903
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 904
__ARG_1.'say'($S1)
# }
.annotate 'line', 905

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 867
addattribute $P0, 'body'
.annotate 'line', 868
addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefFunction' ]

.sub 'name' :method

.annotate 'line', 919
# Body
# {
.annotate 'line', 921
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 922
.return($S1)
# }
.annotate 'line', 923

.end # name


.sub 'result' :method

.annotate 'line', 924
# Body
# {
.annotate 'line', 926
getattribute $P1, self, 'typeresult'
.return($P1)
# }
.annotate 'line', 927

.end # result


.sub 'params' :method

.annotate 'line', 928
# Body
# {
getattribute $P1, self, 'nparams'
.return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 929
# Body
# {
.annotate 'line', 931
# string type: $S1
null $S1
set $I1, __ARG_1
null $I2
.annotate 'line', 932
if $I1 == $I2 goto __label_2
set $I2, 1
if $I1 == $I2 goto __label_3
set $I2, 2
if $I1 == $I2 goto __label_4
goto __label_1
# switch
__label_2: # case
.annotate 'line', 933
getattribute $P1, self, 'type0'
set $S1, $P1
goto __label_0 # break
__label_3: # case
.annotate 'line', 934
getattribute $P2, self, 'type1'
set $S1, $P2
goto __label_0 # break
__label_4: # case
.annotate 'line', 935
getattribute $P3, self, 'type2'
set $S1, $P3
goto __label_0 # break
__label_1: # default
.annotate 'line', 937
'InternalError'('Invalid predef arg')
__label_0: # switch end
.annotate 'line', 939
.return($S1)
# }
.annotate 'line', 940

.end # paramtype


.sub 'set' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional

.annotate 'line', 941
# Body
# {
box $P1, __ARG_1
.annotate 'line', 947
setattribute self, 'name', $P1
.annotate 'line', 948
isa $I2, __ARG_2, 'String'
unless $I2 goto __label_0
.annotate 'line', 949
new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
set $P2, $P3
setattribute self, 'body', $P2
goto __label_1
__label_0: # else
.annotate 'line', 951
setattribute self, 'body', __ARG_2
__label_1: # endif
box $P2, __ARG_3
.annotate 'line', 952
setattribute self, 'typeresult', $P2
.annotate 'line', 953
# int n: $I1
null $I1
.annotate 'line', 954
if_null __ARG_4, __label_2
# {
box $P3, __ARG_4
.annotate 'line', 955
setattribute self, 'type0', $P3
set $S1, __ARG_4
set $S2, '*'
.annotate 'line', 956
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
.annotate 'line', 962
if_null __ARG_5, __label_7
concat $S3, "Invalid predef '", __ARG_1
concat $S3, $S3, '"'
.annotate 'line', 963
'InternalError'($S3)
__label_7: # endif
goto __label_3 # break
__label_4: # default
set $I1, 1
.annotate 'line', 967
if_null __ARG_5, __label_8
# {
box $P4, __ARG_5
.annotate 'line', 968
setattribute self, 'type1', $P4
.annotate 'line', 969
inc $I1
# }
__label_8: # endif
.annotate 'line', 971
if_null __ARG_6, __label_9
# {
box $P5, __ARG_6
.annotate 'line', 972
setattribute self, 'type2', $P5
.annotate 'line', 973
inc $I1
# }
__label_9: # endif
__label_3: # switch end
# }
__label_2: # endif
box $P5, $I1
.annotate 'line', 977
setattribute self, 'nparams', $P5
.annotate 'line', 978
.return(self)
# }
.annotate 'line', 979

.end # set


.sub 'set_eval' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 980
# Body
# {
.annotate 'line', 988
setattribute self, 'evalfun', __ARG_2
.annotate 'line', 989
self.'set'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 990
.return(self)
# }
.annotate 'line', 991

.end # set_eval


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 992
# Body
# {
.annotate 'line', 994
# predefined string
getattribute $P2, self, 'name'
set $S2, $P2
concat $S3, 'predefined ', $S2
__ARG_1.'comment'($S3)
.annotate 'line', 995
# string typeresult: $S1
getattribute $P2, self, 'typeresult'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 996
isne $I1, $S1, 'v'
unless $I1 goto __label_2
iseq $I1, __ARG_4, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 997
$P3 = __ARG_2.'tempreg'($S1)
set __ARG_4, $P3
__label_1: # endif
.annotate 'line', 998
# var fun: $P1
getattribute $P1, self, 'body'
.annotate 'line', 999
$P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1000

.end # expand

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 910
addattribute $P0, 'name'
.annotate 'line', 911
addattribute $P0, 'body'
.annotate 'line', 912
addattribute $P0, 'evalfun'
.annotate 'line', 913
addattribute $P0, 'typeresult'
.annotate 'line', 914
addattribute $P0, 'type0'
.annotate 'line', 915
addattribute $P0, 'type1'
.annotate 'line', 916
addattribute $P0, 'type2'
.annotate 'line', 917
addattribute $P0, 'nparams'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1006
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1008
setattribute self, 'type', $P1
# }
.annotate 'line', 1009

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1010
# Body
# {
.annotate 'line', 1012
# string type: $S1
getattribute $P2, self, 'type'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1013
# predefined elements
elements $I1, __ARG_4
eq $I1, 1, __label_1
.annotate 'line', 1014
'InternalError'("Invalid Predef_typecast.invoke call")
__label_1: # endif
.annotate 'line', 1015
# var rawarg: $P1
$P1 = __ARG_4[0]
.annotate 'line', 1016
# string argtype: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 1017
iseq $I1, $S2, $S1
if $I1 goto __label_5
isa $I1, $P1, 'IndexExpr'
__label_5:
unless $I1 goto __label_3
.annotate 'line', 1018
$P1.'emit'(__ARG_1, __ARG_3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 1020
# string arg: $S3
$P3 = $P1.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
.annotate 'line', 1021
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1022
__ARG_1.'emitset'(__ARG_3, $S3)
# }
__label_4: # endif
# }
.annotate 'line', 1024

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1005
addattribute $P0, 'type'
.end
.namespace [ 'Predef_say' ]

.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1029
# Body
# {
.annotate 'line', 1031
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1032
# int n: $I1
# predefined int
set $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1033
lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1034
# int i: $I2
null $I2
__label_4: # for condition
ge $I2, $I1, __label_3
.annotate 'line', 1035
$P1 = __ARG_4[$I2]
__ARG_1.'say'('print ', $P1)
__label_2: # for iteration
.annotate 'line', 1034
inc $I2
goto __label_4
__label_3: # for end
.annotate 'line', 1036
$P1 = __ARG_4[$I1]
__ARG_1.'say'('say ', $P1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 1039
__ARG_1.'say'(" say ''")
__label_1: # endif
# }
.annotate 'line', 1040

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

.annotate 'line', 1045
# Body
# {
.annotate 'line', 1047
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1048
__ARG_1.'say'("getstderr $P0")
.annotate 'line', 1049
# int n: $I1
# predefined int
set $I1, __ARG_4
# for loop
.annotate 'line', 1050
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1051
$P1 = __ARG_4[$I2]
__ARG_1.'say'("print $P0, ", $P1)
__label_0: # for iteration
.annotate 'line', 1050
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1052
__ARG_1.'say'("print $P0, \"\\n\"")
# }
.annotate 'line', 1053

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

.annotate 'line', 1058
# Body
# {
.annotate 'line', 1060
__ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1061
# int n: $I1
set $P1, __ARG_4
set $I1, $P1
# for loop
.annotate 'line', 1062
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1063
$P1 = __ARG_4[$I2]
__ARG_1.'say'('print ', $P1)
__label_0: # for iteration
.annotate 'line', 1062
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1064

.end # invoke

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Predef_print' ]
.end
.namespace [ ]

.sub 'predefeval_length'
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
# predefined length
length $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1072

.end # predefeval_length


.sub 'predefeval_bytelength'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1074
# Body
# {
.annotate 'line', 1076
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1077
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1078
# predefined bytelength
bytelength $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1079

.end # predefeval_bytelength


.sub 'predefeval_ord'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1081
# Body
# {
.annotate 'line', 1083
# var arg: $P1
$P2 = __ARG_3[0]
getattribute $P1, $P2, 'arg'
.annotate 'line', 1084
# string s: $S1
$P2 = $P1.'get_value'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 1085
# predefined ord
ord $I1, $S1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1086

.end # predefeval_ord


.sub 'predefeval_ord_n'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1088
# Body
# {
.annotate 'line', 1090
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1091
# string s: $S1
$P3 = $P1.'get_value'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1092
# var argn: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1093
# int n: $I1
getattribute $P4, $P2, 'numval'
set $I1, $P4
.annotate 'line', 1094
# predefined ord
ord $I2, $S1, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1095

.end # predefeval_ord_n


.sub 'predefeval_chr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1097
# Body
# {
.annotate 'line', 1099
# var arg: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1101
# int n: $I1
getattribute $P3, $P1, 'numval'
set $I1, $P3
.annotate 'line', 1102
# string s: $S1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
.annotate 'line', 1104
# var t: $P2
new $P2, [ 'TokenQuoted' ]
getattribute $P4, __ARG_2, 'file'
getattribute $P5, __ARG_2, 'line'
$P2.'TokenQuoted'($P4, $P5, $S1)
.annotate 'line', 1105
new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P2)
set $P4, $P5
.return($P4)
# }
.annotate 'line', 1106

.end # predefeval_chr


.sub 'predefeval_substr'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1108
# Body
# {
.annotate 'line', 1110
# var argstr: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1111
# var argpos: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1112
# string str: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1113
# int pos: $I1
getattribute $P5, $P2, 'numval'
set $I1, $P5
.annotate 'line', 1115
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P6, __ARG_2, 'file'
getattribute $P7, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1
$P3.'TokenQuoted'($P6, $P7, $S2)
.annotate 'line', 1116
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_1, $P3)
set $P6, $P7
.return($P6)
# }
.annotate 'line', 1117

.end # predefeval_substr


.sub 'predefeval_substr_l'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1119
# Body
# {
.annotate 'line', 1121
# var argstr: $P1
$P5 = __ARG_3[0]
getattribute $P1, $P5, 'arg'
.annotate 'line', 1122
# var argpos: $P2
$P5 = __ARG_3[1]
getattribute $P2, $P5, 'arg'
.annotate 'line', 1123
# var arglen: $P3
$P6 = __ARG_3[2]
getattribute $P3, $P6, 'arg'
.annotate 'line', 1124
# string str: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_0
set $S1, $P6
__label_0:
.annotate 'line', 1125
# int pos: $I1
getattribute $P7, $P2, 'numval'
set $I1, $P7
.annotate 'line', 1126
# int len: $I2
getattribute $P7, $P3, 'numval'
set $I2, $P7
.annotate 'line', 1128
# var t: $P4
new $P4, [ 'TokenQuoted' ]
getattribute $P8, __ARG_2, 'file'
getattribute $P9, __ARG_2, 'line'
# predefined substr
substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P8, $P9, $S2)
.annotate 'line', 1129
new $P9, [ 'StringLiteral' ]
$P9.'StringLiteral'(__ARG_1, $P4)
set $P8, $P9
.return($P8)
# }
.annotate 'line', 1130

.end # predefeval_substr_l


.sub 'predefeval_indexof'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1132
# Body
# {
.annotate 'line', 1134
# var argstrfrom: $P1
$P3 = __ARG_3[0]
getattribute $P1, $P3, 'arg'
.annotate 'line', 1135
# var argstrsearch: $P2
$P3 = __ARG_3[1]
getattribute $P2, $P3, 'arg'
.annotate 'line', 1136
# string strfrom: $S1
$P4 = $P1.'get_value'()
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 1137
# string strsearch: $S2
$P4 = $P2.'get_value'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 1138
# predefined indexof
index $I1, $S1, $S2
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1139

.end # predefeval_indexof


.sub 'predefeval_indexof_pos'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1141
# Body
# {
.annotate 'line', 1143
# var argstrfrom: $P1
$P4 = __ARG_3[0]
getattribute $P1, $P4, 'arg'
.annotate 'line', 1144
# var argstrsearch: $P2
$P4 = __ARG_3[1]
getattribute $P2, $P4, 'arg'
.annotate 'line', 1145
# var argpos: $P3
$P5 = __ARG_3[2]
getattribute $P3, $P5, 'arg'
.annotate 'line', 1146
# string strfrom: $S1
$P5 = $P1.'get_value'()
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 1147
# string strsearch: $S2
$P6 = $P2.'get_value'()
null $S2
if_null $P6, __label_1
set $S2, $P6
__label_1:
.annotate 'line', 1148
# int pos: $I1
getattribute $P6, $P3, 'numval'
set $I1, $P6
.annotate 'line', 1149
# predefined indexof
index $I2, $S1, $S2, $I1
.tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1150

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1152
# Body
# {
.annotate 'line', 1154
get_hll_global $P2, 'predefeval_length'
.annotate 'line', 1155
get_hll_global $P3, 'predefeval_bytelength'
.annotate 'line', 1156
get_hll_global $P4, 'predefeval_chr'
.annotate 'line', 1157
get_hll_global $P5, 'predefeval_ord'
.annotate 'line', 1158
get_hll_global $P6, 'predefeval_ord_n'
.annotate 'line', 1159
get_hll_global $P7, 'predefeval_substr'
.annotate 'line', 1160
get_hll_global $P8, 'predefeval_substr_l'
.annotate 'line', 1161
get_hll_global $P9, 'predefeval_indexof'
.annotate 'line', 1162
get_hll_global $P10, 'predefeval_indexof_pos'
.annotate 'line', 1164
# var predefs: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1165
new $P13, [ 'PredefFunction' ]
.annotate 'line', 1166
new $P15, [ 'Predef_typecast' ]
$P15.'Predef_typecast'('I')
set $P14, $P15
.annotate 'line', 1165
$P12 = $P13.'set'('int', $P14, 'I', '!')
.annotate 'line', 1164
$P1.'push'($P12)
.annotate 'line', 1169
new $P17, [ 'PredefFunction' ]
.annotate 'line', 1170
new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('N')
set $P18, $P19
.annotate 'line', 1169
$P16 = $P17.'set'('float', $P18, 'N', '!')
.annotate 'line', 1164
$P1.'push'($P16)
.annotate 'line', 1173
new $P21, [ 'PredefFunction' ]
.annotate 'line', 1174
new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('S')
set $P22, $P23
.annotate 'line', 1173
$P20 = $P21.'set'('string', $P22, 'S', '!')
.annotate 'line', 1164
$P1.'push'($P20)
.annotate 'line', 1177
new $P25, [ 'PredefFunction' ]
$P24 = $P25.'set'('die', 'die {arg0}', 'v', 'S')
.annotate 'line', 1164
$P1.'push'($P24)
.annotate 'line', 1181
new $P27, [ 'PredefFunction' ]
$P26 = $P27.'set'('exit', 'exit {arg0}', 'v', 'I')
.annotate 'line', 1164
$P1.'push'($P26)
.annotate 'line', 1185
new $P29, [ 'PredefFunction' ]
$P28 = $P29.'set'('time', 'time {res}', 'I')
.annotate 'line', 1164
$P1.'push'($P28)
.annotate 'line', 1189
new $P31, [ 'PredefFunction' ]
$P30 = $P31.'set'('floattime', 'time {res}', 'N')
.annotate 'line', 1164
$P1.'push'($P30)
.annotate 'line', 1193
new $P33, [ 'PredefFunction' ]
$P32 = $P33.'set'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
.annotate 'line', 1164
$P1.'push'($P32)
.annotate 'line', 1197
new $P35, [ 'PredefFunction' ]
$P34 = $P35.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P34)
.annotate 'line', 1202
new $P37, [ 'PredefFunction' ]
$P36 = $P37.'set'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P36)
.annotate 'line', 1207
new $P39, [ 'PredefFunction' ]
$P38 = $P39.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P38)
.annotate 'line', 1212
new $P41, [ 'PredefFunction' ]
$P40 = $P41.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
.annotate 'line', 1164
$P1.'push'($P40)
.annotate 'line', 1218
new $P43, [ 'PredefFunction' ]
$P42 = $P43.'set'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
.annotate 'line', 1164
$P1.'push'($P42)
.annotate 'line', 1225
new $P45, [ 'PredefFunction' ]
$P44 = $P45.'set'('elements', 'elements {res}, {arg0}', 'I', 'P')
.annotate 'line', 1164
$P1.'push'($P44)
.annotate 'line', 1229
new $P47, [ 'PredefFunction' ]
.annotate 'line', 1229
$P46 = $P47.'set_eval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
.annotate 'line', 1164
$P1.'push'($P46)
.annotate 'line', 1234
new $P49, [ 'PredefFunction' ]
.annotate 'line', 1234
$P48 = $P49.'set_eval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
.annotate 'line', 1164
$P1.'push'($P48)
.annotate 'line', 1239
new $P51, [ 'PredefFunction' ]
.annotate 'line', 1239
$P50 = $P51.'set_eval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
.annotate 'line', 1164
$P1.'push'($P50)
.annotate 'line', 1246
new $P53, [ 'PredefFunction' ]
.annotate 'line', 1246
$P52 = $P53.'set_eval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
.annotate 'line', 1164
$P1.'push'($P52)
.annotate 'line', 1251
new $P55, [ 'PredefFunction' ]
.annotate 'line', 1251
$P54 = $P55.'set_eval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
.annotate 'line', 1164
$P1.'push'($P54)
.annotate 'line', 1256
new $P57, [ 'PredefFunction' ]
.annotate 'line', 1256
$P56 = $P57.'set_eval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
.annotate 'line', 1164
$P1.'push'($P56)
.annotate 'line', 1261
new $P59, [ 'PredefFunction' ]
.annotate 'line', 1261
$P58 = $P59.'set_eval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
.annotate 'line', 1164
$P1.'push'($P58)
.annotate 'line', 1266
new $P61, [ 'PredefFunction' ]
.annotate 'line', 1266
$P60 = $P61.'set_eval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P60)
.annotate 'line', 1271
new $P63, [ 'PredefFunction' ]
.annotate 'line', 1271
$P62 = $P63.'set_eval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
.annotate 'line', 1164
$P1.'push'($P62)
.annotate 'line', 1276
new $P65, [ 'PredefFunction' ]
$P64 = $P65.'set'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1164
$P1.'push'($P64)
.annotate 'line', 1280
new $P67, [ 'PredefFunction' ]
$P66 = $P67.'set'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P66)
.annotate 'line', 1284
new $P69, [ 'PredefFunction' ]
$P68 = $P69.'set'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P68)
.annotate 'line', 1288
new $P71, [ 'PredefFunction' ]
$P70 = $P71.'set'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P70)
.annotate 'line', 1292
new $P73, [ 'PredefFunction' ]
$P72 = $P73.'set'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P72)
.annotate 'line', 1296
new $P75, [ 'PredefFunction' ]
$P74 = $P75.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P74)
.annotate 'line', 1301
new $P77, [ 'PredefFunction' ]
$P76 = $P77.'set'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P76)
.annotate 'line', 1306
new $P79, [ 'PredefFunction' ]
$P78 = $P79.'set'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P78)
.annotate 'line', 1310
new $P81, [ 'PredefFunction' ]
$P80 = $P81.'set'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P80)
.annotate 'line', 1314
new $P83, [ 'PredefFunction' ]
$P82 = $P83.'set'('exp', 'exp {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P82)
.annotate 'line', 1318
new $P85, [ 'PredefFunction' ]
$P84 = $P85.'set'('ln', 'ln {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P84)
.annotate 'line', 1322
new $P87, [ 'PredefFunction' ]
$P86 = $P87.'set'('sin', 'sin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P86)
.annotate 'line', 1326
new $P89, [ 'PredefFunction' ]
$P88 = $P89.'set'('cos', 'cos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P88)
.annotate 'line', 1330
new $P91, [ 'PredefFunction' ]
$P90 = $P91.'set'('tan', 'tan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P90)
.annotate 'line', 1334
new $P93, [ 'PredefFunction' ]
$P92 = $P93.'set'('asin', 'asin {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P92)
.annotate 'line', 1338
new $P95, [ 'PredefFunction' ]
$P94 = $P95.'set'('acos', 'acos {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P94)
.annotate 'line', 1342
new $P97, [ 'PredefFunction' ]
$P96 = $P97.'set'('atan', 'atan {res}, {arg0}', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P96)
.annotate 'line', 1346
new $P99, [ 'PredefFunction' ]
$P98 = $P99.'set'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
.annotate 'line', 1164
$P1.'push'($P98)
.annotate 'line', 1350
new $P101, [ 'PredefFunction' ]
$P100 = $P101.'set'('getinterp', 'getinterp {res}', 'P')
.annotate 'line', 1164
$P1.'push'($P100)
.annotate 'line', 1354
new $P103, [ 'PredefFunction' ]
$P102 = $P103.'set'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P102)
.annotate 'line', 1358
new $P105, [ 'PredefFunction' ]
$P104 = $P105.'set'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P104)
.annotate 'line', 1362
new $P107, [ 'PredefFunction' ]
$P106 = $P107.'set'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P106)
.annotate 'line', 1366
new $P109, [ 'PredefFunction' ]
$P108 = $P109.'set'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
.annotate 'line', 1164
$P1.'push'($P108)
.annotate 'line', 1370
new $P111, [ 'PredefFunction' ]
$P110 = $P111.'set'('clone', 'clone {res}, {arg0}', 'P', 'P')
.annotate 'line', 1164
$P1.'push'($P110)
.annotate 'line', 1374
new $P113, [ 'PredefFunction' ]
$P112 = $P113.'set'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P112)
.annotate 'line', 1378
new $P115, [ 'PredefFunction' ]
$P114 = $P115.'set'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
.annotate 'line', 1164
$P1.'push'($P114)
.annotate 'line', 1382
new $P117, [ 'PredefFunction' ]
$P116 = $P117.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P116)
.annotate 'line', 1387
new $P119, [ 'PredefFunction' ]
$P118 = $P119.'set'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P118)
.annotate 'line', 1392
new $P121, [ 'PredefFunction' ]
$P120 = $P121.'set'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
.annotate 'line', 1164
$P1.'push'($P120)
.annotate 'line', 1396
new $P123, [ 'PredefFunction' ]
$P122 = $P123.'set'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
.annotate 'line', 1164
$P1.'push'($P122)
.annotate 'line', 1400
new $P125, [ 'PredefFunction' ]
$P124 = $P125.'set'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
.annotate 'line', 1164
$P1.'push'($P124)
.annotate 'line', 1404
new $P127, [ 'PredefFunction' ]
$P126 = $P127.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
.annotate 'line', 1164
$P1.'push'($P126)
.annotate 'line', 1408
new $P129, [ 'PredefFunction' ]
$P128 = $P129.'set'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
.annotate 'line', 1164
$P1.'push'($P128)
.annotate 'line', 1412
new $P131, [ 'PredefFunction' ]
.annotate 'line', 1413
new $P132, [ 'Predef_print' ]
.annotate 'line', 1412
$P130 = $P131.'set'('print', $P132, 'v', '*')
.annotate 'line', 1164
$P1.'push'($P130)
.annotate 'line', 1416
new $P134, [ 'PredefFunction' ]
.annotate 'line', 1417
new $P135, [ 'Predef_say' ]
.annotate 'line', 1416
$P133 = $P134.'set'('say', $P135, 'v', '*')
.annotate 'line', 1164
$P1.'push'($P133)
.annotate 'line', 1420
new $P137, [ 'PredefFunction' ]
.annotate 'line', 1421
new $P138, [ 'Predef_cry' ]
.annotate 'line', 1420
$P136 = $P137.'set'('cry', $P138, 'v', '*')
.annotate 'line', 1164
$P1.'push'($P136)
__label_1: # Infinite loop
.annotate 'line', 1426
.yield($P1)
goto __label_1
__label_0: # Infinite loop end
# }
.annotate 'line', 1427

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1429
# Body
# {
.annotate 'line', 1431
$P2 = 'getpredefs'()
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1432
getattribute $P4, $P1, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1433
# int pargs: $I1
getattribute $P5, $P1, 'nparams'
set $I1, $P5
.annotate 'line', 1434
iseq $I2, $I1, __ARG_2
if $I2 goto __label_5
.annotate 'line', 1435
iseq $I2, $I1, -1
__label_5:
if $I2 goto __label_4
.annotate 'line', 1436
iseq $I2, $I1, -2
unless $I2 goto __label_6
iseq $I2, __ARG_2, 1
__label_6:
__label_4:
unless $I2 goto __label_3
.annotate 'line', 1437
.return($P1)
__label_3: # endif
# }
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P2
.annotate 'line', 1439
.return($P2)
# }
.annotate 'line', 1440

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1446
# Body
# {
.annotate 'line', 1448
# int n: $I1
# predefined elements
elements $I1, __ARG_1
# for loop
.annotate 'line', 1449
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 1450
$P2 = __ARG_1[$I2]
$P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
__label_0: # for iteration
.annotate 'line', 1449
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 1451

.end # optimize_array

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1462
# Body
# {
.annotate 'line', 1464
setattribute self, 'start', __ARG_1
.annotate 'line', 1465
setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1466

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1467
# Body
# {
.annotate 'line', 1469
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 1470

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1471
# Body
# {
.annotate 'line', 1473
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1474

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1475
# Body
# {
.annotate 'line', 1477
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1478

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1479
# Body
# {
.annotate 'line', 1481
getattribute $P1, self, 'owner'
.tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1482

.end # addlocalfunction


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1483
# Body
# {
.annotate 'line', 1485
getattribute $P1, self, 'owner'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1486

.end # findclasskey

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1459
addattribute $P0, 'start'
.annotate 'line', 1460
addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1499
# Body
# {
.annotate 'line', 1501
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P2
# }
.annotate 'line', 1502

.end # init


.sub 'numargs' :method

.annotate 'line', 1504
# Body
# {
.annotate 'line', 1506
getattribute $P1, self, 'args'
# predefined elements
elements $I1, $P1
.return($I1)
# }
.annotate 'line', 1507

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1508
# Body
# {
.annotate 'line', 1510
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1511
$P2 = $P1[__ARG_1]
.return($P2)
# }
.annotate 'line', 1512

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1514
# Body
# {
.annotate 'line', 1516
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1517
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1518
# {
.annotate 'line', 1519
# var value: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1520
$P1.'push'($P3)
# }
.annotate 'line', 1521
$P2 = __ARG_1.'get'()
$P4 = $P2.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 1522
'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1523

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1525
# Body
# {
.annotate 'line', 1527
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1528
if_null $P1, __label_0
.annotate 'line', 1529
'optimize_array'($P1)
__label_0: # endif
# }
.annotate 'line', 1530

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1531
# Body
# {
.annotate 'line', 1533
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1534
# var argreg: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1535
# int nargs: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1536
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1537
# var a: $P3
$P3 = $P1[$I2]
.annotate 'line', 1538
# string reg: $S1
$P4 = $P3.'emit_get'(__ARG_1)
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1539
$P2.'push'($S1)
# }
__label_0: # for iteration
.annotate 'line', 1536
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 1541
.return($P2)
# }
.annotate 'line', 1542

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1543
# Body
# {
.annotate 'line', 1545
# var argreg: $P1
$P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1546
# predefined join
join $S1, ', ', $P1
__ARG_1.'print'($S1)
# }
.annotate 'line', 1547

.end # emitargs

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1497
addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1559
# Body
# {
getattribute $P1, self, 'name'
.return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1560
# Body
# {
.annotate 'line', 1562
# int nargs: $I1
getattribute $P2, self, 'args'
$P1 = $P2.'numargs'()
set $I1, $P1
.annotate 'line', 1563
.return($I1)
# }
.annotate 'line', 1564

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1565
# Body
# {
.annotate 'line', 1567
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 1568
$P2 = $P1.'numargs'()
set $I1, $P2
ge __ARG_1, $I1, __label_0
.annotate 'line', 1569
.tailcall $P1.'getarg'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 1571
'InternalError'('Wrong modifier arg number')
__label_1: # endif
# }
.annotate 'line', 1572

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1573
# Body
# {
box $P1, __ARG_1
.annotate 'line', 1575
setattribute self, 'name', $P1
.annotate 'line', 1576
if_null __ARG_2, __label_0
.annotate 'line', 1577
setattribute self, 'args', __ARG_2
__label_0: # endif
# }
.annotate 'line', 1578

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1579
# Body
# {
.annotate 'line', 1581
getattribute $P1, self, 'args'
$P1.'optimizeargs'()
# }
.annotate 'line', 1582

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Modifier' ]
.annotate 'line', 1556
addattribute $P0, 'name'
.annotate 'line', 1557
addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1589
# Body
# {
.annotate 'line', 1591
# var list: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1592
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1593
# {
.annotate 'line', 1594
$P2 = __ARG_1.'get'()
.annotate 'line', 1595
# string name: $S1
$P4 = $P2.'getidentifier'()
null $S1
if_null $P4, __label_3
set $S1, $P4
__label_3:
.annotate 'line', 1596
$P2 = __ARG_1.'get'()
.annotate 'line', 1597
# var args: $P3
new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1598
$P5 = $P2.'isop'('(')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 1599
$P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1600
$P2 = __ARG_1.'get'()
# }
__label_4: # endif
.annotate 'line', 1602
new $P6, [ 'Modifier' ]
$P6.'Modifier'($S1, $P3)
set $P5, $P6
$P1.'push'($P5)
# }
.annotate 'line', 1603
$P6 = $P2.'isop'(',')
if_null $P6, __label_1
if $P6 goto __label_0
__label_1: # enddo
.annotate 'line', 1604
'RequireOp'(']', $P2)
.annotate 'line', 1605
setattribute self, 'list', $P1
# }
.annotate 'line', 1606

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1607
# Body
# {
.annotate 'line', 1609
getattribute $P2, self, 'list'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1610
$P1.'optimize'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1611

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1612
# Body
# {
getattribute $P1, self, 'list'
.return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1613
# Body
# {
.annotate 'line', 1615
# var list: $P1
getattribute $P1, self, 'list'
.annotate 'line', 1616
# int n: $I1
# predefined elements
elements $I1, $P1
# for loop
.annotate 'line', 1617
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
# {
.annotate 'line', 1618
# var mod: $P2
$P2 = $P1[$I2]
.annotate 'line', 1619
$P3 = $P2.'getname'()
set $S1, $P3
ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1620
.return($P2)
# }
__label_3: # endif
# }
__label_0: # for iteration
.annotate 'line', 1617
inc $I2
goto __label_2
__label_1: # for end
null $P3
.annotate 'line', 1623
.return($P3)
# }
.annotate 'line', 1624

.end # pick

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1587
addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1631
# Body
# {
.annotate 'line', 1633
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, "[ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1634
.return($S2)
# }
.annotate 'line', 1635

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1637
# Body
# {
.annotate 'line', 1639
# predefined elements
elements $I1, __ARG_1
ne $I1, 0, __label_0
.annotate 'line', 1640
.return(".namespace [ ]")
goto __label_1
__label_0: # else
# {
.annotate 'line', 1642
# string s: $S1
# predefined join
join $S1, "'; '", __ARG_1
concat $S2, ".namespace [ '", $S1
concat $S2, $S2, "' ]"
.annotate 'line', 1643
.return($S2)
# }
__label_1: # endif
# }
.annotate 'line', 1645

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1647
# Body
# {
.annotate 'line', 1649
# var taux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1650
$P2 = $P1.'iskeyword'('extern')
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 1651
new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P3, $P4
.return($P3)
goto __label_1
__label_0: # else
.annotate 'line', 1652
$P5 = $P1.'iskeyword'('static')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 1653
new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
goto __label_3
__label_2: # else
# {
.annotate 'line', 1655
__ARG_2.'unget'($P1)
.annotate 'line', 1656
new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P2, $P3
.return($P2)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1658

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1660
# Body
# {
.annotate 'line', 1662
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 1663
$P4 = $P1.'isop'(';')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 1664
new $P5, [ 'EmptyStatement' ]
.return($P5)
__label_0: # endif
.annotate 'line', 1665
$P4 = $P1.'isop'('{')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 1666
new $P6, [ 'CompoundStatement' ]
$P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 1667
$P6 = $P1.'isop'('${')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 1668
new $P8, [ 'PiropStatement' ]
$P8.'PiropStatement'($P1, __ARG_1, __ARG_2)
set $P7, $P8
.return($P7)
__label_2: # endif
.annotate 'line', 1670
# string key: $S1
$P7 = $P1.'checkkeyword'()
null $S1
if_null $P7, __label_3
set $S1, $P7
__label_3:
.annotate 'line', 1671
# var st: $P2
null $P2
set $S2, $S1
set $S3, 'using'
.annotate 'line', 1672
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
.annotate 'line', 1674
.tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
__label_7: # case
.annotate 'line', 1676
.tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_8: # case
.annotate 'line', 1679
.tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
goto __label_4 # break
__label_9: # case
.annotate 'line', 1682
.tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
__label_10: # case
.annotate 'line', 1684
.tailcall 'parseString'($P1, __ARG_1, __ARG_2)
__label_11: # case
.annotate 'line', 1686
.tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
__label_12: # case
.annotate 'line', 1688
.tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
__label_13: # case
.annotate 'line', 1690
new $P9, [ 'ReturnStatement' ]
$P9.'ReturnStatement'($P1, __ARG_1, __ARG_2)
set $P8, $P9
.return($P8)
__label_14: # case
.annotate 'line', 1692
new $P11, [ 'YieldStatement' ]
$P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
set $P10, $P11
.return($P10)
__label_15: # case
.annotate 'line', 1694
new $P13, [ 'GotoStatement' ]
$P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_16: # case
.annotate 'line', 1696
new $P15, [ 'IfStatement' ]
$P15.'IfStatement'($P1, __ARG_1, __ARG_2)
set $P14, $P15
.return($P14)
__label_17: # case
.annotate 'line', 1698
new $P17, [ 'WhileStatement' ]
$P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
set $P16, $P17
.return($P16)
__label_18: # case
.annotate 'line', 1700
new $P19, [ 'DoStatement' ]
$P19.'DoStatement'($P1, __ARG_1, __ARG_2)
set $P18, $P19
.return($P18)
__label_19: # case
.annotate 'line', 1702
new $P21, [ 'ContinueStatement' ]
$P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
set $P20, $P21
.return($P20)
__label_20: # case
.annotate 'line', 1704
new $P23, [ 'BreakStatement' ]
$P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
set $P22, $P23
.return($P22)
__label_21: # case
.annotate 'line', 1706
new $P25, [ 'SwitchStatement' ]
$P25.'SwitchStatement'($P1, __ARG_1, __ARG_2)
set $P24, $P25
.return($P24)
__label_22: # case
.annotate 'line', 1708
.tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
__label_23: # case
.annotate 'line', 1710
new $P27, [ 'ThrowStatement' ]
$P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
set $P26, $P27
.return($P26)
__label_24: # case
.annotate 'line', 1712
new $P29, [ 'TryStatement' ]
$P29.'TryStatement'($P1, __ARG_1, __ARG_2)
set $P28, $P29
.return($P28)
__label_5: # default
.annotate 'line', 1714
$P30 = $P1.'isidentifier'()
if_null $P30, __label_25
unless $P30 goto __label_25
# {
.annotate 'line', 1715
# var t2: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 1716
$P9 = $P3.'isop'(':')
if_null $P9, __label_26
unless $P9 goto __label_26
.annotate 'line', 1717
new $P11, [ 'LabelStatement' ]
$P11.'LabelStatement'($P1, __ARG_2)
set $P10, $P11
.return($P10)
__label_26: # endif
.annotate 'line', 1718
__ARG_1.'unget'($P3)
# }
__label_25: # endif
.annotate 'line', 1720
__ARG_1.'unget'($P1)
.annotate 'line', 1721
new $P13, [ 'ExprStatement' ]
$P13.'ExprStatement'($P1, __ARG_1, __ARG_2)
set $P12, $P13
.return($P12)
__label_4: # switch end
.annotate 'line', 1723
unless_null $P2, __label_27
.annotate 'line', 1724
'InternalError'('parseStatement failure')
__label_27: # endif
.annotate 'line', 1725
.tailcall $P2.'parse'($P1, __ARG_1, __ARG_2)
# }
.annotate 'line', 1726

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'initstatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1734
# Body
# {
.annotate 'line', 1736
self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1737

.end # initstatement


.sub 'isempty' :method

.annotate 'line', 1738
# Body
# {
.return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1739
# Body
# {
.annotate 'line', 1741
getattribute $P1, self, 'owner'
.tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1742

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1743
# Body
# {
.annotate 'line', 1745
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1746

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1747
# Body
# {
.annotate 'line', 1749
getattribute $P1, self, 'owner'
$P1.'freetemps'()
# }
.annotate 'line', 1750

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1751
# Body
# {
.annotate 'line', 1753
getattribute $P1, self, 'owner'
.tailcall $P1.'genlabel'()
# }
.annotate 'line', 1754

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1755
# Body
# {
.annotate 'line', 1757
getattribute $P1, self, 'owner'
.tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1758

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1759
# Body
# {
.annotate 'line', 1761
getattribute $P1, self, 'owner'
.tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1762

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1763
# Body
# {
.annotate 'line', 1765
getattribute $P1, self, 'owner'
.tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1766

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1767
# Body
# {
.annotate 'line', 1769
getattribute $P1, self, 'owner'
.tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1770

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1771
# Body
# {
.annotate 'line', 1773
getattribute $P1, self, 'owner'
.tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1774

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1775
# Body
# {
.annotate 'line', 1777
getattribute $P1, self, 'owner'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1778

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1780
# Body
# {
.annotate 'line', 1785
getattribute $P1, self, 'owner'
.tailcall $P1.'getouter'()
# }
.annotate 'line', 1786

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1787
# Body
# {
.annotate 'line', 1789
getattribute $P1, self, 'owner'
.tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1790

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1791
# Body
# {
.annotate 'line', 1793
getattribute $P1, self, 'owner'
.tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1794

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1795
# Body
# {
.annotate 'line', 1797
getattribute $P1, self, 'start'
'InternalError'('**checking**', $P1)
.annotate 'line', 1799
.return(self)
# }
.annotate 'line', 1800

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Statement' ]
.annotate 'line', 1732
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1805
# Body
# {
.return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1806
# Body
# {
.annotate 'line', 1808
'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1809

.end # annotate


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
# }
.annotate 'line', 1814

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1803
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1821
# Body
# {
.annotate 'line', 1823
# var statements: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1824
$P1.'push'(__ARG_1)
.annotate 'line', 1825
$P1.'push'(__ARG_2)
.annotate 'line', 1826
setattribute self, 'statements', $P1
# }
.annotate 'line', 1827

.end # MultiStatement


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1828
# Body
# {
.annotate 'line', 1830
getattribute $P1, self, 'statements'
$P1.'push'(__ARG_1)
.annotate 'line', 1831
.return(self)
# }
.annotate 'line', 1832

.end # push


.sub 'optimize' :method

.annotate 'line', 1833
# Body
# {
.annotate 'line', 1835
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 1836
.return(self)
# }
.annotate 'line', 1837

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1838
# Body
# {
.annotate 'line', 1840
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
.annotate 'line', 1841
$P1.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 1842

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1819
addattribute $P0, 'statements'
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1845
# Body
# {
.annotate 'line', 1847
unless_null __ARG_1, __label_0
.annotate 'line', 1848
.return(__ARG_2)
goto __label_1
__label_0: # else
.annotate 'line', 1849
isa $I1, __ARG_1, 'MultiStatement'
unless $I1 goto __label_2
.annotate 'line', 1850
.tailcall __ARG_1.'push'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 1852
new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
set $P1, $P2
.return($P1)
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 1853

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1863
# Body
# {
.annotate 'line', 1865
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1866
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 1867
# int dotted: $I1
null $I1
.annotate 'line', 1868
$P2 = $P1.'isop'('.')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
set $I1, 1
.annotate 'line', 1870
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 1872
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
.annotate 'line', 1873
setattribute self, 'opname', $P3
.annotate 'line', 1874
$P1 = __ARG_2.'get'()
.annotate 'line', 1875
$P3 = $P1.'isop'('}')
isfalse $I2, $P3
unless $I2 goto __label_4
# {
.annotate 'line', 1876
__ARG_2.'unget'($P1)
.annotate 'line', 1877
self.'parseargs'(__ARG_2, self, '}')
# }
__label_4: # endif
.annotate 'line', 1879
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 1880

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 1881
# Body
# {
.annotate 'line', 1883
self.'optimizeargs'()
.annotate 'line', 1884
.return(self)
# }
.annotate 'line', 1885

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1886
# Body
# {
.annotate 'line', 1888
# string opname: $S1
getattribute $P1, self, 'opname'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1889
self.'annotate'(__ARG_1)
concat $S2, 'pirop ', $S1
.annotate 'line', 1890
__ARG_1.'comment'($S2)
.annotate 'line', 1891
$P1 = self.'numargs'()
set $I1, $P1
ne $I1, 0, __label_1
.annotate 'line', 1892
__ARG_1.'say'($S1)
goto __label_2
__label_1: # else
# {
.annotate 'line', 1894
__ARG_1.'print'($S1, ' ')
.annotate 'line', 1895
self.'emitargs'(__ARG_1)
.annotate 'line', 1896
__ARG_1.'say'()
# }
__label_2: # endif
# }
.annotate 'line', 1898

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1859
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 1861
addattribute $P0, 'opname'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1908
# Body
# {
.annotate 'line', 1910
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1911
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1912
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1913
# {
.annotate 'line', 1914
$P2 = __ARG_2.'get'()
.annotate 'line', 1915
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1916
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1917
'RequireOp'(';', $P2)
.annotate 'line', 1918
setattribute self, 'path', $P1
.annotate 'line', 1919
.return(self)
# }
.annotate 'line', 1920

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 1921
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1922
# Body
# {
.annotate 'line', 1924
self.'annotate'(__ARG_1)
.annotate 'line', 1925
getattribute $P1, self, 'path'
# predefined join
join $S1, '/', $P1
__ARG_1.'say'("load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 1926

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 1905
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1907
addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1936
# Body
# {
.annotate 'line', 1938
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1939
# string sym: $S1
$P1 = __ARG_2.'get'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 1940
$P1 = __ARG_2.'get'()
'RequireOp'(';', $P1)
box $P2, $S1
.annotate 'line', 1941
setattribute self, 'symbol', $P2
# }
.annotate 'line', 1942

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 1943
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1944
# Body
# {
.annotate 'line', 1946
self.'annotate'(__ARG_1)
.annotate 'line', 1947
# var v: $P1
getattribute $P2, self, 'symbol'
$P1 = self.'createvar'($P2, 'P')
.annotate 'line', 1948
$P2 = $P1.'getreg'()
getattribute $P3, self, 'symbol'
__ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 1949

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 1933
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1935
addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1959
# Body
# {
.annotate 'line', 1961
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 1962
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 1963
# var t: $P2
null $P2
__label_0: # do
.annotate 'line', 1964
# {
.annotate 'line', 1965
$P2 = __ARG_2.'get'()
.annotate 'line', 1966
$P3 = $P2.'getidentifier'()
$P1.'push'($P3)
# }
.annotate 'line', 1967
$P2 = __ARG_2.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_1
if $P3 goto __label_0
__label_1: # enddo
.annotate 'line', 1968
'RequireOp'(';', $P2)
.annotate 'line', 1969
setattribute self, 'path', $P1
# }
.annotate 'line', 1970

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 1971
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1972
# Body
# {
.annotate 'line', 1974
# var path: $P1
getattribute $P1, self, 'path'
.annotate 'line', 1975
# string name: $S1
$P3 = $P1.'pop'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 1976
self.'annotate'(__ARG_1)
.annotate 'line', 1978
# var vdata: $P2
$P2 = self.'createvar'($S1, 'P')
.annotate 'line', 1979
$P3 = $P2.'getreg'()
__ARG_1.'print'('get_hll_global ', $P3, ', ')
.annotate 'line', 1981
# int n: $I1
set $P4, $P1
set $I1, $P4
set $I2, $I1
null $I3
.annotate 'line', 1982
if $I2 == $I3 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 1984
__ARG_1.'say'("'", $S1, "'")
goto __label_1 # break
__label_2: # default
.annotate 'line', 1987
$P4 = 'getparrotkey'($P1)
__ARG_1.'say'($P4, " , '", $S1, "'")
__label_1: # switch end
# }
.annotate 'line', 1989

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 1956
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1958
addattribute $P0, 'path'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1999
# Body
# {
.annotate 'line', 2001
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 2002
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'expr', $P2
.annotate 'line', 2003
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2004

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2005
# Body
# {
.annotate 'line', 2007
getattribute $P3, self, 'expr'
$P2 = $P3.'optimize'()
setattribute self, 'expr', $P2
.annotate 'line', 2008
.return(self)
# }
.annotate 'line', 2009

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2010
# Body
# {
.annotate 'line', 2012
getattribute $P1, self, 'expr'
$P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2013

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 1996
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 1998
addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2030
# Body
# {
.annotate 'line', 2032
setattribute self, 'type', __ARG_1
.annotate 'line', 2033
setattribute self, 'reg', __ARG_2
.annotate 'line', 2034
setattribute self, 'scope', __ARG_3
box $P2, __ARG_4
.annotate 'line', 2035
setattribute self, 'flags', $P2
.annotate 'line', 2036
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2037

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2038
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2040
setattribute self, 'id', $P1
# }
.annotate 'line', 2041

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2042
# Body
# {
box $P1, __ARG_1
.annotate 'line', 2044
setattribute self, 'lexname', $P1
# }
.annotate 'line', 2045

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2046
# Body
# {
getattribute $P1, self, 'type'
.return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2047
# Body
# {
getattribute $P1, self, 'reg'
.return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2048
# Body
# {
getattribute $P1, self, 'scope'
.return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2049
# Body
# {
getattribute $P1, self, 'value'
.return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2050
# Body
# {
getattribute $P1, self, 'value'
isnull $I1, $P1
not $I1
.return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2051
# Body
# {
getattribute $P1, self, 'id'
.return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2052
# Body
# {
getattribute $P1, self, 'lexname'
.return($P1)
# }

.end # getlex


.sub 'isvolatile' :method

.annotate 'line', 2053
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
.annotate 'line', 2022
addattribute $P0, 'type'
.annotate 'line', 2023
addattribute $P0, 'reg'
.annotate 'line', 2024
addattribute $P0, 'scope'
.annotate 'line', 2025
addattribute $P0, 'flags'
.annotate 'line', 2026
addattribute $P0, 'value'
.annotate 'line', 2027
addattribute $P0, 'id'
.annotate 'line', 2028
addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2059
# Body
# {
.annotate 'line', 2061
setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2062

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2063
# Body
# {
.annotate 'line', 2065
'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2066

.end # get_string

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2058
addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2073
# Body
# {
.annotate 'line', 2075
root_new $P2, ['parrot';'Hash']
setattribute self, 'locals', $P2
# }
.annotate 'line', 2076

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2077
# Body
# {
.annotate 'line', 2079
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2080
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2081
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2082
if_null $P2, __label_1
concat $S3, "Redeclared '", $S1
concat $S3, $S3, "'"
.annotate 'line', 2083
'SyntaxError'($S3, __ARG_1)
__label_1: # endif
.annotate 'line', 2084
# string reg: $S2
$P4 = self.'createreg'(__ARG_2)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 2085
# var data: $P3
new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2086
$P1[$S1] = $P3
.annotate 'line', 2087
.return($P3)
# }
.annotate 'line', 2088

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2089
# Body
# {
.annotate 'line', 2091
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2092
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2093
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2094
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2095
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2096
new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2097

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2098
# Body
# {
.annotate 'line', 2100
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2101
# string sname: $S1
set $P4, __ARG_1
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 2102
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2103
if_null $P2, __label_1
concat $S2, "Redeclared '", $S1
concat $S2, $S2, "'"
.annotate 'line', 2104
'SyntaxError'($S2, __ARG_1)
__label_1: # endif
.annotate 'line', 2105
# var data: $P3
new $P3, [ 'VarData' ]
new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2106
isnull $I1, __ARG_4
not $I1
unless $I1 goto __label_3
isne $I1, __ARG_4, ''
__label_3:
unless $I1 goto __label_2
.annotate 'line', 2107
$P3.'setid'(__ARG_4)
__label_2: # endif
.annotate 'line', 2108
$P1[$S1] = $P3
# }
.annotate 'line', 2109

.end # createconst


.sub 'getvar' :method
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
isnull $I1, $P2
unless $I1 goto __label_2
getattribute $P3, self, 'owner'
isnull $I1, $P3
not $I1
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2116
getattribute $P4, self, 'owner'
$P2 = $P4.'getvar'(__ARG_1)
__label_1: # endif
.annotate 'line', 2117
isnull $I1, $P2
not $I1
unless $I1 goto __label_4
isa $I2, $P2, 'VarData'
not $I1, $I2
__label_4:
unless $I1 goto __label_3
.annotate 'line', 2118
'InternalError'('Incorrect data for Variable', __ARG_1)
__label_3: # endif
.annotate 'line', 2119
.return($P2)
# }
.annotate 'line', 2120

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2121
# Body
# {
.annotate 'line', 2123
# var locals: $P1
getattribute $P1, self, 'locals'
.annotate 'line', 2124
# string sname: $S1
set $P3, __ARG_1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2125
# var exist: $P2
$P2 = $P1[$S1]
.annotate 'line', 2126
.return($P2)
# }
.annotate 'line', 2127

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2128
# Body
# {
.annotate 'line', 2130
# var lexowner: $P1
$P1 = self.'getouter'()
.annotate 'line', 2131
# string lexname: $S1
$P2 = $P1.'createlex'(__ARG_1)
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2132
.return($S1)
# }
.annotate 'line', 2133

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2134
# Body
# {
.annotate 'line', 2136
# var lexowner: $P1
set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2138
self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2139
.return('__WLEX_self')
# }
.annotate 'line', 2140

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2072
addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2149
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'issimple' :method

.annotate 'line', 2159
# Body
# {
.return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2160
# Body
# {
.return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2161
# Body
# {
.return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2162
# Body
# {
.return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2163
# Body
# {
.return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2164
# Body
# {
.return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2165
# Body
# {
.return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2166
# Body
# {
.return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2167
# Body
# {
.return(0)
# }

.end # isnegable


.sub 'initexpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2168
# Body
# {
.annotate 'line', 2170
self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2171

.end # initexpr


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2172
# Body
# {
.annotate 'line', 2174
getattribute $P1, self, 'owner'
.tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2175

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2176
# Body
# {
.annotate 'line', 2179
.return(self)
# }
.annotate 'line', 2180

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2181
# Body
# {
.annotate 'line', 2183
# string type: $S1
$P1 = self.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2184
# string reg: $S2
ne $S1, 'v', __label_2
set $S2, ''
goto __label_1
__label_2:
$S2 = self.'tempreg'($S1)
__label_1:
.annotate 'line', 2185
self.'emit'(__ARG_1, $S2)
.annotate 'line', 2186
.return($S2)
# }
.annotate 'line', 2187

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2188
# Body
# {
.annotate 'line', 2190
getattribute $P1, self, 'start'
'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2191

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Expr' ]
.annotate 'line', 2157
get_class $P1, [ 'CommonBase' ]
addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2196
# Body
# {
.return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2194
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2204
# Body
# {
.annotate 'line', 2206
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 2207
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 2208
$P2 = $P1.'isop'('(')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 2209
'SyntaxError'('anonymous function expected', $P1)
__label_0: # endif
.annotate 'line', 2210
new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
set $P3, $P4
setattribute self, 'fn', $P3
# }
.annotate 'line', 2211

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2212
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2213
# Body
# {
.annotate 'line', 2215
getattribute $P3, self, 'fn'
$P2 = $P3.'optimize'()
setattribute self, 'fn', $P2
.annotate 'line', 2216
.return(self)
# }
.annotate 'line', 2217

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2218
# Body
# {
.annotate 'line', 2220
# var fn: $P1
getattribute $P1, self, 'fn'
.annotate 'line', 2221
# string reg: $S1
$P2 = self.'tempreg'('P')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2222
self.'annotate'(__ARG_1)
.annotate 'line', 2223
$P2 = $P1.'getsubid'()
__ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
set $S2, __ARG_2
.annotate 'line', 2224
eq $S2, '', __label_1
.annotate 'line', 2225
__ARG_1.'say'('newclosure ', __ARG_2, ', ', $S1)
__label_1: # endif
# }
.annotate 'line', 2226

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2201
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2203
addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2239
# Body
# {
.annotate 'line', 2241
setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2242
.return(self)
# }
.annotate 'line', 2243

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2244
# Body
# {
.annotate 'line', 2246
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2247

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2248
# Body
# {
.annotate 'line', 2250
getattribute $P3, self, 'condexpr'
$P2 = $P3.'optimize'()
setattribute self, 'condexpr', $P2
.annotate 'line', 2251
.return(self)
# }
.annotate 'line', 2252

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2253
# Body
# {
.annotate 'line', 2255
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2256
$P2 = $P1.'isliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 2257
$P3 = $P1.'checkresult'()
set $S1, $P3
set $S2, 'I'
if $S1 == $S2 goto __label_3
goto __label_2
# switch
__label_3: # case
.annotate 'line', 2259
# int n: $I1
$P4 = $P1.'getIntegerValue'()
set $I1, $P4
.annotate 'line', 2260
ne $I1, 0, __label_4
.annotate 'line', 2261
.return(2)
goto __label_5
__label_4: # else
.annotate 'line', 2263
.return(1)
__label_5: # endif
__label_2: # default
__label_1: # switch end
# }
__label_0: # endif
.annotate 'line', 2266
.return(0)
# }
.annotate 'line', 2267

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2268
# Body
# {
.annotate 'line', 2270
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2272
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2273
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2274
$P1.'emit_if'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2276
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2277
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2278
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
.annotate 'line', 2281
__ARG_1.'emitif_null'($S1, __ARG_3)
__label_9: # case
__label_10: # case
.annotate 'line', 2284
__ARG_1.'emitif'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2287
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2290

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2291
# Body
# {
.annotate 'line', 2293
# var condexpr: $P1
getattribute $P1, self, 'condexpr'
.annotate 'line', 2295
isa $I1, $P1, 'ComparatorBaseExpr'
if $I1 goto __label_2
.annotate 'line', 2296
isa $I1, $P1, 'NullCheckerExpr'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 2297
$P1.'emit_else'(__ARG_1, __ARG_2)
goto __label_1
__label_0: # else
# {
.annotate 'line', 2299
# string reg: $S1
$P2 = $P1.'emit_get'(__ARG_1)
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 2300
# string type: $S2
$P2 = $P1.'checkresult'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
set $S3, $S2
set $S4, 'S'
.annotate 'line', 2301
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
.annotate 'line', 2304
__ARG_1.'emitif_null'($S1, __ARG_2)
__label_9: # case
__label_10: # case
.annotate 'line', 2307
__ARG_1.'emitunless'($S1, __ARG_2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2310
'InternalError'('Invalid if condition')
__label_5: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2313

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Condition' ]
.annotate 'line', 2238
addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2320
# Body
# {
.return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2321
# Body
# {
.return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Literal' ]
.annotate 'line', 2318
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2329
# Body
# {
.annotate 'line', 2331
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2332
setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2333

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2334
# Body
# {
.return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2335
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2336
# Body
# {
.annotate 'line', 2338
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2339
# string str: $S1
getattribute $P2, $P1, 'str'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2340
# int typesinglequoted: $I1
isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2341
# int need_unicode: $I2
null $I2
box $P2, $S1
.annotate 'line', 2342
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $I3, $P3
# {
.annotate 'line', 2343
le $I3, 127, __label_3
# {
set $I2, 1
goto __label_2 # break
.annotate 'line', 2345
# }
__label_3: # endif
# }
goto __label_1
__label_2: # endfor
unless $I2 goto __label_4
.annotate 'line', 2348
# {
unless $I1 goto __label_5
.annotate 'line', 2349
# {
null $I1
.annotate 'line', 2351
# string saux: $S2
set $S2, $S1
set $S1, ''
box $P4, $S2
.annotate 'line', 2353
iter $P5, $P4
set $P5, 0
__label_6: # for iteration
unless $P5 goto __label_7
shift $S3, $P5
# {
.annotate 'line', 2354
ne $S3, '\', __label_8
set $S3, '\\'
__label_8: # endif
concat $S1, $S1, $S3
.annotate 'line', 2356
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 2359
# string result: $S4
set $S4, ''
.annotate 'line', 2360
# int l: $I4
# predefined length
length $I4, $S1
# for loop
.annotate 'line', 2361
# int i: $I5
null $I5
__label_11: # for condition
ge $I5, $I4, __label_10
# {
.annotate 'line', 2362
# string c: $S5
# predefined substr
substr $S5, $S1, $I5, 1
.annotate 'line', 2363
# int n: $I6
# predefined ord
ord $I6, $S5
.annotate 'line', 2364
le $I6, 127, __label_12
# {
.annotate 'line', 2365
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
.annotate 'line', 2366
# }
goto __label_13
__label_12: # else
concat $S4, $S4, $S5
__label_13: # endif
.annotate 'line', 2369
# }
__label_9: # for iteration
.annotate 'line', 2361
inc $I5
goto __label_11
__label_10: # for end
set $S1, $S4
.annotate 'line', 2371
# }
__label_4: # endif
.annotate 'line', 2373
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
.annotate 'line', 2377
.return($S1)
# }
.annotate 'line', 2378

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2379
# Body
# {
.annotate 'line', 2381
# var strtok: $P1
getattribute $P1, self, 'strval'
.annotate 'line', 2382
# string str: $S1
getattribute $P3, $P1, 'str'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2383
isa $I1, $P1, 'TokenQuoted'
unless $I1 goto __label_1
# {
.annotate 'line', 2384
# var s: $P2
box $P2, $S1
.annotate 'line', 2385
$P3 = $P2.'unescape'('utf8')
set $S1, $P3
# }
__label_1: # endif
.annotate 'line', 2387
.return($S1)
# }
.annotate 'line', 2388

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2389
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2391
eq $S1, '', __label_0
.annotate 'line', 2392
$P1 = self.'getPirString'()
__ARG_1.'emitset'(__ARG_2, $P1)
__label_0: # endif
# }
.annotate 'line', 2393

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2394
# Body
# {
.annotate 'line', 2396
.tailcall self.'getPirString'()
# }
.annotate 'line', 2397

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2326
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2328
addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2406
# Body
# {
.annotate 'line', 2409
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2410
setattribute self, 'pos', __ARG_2
.annotate 'line', 2411
# int n: $I1
null $I1
unless __ARG_4 goto __label_0
set $I1, __ARG_3
goto __label_1
__label_0: # else
.annotate 'line', 2413
# {
.annotate 'line', 2415
# string aux: $S1
set $P1, __ARG_2
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
set $I1, $S1
.annotate 'line', 2416
# }
__label_1: # endif
box $P2, $I1
.annotate 'line', 2418
setattribute self, 'numval', $P2
# }
.annotate 'line', 2419

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2420
# Body
# {
.return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2421
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2422
# Body
# {
.annotate 'line', 2424
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2425
# int i: $I1
set $S2, $S1
set $I1, $S2
.annotate 'line', 2426
.return($I1)
# }
.annotate 'line', 2427

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2428
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2430
eq $S1, '', __label_0
# {
.annotate 'line', 2431
# int value: $I1
$P1 = self.'getIntegerValue'()
set $I1, $P1
.annotate 'line', 2432
ne $I1, 0, __label_1
.annotate 'line', 2433
__ARG_1.'emitnull'(__ARG_2)
goto __label_2
__label_1: # else
.annotate 'line', 2435
__ARG_1.'emitset'(__ARG_2, $I1)
__label_2: # endif
# }
__label_0: # endif
# }
.annotate 'line', 2437

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2438
# Body
# {
.annotate 'line', 2440
.tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2441

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2402
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2404
addattribute $P0, 'pos'
.annotate 'line', 2405
addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2449
# Body
# {
.annotate 'line', 2451
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2452
setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2453

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2454
# Body
# {
.return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2455
# Body
# {
.return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2456
# Body
# {
.annotate 'line', 2458
# string aux: $S1
getattribute $P2, self, 'numval'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2459
# var n: $P1
new $P1, [ 'Float' ]
assign $P1, $S1
.annotate 'line', 2461
.return($P1)
# }
.annotate 'line', 2462

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2463
# Body
# {
set $S1, __ARG_2
.annotate 'line', 2465
eq $S1, '', __label_0
# {
.annotate 'line', 2466
# var n: $P1
$P1 = self.'getFloatValue'()
.annotate 'line', 2467
__ARG_1.'emitset'(__ARG_2, $P1)
# }
__label_0: # endif
# }
.annotate 'line', 2469

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2470
# Body
# {
.annotate 'line', 2474
# string aux: $S1
getattribute $P1, self, 'numval'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2475
# predefined indexof
index $I1, $S1, '.'
ge $I1, 0, __label_1
concat $S1, $S1, '.0'
__label_1: # endif
.annotate 'line', 2477
.return($S1)
# }
.annotate 'line', 2478

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2446
get_class $P1, [ 'Literal' ]
addparent $P0, $P1
.annotate 'line', 2448
addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2486
# Body
# {
.return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2487
# Body
# {
.annotate 'line', 2489
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2490
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2491

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2492
# Body
# {
.annotate 'line', 2494
getattribute $P1, self, 'name'
.tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2495

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2496
# Body
# {
.annotate 'line', 2498
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2499
if_null $P1, __label_0
.annotate 'line', 2500
.tailcall $P1.'gettype'()
goto __label_1
__label_0: # else
# {
.annotate 'line', 2502
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
.annotate 'line', 2505
.return('P')
__label_3: # default
.annotate 'line', 2507
.return('')
__label_2: # switch end
# }
__label_1: # endif
# }
.annotate 'line', 2510

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2511
# Body
# {
.annotate 'line', 2513
# string s: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2514
.return($S1)
# }
.annotate 'line', 2515

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2516
# Body
# {
.annotate 'line', 2518
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2519
unless_null $P1, __label_0
.annotate 'line', 2520
'InternalError'('Bad thing')
__label_0: # endif
.annotate 'line', 2521
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2522
# string s: $S1
null $S1
.annotate 'line', 2523
unless_null $P2, __label_1
# {
.annotate 'line', 2524
# string sname: $S2
set $P3, $P1
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
set $S3, $S2
set $S4, 'self'
.annotate 'line', 2525
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
.annotate 'line', 2531
# }
goto __label_2
__label_1: # else
# {
.annotate 'line', 2535
$P4 = $P2.'getid'()
if_null $P4, __label_8
.annotate 'line', 2536
.tailcall $P2.'getid'()
goto __label_9
__label_8: # else
.annotate 'line', 2538
$P5 = $P2.'getreg'()
set $S1, $P5
__label_9: # endif
# }
__label_2: # endif
.annotate 'line', 2540
.return($S1)
# }
.annotate 'line', 2541

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2542
# Body
# {
.annotate 'line', 2544
# var value: $P1
$P1 = self.'checkIdentifier'()
set $S2, $P1
.annotate 'line', 2545
ne $S2, '', __label_0
# {
.annotate 'line', 2546
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
concat $S2, "Variable '", $S1
concat $S2, $S2, "' is not defined"
.annotate 'line', 2547
getattribute $P2, self, 'name'
'SyntaxError'($S2, $P2)
# }
__label_0: # endif
.annotate 'line', 2549
.return($P1)
# }
.annotate 'line', 2550

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2551
# Body
# {
.annotate 'line', 2553
# var name: $P1
getattribute $P1, self, 'name'
.annotate 'line', 2554
# var desc: $P2
getattribute $P3, self, 'owner'
$P2 = $P3.'getvar'($P1)
.annotate 'line', 2555
if_null $P2, __label_0
# {
.annotate 'line', 2556
$I1 = $P2.'isconst'()
unless $I1 goto __label_2
$P3 = $P2.'getid'()
isnull $I1, $P3
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2557
.tailcall $P2.'getvalue'()
__label_1: # endif
# }
__label_0: # endif
.annotate 'line', 2559
.return(self)
# }
.annotate 'line', 2560

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2561
# Body
# {
.annotate 'line', 2563
# string id: $S1
$P2 = self.'getIdentifier'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 2564
# var desc: $P1
getattribute $P2, self, 'owner'
getattribute $P3, self, 'name'
$P1 = $P2.'getvar'($P3)
.annotate 'line', 2565
isnull $I1, $P1
not $I1
unless $I1 goto __label_2
$I1 = $P1.'isvolatile'()
__label_2:
unless $I1 goto __label_1
# {
.annotate 'line', 2566
# string lexname: $S2
$P3 = $P1.'getlex'()
null $S2
if_null $P3, __label_3
set $S2, $P3
__label_3:
.annotate 'line', 2567
isnull $I1, $S2
not $I1
unless $I1 goto __label_5
isne $I1, $S2, ''
__label_5:
unless $I1 goto __label_4
.annotate 'line', 2568
__ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
__label_4: # endif
# }
__label_1: # endif
.annotate 'line', 2570
.return($S1)
# }
.annotate 'line', 2571

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2572
# Body
# {
set $S2, __ARG_2
.annotate 'line', 2574
eq $S2, '', __label_0
# {
.annotate 'line', 2575
self.'annotate'(__ARG_1)
.annotate 'line', 2576
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
.annotate 'line', 2577
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_0: # endif
# }
.annotate 'line', 2579

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2580
# Body
# {
.annotate 'line', 2582
self.'annotate'(__ARG_1)
.annotate 'line', 2583
# string id: $S1
$P1 = self.'emit_getid'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2584
.return($S1)
# }
.annotate 'line', 2585

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2586
# Body
# {
.annotate 'line', 2588
self.'annotate'(__ARG_1)
.annotate 'line', 2589
$P2 = self.'isnull'()
if_null $P2, __label_0
unless $P2 goto __label_0
# predefined die
.annotate 'line', 2590
die "NO"
__label_0: # endif
.annotate 'line', 2591
# string typeleft: $S1
$P2 = self.'checkresult'()
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 2592
# string lreg: $S2
$P3 = self.'getIdentifier'()
null $S2
if_null $P3, __label_2
set $S2, $P3
__label_2:
.annotate 'line', 2593
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
# {
set $S6, $S1
set $S7, 'S'
.annotate 'line', 2594
if $S6 == $S7 goto __label_7
set $S7, 'P'
if $S6 == $S7 goto __label_8
goto __label_6
# switch
__label_7: # case
__label_8: # case
.annotate 'line', 2597
__ARG_1.'emitnull'($S2)
goto __label_5 # break
__label_6: # default
.annotate 'line', 2600
getattribute $P4, self, 'start'
'SyntaxError'("Can't assign null to that type", $P4)
__label_5: # switch end
# }
goto __label_4
__label_3: # else
.annotate 'line', 2603
isa $I1, __ARG_2, 'IndexExpr'
unless $I1 goto __label_9
.annotate 'line', 2604
__ARG_2.'emit'(__ARG_1, $S2)
goto __label_10
__label_9: # else
# {
.annotate 'line', 2606
# string typeright: $S3
$P4 = __ARG_2.'checkresult'()
null $S3
if_null $P4, __label_11
set $S3, $P4
__label_11:
.annotate 'line', 2607
ne $S3, 'v', __label_12
.annotate 'line', 2608
getattribute $P5, self, 'start'
'SyntaxError'("Can't assign from void expression", $P5)
__label_12: # endif
.annotate 'line', 2609
ne $S1, $S3, __label_13
# {
.annotate 'line', 2610
__ARG_2.'emit'(__ARG_1, $S2)
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 2613
# string rreg: $S4
$P5 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P5, __label_15
set $S4, $P5
__label_15:
.annotate 'line', 2614
self.'annotate'(__ARG_1)
.annotate 'line', 2615
iseq $I1, $S1, 'P'
unless $I1 goto __label_18
isne $I1, $S3, 'P'
__label_18:
unless $I1 goto __label_16
.annotate 'line', 2616
__ARG_1.'emitbox'($S2, $S4)
goto __label_17
__label_16: # else
.annotate 'line', 2618
__ARG_1.'emitset'($S2, $S4)
__label_17: # endif
# }
__label_14: # endif
# }
__label_10: # endif
__label_4: # endif
.annotate 'line', 2621
# var desc: $P1
getattribute $P6, self, 'owner'
getattribute $P7, self, 'name'
$P1 = $P6.'getvar'($P7)
.annotate 'line', 2622
$P6 = $P1.'isvolatile'()
if_null $P6, __label_19
unless $P6 goto __label_19
# {
.annotate 'line', 2623
# string lexname: $S5
$P7 = $P1.'getlex'()
null $S5
if_null $P7, __label_20
set $S5, $P7
__label_20:
.annotate 'line', 2624
isnull $I2, $S5
not $I2
unless $I2 goto __label_22
isne $I2, $S5, ''
__label_22:
unless $I2 goto __label_21
.annotate 'line', 2625
__ARG_1.'say'("store_lex '", $S5, "', ", $S2)
__label_21: # endif
# }
__label_19: # endif
.annotate 'line', 2627
.return($S2)
# }
.annotate 'line', 2628

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2483
get_class $P1, [ 'SimpleExpr' ]
addparent $P0, $P1
.annotate 'line', 2485
addattribute $P0, 'name'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2635
# Body
# {
.annotate 'line', 2637
self.'initexpr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2638

.end # initop

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2633
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'initunary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2646
# Body
# {
.annotate 'line', 2648
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2649
setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2650

.end # initunary


.sub 'optimizearg' :method

.annotate 'line', 2651
# Body
# {
.annotate 'line', 2653
getattribute $P3, self, 'subexpr'
$P2 = $P3.'optimize'()
setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2654

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2655
# Body
# {
.annotate 'line', 2657
self.'optimizearg'()
.annotate 'line', 2658
.return(self)
# }
.annotate 'line', 2659

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2643
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2645
addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2668
# Body
# {
.annotate 'line', 2670
self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2671
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2672
setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2673

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2674
# Body
# {
.annotate 'line', 2676
self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2677
.return(self)
# }
.annotate 'line', 2678

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2679
# Body
# {
.annotate 'line', 2681
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
getattribute $P3, __ARG_1, 'lexpr'
getattribute $P4, __ARG_1, 'rexpr'
.tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2682

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2683
# Body
# {
.annotate 'line', 2685
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2686
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2687

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2688
# Body
# {
.annotate 'line', 2690
self.'optimizearg'()
.annotate 'line', 2691
.return(self)
# }
.annotate 'line', 2692

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2664
get_class $P1, [ 'OpExpr' ]
addparent $P0, $P1
.annotate 'line', 2666
addattribute $P0, 'lexpr'
.annotate 'line', 2667
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2699
# Body
# {
.annotate 'line', 2701
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2702

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2703
# Body
# {
.annotate 'line', 2705
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2706
.return(self)
# }
.annotate 'line', 2707

.end # set


.sub 'optimize' :method

.annotate 'line', 2708
# Body
# {
.annotate 'line', 2710
self.'optimizearg'()
.annotate 'line', 2711
getattribute $P4, self, 'subexpr'
$P3 = $P4.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2712
# var numval: $P1
getattribute $P5, self, 'subexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 2713
# int i: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 2714
getattribute $P4, self, 'owner'
getattribute $P5, self, 'subexpr'
getattribute $P6, $P5, 'start'
neg $I2, $I1
.tailcall 'integerValue'($P4, $P6, $I2)
# }
__label_0: # endif
# {
.annotate 'line', 2717
getattribute $P7, self, 'subexpr'
$P6 = $P7.'isfloatliteral'()
if_null $P6, __label_1
unless $P6 goto __label_1
# {
.annotate 'line', 2718
# var numval: $P2
getattribute $P8, self, 'subexpr'
getattribute $P2, $P8, 'numval'
.annotate 'line', 2719
# float n: $N1
# predefined string
set $S1, $P2
set $N1, $S1
.annotate 'line', 2720
getattribute $P7, self, 'owner'
getattribute $P8, self, 'subexpr'
getattribute $P9, $P8, 'start'
neg $N2, $N1
.tailcall 'floatValue'($P7, $P9, $N2)
# }
__label_1: # endif
# }
.annotate 'line', 2723
.return(self)
# }
.annotate 'line', 2724

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2725
# Body
# {
.annotate 'line', 2727
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2728
self.'annotate'(__ARG_1)
.annotate 'line', 2729
__ARG_1.'say'('neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 2730

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 2697
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 2737
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 2738
# Body
# {
.annotate 'line', 2740
.return('I')
# }
.annotate 'line', 2741

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2742
# Body
# {
.annotate 'line', 2744
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2745
.return(self)
# }
.annotate 'line', 2746

.end # set


.sub 'optimize' :method

.annotate 'line', 2747
# Body
# {
.annotate 'line', 2749
self.'optimizearg'()
.annotate 'line', 2750
# var subexpr: $P1
getattribute $P1, self, 'subexpr'
.annotate 'line', 2751
$P3 = $P1.'isintegerliteral'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 2752
# var numval: $P2
getattribute $P2, $P1, 'numval'
.annotate 'line', 2753
# int n: $I1
set $P3, $P2
set $I1, $P3
.annotate 'line', 2754
getattribute $P4, self, 'owner'
getattribute $P5, $P1, 'start'
not $I2, $I1
.tailcall 'integerValue'($P4, $P5, $I2)
# }
__label_0: # endif
.annotate 'line', 2756
$P4 = $P1.'isnegable'()
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 2757
.tailcall $P1.'negated'()
__label_1: # endif
.annotate 'line', 2758
.return(self)
# }
.annotate 'line', 2759

.end # optimize


.sub 'negated' :method

.annotate 'line', 2760
# Body
# {
.annotate 'line', 2762
getattribute $P1, self, 'subexpr'
.return($P1)
# }
.annotate 'line', 2763

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2764
# Body
# {
.annotate 'line', 2766
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2767
self.'annotate'(__ARG_1)
.annotate 'line', 2768
# string type: $S2
getattribute $P2, self, 'subexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
set $S3, $S2
set $S4, 'I'
.annotate 'line', 2769
if $S3 == $S4 goto __label_4
set $S4, 'P'
if $S3 == $S4 goto __label_5
goto __label_3
# switch
__label_4: # case
.annotate 'line', 2771
__ARG_1.'say'('not ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_5: # case
.annotate 'line', 2774
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 2777
__ARG_1.'say'('isfalse ', __ARG_2, ', ', $S1)
__label_2: # switch end
# }
.annotate 'line', 2779

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 2735
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2786
# Body
# {
.annotate 'line', 2788
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2789

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2790
# Body
# {
.annotate 'line', 2792
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2793
setattribute self, 'subexpr', __ARG_3
.annotate 'line', 2794
.return(self)
# }
.annotate 'line', 2795

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2796
# Body
# {
.annotate 'line', 2798
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2799
eq $S2, '', __label_1
.annotate 'line', 2800
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2801

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2802
# Body
# {
.annotate 'line', 2804
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2805
self.'annotate'(__ARG_1)
.annotate 'line', 2806
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2807
.return($S1)
# }
.annotate 'line', 2808

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 2784
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2815
# Body
# {
.annotate 'line', 2817
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2818
.return(self)
# }
.annotate 'line', 2819

.end # set


.sub 'checkresult' :method

.annotate 'line', 2820
# Body
# {
.annotate 'line', 2822
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2823

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2824
# Body
# {
.annotate 'line', 2826
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2827
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2828
eq $S2, '', __label_1
.annotate 'line', 2829
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2830
__ARG_1.'say'('inc ', $S1)
.annotate 'line', 2831
.return($S1)
# }
.annotate 'line', 2832

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 2813
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2839
# Body
# {
.annotate 'line', 2841
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2842

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2843
# Body
# {
.annotate 'line', 2845
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2846
.return(self)
# }
.annotate 'line', 2847

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2848
# Body
# {
.annotate 'line', 2850
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2851
eq $S2, '', __label_1
.annotate 'line', 2852
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2853

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2854
# Body
# {
.annotate 'line', 2856
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2857
self.'annotate'(__ARG_1)
.annotate 'line', 2858
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2859
.return($S1)
# }
.annotate 'line', 2860

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 2837
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2867
# Body
# {
.annotate 'line', 2869
self.'initunary'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2870
.return(self)
# }
.annotate 'line', 2871

.end # set


.sub 'checkresult' :method

.annotate 'line', 2872
# Body
# {
.annotate 'line', 2874
getattribute $P1, self, 'subexpr'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 2875

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2876
# Body
# {
.annotate 'line', 2878
# string reg: $S1
getattribute $P2, self, 'subexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2879
self.'annotate'(__ARG_1)
set $S2, __ARG_2
.annotate 'line', 2880
eq $S2, '', __label_1
.annotate 'line', 2881
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
.annotate 'line', 2882
__ARG_1.'say'('dec ', $S1)
.annotate 'line', 2883
.return($S1)
# }
.annotate 'line', 2884

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 2865
get_class $P1, [ 'OpUnaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2893
# Body
# {
.annotate 'line', 2895
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 2896
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2897
setattribute self, 'rexpr', __ARG_4
.annotate 'line', 2898
.return(self)
# }
.annotate 'line', 2899

.end # set


.sub 'checkresult' :method

.annotate 'line', 2900
# Body
# {
.annotate 'line', 2902
getattribute $P2, self, 'lexpr'
$P1 = $P2.'isidentifier'()
if_null $P1, __label_0
unless $P1 goto __label_0
.annotate 'line', 2903
getattribute $P3, self, 'lexpr'
.tailcall $P3.'checkresult'()
goto __label_1
__label_0: # else
.annotate 'line', 2905
'InternalError'('Unimplemented')
__label_1: # endif
# }
.annotate 'line', 2906

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 2907
# Body
# {
.annotate 'line', 2909
getattribute $P3, self, 'lexpr'
$P2 = $P3.'optimize'()
setattribute self, 'lexpr', $P2
.annotate 'line', 2910
getattribute $P3, self, 'rexpr'
$P2 = $P3.'optimize'()
setattribute self, 'rexpr', $P2
.annotate 'line', 2911
.return(self)
# }
.annotate 'line', 2912

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 2913
# Body
# {
.annotate 'line', 2915
.tailcall self.'optimize_base'()
# }
.annotate 'line', 2916

.end # optimize

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 2889
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 2891
addattribute $P0, 'lexpr'
.annotate 'line', 2892
addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2923
# Body
# {
.annotate 'line', 2925
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2926
eq $S2, '', __label_1
# {
.annotate 'line', 2927
self.'annotate'(__ARG_1)
.annotate 'line', 2928
__ARG_1.'emitset'(__ARG_2, $S1)
# }
__label_1: # endif
# }
.annotate 'line', 2930

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2931
# Body
# {
.annotate 'line', 2933
self.'annotate'(__ARG_1)
.annotate 'line', 2934
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2935
getattribute $P2, self, 'rexpr'
.tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 2936

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 2921
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2943
# Body
# {
.annotate 'line', 2945
self.'annotate'(__ARG_1)
.annotate 'line', 2946
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2947
isnull $I1, __ARG_2
not $I1
unless $I1 goto __label_2
set $S2, __ARG_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 2948
__ARG_1.'emitassign'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2949

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2950
# Body
# {
.annotate 'line', 2952
self.'annotate'(__ARG_1)
.annotate 'line', 2953
# string reg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 2954
# string reg2: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 2955
__ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 2956
.return($S1)
# }
.annotate 'line', 2957

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 2941
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2964
# Body
# {
.annotate 'line', 2966
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 2967
eq $S2, '', __label_1
.annotate 'line', 2968
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 2969

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2970
# Body
# {
.annotate 'line', 2972
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 2973
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 2974
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 2975
# string reg: $S2
$P3 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 2976
iseq $I1, $S1, 'S'
unless $I1 goto __label_4
isa $I1, $P2, 'ConcatString'
__label_4:
unless $I1 goto __label_2
.annotate 'line', 2977
$P2.'emit_concat_to'(__ARG_1, $S2)
goto __label_3
__label_2: # else
# {
.annotate 'line', 2979
# string reg2: $S3
$P4 = $P2.'emit_get'(__ARG_1)
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 2980
self.'annotate'(__ARG_1)
.annotate 'line', 2981
ne $S1, 'S', __label_6
# {
.annotate 'line', 2982
$P4 = $P2.'checkresult'()
set $S5, $P4
eq $S5, 'S', __label_8
# {
.annotate 'line', 2983
# string aux: $S4
$P5 = self.'tempreg'('S')
null $S4
if_null $P5, __label_9
set $S4, $P5
__label_9:
.annotate 'line', 2984
__ARG_1.'emitset'($S4, $S3)
set $S3, $S4
.annotate 'line', 2985
# }
__label_8: # endif
.annotate 'line', 2987
__ARG_1.'emitconcat1'($S2, $S3)
# }
goto __label_7
__label_6: # else
.annotate 'line', 2990
__ARG_1.'emitaddto'($S2, $S3)
__label_7: # endif
# }
__label_3: # endif
.annotate 'line', 2992
.return($S2)
# }
.annotate 'line', 2993

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 2962
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3000
# Body
# {
.annotate 'line', 3002
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3003
eq $S2, '', __label_1
.annotate 'line', 3004
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3005

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3006
# Body
# {
.annotate 'line', 3008
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3009
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3010
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3011
self.'annotate'(__ARG_1)
.annotate 'line', 3012
__ARG_1.'say'('sub ', $S2, ', ', $S3)
.annotate 'line', 3013
.return($S2)
# }
.annotate 'line', 3014

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 2998
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3021
# Body
# {
.annotate 'line', 3023
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3024
eq $S2, '', __label_1
.annotate 'line', 3025
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3026

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3027
# Body
# {
.annotate 'line', 3029
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3030
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3031
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3032
self.'annotate'(__ARG_1)
.annotate 'line', 3033
__ARG_1.'say'('mul ', $S2, ', ', $S3)
.annotate 'line', 3034
.return($S2)
# }
.annotate 'line', 3035

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3019
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3042
# Body
# {
.annotate 'line', 3044
# string reg: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
set $S2, __ARG_2
.annotate 'line', 3045
eq $S2, '', __label_1
.annotate 'line', 3046
__ARG_1.'emitset'(__ARG_2, $S1)
__label_1: # endif
# }
.annotate 'line', 3047

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3048
# Body
# {
.annotate 'line', 3050
# string type: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3051
# string reg: $S2
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3052
# string reg2: $S3
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3053
self.'annotate'(__ARG_1)
.annotate 'line', 3054
__ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3055
.return($S2)
# }
.annotate 'line', 3056

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3040
get_class $P1, [ 'OpBaseAssignExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3063
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3064
# Body
# {
.annotate 'line', 3066
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3067
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3068
# string regl: $S3
getattribute $P4, self, 'lexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 3069
# string regr: $S4
getattribute $P4, self, 'rexpr'
$P3 = $P4.'emit_get'(__ARG_1)
null $S4
if_null $P3, __label_3
set $S4, $P3
__label_3:
.annotate 'line', 3070
self.'annotate'(__ARG_1)
.annotate 'line', 3071
# string aux: $S5
null $S5
.annotate 'line', 3072
iseq $I1, $S1, 'N'
if $I1 goto __label_6
iseq $I1, $S2, 'N'
__label_6:
unless $I1 goto __label_4
# {
.annotate 'line', 3074
ne $S1, 'I', __label_7
# {
.annotate 'line', 3075
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3076
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3077
# }
__label_7: # endif
.annotate 'line', 3079
ne $S2, 'I', __label_8
# {
.annotate 'line', 3080
$P5 = self.'tempreg'('N')
set $S5, $P5
.annotate 'line', 3081
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3082
# }
__label_8: # endif
# }
goto __label_5
__label_4: # else
.annotate 'line', 3085
iseq $I1, $S2, 'I'
unless $I1 goto __label_11
iseq $I1, $S1, 'P'
__label_11:
unless $I1 goto __label_9
# {
.annotate 'line', 3086
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3087
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3088
# }
goto __label_10
__label_9: # else
.annotate 'line', 3090
iseq $I2, $S2, 'P'
unless $I2 goto __label_14
iseq $I2, $S1, 'I'
__label_14:
unless $I2 goto __label_12
# {
.annotate 'line', 3091
$P6 = self.'tempreg'('I')
set $S5, $P6
.annotate 'line', 3092
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3093
# }
goto __label_13
__label_12: # else
.annotate 'line', 3095
iseq $I2, $S2, 'S'
unless $I2 goto __label_17
iseq $I2, $S1, 'P'
__label_17:
unless $I2 goto __label_15
# {
.annotate 'line', 3096
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3097
__ARG_1.'emitset'($S5, $S3)
set $S3, $S5
.annotate 'line', 3098
# }
goto __label_16
__label_15: # else
.annotate 'line', 3100
iseq $I3, $S2, 'P'
unless $I3 goto __label_19
iseq $I3, $S1, 'S'
__label_19:
unless $I3 goto __label_18
# {
.annotate 'line', 3101
$P7 = self.'tempreg'('S')
set $S5, $P7
.annotate 'line', 3102
__ARG_1.'emitset'($S5, $S4)
set $S4, $S5
.annotate 'line', 3103
# }
__label_18: # endif
__label_16: # endif
__label_13: # endif
__label_10: # endif
__label_5: # endif
set $I3, __ARG_3
null $I4
.annotate 'line', 3106
if $I3 == $I4 goto __label_22
set $I4, 1
if $I3 == $I4 goto __label_23
set $I4, 2
if $I3 == $I4 goto __label_24
goto __label_21
# switch
__label_22: # case
.annotate 'line', 3108
self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_23: # case
.annotate 'line', 3111
self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_24: # case
.annotate 'line', 3114
self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
goto __label_20 # break
__label_21: # default
__label_20: # switch end
.annotate 'line', 3115
# }
.annotate 'line', 3117

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3118
# Body
# {
.annotate 'line', 3120
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3121

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3122
# Body
# {
.annotate 'line', 3124
self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3125

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3126
# Body
# {
.annotate 'line', 3128
self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3129

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3061
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3142
# Body
# {
.annotate 'line', 3144
getattribute $P1, __ARG_1, 'owner'
getattribute $P2, __ARG_1, 'start'
self.'initexpr'($P1, $P2)
.annotate 'line', 3145
setattribute self, 'expr', __ARG_2
box $P2, __ARG_3
.annotate 'line', 3146
setattribute self, 'checknull', $P2
# }
.annotate 'line', 3147

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3148
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3149
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3150
# Body
# {
.annotate 'line', 3152
# int checkneg: $I1
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
box $P1, $I1
.annotate 'line', 3153
setattribute self, 'checknull', $P1
.annotate 'line', 3154
.return(self)
# }
.annotate 'line', 3155

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3156
# Body
# {
.annotate 'line', 3158
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3159
self.'annotate'(__ARG_1)
.annotate 'line', 3160
__ARG_1.'say'('isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3161
getattribute $P1, self, 'checknull'
isfalse $I1, $P1
unless $I1 goto __label_1
.annotate 'line', 3162
__ARG_1.'say'('not ', __ARG_2)
__label_1: # endif
# }
.annotate 'line', 3163

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3164
# Body
# {
.annotate 'line', 3166
# string reg: $S1
getattribute $P2, self, 'expr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3167
self.'annotate'(__ARG_1)
.annotate 'line', 3168
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
.annotate 'line', 3169

.end # emit_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3137
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3139
addattribute $P0, 'expr'
.annotate 'line', 3140
addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3176
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3177
# Body
# {
.annotate 'line', 3179
new $P1, [ 'OpNotEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3180

.end # negated


.sub 'optimize' :method

.annotate 'line', 3181
# Body
# {
.annotate 'line', 3183
self.'optimizearg'()
.annotate 'line', 3184
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3185
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3186
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3187
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3188
# {
unless $I2 goto __label_1
.annotate 'line', 3190
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 1)
goto __label_2
__label_1: # else
.annotate 'line', 3192
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 1)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3195
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 1)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3196
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3197
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3198
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3199
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3200
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3201
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3202
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
iseq $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3205
.return(self)
# }
.annotate 'line', 3206

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3207
# Body
# {
.annotate 'line', 3209
__ARG_1.'say'('iseq ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3210

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3211
# Body
# {
.annotate 'line', 3213
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3214

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3215
# Body
# {
.annotate 'line', 3217
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3218

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3219
# Body
# {
.annotate 'line', 3221
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3222

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3174
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3229
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3230
# Body
# {
.annotate 'line', 3232
new $P1, [ 'OpEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3233

.end # negated


.sub 'optimize' :method

.annotate 'line', 3234
# Body
# {
.annotate 'line', 3236
self.'optimizearg'()
.annotate 'line', 3237
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3238
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3239
# int lnull: $I1
$P3 = $P1.'isnull'()
set $I1, $P3
.annotate 'line', 3240
# int rnull: $I2
$P3 = $P2.'isnull'()
set $I2, $P3
unless $I1 goto __label_0
.annotate 'line', 3241
# {
unless $I2 goto __label_1
.annotate 'line', 3243
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, 0)
goto __label_2
__label_1: # else
.annotate 'line', 3245
new $P7, [ 'NullCheckerExpr' ]
getattribute $P8, self, 'rexpr'
$P7.'NullCheckerExpr'(self, $P8, 0)
set $P6, $P7
.return($P6)
__label_2: # endif
# }
__label_0: # endif
unless $I2 goto __label_3
.annotate 'line', 3248
new $P5, [ 'NullCheckerExpr' ]
getattribute $P6, self, 'lexpr'
$P5.'NullCheckerExpr'(self, $P6, 0)
set $P4, $P5
.return($P4)
__label_3: # endif
.annotate 'line', 3249
$I3 = $P1.'isliteral'()
unless $I3 goto __label_5
$I3 = $P2.'isliteral'()
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3250
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_6
set $S1, $P7
__label_6:
.annotate 'line', 3251
# string rtype: $S2
$P8 = $P2.'checkresult'()
null $S2
if_null $P8, __label_7
set $S2, $P8
__label_7:
.annotate 'line', 3252
iseq $I3, $S1, 'S'
unless $I3 goto __label_9
iseq $I3, $S2, 'S'
__label_9:
unless $I3 goto __label_8
# {
.annotate 'line', 3253
# string ls: $S3
getattribute $P10, $P1, 'strval'
getattribute $P9, $P10, 'str'
null $S3
if_null $P9, __label_10
set $S3, $P9
__label_10:
.annotate 'line', 3254
# string rs: $S4
getattribute $P10, $P2, 'strval'
getattribute $P9, $P10, 'str'
null $S4
if_null $P9, __label_11
set $S4, $P9
__label_11:
.annotate 'line', 3255
getattribute $P11, self, 'owner'
getattribute $P12, self, 'start'
isne $I4, $S3, $S4
.tailcall 'integerValue'($P11, $P12, $I4)
# }
__label_8: # endif
# }
__label_4: # endif
.annotate 'line', 3258
.return(self)
# }
.annotate 'line', 3259

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3260
# Body
# {
.annotate 'line', 3262
__ARG_1.'say'('isne ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3263

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3264
# Body
# {
.annotate 'line', 3266
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3267

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3268
# Body
# {
.annotate 'line', 3270
__ARG_1.'say'('ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3271

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3272
# Body
# {
.annotate 'line', 3274
__ARG_1.'say'('eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3275

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3227
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

.annotate 'line', 3283
# Body
# {
.annotate 'line', 3285
self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
box $P1, __ARG_1
.annotate 'line', 3286
setattribute self, 'positive', $P1
# }
.annotate 'line', 3287

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3288
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3289
# Body
# {
.annotate 'line', 3291
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3292
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
.annotate 'line', 3293

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3294
# Body
# {
.annotate 'line', 3296
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3297
# string op: $S1
unless $I1 goto __label_1
set $S1, 'issame'
goto __label_0
__label_1:
set $S1, 'isntsame'
__label_0:
.annotate 'line', 3298
__ARG_1.'say'($S1, ' ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3299

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3300
# Body
# {
.annotate 'line', 3302
self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3303

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3304
# Body
# {
.annotate 'line', 3306
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3307
# string op: $S1
unless $I1 goto __label_1
set $S1, 'eq_addr'
goto __label_0
__label_1:
set $S1, 'ne_addr'
__label_0:
.annotate 'line', 3308
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
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
# int positive: $I1
getattribute $P1, self, 'positive'
set $I1, $P1
.annotate 'line', 3313
# string op: $S1
unless $I1 goto __label_1
set $S1, 'ne_addr'
goto __label_0
__label_1:
set $S1, 'eq_addr'
__label_0:
.annotate 'line', 3314
__ARG_1.'say'($S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3315

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3280
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 3282
addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3322
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3323
# Body
# {
.annotate 'line', 3325
new $P1, [ 'OpGreaterEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3326

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3327
# Body
# {
.annotate 'line', 3329
__ARG_1.'say'('islt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3330

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3331
# Body
# {
.annotate 'line', 3333
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3334

.end # emitop_if


.sub 'emitop_else' :method
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

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3320
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3345
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3346
# Body
# {
.annotate 'line', 3348
new $P1, [ 'OpLessEqualExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3349

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3350
# Body
# {
.annotate 'line', 3352
__ARG_1.'say'('isgt ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3353

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3354
# Body
# {
.annotate 'line', 3356
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3357

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3358
# Body
# {
.annotate 'line', 3360
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3361

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3343
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3368
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3369
# Body
# {
.annotate 'line', 3371
new $P1, [ 'OpGreaterExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3372

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3373
# Body
# {
.annotate 'line', 3375
__ARG_1.'say'('isle ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3376

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3377
# Body
# {
.annotate 'line', 3379
__ARG_1.'say'('le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3380

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3381
# Body
# {
.annotate 'line', 3383
__ARG_1.'say'('gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3384

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3366
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3391
# Body
# {
.return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3392
# Body
# {
.annotate 'line', 3394
new $P1, [ 'OpLessExpr' ]
.tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3395

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3396
# Body
# {
.annotate 'line', 3398
__ARG_1.'say'('isge ', __ARG_2, ', ', __ARG_3, ', ', __ARG_4)
# }
.annotate 'line', 3399

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3400
# Body
# {
.annotate 'line', 3402
__ARG_1.'say'('ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3403

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3404
# Body
# {
.annotate 'line', 3406
__ARG_1.'say'('lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3407

.end # emitop_else

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3389
get_class $P1, [ 'ComparatorBaseExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3414
# Body
# {
.annotate 'line', 3416
.return('I')
# }
.annotate 'line', 3417

.end # checkresult

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3412
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3424
# Body
# {
.annotate 'line', 3426
self.'optimizearg'()
.annotate 'line', 3427
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3428
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3429
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3430
eq $I1, 0, __label_1
.annotate 'line', 3431
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3433
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3435
.return(self)
# }
.annotate 'line', 3436

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3437
# Body
# {
.annotate 'line', 3439
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
.annotate 'line', 3440
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_5
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_5:
unless $I1 goto __label_3
# {
.annotate 'line', 3441
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_6
set $S2, $P3
__label_6:
.annotate 'line', 3442
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_7
set $S3, $P2
__label_7:
.annotate 'line', 3443
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3444
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3445
__ARG_1.'say'('and ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 3448
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_8
set $S4, $P4
__label_8:
.annotate 'line', 3449
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3450
__ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3451
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3452
__ARG_1.'emitlabel'($S4)
# }
__label_4: # endif
# }
.annotate 'line', 3454

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3422
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3461
# Body
# {
.annotate 'line', 3463
self.'optimizearg'()
.annotate 'line', 3464
getattribute $P3, self, 'lexpr'
$P2 = $P3.'isintegerliteral'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 3465
# var lval: $P1
getattribute $P4, self, 'lexpr'
getattribute $P1, $P4, 'numval'
.annotate 'line', 3466
# int ln: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 3467
ne $I1, 0, __label_1
.annotate 'line', 3468
getattribute $P3, self, 'rexpr'
.return($P3)
goto __label_2
__label_1: # else
.annotate 'line', 3470
getattribute $P4, self, 'owner'
getattribute $P5, self, 'start'
.tailcall 'integerValue'($P4, $P5, $I1)
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 3472
.return(self)
# }
.annotate 'line', 3473

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3474
# Body
# {
.annotate 'line', 3476
# string res: $S1
null $S1
.annotate 'line', 3477
if_null __ARG_2, __label_0
set $S1, __ARG_2
goto __label_1
__label_0: # else
.annotate 'line', 3480
$P1 = self.'tempreg'('I')
set $S1, $P1
__label_1: # endif
.annotate 'line', 3481
getattribute $P1, self, 'lexpr'
$I1 = $P1.'issimple'()
unless $I1 goto __label_4
getattribute $P2, self, 'rexpr'
$I1 = $P2.'issimple'()
__label_4:
unless $I1 goto __label_2
# {
.annotate 'line', 3482
# string op1: $S2
$P3 = self.'tempreg'('I')
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 3483
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_6
set $S3, $P2
__label_6:
.annotate 'line', 3484
getattribute $P3, self, 'lexpr'
$P3.'emit'(__ARG_1, $S2)
.annotate 'line', 3485
getattribute $P4, self, 'rexpr'
$P4.'emit'(__ARG_1, $S3)
.annotate 'line', 3486
__ARG_1.'say'('or ', $S1, ', ', $S2, ', ', $S3)
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 3489
# string l: $S4
getattribute $P5, self, 'owner'
$P4 = $P5.'genlabel'()
null $S4
if_null $P4, __label_7
set $S4, $P4
__label_7:
.annotate 'line', 3490
getattribute $P5, self, 'lexpr'
$P5.'emit'(__ARG_1, $S1)
.annotate 'line', 3491
__ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3492
getattribute $P6, self, 'rexpr'
$P6.'emit'(__ARG_1, $S1)
.annotate 'line', 3493
__ARG_1.'emitlabel'($S4)
# }
__label_3: # endif
# }
.annotate 'line', 3495

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3459
get_class $P1, [ 'OpBaseBoolExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]

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
newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3500
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3512
# Body
# {
.annotate 'line', 3514
self.'optimizearg'()
.annotate 'line', 3515
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3516
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3517
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3518
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3519
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3520
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
band $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3522
.return(self)
# }
.annotate 'line', 3523

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3524
# Body
# {
.annotate 'line', 3526
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
.annotate 'line', 3527
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3528
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3529
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3530
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3531
__ARG_1.'say'('band ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3532

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3510
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3539
# Body
# {
.annotate 'line', 3541
self.'optimizearg'()
.annotate 'line', 3542
getattribute $P3, self, 'lexpr'
$I3 = $P3.'isintegerliteral'()
unless $I3 goto __label_1
getattribute $P4, self, 'rexpr'
$I3 = $P4.'isintegerliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3543
# var lval: $P1
getattribute $P5, self, 'lexpr'
getattribute $P1, $P5, 'numval'
.annotate 'line', 3544
# int ln: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 3545
# var rval: $P2
getattribute $P4, self, 'rexpr'
getattribute $P2, $P4, 'numval'
.annotate 'line', 3546
# int rn: $I2
set $P5, $P2
set $I2, $P5
.annotate 'line', 3547
getattribute $P6, self, 'owner'
getattribute $P7, self, 'start'
set $I4, $I1
set $I5, $I2
bor $I3, $I4, $I5
.tailcall 'integerValue'($P6, $P7, $I3)
# }
__label_0: # endif
.annotate 'line', 3549
.return(self)
# }
.annotate 'line', 3550

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3551
# Body
# {
.annotate 'line', 3553
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
.annotate 'line', 3554
# string op1: $S2
$P1 = self.'tempreg'('I')
null $S2
if_null $P1, __label_3
set $S2, $P1
__label_3:
.annotate 'line', 3555
# string op2: $S3
$P2 = self.'tempreg'('I')
null $S3
if_null $P2, __label_4
set $S3, $P2
__label_4:
.annotate 'line', 3556
getattribute $P2, self, 'lexpr'
$P2.'emit'(__ARG_1, $S2)
.annotate 'line', 3557
getattribute $P3, self, 'rexpr'
$P3.'emit'(__ARG_1, $S3)
.annotate 'line', 3558
__ARG_1.'say'('bor ', $S1, ', ', $S2, ', ', $S3)
# }
.annotate 'line', 3559

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3537
get_class $P1, [ 'OpBaseBinExpr' ]
addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3567
# Body
# {
.annotate 'line', 3569
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 3570
isa $I1, __ARG_3, 'ConcatString'
unless $I1 goto __label_0
# {
.annotate 'line', 3571
getattribute $P2, __ARG_3, 'values'
setattribute self, 'values', $P2
.annotate 'line', 3572
isa $I1, __ARG_4, 'ConcatString'
unless $I1 goto __label_2
.annotate 'line', 3573
getattribute $P1, self, 'values'
getattribute $P2, __ARG_4, 'values'
$P1.'append'($P2)
goto __label_3
__label_2: # else
.annotate 'line', 3575
getattribute $P3, self, 'values'
$P3.'push'(__ARG_4)
__label_3: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 3577
isa $I2, __ARG_4, 'ConcatString'
unless $I2 goto __label_4
# {
.annotate 'line', 3578
getattribute $P4, __ARG_4, 'values'
setattribute self, 'values', $P4
.annotate 'line', 3579
getattribute $P4, self, 'values'
$P4.'unshift'(__ARG_3)
# }
goto __label_5
__label_4: # else
.annotate 'line', 3582
root_new $P6, ['parrot';'ResizablePMCArray']
$P6.'push'(__ARG_3)
$P6.'push'(__ARG_4)
setattribute self, 'values', $P6
__label_5: # endif
__label_1: # endif
# }
.annotate 'line', 3583

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3584
# Body
# {
.return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3585
# Body
# {
.annotate 'line', 3587
# var values: $P1
getattribute $P1, self, 'values'
.annotate 'line', 3588
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3589
# string regvalues: $P2
new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3590
# int i: $I2
null $I2
# for loop
null $I2
__label_2: # for condition
.annotate 'line', 3591
ge $I2, $I1, __label_1
.annotate 'line', 3592
# predefined string
$P4 = $P1[$I2]
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
$P2[$I2] = $S1
__label_0: # for iteration
.annotate 'line', 3591
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3593
.return($P2)
# }
.annotate 'line', 3594

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3595
# Body
# {
.annotate 'line', 3597
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3598
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3599
# string auxreg: $S1
set $S1, '$S0'
.annotate 'line', 3600
self.'annotate'(__ARG_1)
.annotate 'line', 3601
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3602
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3603
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P2)
__label_0: # for iteration
.annotate 'line', 3602
inc $I2
goto __label_2
__label_1: # for end
.annotate 'line', 3604
__ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 3605

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3606
# Body
# {
.annotate 'line', 3608
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3609
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3610
# string auxreg: $S1
$P2 = self.'tempreg'('S')
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3611
self.'annotate'(__ARG_1)
.annotate 'line', 3612
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3613
# int i: $I2
set $I2, 2
__label_3: # for condition
ge $I2, $I1, __label_2
.annotate 'line', 3614
$P3 = $P1[$I2]
__ARG_1.'emitconcat1'($S1, $P3)
__label_1: # for iteration
.annotate 'line', 3613
inc $I2
goto __label_3
__label_2: # for end
.annotate 'line', 3615
.return($S1)
# }
.annotate 'line', 3616

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3617
# Body
# {
.annotate 'line', 3619
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3620
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3621
self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 3622
# int i: $I2
null $I2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3623
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3622
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3624

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3625
# Body
# {
.annotate 'line', 3627
# var regvalues: $P1
$P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3628
# int nvalues: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 3629
self.'annotate'(__ARG_1)
.annotate 'line', 3630
$P2 = $P1[0]
$P3 = $P1[1]
__ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 3631
# int i: $I2
set $I2, 2
__label_2: # for condition
ge $I2, $I1, __label_1
.annotate 'line', 3632
$P2 = $P1[$I2]
__ARG_1.'emitconcat1'(__ARG_2, $P2)
__label_0: # for iteration
.annotate 'line', 3631
inc $I2
goto __label_2
__label_1: # for end
# }
.annotate 'line', 3633

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3564
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 3566
addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 3640
# Body
# {
.annotate 'line', 3642
self.'optimizearg'()
.annotate 'line', 3643
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3644
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3645
# string ltype: $S1
$P10 = $P1.'checkresult'()
null $S1
if_null $P10, __label_0
set $S1, $P10
__label_0:
.annotate 'line', 3646
# string rtype: $S2
$P10 = $P2.'checkresult'()
null $S2
if_null $P10, __label_1
set $S2, $P10
__label_1:
.annotate 'line', 3647
$I3 = $P1.'isliteral'()
unless $I3 goto __label_3
$I3 = $P2.'isliteral'()
__label_3:
unless $I3 goto __label_2
# {
.annotate 'line', 3648
iseq $I4, $S1, 'S'
unless $I4 goto __label_5
iseq $I4, $S2, 'S'
__label_5:
unless $I4 goto __label_4
# {
.annotate 'line', 3649
# var etok: $P3
getattribute $P3, $P1, 'strval'
.annotate 'line', 3650
# var rtok: $P4
getattribute $P4, $P2, 'strval'
.annotate 'line', 3651
# var t: $P5
null $P5
.annotate 'line', 3652
# string es: $S3
getattribute $P11, $P3, 'str'
null $S3
if_null $P11, __label_6
set $S3, $P11
__label_6:
.annotate 'line', 3653
# string rs: $S4
getattribute $P11, $P4, 'str'
null $S4
if_null $P11, __label_7
set $S4, $P11
__label_7:
.annotate 'line', 3654
isa $I3, $P3, 'TypeSingleQuoted'
unless $I3 goto __label_10
isa $I3, $P4, 'TypeSingleQuoted'
__label_10:
unless $I3 goto __label_8
.annotate 'line', 3655
new $P12, [ 'TokenSingleQuoted' ]
getattribute $P13, $P3, 'file'
getattribute $P14, $P3, 'line'
concat $S5, $S3, $S4
$P12.'TokenSingleQuoted'($P13, $P14, $S5)
set $P5, $P12
goto __label_9
__label_8: # else
.annotate 'line', 3657
new $P15, [ 'TokenQuoted' ]
getattribute $P16, $P3, 'file'
getattribute $P17, $P3, 'line'
concat $S6, $S3, $S4
$P15.'TokenQuoted'($P16, $P17, $S6)
set $P5, $P15
__label_9: # endif
.annotate 'line', 3658
new $P13, [ 'StringLiteral' ]
getattribute $P14, self, 'owner'
$P13.'StringLiteral'($P14, $P5)
set $P12, $P13
.return($P12)
# }
__label_4: # endif
.annotate 'line', 3660
iseq $I4, $S1, 'I'
unless $I4 goto __label_12
iseq $I4, $S2, 'I'
__label_12:
unless $I4 goto __label_11
# {
.annotate 'line', 3661
# var lval: $P6
getattribute $P6, $P1, 'numval'
.annotate 'line', 3662
# int ln: $I1
set $P15, $P6
set $I1, $P15
.annotate 'line', 3663
# var rval: $P7
getattribute $P7, $P2, 'numval'
.annotate 'line', 3664
# int rn: $I2
set $P16, $P7
set $I2, $P16
.annotate 'line', 3665
getattribute $P17, self, 'owner'
getattribute $P18, self, 'start'
add $I5, $I1, $I2
.tailcall 'integerValue'($P17, $P18, $I5)
# }
__label_11: # endif
# {
.annotate 'line', 3668
$P18 = 'floatresult'($S1, $S2)
if_null $P18, __label_13
unless $P18 goto __label_13
# {
.annotate 'line', 3669
# var lvalf: $P8
getattribute $P8, $P1, 'numval'
.annotate 'line', 3670
# float lf: $N1
# predefined string
set $S5, $P8
set $N1, $S5
.annotate 'line', 3671
# var rvalf: $P9
getattribute $P9, $P2, 'numval'
.annotate 'line', 3672
# float rf: $N2
# predefined string
set $S6, $P9
set $N2, $S6
.annotate 'line', 3673
getattribute $P19, self, 'owner'
getattribute $P20, self, 'start'
add $N3, $N1, $N2
.tailcall 'floatValue'($P19, $P20, $N3)
# }
__label_13: # endif
# }
# }
__label_2: # endif
.annotate 'line', 3677
iseq $I5, $S1, 'S'
unless $I5 goto __label_15
iseq $I5, $S2, 'S'
__label_15:
unless $I5 goto __label_14
# {
.annotate 'line', 3678
new $P20, [ 'ConcatString' ]
getattribute $P21, self, 'owner'
getattribute $P22, self, 'start'
$P20.'ConcatString'($P21, $P22, $P1, $P2)
set $P19, $P20
.return($P19)
# }
__label_14: # endif
.annotate 'line', 3680
.return(self)
# }
.annotate 'line', 3681

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3682
# Body
# {
.annotate 'line', 3684
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3685
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3686
ne $S1, $S2, __label_2
.annotate 'line', 3687
.return($S1)
__label_2: # endif
.annotate 'line', 3688
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'S'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3689
.return('S')
__label_3: # endif
.annotate 'line', 3690
iseq $I1, $S1, 'S'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3691
.return('S')
__label_5: # endif
.annotate 'line', 3692
$P3 = 'floatresult'($S1, $S2)
if_null $P3, __label_7
unless $P3 goto __label_7
.annotate 'line', 3693
.return('N')
__label_7: # endif
.annotate 'line', 3694
.return('I')
# }
.annotate 'line', 3695

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3696
# Body
# {
.annotate 'line', 3698
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3699
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3700
# string restype: $S1
$P3 = self.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3701
# string ltype: $S2
$P3 = $P1.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3702
# string rtype: $S3
$P4 = $P2.'checkresult'()
null $S3
if_null $P4, __label_2
set $S3, $P4
__label_2:
.annotate 'line', 3704
# string rleft: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_3
set $S4, $P4
__label_3:
.annotate 'line', 3705
# string rright: $S5
$P5 = $P2.'emit_get'(__ARG_1)
null $S5
if_null $P5, __label_4
set $S5, $P5
__label_4:
.annotate 'line', 3706
ne $S1, 'S', __label_5
# {
.annotate 'line', 3707
isne $I1, $S2, 'S'
if $I1 goto __label_8
isne $I1, $S3, 'S'
__label_8:
unless $I1 goto __label_7
# {
.annotate 'line', 3708
# string aux: $S6
$P5 = self.'tempreg'('S')
null $S6
if_null $P5, __label_9
set $S6, $P5
__label_9:
.annotate 'line', 3709
eq $S2, 'S', __label_10
# {
.annotate 'line', 3710
__ARG_1.'emitset'($S6, $S4)
set $S4, $S6
.annotate 'line', 3711
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 3714
__ARG_1.'emitset'($S6, $S5)
set $S5, $S6
.annotate 'line', 3715
# }
__label_11: # endif
# }
__label_7: # endif
.annotate 'line', 3718
__ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 3721
iseq $I1, $S1, 'I'
unless $I1 goto __label_14
isne $I1, $S2, 'I'
if $I1 goto __label_15
isne $I1, $S3, 'I'
__label_15:
__label_14:
unless $I1 goto __label_12
# {
.annotate 'line', 3722
# string l: $S7
null $S7
.annotate 'line', 3723
ne $S2, 'I', __label_16
set $S7, $S4
goto __label_17
__label_16: # else
# {
.annotate 'line', 3725
$P6 = self.'tempreg'('I')
set $S7, $P6
.annotate 'line', 3726
__ARG_1.'emitset'($S7, $S4)
# }
__label_17: # endif
.annotate 'line', 3728
# string r: $S8
null $S8
.annotate 'line', 3729
ne $S3, 'I', __label_18
set $S8, $S5
goto __label_19
__label_18: # else
# {
.annotate 'line', 3731
$P6 = self.'tempreg'('I')
set $S8, $P6
.annotate 'line', 3732
__ARG_1.'emitset'($S8, $S5)
# }
__label_19: # endif
.annotate 'line', 3734
__ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
goto __label_13
__label_12: # else
.annotate 'line', 3737
__ARG_1.'emitadd'(__ARG_2, $S4, $S5)
__label_13: # endif
# }
__label_6: # endif
# }
.annotate 'line', 3739

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 3638
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 3746
# Body
# {
.annotate 'line', 3748
self.'optimizearg'()
.annotate 'line', 3749
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3750
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3751
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3752
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3753
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3754
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3755
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3756
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3757
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3758
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3759
getattribute $P7, self, 'owner'
getattribute $P8, self, 'start'
sub $I4, $I1, $I2
.tailcall 'integerValue'($P7, $P8, $I4)
# }
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 3762
.return(self)
# }
.annotate 'line', 3763

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3764
# Body
# {
.annotate 'line', 3766
# string rl: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'checkresult'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3767
# string rr: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'checkresult'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3768
ne $S1, $S2, __label_2
.annotate 'line', 3769
.return($S1)
__label_2: # endif
.annotate 'line', 3770
iseq $I1, $S1, 'I'
unless $I1 goto __label_4
iseq $I1, $S2, 'N'
__label_4:
unless $I1 goto __label_3
.annotate 'line', 3771
.return('N')
__label_3: # endif
.annotate 'line', 3772
iseq $I1, $S1, 'N'
unless $I1 goto __label_6
iseq $I1, $S2, 'I'
__label_6:
unless $I1 goto __label_5
.annotate 'line', 3773
.return('N')
__label_5: # endif
.annotate 'line', 3774
.return('I')
# }
.annotate 'line', 3775

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3776
# Body
# {
.annotate 'line', 3778
# string lreg: $S1
getattribute $P2, self, 'lexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 3779
# string rreg: $S2
getattribute $P2, self, 'rexpr'
$P1 = $P2.'emit_get'(__ARG_1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 3780
__ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 3781

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 3744
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 3788
# Body
# {
.annotate 'line', 3790
self.'optimizearg'()
.annotate 'line', 3791
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3792
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3793
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3794
# string ltype: $S1
$P7 = $P1.'checkresult'()
null $S1
if_null $P7, __label_2
set $S1, $P7
__label_2:
.annotate 'line', 3795
# string rtype: $S2
$P7 = $P2.'checkresult'()
null $S2
if_null $P7, __label_3
set $S2, $P7
__label_3:
.annotate 'line', 3796
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3797
# var lval: $P3
getattribute $P3, $P1, 'numval'
.annotate 'line', 3798
# int ln: $I1
set $P8, $P3
set $I1, $P8
.annotate 'line', 3799
# var rval: $P4
getattribute $P4, $P2, 'numval'
.annotate 'line', 3800
# int rn: $I2
set $P8, $P4
set $I2, $P8
.annotate 'line', 3801
getattribute $P9, self, 'owner'
getattribute $P10, self, 'start'
mul $I4, $I1, $I2
.tailcall 'integerValue'($P9, $P10, $I4)
# }
__label_4: # endif
# {
.annotate 'line', 3804
$P9 = 'floatresult'($S1, $S2)
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 3805
# var lvalf: $P5
getattribute $P5, $P1, 'numval'
.annotate 'line', 3806
# float lf: $N1
# predefined string
set $S3, $P5
set $N1, $S3
.annotate 'line', 3807
# var rvalf: $P6
getattribute $P6, $P2, 'numval'
.annotate 'line', 3808
# float rf: $N2
# predefined string
set $S3, $P6
set $N2, $S3
.annotate 'line', 3809
getattribute $P10, self, 'owner'
getattribute $P11, self, 'start'
mul $N3, $N1, $N2
.tailcall 'floatValue'($P10, $P11, $N3)
# }
__label_6: # endif
# }
# }
__label_0: # endif
.annotate 'line', 3813
.return(self)
# }
.annotate 'line', 3814

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3815
# Body
# {
.annotate 'line', 3817
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3818
# string rl: $S1
getattribute $P3, self, 'lexpr'
$P2 = $P3.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 3819
# string rr: $S2
getattribute $P3, self, 'rexpr'
$P2 = $P3.'checkresult'()
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 3820
ne $S1, $S2, __label_2
.annotate 'line', 3821
.return($S1)
__label_2: # endif
.annotate 'line', 3822
ne $S1, 'S', __label_3
.annotate 'line', 3823
.return('S')
goto __label_4
__label_3: # else
.annotate 'line', 3825
.return('N')
__label_4: # endif
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
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3831
# string ltype: $S1
$P3 = $P1.'checkresult'()
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 3832
# string rtype: $S2
$P3 = $P2.'checkresult'()
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 3833
# string lreg: $S3
null $S3
# string rreg: $S4
null $S4
.annotate 'line', 3834
ne $S1, 'S', __label_2
# {
.annotate 'line', 3835
$P4 = $P1.'emit_get'(__ARG_1)
set $S3, $P4
.annotate 'line', 3836
$P4 = $P2.'emit_get'(__ARG_1)
set $S4, $P4
.annotate 'line', 3837
# string rval: $S5
null $S5
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3838
if $S7 == $S8 goto __label_5
goto __label_4
# switch
__label_5: # case
set $S5, $S4
goto __label_3 # break
__label_4: # default
.annotate 'line', 3843
$P5 = self.'tempreg'('I')
set $S5, $P5
.annotate 'line', 3844
__ARG_1.'emitset'($S5, $S4)
__label_3: # switch end
.annotate 'line', 3846
self.'annotate'(__ARG_1)
.annotate 'line', 3847
__ARG_1.'say'('repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 3848
.return()
# }
__label_2: # endif
.annotate 'line', 3850
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
.annotate 'line', 3851
$P5 = $P1.'emit_get'(__ARG_1)
set $S3, $P5
.annotate 'line', 3852
$P6 = $P2.'emit_get'(__ARG_1)
set $S4, $P6
.annotate 'line', 3853
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 3854
.return()
# }
__label_6: # endif
.annotate 'line', 3859
ne $S1, 'N', __label_10
# {
.annotate 'line', 3860
$P6 = $P1.'emit_get'(__ARG_1)
set $S3, $P6
.annotate 'line', 3861
$P7 = $P2.'emit_get'(__ARG_1)
set $S4, $P7
.annotate 'line', 3862
# string rval: $S6
null $S6
set $S7, $S2
set $S8, 'I'
.annotate 'line', 3863
if $S7 == $S8 goto __label_13
set $S8, 'N'
if $S7 == $S8 goto __label_14
goto __label_12
# switch
__label_13: # case
.annotate 'line', 3865
$P7 = self.'tempreg'('N')
set $S6, $P7
.annotate 'line', 3866
__ARG_1.'emitset'($S6, $S4)
set $S6, $S4
goto __label_11 # break
__label_14: # case
set $S6, $S4
goto __label_11 # break
__label_12: # default
.annotate 'line', 3873
$P8 = self.'tempreg'('N')
set $S6, $P8
.annotate 'line', 3874
__ARG_1.'emitset'($S6, $S4)
__label_11: # switch end
.annotate 'line', 3876
self.'annotate'(__ARG_1)
.annotate 'line', 3877
__ARG_1.'emitmul'(__ARG_2, $S3, $S6)
.annotate 'line', 3878
.return()
# }
__label_10: # endif
.annotate 'line', 3881
# int nleft: $I1
null $I1
# int nright: $I2
null $I2
.annotate 'line', 3882
$P8 = $P1.'issimple'()
isfalse $I3, $P8
if $I3 goto __label_17
$I3 = $P1.'isidentifier'()
__label_17:
unless $I3 goto __label_15
# {
.annotate 'line', 3883
$P10 = self.'checkresult'()
$P9 = self.'tempreg'($P10)
set $S3, $P9
.annotate 'line', 3884
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 3887
$P9 = $P1.'getIntegerValue'()
set $I1, $P9
set $S3, $I1
.annotate 'line', 3888
# }
__label_16: # endif
.annotate 'line', 3890
$P10 = $P2.'issimple'()
isfalse $I4, $P10
if $I4 goto __label_20
$I4 = $P2.'isidentifier'()
__label_20:
unless $I4 goto __label_18
# {
.annotate 'line', 3891
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3892
$P2.'emit'(__ARG_1, $S4)
# }
goto __label_19
__label_18: # else
# {
set $S9, $S2
set $S10, 'S'
.annotate 'line', 3895
if $S9 == $S10 goto __label_23
set $S10, 'I'
if $S9 == $S10 goto __label_24
goto __label_22
# switch
__label_23: # case
.annotate 'line', 3897
$P12 = self.'checkresult'()
$P11 = self.'tempreg'($P12)
set $S4, $P11
.annotate 'line', 3898
$P2.'emit'(__ARG_1, $S4)
goto __label_21 # break
__label_24: # case
__label_22: # default
.annotate 'line', 3902
$P13 = $P2.'getIntegerValue'()
set $I2, $P13
set $S4, $I2
goto __label_21 # break
__label_21: # switch end
.annotate 'line', 3904
# }
__label_19: # endif
.annotate 'line', 3907
self.'annotate'(__ARG_1)
.annotate 'line', 3908
__ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 3909

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 3786
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 3916
# Body
# {
.annotate 'line', 3918
self.'optimizearg'()
.annotate 'line', 3919
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3920
# var rexpr: $P2
getattribute $P2, self, 'rexpr'
.annotate 'line', 3921
$I3 = $P1.'isliteral'()
unless $I3 goto __label_1
$I3 = $P2.'isliteral'()
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 3922
# string ltype: $S1
$P5 = $P1.'checkresult'()
null $S1
if_null $P5, __label_2
set $S1, $P5
__label_2:
.annotate 'line', 3923
# string rtype: $S2
$P5 = $P2.'checkresult'()
null $S2
if_null $P5, __label_3
set $S2, $P5
__label_3:
.annotate 'line', 3924
# var lval: $P3
null $P3
.annotate 'line', 3925
# var rval: $P4
null $P4
.annotate 'line', 3926
iseq $I3, $S1, 'I'
unless $I3 goto __label_5
iseq $I3, $S2, 'I'
__label_5:
unless $I3 goto __label_4
# {
.annotate 'line', 3927
getattribute $P3, $P1, 'numval'
.annotate 'line', 3928
# int ln: $I1
set $P6, $P3
set $I1, $P6
.annotate 'line', 3929
getattribute $P4, $P2, 'numval'
.annotate 'line', 3930
# int rn: $I2
set $P6, $P4
set $I2, $P6
.annotate 'line', 3931
eq $I2, 0, __label_6
.annotate 'line', 3932
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
.annotate 'line', 3935
$P7 = 'floatresult'($S1, $S2)
if_null $P7, __label_7
unless $P7 goto __label_7
# {
.annotate 'line', 3936
getattribute $P3, $P1, 'numval'
.annotate 'line', 3937
# float lf: $N1
# predefined string
set $S3, $P3
set $N1, $S3
.annotate 'line', 3938
getattribute $P4, $P2, 'numval'
.annotate 'line', 3939
# float rf: $N2
# predefined string
set $S3, $P4
set $N2, $S3
set $N3, 0
.annotate 'line', 3940
eq $N2, $N3, __label_8
.annotate 'line', 3941
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
.annotate 'line', 3945
.return(self)
# }
.annotate 'line', 3946

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 3947
# Body
# {
.annotate 'line', 3949
.return('N')
# }
.annotate 'line', 3950

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3951
# Body
# {
.annotate 'line', 3953
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3954
# var lreg: $P2
null $P2
.annotate 'line', 3955
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_0
.annotate 'line', 3956
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3958
$P2 = self.'tempreg'('N')
.annotate 'line', 3959
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3961
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3962
# var rreg: $P4
null $P4
.annotate 'line', 3963
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'N', __label_2
.annotate 'line', 3964
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3966
$P4 = self.'tempreg'('N')
.annotate 'line', 3967
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 3969
self.'annotate'(__ARG_1)
.annotate 'line', 3970
__ARG_1.'say'('div ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 3971

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 3914
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3978
# Body
# {
.annotate 'line', 3980
.return('I')
# }
.annotate 'line', 3981

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3982
# Body
# {
.annotate 'line', 3984
# var lexpr: $P1
getattribute $P1, self, 'lexpr'
.annotate 'line', 3985
# var lreg: $P2
null $P2
.annotate 'line', 3986
$P5 = $P1.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_0
.annotate 'line', 3987
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 3989
$P2 = self.'tempreg'('I')
.annotate 'line', 3990
$P1.'emit'(__ARG_1, $P2)
# }
__label_1: # endif
.annotate 'line', 3992
# var rexpr: $P3
getattribute $P3, self, 'rexpr'
.annotate 'line', 3993
# var rreg: $P4
null $P4
.annotate 'line', 3994
$P5 = $P3.'checkresult'()
set $S1, $P5
ne $S1, 'I', __label_2
.annotate 'line', 3995
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 3997
$P4 = self.'tempreg'('I')
.annotate 'line', 3998
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 4000
self.'annotate'(__ARG_1)
.annotate 'line', 4001
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 4002

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 3976
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4009
# Body
# {
.annotate 'line', 4011
.return('I')
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
ne $S1, 'I', __label_0
.annotate 'line', 4018
$P2 = $P1.'emit_get'(__ARG_1)
goto __label_1
__label_0: # else
# {
.annotate 'line', 4020
$P2 = self.'tempreg'('I')
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
ne $S1, 'I', __label_2
.annotate 'line', 4026
$P4 = $P3.'emit_get'(__ARG_1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 4028
$P4 = self.'tempreg'('I')
.annotate 'line', 4029
$P3.'emit'(__ARG_1, $P4)
# }
__label_3: # endif
.annotate 'line', 4031
self.'annotate'(__ARG_1)
.annotate 'line', 4036
__ARG_1.'say'('mod ', __ARG_2, ', ', $P2, ', ', $P4)
# }
.annotate 'line', 4037

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4007
get_class $P1, [ 'OpBinaryExpr' ]
addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4046
# Body
# {
.annotate 'line', 4048
setattribute self, 'arg', __ARG_1
.annotate 'line', 4049
setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4050

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4051
# Body
# {
.annotate 'line', 4053
getattribute $P3, self, 'arg'
$P2 = $P3.'optimize'()
setattribute self, 'arg', $P2
.annotate 'line', 4054
.return(self)
# }
.annotate 'line', 4055

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4056
# Body
# {
.annotate 'line', 4058
getattribute $P1, self, 'arg'
.tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4059

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Argument' ]
.annotate 'line', 4044
addattribute $P0, 'arg'
.annotate 'line', 4045
addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4062
# Body
# {
.annotate 'line', 4064
iter $P2, __ARG_1
set $P2, 0
__label_0: # for iteration
unless $P2 goto __label_1
shift $P1, $P2
.annotate 'line', 4065
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_2
.annotate 'line', 4066
.return(0)
__label_2: # endif
goto __label_0
__label_1: # endfor
.annotate 'line', 4067
.return(1)
# }
.annotate 'line', 4068

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4077
# Body
# {
.annotate 'line', 4079
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4080
setattribute self, 'predef', __ARG_3
.annotate 'line', 4081
setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4082

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4083
# Body
# {
.annotate 'line', 4085
getattribute $P1, self, 'predef'
.tailcall $P1.'result'()
# }
.annotate 'line', 4086

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4087
# Body
# {
.annotate 'line', 4089
# var predef: $P1
getattribute $P1, self, 'predef'
.annotate 'line', 4090
# var args: $P2
getattribute $P2, self, 'args'
.annotate 'line', 4091
# string argreg: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4092
# var arg: $P4
null $P4
.annotate 'line', 4093
# int np: $I1
$P6 = $P1.'params'()
set $I1, $P6
set $I4, $I1
set $I5, -1
.annotate 'line', 4094
if $I4 == $I5 goto __label_2
set $I5, -2
if $I4 == $I5 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 4096
iter $P7, $P2
set $P7, 0
__label_4: # for iteration
unless $P7 goto __label_5
shift $P4, $P7
# {
.annotate 'line', 4097
# string reg: $S1
getattribute $P8, $P4, 'arg'
$P6 = $P8.'emit_get'(__ARG_1)
null $S1
if_null $P6, __label_6
set $S1, $P6
__label_6:
.annotate 'line', 4098
$P3.'push'($S1)
# }
goto __label_4
__label_5: # endfor
goto __label_0 # break
__label_3: # case
.annotate 'line', 4102
# var rawargs: $P5
root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4103
iter $P9, $P2
set $P9, 0
__label_7: # for iteration
unless $P9 goto __label_8
shift $P4, $P9
.annotate 'line', 4104
getattribute $P10, $P4, 'arg'
$P5.'push'($P10)
goto __label_7
__label_8: # endfor
.annotate 'line', 4105
getattribute $P11, self, 'predef'
getattribute $P12, self, 'start'
$P11.'expand'(__ARG_1, self, $P12, __ARG_2, $P5)
.annotate 'line', 4106
.return()
__label_1: # default
.annotate 'line', 4108
# int n: $I2
getattribute $P13, self, 'args'
set $I2, $P13
# for loop
.annotate 'line', 4109
# int i: $I3
null $I3
__label_11: # for condition
ge $I3, $I2, __label_10
# {
.annotate 'line', 4110
$P14 = $P2[$I3]
getattribute $P4, $P14, 'arg'
.annotate 'line', 4111
# string argtype: $S2
$P10 = $P4.'checkresult'()
null $S2
if_null $P10, __label_12
set $S2, $P10
__label_12:
.annotate 'line', 4112
# string paramtype: $S3
$P11 = $P1.'paramtype'($I3)
null $S3
if_null $P11, __label_13
set $S3, $P11
__label_13:
.annotate 'line', 4113
# string argr: $S4
null $S4
.annotate 'line', 4114
iseq $I4, $S2, $S3
if $I4 goto __label_16
iseq $I4, $S3, '?'
__label_16:
unless $I4 goto __label_14
.annotate 'line', 4115
$P12 = $P4.'emit_get'(__ARG_1)
set $S4, $P12
goto __label_15
__label_14: # else
# {
.annotate 'line', 4117
$P13 = self.'tempreg'($S3)
set $S4, $P13
.annotate 'line', 4118
ne $S3, 'P', __label_17
# {
.annotate 'line', 4119
# string nreg: $S5
set $S5, ''
set $S6, $S2
set $S7, 'I'
.annotate 'line', 4120
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
.annotate 'line', 4125
eq $S5, '', __label_23
.annotate 'line', 4126
__ARG_1.'say'('new ', $S4, ", '", $S5, "'")
__label_23: # endif
# }
__label_17: # endif
.annotate 'line', 4128
$P4.'emit'(__ARG_1, $S4)
# }
__label_15: # endif
.annotate 'line', 4130
$P3.'push'($S4)
# }
__label_9: # for iteration
.annotate 'line', 4109
inc $I3
goto __label_11
__label_10: # for end
__label_0: # switch end
.annotate 'line', 4133
getattribute $P14, self, 'predef'
getattribute $P15, self, 'start'
$P14.'expand'(__ARG_1, self, $P15, __ARG_2, $P3)
# }
.annotate 'line', 4134

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4072
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4074
addattribute $P0, 'predef'
.annotate 'line', 4075
addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4144
# Body
# {
.annotate 'line', 4146
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4147
setattribute self, 'funref', __ARG_4
.annotate 'line', 4148
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'args', $P5
.annotate 'line', 4149
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4150
$P5 = $P1.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4151
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4152
# {
.annotate 'line', 4153
# var modifier: $P2
null $P2
.annotate 'line', 4154
# var expr: $P3
$P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4155
$P1 = __ARG_1.'get'()
.annotate 'line', 4156
$P6 = $P1.'isop'(':')
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4157
$P1 = __ARG_1.'get'()
.annotate 'line', 4158
$P7 = $P1.'isop'('[')
if_null $P7, __label_5
unless $P7 goto __label_5
# {
.annotate 'line', 4159
new $P8, [ 'ModifierList' ]
$P8.'ModifierList'(__ARG_1, __ARG_2)
set $P2, $P8
.annotate 'line', 4160
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # else
# {
.annotate 'line', 4163
'InternalError'('Checking implementation')
# }
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 4166
getattribute $P7, self, 'args'
new $P9, [ 'Argument' ]
$P9.'Argument'($P3, $P2)
set $P8, $P9
$P7.'push'($P8)
# }
.annotate 'line', 4167
$P9 = $P1.'isop'(',')
if_null $P9, __label_2
if $P9 goto __label_1
__label_2: # enddo
.annotate 'line', 4168
$P10 = $P1.'isop'(')')
isfalse $I1, $P10
unless $I1 goto __label_7
.annotate 'line', 4169
'SyntaxError'("Expected ')' or ','", $P1)
__label_7: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4171

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4172
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4173
# Body
# {
.annotate 'line', 4175
getattribute $P7, self, 'funref'
$P6 = $P7.'optimize'()
setattribute self, 'funref', $P6
.annotate 'line', 4176
# var args: $P1
getattribute $P1, self, 'args'
.annotate 'line', 4177
'optimize_array'($P1)
.annotate 'line', 4180
# var funref: $P2
getattribute $P2, self, 'funref'
.annotate 'line', 4181
$P5 = $P2.'isidentifier'()
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 4182
# string call: $S1
$P6 = $P2.'getName'()
null $S1
if_null $P6, __label_1
set $S1, $P6
__label_1:
.annotate 'line', 4183
# var predef: $P3
# predefined elements
elements $I1, $P1
$P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4184
if_null $P3, __label_2
# {
.annotate 'line', 4185
self.'use_predef'($S1)
.annotate 'line', 4188
# var evalfun: $P4
getattribute $P4, $P3, 'evalfun'
.annotate 'line', 4189
if_null $P4, __label_3
# {
.annotate 'line', 4190
$P7 = 'arglist_hascompilevalue'($P1)
if_null $P7, __label_4
unless $P7 goto __label_4
.annotate 'line', 4191
getattribute $P8, self, 'owner'
getattribute $P9, self, 'start'
.tailcall $P4($P8, $P9, $P1)
__label_4: # endif
# }
__label_3: # endif
.annotate 'line', 4194
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
.annotate 'line', 4198
.return(self)
# }
.annotate 'line', 4199

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4200
# Body
# {
.annotate 'line', 4202
# var funref: $P1
getattribute $P1, self, 'funref'
.annotate 'line', 4203
# int ismethod: $I1
isa $I1, $P1, 'MemberExpr'
.annotate 'line', 4204
# string call: $S1
null $S1
.annotate 'line', 4205
$P9 = $P1.'isidentifier'()
if_null $P9, __label_0
unless $P9 goto __label_0
# {
.annotate 'line', 4206
$P10 = $P1.'checkIdentifier'()
set $S1, $P10
.annotate 'line', 4207
ne $S1, '', __label_2
# {
.annotate 'line', 4208
# string aux: $S2
$P9 = $P1.'getName'()
null $S2
if_null $P9, __label_3
set $S2, $P9
__label_3:
concat $S0, "'", $S2
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4209
# }
__label_2: # endif
# }
goto __label_1
__label_0: # else
unless $I1 goto __label_5
.annotate 'line', 4213
$P10 = $P1.'emit_left_get'(__ARG_1)
goto __label_4
__label_5:
$P10 = $P1.'emit_get'(__ARG_1)
__label_4:
set $S1, $P10
__label_1: # endif
.annotate 'line', 4215
# string argreg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4216
# var args: $P3
getattribute $P3, self, 'args'
.annotate 'line', 4217
iter $P11, $P3
set $P11, 0
__label_6: # for iteration
unless $P11 goto __label_7
shift $P4, $P11
# {
.annotate 'line', 4218
# var arg: $P5
getattribute $P5, $P4, 'arg'
.annotate 'line', 4219
# string reg: $S3
null $S3
.annotate 'line', 4220
$P12 = $P5.'isnull'()
if_null $P12, __label_8
unless $P12 goto __label_8
# {
.annotate 'line', 4221
$P13 = self.'tempreg'('P')
set $S3, $P13
.annotate 'line', 4222
__ARG_1.'emitnull'($S3)
# }
goto __label_9
__label_8: # else
.annotate 'line', 4225
$P12 = $P5.'emit_get'(__ARG_1)
set $S3, $P12
__label_9: # endif
.annotate 'line', 4226
$P2.'push'($S3)
# }
goto __label_6
__label_7: # endfor
.annotate 'line', 4228
self.'annotate'(__ARG_1)
.annotate 'line', 4230
isnull $I6, __ARG_2
not $I6
unless $I6 goto __label_11
set $S8, __ARG_2
isne $I6, $S8, ''
__label_11:
unless $I6 goto __label_10
# {
set $S9, __ARG_2
.annotate 'line', 4231
ne $S9, '.tailcall', __label_12
.annotate 'line', 4232
__ARG_1.'print'('.tailcall ')
goto __label_13
__label_12: # else
.annotate 'line', 4234
__ARG_1.'print'(__ARG_2, ' = ')
__label_13: # endif
# }
__label_10: # endif
unless $I1 goto __label_14
.annotate 'line', 4238
$P13 = $P1.'get_member'()
__ARG_1.'print'($S1, ".'", $P13, "'")
goto __label_15
__label_14: # else
.annotate 'line', 4240
__ARG_1.'print'($S1)
__label_15: # endif
.annotate 'line', 4242
__ARG_1.'print'('(')
.annotate 'line', 4244
# string sep: $S4
set $S4, ''
.annotate 'line', 4245
# int n: $I2
set $P14, $P2
set $I2, $P14
# for loop
.annotate 'line', 4246
# int i: $I3
null $I3
__label_18: # for condition
ge $I3, $I2, __label_17
# {
.annotate 'line', 4247
# string a: $S5
$S5 = $P2[$I3]
.annotate 'line', 4248
__ARG_1.'print'($S4, $S5)
.annotate 'line', 4249
# int isflat: $I4
null $I4
# int isnamed: $I5
null $I5
.annotate 'line', 4250
# string setname: $S6
set $S6, ''
.annotate 'line', 4251
# var modifiers: $P6
$P14 = $P3[$I3]
getattribute $P6, $P14, 'modifiers'
.annotate 'line', 4252
if_null $P6, __label_19
# {
.annotate 'line', 4253
$P15 = $P6.'getlist'()
iter $P16, $P15
set $P16, 0
__label_20: # for iteration
unless $P16 goto __label_21
shift $P7, $P16
# {
.annotate 'line', 4254
# string name: $S7
$P17 = $P7.'getname'()
null $S7
if_null $P17, __label_22
set $S7, $P17
__label_22:
.annotate 'line', 4255
ne $S7, 'flat', __label_23
set $I4, 1
__label_23: # endif
.annotate 'line', 4257
ne $S7, 'named', __label_24
# {
set $I5, 1
.annotate 'line', 4259
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
.annotate 'line', 4263
# var argmod: $P8
$P8 = $P7.'getarg'(0)
.annotate 'line', 4264
$P17 = $P8.'isstringliteral'()
isfalse $I8, $P17
unless $I8 goto __label_29
.annotate 'line', 4265
getattribute $P18, self, 'start'
'SyntaxError'('Invalid modifier', $P18)
__label_29: # endif
.annotate 'line', 4266
$P19 = $P8.'getPirString'()
set $S6, $P19
goto __label_25 # break
__label_26: # default
.annotate 'line', 4269
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
.annotate 'line', 4274
and $I7, $I8, $I9
unless $I7 goto __label_30
.annotate 'line', 4275
__ARG_1.'print'(' :flat :named')
goto __label_31
__label_30: # else
unless $I4 goto __label_32
.annotate 'line', 4277
__ARG_1.'print'(' :flat')
goto __label_33
__label_32: # else
unless $I5 goto __label_34
.annotate 'line', 4278
# {
.annotate 'line', 4279
__ARG_1.'print'(' :named')
.annotate 'line', 4280
eq $S6, '', __label_35
.annotate 'line', 4281
__ARG_1.'print'("(", $S6, ")")
__label_35: # endif
# }
__label_34: # endif
__label_33: # endif
__label_31: # endif
set $S4, ', '
.annotate 'line', 4283
# }
__label_16: # for iteration
.annotate 'line', 4246
inc $I3
goto __label_18
__label_17: # for end
.annotate 'line', 4285
__ARG_1.'say'(')')
# }
.annotate 'line', 4286

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4139
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4141
addattribute $P0, 'funref'
.annotate 'line', 4142
addattribute $P0, 'args'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4296
# Body
# {
.annotate 'line', 4298
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4299
setattribute self, 'left', __ARG_4
.annotate 'line', 4300
$P2 = __ARG_1.'get'()
setattribute self, 'right', $P2
# }
.annotate 'line', 4301

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4302
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4303
# Body
# {
.annotate 'line', 4305
getattribute $P3, self, 'left'
$P2 = $P3.'optimize'()
setattribute self, 'left', $P2
.annotate 'line', 4306
.return(self)
# }
.annotate 'line', 4307

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4308
# Body
# {
.annotate 'line', 4310
getattribute $P1, self, 'right'
.return($P1)
# }
.annotate 'line', 4311

.end # get_member


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4312
# Body
# {
.annotate 'line', 4314
# var left: $P1
getattribute $P1, self, 'left'
.annotate 'line', 4315
# string type: $S1
$P2 = $P1.'checkresult'()
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 4316
# string reg: $S2
$P2 = $P1.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 4317
eq $S1, 'P', __label_2
# {
.annotate 'line', 4318
# string auxreg: $S3
set $S3, $S2
.annotate 'line', 4319
$P3 = self.'tempreg'('P')
set $S2, $P3
.annotate 'line', 4320
__ARG_1.'emitbox'($S2, $S3)
# }
__label_2: # endif
.annotate 'line', 4322
.return($S2)
# }
.annotate 'line', 4323

.end # emit_left_get


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4324
# Body
# {
.annotate 'line', 4326
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4327
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4328
# string result: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4329
self.'annotate'(__ARG_1)
.annotate 'line', 4330
__ARG_1.'say'('getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4331
.return($S3)
# }
.annotate 'line', 4332

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4333
# Body
# {
.annotate 'line', 4335
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4336
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4337
self.'annotate'(__ARG_1)
.annotate 'line', 4338
__ARG_1.'say'('getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4339

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4340
# Body
# {
.annotate 'line', 4342
self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4343

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4344
# Body
# {
.annotate 'line', 4346
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4347
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4348
# string value: $S3
null $S3
.annotate 'line', 4349
ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4351
ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4352
$P3 = self.'tempreg'('P')
set __ARG_3, $P3
.annotate 'line', 4353
__ARG_1.'emitnull'(__ARG_3)
# }
__label_4: # endif
set $S3, __ARG_3
.annotate 'line', 4355
# }
goto __label_3
__label_2: # else
# {
.annotate 'line', 4358
$P3 = self.'tempreg'('P')
set $S3, $P3
.annotate 'line', 4359
__ARG_1.'emitbox'($S3, __ARG_3)
# }
__label_3: # endif
.annotate 'line', 4361
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4362

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4363
# Body
# {
.annotate 'line', 4365
# string obj: $S1
getattribute $P2, self, 'left'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4366
# string ident: $S2
getattribute $P2, self, 'right'
$P1 = $P2.'getidentifier'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 4367
# string value: $S3
$P3 = self.'tempreg'('P')
null $S3
if_null $P3, __label_2
set $S3, $P3
__label_2:
.annotate 'line', 4368
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
.annotate 'line', 4369
__ARG_1.'emitnull'($S3)
goto __label_4
__label_3: # else
# {
.annotate 'line', 4371
# string rreg: $S4
$P4 = __ARG_2.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_5
set $S4, $P4
__label_5:
.annotate 'line', 4372
$P4 = __ARG_2.'checkresult'()
set $S5, $P4
eq $S5, 'P', __label_6
.annotate 'line', 4373
__ARG_1.'emitbox'($S3, $S4)
goto __label_7
__label_6: # else
set $S3, $S4
__label_7: # endif
.annotate 'line', 4375
# }
__label_4: # endif
.annotate 'line', 4377
__ARG_1.'say'("setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4378
.return($S3)
# }
.annotate 'line', 4379

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4291
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4293
addattribute $P0, 'left'
.annotate 'line', 4294
addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4388
# Body
# {
.annotate 'line', 4390
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4391
setattribute self, 'left', __ARG_4
.annotate 'line', 4392
self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 4393

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 4394
# Body
# {
.annotate 'line', 4396
getattribute $P2, self, 'left'
$P1 = $P2.'checkresult'()
set $S1, $P1
ne $S1, 'S', __label_0
.annotate 'line', 4397
.return('S')
goto __label_1
__label_0: # else
.annotate 'line', 4399
.return('P')
__label_1: # endif
# }
.annotate 'line', 4400

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4401
# Body
# {
.annotate 'line', 4403
# var left: $P1
getattribute $P4, self, 'left'
$P1 = $P4.'optimize'()
.annotate 'line', 4404
setattribute self, 'left', $P1
.annotate 'line', 4405
self.'optimizeargs'()
.annotate 'line', 4409
$I2 = $P1.'isstringliteral'()
unless $I2 goto __label_1
$P5 = self.'numargs'()
set $I3, $P5
iseq $I2, $I3, 1
__label_1:
unless $I2 goto __label_0
# {
.annotate 'line', 4410
# var arg: $P2
$P2 = self.'getarg'(0)
.annotate 'line', 4411
$P5 = $P2.'isintegerliteral'()
if_null $P5, __label_2
unless $P5 goto __label_2
# {
.annotate 'line', 4412
# int ival: $I1
$P6 = $P2.'getIntegerValue'()
set $I1, $P6
.annotate 'line', 4413
# string sval: $S1
$P6 = $P1.'get_value'()
null $S1
if_null $P6, __label_3
set $S1, $P6
__label_3:
.annotate 'line', 4414
# var t: $P3
new $P3, [ 'TokenQuoted' ]
getattribute $P7, self, 'start'
getattribute $P8, $P7, 'file'
getattribute $P9, self, 'start'
getattribute $P10, $P9, 'line'
.annotate 'line', 4415
# predefined substr
substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P8, $P10, $S2)
.annotate 'line', 4416
new $P8, [ 'StringLiteral' ]
getattribute $P9, self, 'owner'
$P8.'StringLiteral'($P9, $P3)
set $P7, $P8
.return($P7)
# }
__label_2: # endif
# }
__label_0: # endif
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
# var regleft: $P1
null $P1
.annotate 'line', 4424
getattribute $P4, self, 'left'
$P3 = $P4.'isidentifier'()
if_null $P3, __label_0
unless $P3 goto __label_0
.annotate 'line', 4425
getattribute $P5, self, 'left'
$P1 = $P5.'getIdentifier'()
goto __label_1
__label_0: # else
.annotate 'line', 4427
getattribute $P6, self, 'left'
$P1 = $P6.'emit_get'(__ARG_1)
__label_1: # endif
.annotate 'line', 4428
# int nargs: $I1
$P3 = self.'numargs'()
set $I1, $P3
.annotate 'line', 4429
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4430
# string type: $S1
$P4 = self.'checkresult'()
null $S1
if_null $P4, __label_2
set $S1, $P4
__label_2:
.annotate 'line', 4431
ne $S1, 'S', __label_3
# {
.annotate 'line', 4432
eq $I1, 1, __label_5
.annotate 'line', 4433
getattribute $P5, self, 'start'
'SyntaxError'('Bad string index', $P5)
__label_5: # endif
.annotate 'line', 4434
$P6 = $P2[0]
__ARG_1.'say'('substr ', __ARG_2, ', ', $P1, ', ', $P6, ', ', 1)
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 4437
__ARG_1.'print'(__ARG_2, ' = ', $P1, '[')
.annotate 'line', 4438
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4439
__ARG_1.'say'(']')
# }
__label_4: # endif
# }
.annotate 'line', 4441

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4442
# Body
# {
.annotate 'line', 4444
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4445
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4446
self.'annotate'(__ARG_1)
.annotate 'line', 4447
__ARG_1.'print'($P1, '[')
.annotate 'line', 4448
# predefined join
join $S1, '; ', $P2
__ARG_1.'print'($S1)
.annotate 'line', 4449
__ARG_1.'say'('] = ', __ARG_3)
# }
.annotate 'line', 4450

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4451
# Body
# {
.annotate 'line', 4453
# var regleft: $P1
getattribute $P3, self, 'left'
$P1 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 4454
# var argregs: $P2
$P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4455
# string rreg: $S1
null $S1
.annotate 'line', 4456
$P3 = __ARG_2.'isnull'()
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4457
$P4 = self.'tempreg'('P')
set $S1, $P4
.annotate 'line', 4458
__ARG_1.'emitnull'($S1)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4461
$P4 = __ARG_2.'emit_get'(__ARG_1)
set $S1, $P4
__label_1: # endif
.annotate 'line', 4462
self.'annotate'(__ARG_1)
.annotate 'line', 4463
__ARG_1.'print'($P1, '[')
.annotate 'line', 4464
# predefined join
join $S2, '; ', $P2
__ARG_1.'print'($S2)
.annotate 'line', 4465
__ARG_1.'say'('] = ', $S1)
.annotate 'line', 4466
.return($S1)
# }
.annotate 'line', 4467

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4384
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
get_class $P2, [ 'SimpleArgList' ]
addparent $P0, $P2
.annotate 'line', 4386
addattribute $P0, 'left'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4476
# Body
# {
.annotate 'line', 4478
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4479
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'values', $P4
.annotate 'line', 4480
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4481
$P3 = $P1.'isop'(']')
isfalse $I1, $P3
unless $I1 goto __label_0
# {
.annotate 'line', 4482
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4483
# {
.annotate 'line', 4484
# var item: $P2
$P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4485
getattribute $P4, self, 'values'
$P4.'push'($P2)
# }
.annotate 'line', 4486
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
.annotate 'line', 4487
$P6 = $P1.'isop'(']')
isfalse $I1, $P6
unless $I1 goto __label_4
.annotate 'line', 4488
'SyntaxError'("Expected ']' or ','", $P1)
__label_4: # endif
# }
__label_0: # endif
# }
.annotate 'line', 4490

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 4491
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4492
# Body
# {
.annotate 'line', 4494
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4495
.return(self)
# }
.annotate 'line', 4496

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4497
# Body
# {
set $S2, __ARG_2
.annotate 'line', 4499
eq $S2, '', __label_0
# {
.annotate 'line', 4500
# string value: $S1
$P1 = self.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_2
set $S1, $P1
__label_2:
.annotate 'line', 4501
__ARG_1.'emitset'(__ARG_2, $S1)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 4507
self.'emit_init'(__ARG_1, '')
# }
__label_1: # endif
# }
.annotate 'line', 4509

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4510
# Body
# {
.annotate 'line', 4512
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4513
self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 4514
.return($S1)
# }
.annotate 'line', 4515

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 4516
# Body
# {
.annotate 'line', 4518
self.'annotate'(__ARG_1)
.annotate 'line', 4519
# string itemreg: $S1
null $S1
.annotate 'line', 4520
# string it_p: $S2
null $S2
.annotate 'line', 4521
eq __ARG_2, '', __label_0
# {
.annotate 'line', 4522
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 4523
$P2 = self.'tempreg'('P')
set $S2, $P2
# }
__label_0: # endif
.annotate 'line', 4525
getattribute $P2, self, 'values'
iter $P3, $P2
set $P3, 0
__label_1: # for iteration
unless $P3 goto __label_2
shift $P1, $P3
# {
.annotate 'line', 4526
# string type: $S3
$P4 = $P1.'checkresult'()
null $S3
if_null $P4, __label_3
set $S3, $P4
__label_3:
set $S5, $S3
set $S6, 'I'
.annotate 'line', 4527
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
.annotate 'line', 4529
# string aux: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_9
set $S4, $P4
__label_9:
.annotate 'line', 4530
eq __ARG_2, '', __label_10
# {
.annotate 'line', 4531
__ARG_1.'emitbox'($S2, $S4)
set $S1, $S2
.annotate 'line', 4532
# }
__label_10: # endif
goto __label_4 # break
__label_5: # default
.annotate 'line', 4536
$P5 = $P1.'isnull'()
if_null $P5, __label_11
unless $P5 goto __label_11
# {
.annotate 'line', 4537
eq __ARG_2, '', __label_13
# {
.annotate 'line', 4538
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4539
__ARG_1.'emitnull'($S1)
# }
__label_13: # endif
# }
goto __label_12
__label_11: # else
.annotate 'line', 4543
$P5 = $P1.'emit_get'(__ARG_1)
set $S1, $P5
__label_12: # endif
__label_4: # switch end
.annotate 'line', 4545
eq __ARG_2, '', __label_14
# {
.annotate 'line', 4546
self.'annotate'(__ARG_1)
.annotate 'line', 4547
__ARG_1.'say'(__ARG_2, ".'push'(", $S1, ")")
# }
__label_14: # endif
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 4550

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 4472
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4474
addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4560
# Body
# {
.annotate 'line', 4562
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4563
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4564
# var keys: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 4565
# var values: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 4566
$P7 = $P1.'isop'('}')
isfalse $I1, $P7
unless $I1 goto __label_0
# {
.annotate 'line', 4567
__ARG_1.'unget'($P1)
__label_1: # do
.annotate 'line', 4568
# {
.annotate 'line', 4569
# var key: $P4
$P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4570
'ExpectOp'(':', __ARG_1)
.annotate 'line', 4571
# var value: $P5
$P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4572
$P2.'push'($P4)
.annotate 'line', 4573
$P3.'push'($P5)
# }
.annotate 'line', 4575
$P1 = __ARG_1.'get'()
$P7 = $P1.'isop'(',')
if_null $P7, __label_2
if $P7 goto __label_1
__label_2: # enddo
.annotate 'line', 4576
$P8 = $P1.'isop'('}')
isfalse $I1, $P8
unless $I1 goto __label_4
.annotate 'line', 4577
'SyntaxError'("Expected ',' or '}'", $P1)
__label_4: # endif
# }
__label_0: # endif
.annotate 'line', 4579
setattribute self, 'keys', $P2
.annotate 'line', 4580
setattribute self, 'values', $P3
# }
.annotate 'line', 4581

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 4582
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4583
# Body
# {
.annotate 'line', 4585
getattribute $P1, self, 'keys'
'optimize_array'($P1)
.annotate 'line', 4586
getattribute $P1, self, 'values'
'optimize_array'($P1)
.annotate 'line', 4587
.return(self)
# }
.annotate 'line', 4588

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4589
# Body
# {
.annotate 'line', 4591
self.'annotate'(__ARG_1)
set $S6, __ARG_2
.annotate 'line', 4596
eq $S6, '', __label_0
.annotate 'line', 4597
__ARG_1.'say'('root_new ', __ARG_2, ", ['parrot';'Hash']")
__label_0: # endif
.annotate 'line', 4599
# var keys: $P1
getattribute $P1, self, 'keys'
.annotate 'line', 4600
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 4601
# int n: $I1
set $P5, $P1
set $I1, $P5
# for loop
.annotate 'line', 4602
# int i: $I2
null $I2
__label_3: # for condition
ge $I2, $I1, __label_2
# {
.annotate 'line', 4603
# var key: $P3
$P3 = $P1[$I2]
.annotate 'line', 4604
# string item: $S1
null $S1
.annotate 'line', 4605
$P5 = $P3.'isidentifier'()
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4606
# string id: $S2
$P6 = $P3.'getName'()
null $S2
if_null $P6, __label_6
set $S2, $P6
__label_6:
.annotate 'line', 4607
$P6 = self.'tempreg'('P')
set $S1, $P6
.annotate 'line', 4608
__ARG_1.'say'('get_hll_global ', $S1, ", '", $S2, "'")
# }
goto __label_5
__label_4: # else
.annotate 'line', 4611
$P7 = $P3.'emit_get'(__ARG_1)
set $S1, $P7
__label_5: # endif
.annotate 'line', 4613
# var value: $P4
$P4 = $P2[$I2]
.annotate 'line', 4614
# string itemreg: $S3
null $S3
.annotate 'line', 4615
$P7 = $P4.'isnull'()
if_null $P7, __label_7
unless $P7 goto __label_7
# {
set $S6, __ARG_2
.annotate 'line', 4616
eq $S6, '', __label_9
# {
.annotate 'line', 4617
$P8 = self.'tempreg'('P')
set $S3, $P8
.annotate 'line', 4618
__ARG_1.'emitnull'($S3)
# }
__label_9: # endif
# }
goto __label_8
__label_7: # else
.annotate 'line', 4621
$P8 = $P4.'isidentifier'()
if_null $P8, __label_10
unless $P8 goto __label_10
# {
.annotate 'line', 4622
# string s: $S4
$P9 = $P4.'checkIdentifier'()
null $S4
if_null $P9, __label_12
set $S4, $P9
__label_12:
.annotate 'line', 4623
isnull $I3, $S4
not $I3
unless $I3 goto __label_15
isne $I3, $S4, ''
__label_15:
unless $I3 goto __label_13
set $S3, $S4
goto __label_14
__label_13: # else
.annotate 'line', 4624
# {
.annotate 'line', 4626
# string id: $S5
$P9 = $P4.'getName'()
null $S5
if_null $P9, __label_16
set $S5, $P9
__label_16:
.annotate 'line', 4627
getattribute $P11, self, 'owner'
$P10 = $P11.'getvar'($S5)
unless_null $P10, __label_17
# {
.annotate 'line', 4628
$P12 = self.'tempreg'('P')
set $S3, $P12
.annotate 'line', 4629
__ARG_1.'say'('get_hll_global ', $S3, ", '", $S5, "'")
# }
goto __label_18
__label_17: # else
.annotate 'line', 4632
$P10 = $P4.'emit_get'(__ARG_1)
set $S3, $P10
__label_18: # endif
# }
__label_14: # endif
# }
goto __label_11
__label_10: # else
.annotate 'line', 4636
$P11 = $P4.'emit_get'(__ARG_1)
set $S3, $P11
__label_11: # endif
__label_8: # endif
set $S7, __ARG_2
.annotate 'line', 4637
eq $S7, '', __label_19
.annotate 'line', 4638
__ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
__label_19: # endif
# }
__label_1: # for iteration
.annotate 'line', 4602
inc $I2
goto __label_3
__label_2: # for end
# }
.annotate 'line', 4640

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4641
# Body
# {
.annotate 'line', 4643
# string container: $S1
$P1 = self.'tempreg'('P')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 4644
self.'emit'(__ARG_1, $S1)
.annotate 'line', 4645
.return($S1)
# }
.annotate 'line', 4646

.end # emit_get

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'HashExpr' ]
.annotate 'line', 4555
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4557
addattribute $P0, 'keys'
.annotate 'line', 4558
addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4655
# Body
# {
.return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 4656
# Body
# {
.annotate 'line', 4660
# var owner: $P1
getattribute $P1, self, 'owner'
.annotate 'line', 4661
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4662
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 4663
__ARG_1.'unget'($P2)
.annotate 'line', 4664
# var initializer: $P3
root_new $P3, ['parrot';'ResizablePMCArray']
__label_1: # do
.annotate 'line', 4665
# {
.annotate 'line', 4666
# var auxinit: $P4
$P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 4667
$P3.'push'($P4)
# }
.annotate 'line', 4668
$P2 = __ARG_1.'get'()
$P6 = $P2.'isop'(',')
if_null $P6, __label_2
if $P6 goto __label_1
__label_2: # enddo
.annotate 'line', 4669
setattribute self, 'initializer', $P3
.annotate 'line', 4670
'RequireOp'(')', $P2)
# }
__label_0: # endif
# }
.annotate 'line', 4672

.end # parseinitializer

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 4651
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4653
addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4681
# Body
# {
.annotate 'line', 4683
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4685
$I2 = __ARG_4.'isstring'()
if $I2 goto __label_1
$I2 = __ARG_4.'isidentifier'()
__label_1:
not $I1, $I2
unless $I1 goto __label_0
.annotate 'line', 4686
'SyntaxError'("Unimplemented", __ARG_4)
__label_0: # endif
.annotate 'line', 4687
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4688
$P4 = __ARG_4.'isidentifier'()
if_null $P4, __label_2
unless $P4 goto __label_2
# {
.annotate 'line', 4689
$P5 = $P1.'isop'('.')
if_null $P5, __label_4
unless $P5 goto __label_4
# {
.annotate 'line', 4690
# string values: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4691
$P2.'push'(__ARG_4)
__label_6: # do
.annotate 'line', 4692
# {
.annotate 'line', 4693
# var value: $P3
$P3 = __ARG_1.'get'()
.annotate 'line', 4694
$P4 = $P3.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_9
.annotate 'line', 4695
'Expected'('identifier', $P3)
__label_9: # endif
.annotate 'line', 4696
$P2.'push'($P3)
# }
.annotate 'line', 4697
$P1 = __ARG_1.'get'()
$P5 = $P1.'isop'('.')
if_null $P5, __label_7
if $P5 goto __label_6
__label_7: # enddo
.annotate 'line', 4698
setattribute self, 'value', $P2
# }
goto __label_5
__label_4: # else
.annotate 'line', 4701
setattribute self, 'value', __ARG_4
__label_5: # endif
# }
goto __label_3
__label_2: # else
.annotate 'line', 4704
setattribute self, 'value', __ARG_4
__label_3: # endif
.annotate 'line', 4706
$P7 = $P1.'isop'('(')
if_null $P7, __label_10
unless $P7 goto __label_10
.annotate 'line', 4707
self.'parseinitializer'(__ARG_1)
goto __label_11
__label_10: # else
.annotate 'line', 4709
__ARG_1.'unget'($P1)
__label_11: # endif
# }
.annotate 'line', 4710

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 4711
# Body
# {
.annotate 'line', 4713
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 4714
isa $I1, $P1, 'Token'
unless $I1 goto __label_1
$I1 = $P1.'isidentifier'()
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 4717
# var name: $P2
$P2 = $P1.'getidentifier'()
.annotate 'line', 4718
# var desc: $P3
getattribute $P5, self, 'owner'
$P3 = $P5.'getvar'($P2)
.annotate 'line', 4719
isnull $I1, $P3
not $I1
unless $I1 goto __label_3
$I1 = $P3['const']
__label_3:
unless $I1 goto __label_2
# {
.annotate 'line', 4720
$P5 = $P3['id']
if_null $P5, __label_4
# {
.annotate 'line', 4721
$P1 = $P3['value']
.annotate 'line', 4722
isa $I3, $P1, 'StringLiteral'
not $I2, $I3
unless $I2 goto __label_6
.annotate 'line', 4723
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_6: # endif
.annotate 'line', 4724
getattribute $P7, $P1, 'strval'
setattribute self, 'value', $P7
# }
goto __label_5
__label_4: # else
.annotate 'line', 4727
'SyntaxError'('Constant value must evaluate to a string', $P1)
__label_5: # endif
# }
__label_2: # endif
# }
__label_0: # endif
.annotate 'line', 4731
# var initializer: $P4
getattribute $P4, self, 'initializer'
.annotate 'line', 4732
if_null $P4, __label_7
.annotate 'line', 4733
getattribute $P6, self, 'initializer'
'optimize_array'($P6)
__label_7: # endif
.annotate 'line', 4734
.return(self)
# }
.annotate 'line', 4735

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 4736
# Body
# {
.annotate 'line', 4738
self.'annotate'(__ARG_1)
.annotate 'line', 4740
# var initializer: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4741
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
.annotate 'line', 4744
# int type: $I2
getattribute $P9, self, 'value'
isa $I3, $P9, 'ResizableStringArray'
unless $I3 goto __label_3
set $I2, 2
goto __label_2
__label_3:
.annotate 'line', 4745
getattribute $P11, self, 'value'
$P10 = $P11.'isstring'()
if_null $P10, __label_5
unless $P10 goto __label_5
null $I2
goto __label_4
__label_5:
.annotate 'line', 4746
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
.annotate 'line', 4748
# string reginit: $S1
set $S1, ''
.annotate 'line', 4749
# string regnew: $S2
set $P9, __ARG_2
null $S2
if_null $P9, __label_8
set $S2, $P9
__label_8:
.annotate 'line', 4750
# string constructor: $S3
null $S3
set $I3, $I1
null $I4
.annotate 'line', 4751
if $I3 == $I4 goto __label_11
set $I4, 1
if $I3 == $I4 goto __label_12
goto __label_10
# switch
__label_11: # case
goto __label_9 # break
__label_12: # case
.annotate 'line', 4755
ne $I2, 1, __label_13
# {
.annotate 'line', 4756
not $I5, __ARG_3
unless $I5 goto __label_15
.annotate 'line', 4757
$P10 = self.'tempreg'('P')
set $S2, $P10
__label_15: # endif
# }
goto __label_14
__label_13: # else
# {
.annotate 'line', 4760
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4761
$P11 = $P2.'emit_get'(__ARG_1)
set $S1, $P11
concat $S0, ', ', $S1
set $S1, $S0
.annotate 'line', 4762
# }
__label_14: # endif
goto __label_9 # break
__label_10: # default
.annotate 'line', 4766
isne $I4, $I2, 1
unless $I4 goto __label_17
isne $I4, $I2, 2
__label_17:
unless $I4 goto __label_16
.annotate 'line', 4767
getattribute $P12, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P12)
__label_16: # endif
.annotate 'line', 4768
not $I5, __ARG_3
unless $I5 goto __label_18
.annotate 'line', 4769
$P13 = self.'tempreg'('P')
set $S2, $P13
__label_18: # endif
__label_9: # switch end
set $I6, $I2
null $I7
.annotate 'line', 4772
if $I6 == $I7 goto __label_21
set $I7, 2
if $I6 == $I7 goto __label_22
set $I7, 1
if $I6 == $I7 goto __label_23
goto __label_20
# switch
__label_21: # case
.annotate 'line', 4775
# string name: $S4
getattribute $P15, self, 'value'
$P14 = $P15.'rawstring'()
null $S4
if_null $P14, __label_24
set $S4, $P14
__label_24:
.annotate 'line', 4776
# var aux: $P3
# predefined get_class
get_class $P3, $S4
.annotate 'line', 4777
unless_null $P3, __label_25
concat $S6, "Can't locate class ", $S4
concat $S6, $S6, " at compile time"
.annotate 'line', 4778
getattribute $P16, self, 'value'
'Warn'($S6, $P16)
__label_25: # endif
.annotate 'line', 4782
getattribute $P17, self, 'value'
__ARG_1.'say'('new ', $S2, ", [ ", $P17, " ]", $S1)
.annotate 'line', 4783
le $I1, 1, __label_26
# {
.annotate 'line', 4784
getattribute $P18, self, 'value'
__ARG_1.'say'($S2, ".'", $P18, "'()")
# }
__label_26: # endif
goto __label_19 # break
__label_22: # case
.annotate 'line', 4788
# var multival: $P4
getattribute $P4, self, 'value'
.annotate 'line', 4789
# predefined elements
elements $I7, $P4
sub $I6, $I7, 1
$S3 = $P4[$I6]
.annotate 'line', 4790
$P14 = 'getparrotkey'($P4)
__ARG_1.'say'('new ', $S2, ", ", $P14, $S1)
goto __label_19 # break
__label_23: # case
.annotate 'line', 4793
# var id: $P5
getattribute $P15, self, 'owner'
getattribute $P16, self, 'value'
$P5 = $P15.'getvar'($P16)
.annotate 'line', 4794
unless_null $P5, __label_27
# {
.annotate 'line', 4796
# var cl: $P6
getattribute $P17, self, 'owner'
getattribute $P18, self, 'value'
$P6 = $P17.'checkclass'($P18)
.annotate 'line', 4797
if_null $P6, __label_29
# {
.annotate 'line', 4798
$P19 = $P6.'getclasskey'()
__ARG_1.'say'('new ', $S2, ", ", $P19, $S1)
# }
goto __label_30
__label_29: # else
# {
.annotate 'line', 4801
'Warn'('Checking: new unknown type')
.annotate 'line', 4802
getattribute $P19, self, 'value'
__ARG_1.'say'('new ', $S2, ", ['", $P19, "']", $S1)
# }
__label_30: # endif
.annotate 'line', 4804
getattribute $P20, self, 'value'
set $S3, $P20
# }
goto __label_28
__label_27: # else
# {
.annotate 'line', 4808
$P20 = $P5['reg']
__ARG_1.'say'('new ', $S2, ", ", $P20, "", $S1)
# }
__label_28: # endif
goto __label_19 # break
__label_20: # default
.annotate 'line', 4812
'InternalError'('Unexpected type in new')
__label_19: # switch end
.annotate 'line', 4814
isgt $I8, $I1, 1
if $I8 goto __label_32
isgt $I8, $I1, 0
unless $I8 goto __label_33
iseq $I8, $I2, 1
__label_33:
__label_32:
unless $I8 goto __label_31
# {
.annotate 'line', 4815
# string argregs: $P7
root_new $P7, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4816
iter $P21, $P1
set $P21, 0
__label_34: # for iteration
unless $P21 goto __label_35
shift $P8, $P21
# {
.annotate 'line', 4817
# string reg: $S5
$P22 = $P8.'emit_get'(__ARG_1)
null $S5
if_null $P22, __label_36
set $S5, $P22
__label_36:
.annotate 'line', 4818
$P7.'push'($S5)
# }
goto __label_34
__label_35: # endfor
.annotate 'line', 4820
__ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 4821
# predefined join
join $S6, ", ", $P7
__ARG_1.'print'($S6)
.annotate 'line', 4822
__ARG_1.'say'(")")
.annotate 'line', 4823
not $I8, __ARG_3
unless $I8 goto __label_37
.annotate 'line', 4824
__ARG_1.'emitset'(__ARG_2, $S2)
__label_37: # endif
# }
__label_31: # endif
# }
.annotate 'line', 4826

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4827
# Body
# {
.annotate 'line', 4829
.tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4830

.end # emit_init

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewExpr' ]
.annotate 'line', 4677
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4679
addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4839
# Body
# {
.annotate 'line', 4841
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4842
setattribute self, 'owner', __ARG_2
.annotate 'line', 4843
# var nskey: $P1
new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4844
setattribute self, 'nskey', $P1
.annotate 'line', 4845
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4846
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4847
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4849
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4850

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4851
# Body
# {
.annotate 'line', 4853
# string reginit: $S1
null $S1
.annotate 'line', 4854
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4855
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
.annotate 'line', 4856
if $I2 == $I3 goto __label_4
set $I3, 1
if $I2 == $I3 goto __label_5
goto __label_3
# switch
__label_4: # case
goto __label_2 # break
__label_5: # case
.annotate 'line', 4860
# var initval: $P2
$P2 = $P1[0]
.annotate 'line', 4861
$P4 = $P2.'emit_get'(__ARG_1)
set $S1, $P4
goto __label_2 # break
__label_3: # default
.annotate 'line', 4864
getattribute $P5, self, 'start'
'SyntaxError'('Multiple init arguments not allowed here', $P5)
__label_2: # switch end
.annotate 'line', 4866
# var nskey: $P3
getattribute $P3, self, 'nskey'
.annotate 'line', 4867
$P4 = $P3.'hasHLL'()
if_null $P4, __label_6
unless $P4 goto __label_6
.annotate 'line', 4868
__ARG_1.'print'("root_")
__label_6: # endif
.annotate 'line', 4869
__ARG_1.'print'("new ", __ARG_2, ", ")
null $P5
.annotate 'line', 4870
$P3.'emit'(__ARG_1, $P5)
.annotate 'line', 4871
if_null $S1, __label_7
.annotate 'line', 4872
__ARG_1.'print'(', ', $S1)
__label_7: # endif
.annotate 'line', 4873
__ARG_1.'say'()
# }
.annotate 'line', 4874

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 4835
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4837
addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4883
# Body
# {
.annotate 'line', 4885
self.'initexpr'(__ARG_2, __ARG_3)
.annotate 'line', 4886
setattribute self, 'owner', __ARG_2
.annotate 'line', 4887
# var nskey: $P1
new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4888
setattribute self, 'nskey', $P1
.annotate 'line', 4889
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4890
$P4 = $P2.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 4891
self.'parseinitializer'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 4893
__ARG_1.'unget'($P2)
__label_1: # endif
# }
.annotate 'line', 4894

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4895
# Body
# {
.annotate 'line', 4897
# string reginit: $S1
null $S1
.annotate 'line', 4898
# var init: $P1
getattribute $P1, self, 'initializer'
.annotate 'line', 4900
# int numinits: $I1
unless_null $P1, __label_1
null $I1
goto __label_0
__label_1:
# predefined elements
elements $I1, $P1
__label_0:
.annotate 'line', 4901
# string regnew: $S2
set $P5, __ARG_2
null $S2
if_null $P5, __label_2
set $S2, $P5
__label_2:
.annotate 'line', 4902
le $I1, 0, __label_3
.annotate 'line', 4903
$P5 = self.'tempreg'('P')
set $S2, $P5
__label_3: # endif
.annotate 'line', 4904
# var nskey: $P2
getattribute $P2, self, 'nskey'
.annotate 'line', 4905
__ARG_1.'print'("new ", $S2, ", ")
.annotate 'line', 4906
getattribute $P6, self, 'owner'
$P2.'emit'(__ARG_1, $P6)
.annotate 'line', 4907
__ARG_1.'say'()
.annotate 'line', 4909
le $I1, 0, __label_4
# {
.annotate 'line', 4910
# string argregs: $P3
root_new $P3, ['parrot'; 'ResizableStringArray']
.annotate 'line', 4911
iter $P7, $P1
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $P4, $P7
# {
.annotate 'line', 4912
# string reg: $S3
$P6 = $P4.'emit_get'(__ARG_1)
null $S3
if_null $P6, __label_7
set $S3, $P6
__label_7:
.annotate 'line', 4913
$P3.'push'($S3)
# }
goto __label_5
__label_6: # endfor
.annotate 'line', 4915
# string constructor: $S4
$P8 = $P2.'last'()
null $S4
if_null $P8, __label_8
set $S4, $P8
__label_8:
.annotate 'line', 4916
__ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 4917
# predefined join
join $S5, ", ", $P3
__ARG_1.'print'($S5)
.annotate 'line', 4918
__ARG_1.'say'(")")
.annotate 'line', 4919
__ARG_1.'emitset'(__ARG_2, $S2)
# }
__label_4: # endif
# }
.annotate 'line', 4921

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 4879
get_class $P1, [ 'NewBaseExpr' ]
addparent $P0, $P1
.annotate 'line', 4881
addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4926
# Body
# {
.annotate 'line', 4928
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 4930
$P3 = $P1.'isop'('(')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 4932
new $P5, [ 'CallExpr' ]
.annotate 'line', 4933
new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
set $P4, $P5
.annotate 'line', 4932
.return($P4)
# }
goto __label_1
__label_0: # else
.annotate 'line', 4935
$P3 = $P1.'isop'('[')
if_null $P3, __label_2
unless $P3 goto __label_2
# {
.annotate 'line', 4937
new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
# }
goto __label_3
__label_2: # else
.annotate 'line', 4939
$P6 = $P1.'isidentifier'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 4942
# var t2: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 4943
__ARG_1.'unget'($P2)
.annotate 'line', 4944
$P7 = $P2.'isop'('.')
if_null $P7, __label_6
unless $P7 goto __label_6
# {
.annotate 'line', 4946
new $P9, [ 'NewQualifiedExpr' ]
$P9.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
set $P8, $P9
.return($P8)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 4950
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
.annotate 'line', 4955
new $P11, [ 'NewExpr' ]
$P11.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P10, $P11
.return($P10)
# }
__label_5: # endif
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 4957

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4966
# Body
# {
.annotate 'line', 4968
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 4969
setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4970
$P2 = __ARG_4.'get'()
setattribute self, 'checked', $P2
# }
.annotate 'line', 4971

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 4972
# Body
# {
.return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4973
# Body
# {
.annotate 'line', 4975
# var checked: $P1
getattribute $P1, self, 'checked'
.annotate 'line', 4976
# string checkedval: $S1
null $S1
.annotate 'line', 4977
$P2 = $P1.'isidentifier'()
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 4978
$P3 = $P1.'getidentifier'()
set $S1, $P3
concat $S0, "'", $S1
concat $S0, $S0, "'"
set $S1, $S0
.annotate 'line', 4979
# }
goto __label_1
__label_0: # else
set $S1, $P1
__label_1: # endif
.annotate 'line', 4983
# string r: $S2
getattribute $P3, self, 'lexpr'
$P2 = $P3.'emit_get'(__ARG_1)
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 4984
self.'annotate'(__ARG_1)
.annotate 'line', 4985
__ARG_1.'say'('isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 4986

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 4961
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4963
addattribute $P0, 'lexpr'
.annotate 'line', 4964
addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5001
# Body
# {
.annotate 'line', 5003
self.'initexpr'(__ARG_1, __ARG_2)
.annotate 'line', 5004
new $P3, [ 'Condition' ]
$P2 = $P3.'set'(__ARG_3)
setattribute self, 'condition', $P2
.annotate 'line', 5005
setattribute self, 'etrue', __ARG_4
.annotate 'line', 5006
setattribute self, 'efalse', __ARG_5
.annotate 'line', 5007
.return(self)
# }
.annotate 'line', 5008

.end # set


.sub 'optimize' :method

.annotate 'line', 5009
# Body
# {
.annotate 'line', 5011
getattribute $P3, self, 'condition'
$P2 = $P3.'optimize'()
setattribute self, 'condition', $P2
.annotate 'line', 5012
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
.annotate 'line', 5014
getattribute $P3, self, 'etrue'
.tailcall $P3.'optimize'()
__label_3: # case
.annotate 'line', 5016
getattribute $P4, self, 'efalse'
.tailcall $P4.'optimize'()
__label_1: # default
.annotate 'line', 5018
getattribute $P7, self, 'etrue'
$P6 = $P7.'optimize'()
setattribute self, 'etrue', $P6
.annotate 'line', 5019
getattribute $P10, self, 'efalse'
$P9 = $P10.'optimize'()
setattribute self, 'efalse', $P9
.annotate 'line', 5020
.return(self)
__label_0: # switch end
# }
.annotate 'line', 5022

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5023
# Body
# {
.annotate 'line', 5025
getattribute $P1, self, 'etrue'
.tailcall $P1.'checkresult'()
# }
.annotate 'line', 5026

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5027
# Body
# {
.annotate 'line', 5029
# string cond_end: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5030
# string cond_false: $S2
getattribute $P2, self, 'owner'
$P1 = $P2.'genlabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5031
getattribute $P3, self, 'condition'
$P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5032
getattribute $P3, self, 'etrue'
$P3.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5033
__ARG_1.'emitgoto'($S1)
.annotate 'line', 5034
__ARG_1.'emitlabel'($S2)
.annotate 'line', 5035
getattribute $P4, self, 'efalse'
$P4.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5036
__ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5037

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 4991
get_class $P1, [ 'Expr' ]
addparent $P0, $P1
.annotate 'line', 4997
addattribute $P0, 'condition'
.annotate 'line', 4998
addattribute $P0, 'etrue'
.annotate 'line', 4999
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

.annotate 'line', 5074
# Body
# {
.annotate 'line', 5076
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
.annotate 'line', 5077
.return(1)
__label_3: # case
.annotate 'line', 5078
.return(2)
__label_4: # case
.annotate 'line', 5079
.return(3)
__label_1: # default
.annotate 'line', 5080
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5082

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5084
# Body
# {
.annotate 'line', 5086
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
.annotate 'line', 5087
.return(8)
__label_3: # case
.annotate 'line', 5088
.return(11)
__label_4: # case
.annotate 'line', 5089
.return(9)
__label_5: # case
.annotate 'line', 5090
.return(10)
__label_1: # default
.annotate 'line', 5091
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5093

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5095
# Body
# {
.annotate 'line', 5097
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
.annotate 'line', 5098
.return(19)
__label_3: # case
.annotate 'line', 5099
.return(20)
__label_4: # case
.annotate 'line', 5100
.return(21)
__label_5: # case
.annotate 'line', 5101
.return(22)
__label_1: # default
.annotate 'line', 5102
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5104

.end # getOpCode_5


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5106
# Body
# {
.annotate 'line', 5108
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
.annotate 'line', 5109
.return(12)
__label_3: # case
.annotate 'line', 5110
.return(13)
__label_4: # case
.annotate 'line', 5111
.return(25)
__label_5: # case
.annotate 'line', 5112
.return(26)
__label_1: # default
.annotate 'line', 5114
$P2 = __ARG_1.'iskeyword'('instanceof')
if_null $P2, __label_6
unless $P2 goto __label_6
.return(27)
goto __label_7
__label_6: # else
.annotate 'line', 5115
.return(0)
__label_7: # endif
__label_0: # switch end
# }
.annotate 'line', 5117

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5119
# Body
# {
.annotate 'line', 5121
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
.annotate 'line', 5122
.return(14)
__label_3: # case
.annotate 'line', 5123
.return(16)
__label_4: # case
.annotate 'line', 5124
.return(15)
__label_5: # case
.annotate 'line', 5125
.return(17)
__label_1: # default
.annotate 'line', 5126
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5128

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5130
# Body
# {
.annotate 'line', 5132
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
.annotate 'line', 5133
.return(4)
__label_3: # case
.annotate 'line', 5134
.return(5)
__label_4: # case
.annotate 'line', 5135
.return(6)
__label_5: # case
.annotate 'line', 5136
.return(18)
__label_6: # case
.annotate 'line', 5137
.return(23)
__label_7: # case
.annotate 'line', 5138
.return(24)
__label_1: # default
.annotate 'line', 5139
.return(0)
__label_0: # switch end
# }
.annotate 'line', 5141

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5143
# Body
# {
.annotate 'line', 5145
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5147
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5148
# var expr: $P2
null $P2
.annotate 'line', 5149
$P4 = $P1.'isop'('(')
if_null $P4, __label_0
unless $P4 goto __label_0
# {
.annotate 'line', 5150
$P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5151
'ExpectOp'(')', __ARG_1)
.annotate 'line', 5152
.return($P2)
# }
__label_0: # endif
.annotate 'line', 5154
$P4 = $P1.'isop'('[')
if_null $P4, __label_1
unless $P4 goto __label_1
.annotate 'line', 5155
new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
set $P5, $P6
.return($P5)
__label_1: # endif
.annotate 'line', 5156
$P5 = $P1.'isop'('{')
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 5157
new $P7, [ 'HashExpr' ]
$P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 5158
$P7 = $P1.'iskeyword'('new')
if_null $P7, __label_3
unless $P7 goto __label_3
.annotate 'line', 5159
.tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
__label_3: # endif
.annotate 'line', 5160
$P8 = $P1.'isstring'()
if_null $P8, __label_4
unless $P8 goto __label_4
.annotate 'line', 5161
new $P10, [ 'StringLiteral' ]
$P10.'StringLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_4: # endif
.annotate 'line', 5162
$P8 = $P1.'isint'()
if_null $P8, __label_5
unless $P8 goto __label_5
.annotate 'line', 5163
new $P10, [ 'IntegerLiteral' ]
$P10.'IntegerLiteral'(__ARG_2, $P1)
set $P9, $P10
.return($P9)
__label_5: # endif
.annotate 'line', 5164
$P11 = $P1.'isfloat'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 5165
new $P13, [ 'FloatLiteral' ]
$P13.'FloatLiteral'(__ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_6: # endif
.annotate 'line', 5166
$P11 = $P1.'iskeyword'('function')
if_null $P11, __label_7
unless $P11 goto __label_7
.annotate 'line', 5167
new $P13, [ 'FunctionExpr' ]
$P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
set $P12, $P13
.return($P12)
__label_7: # endif
.annotate 'line', 5168
$P14 = $P1.'isidentifier'()
if_null $P14, __label_8
unless $P14 goto __label_8
.annotate 'line', 5169
new $P16, [ 'IdentifierExpr' ]
$P16.'IdentifierExpr'(__ARG_2, $P1)
set $P15, $P16
.return($P15)
__label_8: # endif
.annotate 'line', 5170
'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5171

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5173
# Body
# {
.annotate 'line', 5175
.const 'Sub' $P3 = 'parseExpr_0'
.annotate 'line', 5176
.const 'Sub' $P4 = 'getOpCode_2'
.annotate 'line', 5178
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5179
# var t: $P2
null $P2
.annotate 'line', 5180
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5181
$P2 = __ARG_1.'get'()
$P5 = $P4($P2)
set $I1, $P5
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 1
.annotate 'line', 5182
if $I2 == $I3 goto __label_4
set $I3, 2
if $I2 == $I3 goto __label_5
set $I3, 3
if $I2 == $I3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 5184
new $P6, [ 'CallExpr' ]
$P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P6
goto __label_2 # break
__label_5: # case
.annotate 'line', 5187
new $P7, [ 'IndexExpr' ]
$P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P7
goto __label_2 # break
__label_6: # case
.annotate 'line', 5190
new $P8, [ 'MemberExpr' ]
$P8.'MemberExpr'(__ARG_1, __ARG_2, $P2, $P1)
set $P1, $P8
goto __label_2 # break
__label_3: # default
.annotate 'line', 5193
'InternalError'('Unexpected code in parseExpr_2')
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5196
__ARG_1.'unget'($P2)
.annotate 'line', 5197
.return($P1)
# }
.annotate 'line', 5198

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5200
# Body
# {
.annotate 'line', 5202
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5204
# var subexp: $P1
$P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5205
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5206
$P4 = $P2.'isop'('++')
if_null $P4, __label_0
unless $P4 goto __label_0
.annotate 'line', 5207
new $P5, [ 'OpPostIncExpr' ]
.tailcall $P5.'set'(__ARG_2, $P2, $P1)
goto __label_1
__label_0: # else
.annotate 'line', 5208
$P6 = $P2.'isop'('--')
if_null $P6, __label_2
unless $P6 goto __label_2
.annotate 'line', 5209
new $P7, [ 'OpPostDecExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1)
goto __label_3
__label_2: # else
# {
.annotate 'line', 5212
__ARG_1.'unget'($P2)
.annotate 'line', 5213
.return($P1)
# }
__label_3: # endif
__label_1: # endif
# }
.annotate 'line', 5215

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5217
# Body
# {
.annotate 'line', 5219
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5220
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5221
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5223
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 5224
# int code: $I1
$P7 = $P6($P1)
set $I1, $P7
.annotate 'line', 5225
# var subexpr: $P2
null $P2
.annotate 'line', 5226
eq $I1, 0, __label_0
# {
.annotate 'line', 5227
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5228
# var oper: $P3
null $P3
set $I2, $I1
set $I3, 8
.annotate 'line', 5229
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
.annotate 'line', 5231
new $P3, [ 'OpUnaryMinusExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5234
new $P3, [ 'OpNotExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5237
new $P3, [ 'OpPreIncExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5240
new $P3, [ 'OpPreDecExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5243
'InternalError'('Invalid code in parseExpr_4', $P1)
__label_2: # switch end
.annotate 'line', 5245
$P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5248
__ARG_1.'unget'($P1)
.annotate 'line', 5249
$P2 = $P5(__ARG_1, __ARG_2)
# }
__label_1: # endif
.annotate 'line', 5251
.return($P2)
# }
.annotate 'line', 5252

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5254
# Body
# {
.annotate 'line', 5256
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5257
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5259
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5260
# var t: $P2
null $P2
.annotate 'line', 5261
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5262
$P2 = __ARG_1.'get'()
$P7 = $P6($P2)
set $I1, $P7
eq $I1, 0, __label_0
# {
.annotate 'line', 5263
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5264
# var aux: $P4
null $P4
set $I2, $I1
set $I3, 19
.annotate 'line', 5265
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
.annotate 'line', 5267
new $P4, [ 'OpMulExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5270
new $P4, [ 'OpDivExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5273
new $P4, [ 'OpModExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5276
new $P4, [ 'OpCModExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5279
'InternalError'('Invalid code in parseExpr_5', $P2)
__label_2: # switch end
.annotate 'line', 5281
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5282
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5284
__ARG_1.'unget'($P2)
.annotate 'line', 5285
.return($P1)
# }
.annotate 'line', 5286

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5288
# Body
# {
.annotate 'line', 5290
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5292
# var lexpr: $P1
$P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5293
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5294
$P2 = __ARG_1.'get'()
$I1 = $P2.'isop'('+')
if $I1 goto __label_2
$I1 = $P2.'isop'('-')
__label_2:
unless $I1 goto __label_0
# {
.annotate 'line', 5295
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5296
# var expr: $P4
null $P4
.annotate 'line', 5297
$P6 = $P2.'isop'('+')
if_null $P6, __label_3
unless $P6 goto __label_3
.annotate 'line', 5298
new $P7, [ 'OpAddExpr' ]
$P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_4
__label_3: # else
.annotate 'line', 5300
new $P8, [ 'OpSubExpr' ]
$P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
__label_4: # endif
set $P1, $P4
.annotate 'line', 5301
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5303
__ARG_1.'unget'($P2)
.annotate 'line', 5304
.return($P1)
# }
.annotate 'line', 5305

.end # parseExpr_6


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5307
# Body
# {
.annotate 'line', 5309
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5310
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5312
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5313
# var rexpr: $P2
null $P2
.annotate 'line', 5314
# var t: $P3
null $P3
.annotate 'line', 5315
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5316
$P3 = __ARG_1.'get'()
$P6 = $P5($P3)
set $I1, $P6
eq $I1, 0, __label_0
# {
set $I2, $I1
set $I3, 12
.annotate 'line', 5317
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
.annotate 'line', 5319
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5320
new $P7, [ 'OpEqualExpr' ]
$P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5323
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5324
new $P8, [ 'OpNotEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5327
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5328
new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
set $P1, $P9
goto __label_2 # break
__label_7: # case
.annotate 'line', 5331
$P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5332
new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
set $P1, $P10
goto __label_2 # break
__label_8: # case
.annotate 'line', 5335
new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
set $P1, $P11
goto __label_2 # break
__label_3: # default
.annotate 'line', 5338
'InternalError'('Invalid code in parseExpr_8', $P3)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5341
__ARG_1.'unget'($P3)
.annotate 'line', 5342
.return($P1)
# }
.annotate 'line', 5343

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5345
# Body
# {
.annotate 'line', 5347
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 5348
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 5350
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5351
# var t: $P2
null $P2
.annotate 'line', 5352
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5353
$P2 = __ARG_1.'get'()
$P6 = $P5($P2)
set $I1, $P6
eq $I1, 0, __label_0
# {
.annotate 'line', 5354
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
set $I2, $I1
set $I3, 14
.annotate 'line', 5355
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
.annotate 'line', 5357
new $P6, [ 'OpLessExpr' ]
$P1 = $P6.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_5: # case
.annotate 'line', 5360
new $P7, [ 'OpGreaterExpr' ]
$P1 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_6: # case
.annotate 'line', 5363
new $P8, [ 'OpLessEqualExpr' ]
$P1 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_7: # case
.annotate 'line', 5366
new $P9, [ 'OpGreaterEqualExpr' ]
$P1 = $P9.'set'(__ARG_2, $P2, $P1, $P3)
goto __label_2 # break
__label_3: # default
.annotate 'line', 5369
'InternalError'('Invalid code in parseExpr_9', $P2)
__label_2: # switch end
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5372
__ARG_1.'unget'($P2)
.annotate 'line', 5373
.return($P1)
# }
.annotate 'line', 5374

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5376
# Body
# {
.annotate 'line', 5378
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 5380
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5381
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5382
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5383
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5384
new $P5, [ 'OpBinAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5386
__ARG_1.'unget'($P2)
.annotate 'line', 5387
.return($P1)
# }
.annotate 'line', 5388

.end # parseExpr_10


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5390
# Body
# {
.annotate 'line', 5392
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 5394
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5395
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5396
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('|')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5397
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5398
new $P5, [ 'OpBinOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5400
__ARG_1.'unget'($P2)
.annotate 'line', 5401
.return($P1)
# }
.annotate 'line', 5402

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5404
# Body
# {
.annotate 'line', 5406
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 5408
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5409
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5410
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('&&')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5411
# var rexpr: $P3
$P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5412
new $P5, [ 'OpBoolAndExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5414
__ARG_1.'unget'($P2)
.annotate 'line', 5415
.return($P1)
# }
.annotate 'line', 5416

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5418
# Body
# {
.annotate 'line', 5420
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 5422
# var lexpr: $P1
$P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5423
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 5424
$P2 = __ARG_1.'get'()
$P5 = $P2.'isop'('||')
if_null $P5, __label_0
unless $P5 goto __label_0
# {
.annotate 'line', 5425
# var rexpr: $P3
$P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 5426
new $P5, [ 'OpBoolOrExpr' ]
$P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5428
__ARG_1.'unget'($P2)
.annotate 'line', 5429
.return($P1)
# }
.annotate 'line', 5430

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5432
# Body
# {
.annotate 'line', 5434
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5435
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 5437
# var econd: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5438
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 5439
$P7 = $P2.'isop'('?')
if_null $P7, __label_0
unless $P7 goto __label_0
# {
.annotate 'line', 5440
# var etrue: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5441
'ExpectOp'(':', __ARG_1)
.annotate 'line', 5442
# var efalse: $P4
$P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5443
new $P7, [ 'OpConditionalExpr' ]
.tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 5446
__ARG_1.'unget'($P2)
.annotate 'line', 5447
.return($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5449

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5451
# Body
# {
.annotate 'line', 5453
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 5454
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 5455
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 5457
# var lexpr: $P1
$P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 5458
# var t: $P2
null $P2
.annotate 'line', 5459
# int code: $I1
null $I1
__label_1: # while
.annotate 'line', 5460
$P2 = __ARG_1.'get'()
$P8 = $P7($P2)
set $I1, $P8
eq $I1, 0, __label_0
# {
.annotate 'line', 5461
# var rexpr: $P3
$P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5462
# var expr: $P4
null $P4
set $I2, $I1
set $I3, 4
.annotate 'line', 5463
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
.annotate 'line', 5465
new $P4, [ 'OpAssignExpr' ]
goto __label_2 # break
__label_5: # case
.annotate 'line', 5468
new $P4, [ 'OpAssignToExpr' ]
goto __label_2 # break
__label_6: # case
.annotate 'line', 5471
new $P4, [ 'OpAddToExpr' ]
goto __label_2 # break
__label_7: # case
.annotate 'line', 5474
new $P4, [ 'OpSubToExpr' ]
goto __label_2 # break
__label_8: # case
.annotate 'line', 5477
new $P4, [ 'OpMulToExpr' ]
goto __label_2 # break
__label_9: # case
.annotate 'line', 5480
new $P4, [ 'OpDivToExpr' ]
goto __label_2 # break
__label_3: # default
.annotate 'line', 5483
'InternalError'('Unexpected code in parseExpr_16', $P2)
__label_2: # switch end
.annotate 'line', 5485
$P4.'set'(__ARG_2, $P2, $P1, $P3)
set $P1, $P4
.annotate 'line', 5486
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 5488
__ARG_1.'unget'($P2)
.annotate 'line', 5489
.return($P1)
# }
.annotate 'line', 5490

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5492
# Body
# {
.annotate 'line', 5494
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 5496
.tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 5497

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 5510
# Body
# {
.annotate 'line', 5512
getattribute $P1, self, 'brlabel'
if_null $P1, __label_0
.annotate 'line', 5513
'InternalError'('attempt to generate break label twice')
__label_0: # endif
.annotate 'line', 5514
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5515
setattribute self, 'brlabel', $P2
.annotate 'line', 5516
.return($S1)
# }
.annotate 'line', 5517

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 5518
# Body
# {
.annotate 'line', 5520
# var label: $P1
getattribute $P1, self, 'brlabel'
.annotate 'line', 5521
unless_null $P1, __label_0
.annotate 'line', 5522
'InternalError'('attempt to get break label before creating it')
__label_0: # endif
.annotate 'line', 5523
.return($P1)
# }
.annotate 'line', 5524

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Breakable' ]
.annotate 'line', 5508
addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 5531
# Body
# {
.annotate 'line', 5533
getattribute $P1, self, 'cntlabel'
if_null $P1, __label_0
.annotate 'line', 5534
'InternalError'('attempt to generate continue label twice')
__label_0: # endif
.annotate 'line', 5535
# string label: $S1
$P1 = self.'genlabel'()
null $S1
if_null $P1, __label_1
set $S1, $P1
__label_1:
box $P2, $S1
.annotate 'line', 5536
setattribute self, 'cntlabel', $P2
.annotate 'line', 5537
.return($S1)
# }
.annotate 'line', 5538

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 5539
# Body
# {
.annotate 'line', 5541
# var label: $P1
getattribute $P1, self, 'cntlabel'
.annotate 'line', 5542
unless_null $P1, __label_0
.annotate 'line', 5543
'InternalError'('attempt to get continue label before creating it')
__label_0: # endif
.annotate 'line', 5544
.return($P1)
# }
.annotate 'line', 5545

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Continuable' ]
.annotate 'line', 5527
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
.annotate 'line', 5529
addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5559
# Body
# {
.annotate 'line', 5561
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5562
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5563
# var values: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5564
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_0
# {
.annotate 'line', 5565
__ARG_2.'unget'($P1)
__label_1: # do
.annotate 'line', 5566
# {
.annotate 'line', 5567
# var expr: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 5568
$P2.'push'($P3)
# }
.annotate 'line', 5569
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'(',')
if_null $P5, __label_2
if $P5 goto __label_1
__label_2: # enddo
# }
__label_0: # endif
.annotate 'line', 5571
'RequireOp'(';', $P1)
.annotate 'line', 5572
setattribute self, 'values', $P2
# }
.annotate 'line', 5573

.end # parse


.sub 'optimize' :method

.annotate 'line', 5574
# Body
# {
.annotate 'line', 5576
getattribute $P1, self, 'values'
'optimize_array'($P1)
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
# var args: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 5582
# var values: $P2
getattribute $P2, self, 'values'
.annotate 'line', 5583
# int n: $I1
set $P6, $P2
set $I1, $P6
.annotate 'line', 5586
iseq $I3, $I1, 1
unless $I3 goto __label_1
isa $I3, self, 'ReturnStatement'
__label_1:
unless $I3 goto __label_0
# {
.annotate 'line', 5587
# var func: $P3
$P3 = $P2[0]
.annotate 'line', 5589
isa $I3, $P3, 'CallExpr'
unless $I3 goto __label_2
# {
.annotate 'line', 5590
# var funref: $P4
getattribute $P4, $P3, 'funref'
.annotate 'line', 5591
$I4 = $P4.'isidentifier'()
if $I4 goto __label_5
.annotate 'line', 5592
isa $I4, $P4, 'MemberExpr'
__label_5:
if $I4 goto __label_4
.annotate 'line', 5593
isa $I4, $P4, 'FunctionExpr'
__label_4:
unless $I4 goto __label_3
# {
.annotate 'line', 5594
self.'annotate'(__ARG_1)
.annotate 'line', 5595
.tailcall $P3.'emit'(__ARG_1, '.tailcall')
# }
__label_3: # endif
# }
__label_2: # endif
# }
__label_0: # endif
# for loop
.annotate 'line', 5599
# int i: $I2
null $I2
__label_8: # for condition
ge $I2, $I1, __label_7
# {
.annotate 'line', 5600
# var value: $P5
$P5 = $P2[$I2]
.annotate 'line', 5601
# string reg: $S1
null $S1
.annotate 'line', 5602
$P7 = $P5.'isnull'()
if_null $P7, __label_9
unless $P7 goto __label_9
# {
.annotate 'line', 5603
$P8 = self.'tempreg'('P')
set $S1, $P8
.annotate 'line', 5604
__ARG_1.'emitnull'($S1)
# }
goto __label_10
__label_9: # else
.annotate 'line', 5607
$P7 = $P5.'emit_get'(__ARG_1)
set $S1, $P7
__label_10: # endif
.annotate 'line', 5608
$P1.'push'($S1)
# }
__label_6: # for iteration
.annotate 'line', 5599
inc $I2
goto __label_8
__label_7: # for end
.annotate 'line', 5610
self.'annotate'(__ARG_1)
.annotate 'line', 5611
self.'emitret'(__ARG_1)
.annotate 'line', 5612
# string sep: $S2
set $S2, ''
.annotate 'line', 5613
iter $P9, $P1
set $P9, 0
__label_11: # for iteration
unless $P9 goto __label_12
shift $S3, $P9
# {
.annotate 'line', 5614
__ARG_1.'print'($S2, $S3)
set $S2, ', '
.annotate 'line', 5615
# }
goto __label_11
__label_12: # endfor
.annotate 'line', 5617
__ARG_1.'say'(')')
# }
.annotate 'line', 5618

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 5555
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5557
addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5623
# Body
# {
.annotate 'line', 5625
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5626

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5627
# Body
# {
.annotate 'line', 5629
__ARG_1.'print'('.return(')
# }
.annotate 'line', 5630

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 5621
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5635
# Body
# {
.annotate 'line', 5637
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 5638

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 5639
# Body
# {
.annotate 'line', 5641
__ARG_1.'print'('.yield(')
# }
.annotate 'line', 5642

.end # emitret

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 5633
get_class $P1, [ 'ReturnYieldStatement' ]
addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5653
# Body
# {
.annotate 'line', 5655
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 5656
setattribute self, 'name', __ARG_1
.annotate 'line', 5657
# string value: $S1
getattribute $P2, self, 'owner'
$P1 = $P2.'createlabel'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
box $P2, $S1
.annotate 'line', 5658
setattribute self, 'value', $P2
# }
.annotate 'line', 5659

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 5660
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5661
# Body
# {
.annotate 'line', 5663
self.'annotate'(__ARG_1)
.annotate 'line', 5664
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5665
# string comment: $S2
concat $S2, 'label ', $S1
.annotate 'line', 5666
getattribute $P1, self, 'value'
__ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 5667

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 5649
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5651
addattribute $P0, 'name'
.annotate 'line', 5652
addattribute $P0, 'value'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5678
# Body
# {
.annotate 'line', 5680
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5681
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5682
$P2 = $P1.'isidentifier'()
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 5683
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 5684
# string s: $S1
set $P2, $P1
null $S1
if_null $P2, __label_1
set $S1, $P2
__label_1:
.annotate 'line', 5685
setattribute self, 'label', $P1
.annotate 'line', 5686
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5687

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 5688
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5689
# Body
# {
.annotate 'line', 5691
self.'annotate'(__ARG_1)
.annotate 'line', 5692
# string label: $S1
getattribute $P1, self, 'label'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5693
# string value: $S2
$P1 = self.'getlabel'($S1)
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'goto ', $S1
.annotate 'line', 5694
__ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 5695

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 5674
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 5676
addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 5704
# Body
# {
.annotate 'line', 5706
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
# }
.annotate 'line', 5707

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 5708
# Body
# {
.annotate 'line', 5710
'ExpectOp'('(', __ARG_1)
.annotate 'line', 5711
$P1 = 'parseExpr'(__ARG_1, self)
self.'set'($P1)
.annotate 'line', 5712
'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 5713

.end # parsecondition

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 5702
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

.annotate 'line', 5724
# Body
# {
.annotate 'line', 5726
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5727
self.'parsecondition'(__ARG_2)
.annotate 'line', 5728
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'truebranch', $P3
.annotate 'line', 5729
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5730
$P2 = $P1.'iskeyword'("else")
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 5731
$P4 = 'parseStatement'(__ARG_2, self)
setattribute self, 'falsebranch', $P4
goto __label_1
__label_0: # else
# {
.annotate 'line', 5733
new $P6, [ 'EmptyStatement' ]
setattribute self, 'falsebranch', $P6
.annotate 'line', 5734
__ARG_2.'unget'($P1)
# }
__label_1: # endif
# }
.annotate 'line', 5736

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 5737
# Body
# {
.annotate 'line', 5739
self.'optimize_condition'()
.annotate 'line', 5740
# int checkvalue: $I1
$P1 = self.'getvalue'()
set $I1, $P1
.annotate 'line', 5741
getattribute $P3, self, 'truebranch'
$P2 = $P3.'optimize'()
setattribute self, 'truebranch', $P2
.annotate 'line', 5742
getattribute $P4, self, 'falsebranch'
$P3 = $P4.'optimize'()
setattribute self, 'falsebranch', $P3
set $I2, $I1
set $I3, 1
.annotate 'line', 5743
if $I2 == $I3 goto __label_2
set $I3, 2
if $I2 == $I3 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5745
getattribute $P4, self, 'truebranch'
.return($P4)
__label_3: # case
.annotate 'line', 5747
getattribute $P5, self, 'falsebranch'
.return($P5)
__label_1: # default
__label_0: # switch end
.annotate 'line', 5749
.return(self)
# }
.annotate 'line', 5750

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5751
# Body
# {
.annotate 'line', 5753
# var truebranch: $P1
getattribute $P1, self, 'truebranch'
.annotate 'line', 5754
# var falsebranch: $P2
getattribute $P2, self, 'falsebranch'
.annotate 'line', 5755
# int t_empty: $I1
$P3 = $P1.'isempty'()
set $I1, $P3
.annotate 'line', 5756
# int f_empty: $I2
$P3 = $P2.'isempty'()
set $I2, $P3
.annotate 'line', 5757
# string elselabel: $S1
set $S1, ''
.annotate 'line', 5758
not $I3, $I2
unless $I3 goto __label_0
.annotate 'line', 5759
$P4 = self.'genlabel'()
set $S1, $P4
__label_0: # endif
.annotate 'line', 5760
# string endlabel: $S2
$P4 = self.'genlabel'()
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 5761
# string cond_false: $S3
unless $I2 goto __label_3
set $S3, $S2
goto __label_2
__label_3:
set $S3, $S1
__label_2:
.annotate 'line', 5762
self.'annotate'(__ARG_1)
.annotate 'line', 5763
self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 5764
$P1.'emit'(__ARG_1)
.annotate 'line', 5766
not $I3, $I2
unless $I3 goto __label_4
# {
.annotate 'line', 5767
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5768
__ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 5769
$P2.'emit'(__ARG_1)
# }
__label_4: # endif
.annotate 'line', 5771
__ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 5772

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IfStatement' ]
.annotate 'line', 5720
get_class $P1, [ 'ConditionalStatement' ]
addparent $P0, $P1
.annotate 'line', 5722
addattribute $P0, 'truebranch'
.annotate 'line', 5723
addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 5782
# Body
# {
.annotate 'line', 5784
$P2 = 'parseStatement'(__ARG_1, self)
setattribute self, 'body', $P2
# }
.annotate 'line', 5785

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 5786
# Body
# {
.annotate 'line', 5788
# string breaklabel: $S1
$P1 = self.'genbreaklabel'()
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5789
# string continuelabel: $S2
$P1 = self.'gencontinuelabel'()
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 5791
self.'annotate'(__ARG_1)
.annotate 'line', 5792
__ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 5793
getattribute $P2, self, 'body'
$P2.'emit'(__ARG_1)
.annotate 'line', 5794
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5795
__ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 5796

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 5779
get_class $P1, [ 'Continuable' ]
addparent $P0, $P1
.annotate 'line', 5781
addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5805
# Body
# {
.annotate 'line', 5807
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5808
self.'parsecondition'(__ARG_2)
.annotate 'line', 5809
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 5810

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 5811
# Body
# {
.annotate 'line', 5813
self.'optimize_condition'()
.annotate 'line', 5814
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5815
.return(self)
# }
.annotate 'line', 5816

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5817
# Body
# {
.annotate 'line', 5819
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
set $I2, 2
if $I1 == $I2 goto __label_3
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5821
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_3: # case
.annotate 'line', 5824
__ARG_1.'comment'('while(false) optimized out')
goto __label_0 # break
__label_1: # default
.annotate 'line', 5827
# string breaklabel: $S1
$P2 = self.'genbreaklabel'()
null $S1
if_null $P2, __label_4
set $S1, $P2
__label_4:
.annotate 'line', 5828
# string continuelabel: $S2
$P3 = self.'gencontinuelabel'()
null $S2
if_null $P3, __label_5
set $S2, $P3
__label_5:
.annotate 'line', 5830
self.'annotate'(__ARG_1)
.annotate 'line', 5831
__ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 5832
self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 5833
getattribute $P4, self, 'body'
$P4.'emit'(__ARG_1)
.annotate 'line', 5834
__ARG_1.'emitgoto'($S2)
.annotate 'line', 5835
__ARG_1.'emitlabel'($S1, 'endwhile')
__label_0: # switch end
# }
.annotate 'line', 5837

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 5803
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

.annotate 'line', 5846
# Body
# {
.annotate 'line', 5848
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5849
self.'parsebody'(__ARG_2)
.annotate 'line', 5850
'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 5851
self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 5852

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 5853
# Body
# {
.annotate 'line', 5855
self.'optimize_condition'()
.annotate 'line', 5856
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 5857
.return(self)
# }
.annotate 'line', 5858

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5859
# Body
# {
.annotate 'line', 5861
$P1 = self.'getvalue'()
set $I1, $P1
set $I2, 1
if $I1 == $I2 goto __label_2
goto __label_1
# switch
__label_2: # case
.annotate 'line', 5863
self.'emit_infinite'(__ARG_1)
goto __label_0 # break
__label_1: # default
.annotate 'line', 5866
# string looplabel: $S1
$P2 = self.'genlabel'()
null $S1
if_null $P2, __label_3
set $S1, $P2
__label_3:
.annotate 'line', 5867
# string breaklabel: $S2
$P3 = self.'genbreaklabel'()
null $S2
if_null $P3, __label_4
set $S2, $P3
__label_4:
.annotate 'line', 5868
# string continuelabel: $S3
$P4 = self.'gencontinuelabel'()
null $S3
if_null $P4, __label_5
set $S3, $P4
__label_5:
.annotate 'line', 5870
self.'annotate'(__ARG_1)
.annotate 'line', 5871
__ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 5873
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 5874
self.'emit_if'(__ARG_1, $S1, $S2)
.annotate 'line', 5875
__ARG_1.'emitlabel'($S2, 'enddo')
__label_0: # switch end
# }
.annotate 'line', 5877

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DoStatement' ]
.annotate 'line', 5844
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

.annotate 'line', 5886
# Body
# {
.annotate 'line', 5888
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5889
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5890

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 5891
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5892
# Body
# {
.annotate 'line', 5894
self.'annotate'(__ARG_1)
.annotate 'line', 5895
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getcontinuelabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5896
__ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 5897

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 5884
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5906
# Body
# {
.annotate 'line', 5908
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5909
'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 5910

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 5911
# Body
# {
.return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5912
# Body
# {
.annotate 'line', 5914
self.'annotate'(__ARG_1)
.annotate 'line', 5915
# string label: $S1
getattribute $P2, self, 'start'
$P1 = self.'getbreaklabel'($P2)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 5916
__ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 5917

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 5904
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5931
# Body
# {
.annotate 'line', 5933
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 5934
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 5935
$P3 = $P1.'isop'('(')
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 5936
'SyntaxError'("Expected '(' in switch", $P1)
__label_0: # endif
.annotate 'line', 5937
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'condition', $P4
.annotate 'line', 5938
$P1 = __ARG_2.'get'()
.annotate 'line', 5939
$P4 = $P1.'isop'(')')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 5940
'SyntaxError'("Expected ')' in switch", $P1)
__label_1: # endif
.annotate 'line', 5941
$P1 = __ARG_2.'get'()
.annotate 'line', 5942
$P5 = $P1.'isop'('{')
isfalse $I2, $P5
unless $I2 goto __label_2
.annotate 'line', 5943
'SyntaxError'("Expected '{' in switch", $P1)
__label_2: # endif
.annotate 'line', 5944
root_new $P6, ['parrot';'ResizablePMCArray']
setattribute self, 'case_value', $P6
.annotate 'line', 5945
root_new $P7, ['parrot';'ResizablePMCArray']
setattribute self, 'case_st', $P7
.annotate 'line', 5946
root_new $P9, ['parrot';'ResizablePMCArray']
setattribute self, 'default_st', $P9
__label_4: # while
.annotate 'line', 5947
$P1 = __ARG_2.'get'()
$I2 = $P1.'iskeyword'('case')
if $I2 goto __label_5
$I2 = $P1.'iskeyword'('default')
__label_5:
unless $I2 goto __label_3
# {
.annotate 'line', 5948
$P9 = $P1.'iskeyword'('case')
if_null $P9, __label_6
unless $P9 goto __label_6
# {
.annotate 'line', 5949
getattribute $P10, self, 'case_value'
$P11 = 'parseExpr'(__ARG_2, self)
$P10.'push'($P11)
.annotate 'line', 5950
$P1 = __ARG_2.'get'()
.annotate 'line', 5951
$P11 = $P1.'isop'(':')
isfalse $I3, $P11
unless $I3 goto __label_8
.annotate 'line', 5952
'SyntaxError'("Expected ':' in case", $P1)
__label_8: # endif
.annotate 'line', 5953
# var st: $P2
root_new $P2, ['parrot';'ResizablePMCArray']
__label_10: # while
.annotate 'line', 5954
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
.annotate 'line', 5955
__ARG_2.'unget'($P1)
.annotate 'line', 5956
$P12 = 'parseStatement'(__ARG_2, self)
$P2.'push'($P12)
# }
goto __label_10
__label_9: # endwhile
.annotate 'line', 5958
getattribute $P13, self, 'case_st'
$P13.'push'($P2)
.annotate 'line', 5959
__ARG_2.'unget'($P1)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 5962
$P1 = __ARG_2.'get'()
.annotate 'line', 5963
$P13 = $P1.'isop'(':')
isfalse $I4, $P13
unless $I4 goto __label_13
.annotate 'line', 5964
'SyntaxError'("Expected ':' in default", $P1)
__label_13: # endif
__label_15: # while
.annotate 'line', 5965
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
.annotate 'line', 5966
__ARG_2.'unget'($P1)
.annotate 'line', 5967
getattribute $P14, self, 'default_st'
$P15 = 'parseStatement'(__ARG_2, self)
$P14.'push'($P15)
# }
goto __label_15
__label_14: # endwhile
.annotate 'line', 5969
__ARG_2.'unget'($P1)
# }
__label_7: # endif
# }
goto __label_4
__label_3: # endwhile
# }
.annotate 'line', 5972

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 5973
# Body
# {
.annotate 'line', 5975
getattribute $P4, self, 'condition'
$P3 = $P4.'optimize'()
setattribute self, 'condition', $P3
.annotate 'line', 5976
getattribute $P2, self, 'case_value'
'optimize_array'($P2)
.annotate 'line', 5977
getattribute $P3, self, 'case_st'
iter $P5, $P3
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P1, $P5
.annotate 'line', 5978
'optimize_array'($P1)
goto __label_0
__label_1: # endfor
.annotate 'line', 5979
getattribute $P4, self, 'default_st'
'optimize_array'($P4)
.annotate 'line', 5980
.return(self)
# }
.annotate 'line', 5981

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 5982
# Body
# {
.annotate 'line', 5985
# string type: $S1
set $S1, ''
.annotate 'line', 5986
getattribute $P8, self, 'case_value'
iter $P9, $P8
set $P9, 0
__label_0: # for iteration
unless $P9 goto __label_1
shift $P1, $P9
# {
.annotate 'line', 5987
# string t: $S2
$P10 = $P1.'checkresult'()
null $S2
if_null $P10, __label_2
set $S2, $P10
__label_2:
.annotate 'line', 5988
ne $S2, 'N', __label_3
.annotate 'line', 5989
getattribute $P8, self, 'start'
'SyntaxError'("Invalid type in case", $P8)
__label_3: # endif
.annotate 'line', 5990
ne $S1, '', __label_4
set $S1, $S2
goto __label_5
__label_4: # else
.annotate 'line', 5992
eq $S1, $S2, __label_6
set $S1, 'P'
__label_6: # endif
__label_5: # endif
.annotate 'line', 5993
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 5996
# string reg: $S3
$P10 = self.'tempreg'($S1)
null $S3
if_null $P10, __label_7
set $S3, $P10
__label_7:
.annotate 'line', 5997
getattribute $P12, self, 'condition'
$P11 = $P12.'checkresult'()
set $S9, $P11
ne $S9, $S1, __label_8
.annotate 'line', 5998
getattribute $P13, self, 'condition'
$P13.'emit'(__ARG_1, $S3)
goto __label_9
__label_8: # else
# {
.annotate 'line', 6000
# string regcond: $S4
getattribute $P15, self, 'condition'
$P14 = $P15.'emit_get'(__ARG_1)
null $S4
if_null $P14, __label_10
set $S4, $P14
__label_10:
.annotate 'line', 6001
__ARG_1.'emitset'($S3, $S4)
# }
__label_9: # endif
.annotate 'line', 6005
self.'genbreaklabel'()
.annotate 'line', 6006
# string defaultlabel: $S5
$P11 = self.'genlabel'()
null $S5
if_null $P11, __label_11
set $S5, $P11
__label_11:
.annotate 'line', 6007
# string caselabel: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6008
# string regval: $S6
$P12 = self.'tempreg'($S1)
null $S6
if_null $P12, __label_12
set $S6, $P12
__label_12:
.annotate 'line', 6009
getattribute $P13, self, 'case_value'
iter $P16, $P13
set $P16, 0
__label_13: # for iteration
unless $P16 goto __label_14
shift $P3, $P16
# {
.annotate 'line', 6010
# string label: $S7
$P14 = self.'genlabel'()
null $S7
if_null $P14, __label_15
set $S7, $P14
__label_15:
.annotate 'line', 6011
$P2.'push'($S7)
.annotate 'line', 6012
$P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6013
__ARG_1.'say'('if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
goto __label_13
__label_14: # endfor
.annotate 'line', 6015
__ARG_1.'emitgoto'($S5)
.annotate 'line', 6018
__ARG_1.'comment'('switch')
.annotate 'line', 6019
self.'annotate'(__ARG_1)
.annotate 'line', 6020
# var case_st: $P4
getattribute $P4, self, 'case_st'
.annotate 'line', 6021
# int n: $I1
set $P15, $P4
set $I1, $P15
# for loop
.annotate 'line', 6022
# int i: $I2
null $I2
__label_18: # for condition
ge $I2, $I1, __label_17
# {
.annotate 'line', 6023
# string l: $S8
$S8 = $P2[$I2]
.annotate 'line', 6024
__ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6025
# var casest: $P5
$P5 = $P4[$I2]
.annotate 'line', 6026
iter $P17, $P5
set $P17, 0
__label_19: # for iteration
unless $P17 goto __label_20
shift $P6, $P17
.annotate 'line', 6027
$P6.'emit'(__ARG_1)
goto __label_19
__label_20: # endfor
# }
__label_16: # for iteration
.annotate 'line', 6022
inc $I2
goto __label_18
__label_17: # for end
.annotate 'line', 6030
__ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6031
getattribute $P18, self, 'default_st'
iter $P19, $P18
set $P19, 0
__label_21: # for iteration
unless $P19 goto __label_22
shift $P7, $P19
.annotate 'line', 6032
$P7.'emit'(__ARG_1)
goto __label_21
__label_22: # endfor
.annotate 'line', 6034
getattribute $P20, self, 'start'
$P18 = self.'getbreaklabel'($P20)
__ARG_1.'emitlabel'($P18, 'switch end')
# }
.annotate 'line', 6035

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 5924
get_class $P1, [ 'Breakable' ]
addparent $P0, $P1
get_class $P2, [ 'Statement' ]
addparent $P0, $P2
.annotate 'line', 5926
addattribute $P0, 'condition'
.annotate 'line', 5927
addattribute $P0, 'case_value'
.annotate 'line', 5928
addattribute $P0, 'case_st'
.annotate 'line', 5929
addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6047
# Body
# {
.annotate 'line', 6049
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6050
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6051
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
# {
.annotate 'line', 6052
__ARG_2.'unget'($P1)
.annotate 'line', 6053
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'initializer', $P3
# }
__label_0: # endif
.annotate 'line', 6055
$P1 = __ARG_2.'get'()
.annotate 'line', 6056
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6057
__ARG_2.'unget'($P1)
.annotate 'line', 6058
self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6059
'ExpectOp'(';', __ARG_2)
# }
__label_1: # endif
.annotate 'line', 6061
$P1 = __ARG_2.'get'()
.annotate 'line', 6062
$P4 = $P1.'isop'(')')
isfalse $I2, $P4
unless $I2 goto __label_2
# {
.annotate 'line', 6063
__ARG_2.'unget'($P1)
.annotate 'line', 6064
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'iteration', $P5
.annotate 'line', 6065
'ExpectOp'(')', __ARG_2)
# }
__label_2: # endif
.annotate 'line', 6067
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6068

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6069
# Body
# {
.annotate 'line', 6071
getattribute $P1, self, 'initializer'
if_null $P1, __label_0
.annotate 'line', 6072
getattribute $P4, self, 'initializer'
$P3 = $P4.'optimize'()
setattribute self, 'initializer', $P3
__label_0: # endif
.annotate 'line', 6073
getattribute $P1, self, 'condexpr'
if_null $P1, __label_1
.annotate 'line', 6074
self.'optimize_condition'()
__label_1: # endif
.annotate 'line', 6075
getattribute $P2, self, 'iteration'
if_null $P2, __label_2
.annotate 'line', 6076
getattribute $P5, self, 'iteration'
$P4 = $P5.'optimize'()
setattribute self, 'iteration', $P4
__label_2: # endif
.annotate 'line', 6077
getattribute $P7, self, 'body'
$P6 = $P7.'optimize'()
setattribute self, 'body', $P6
.annotate 'line', 6078
.return(self)
# }
.annotate 'line', 6079

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6080
# Body
# {
.annotate 'line', 6082
getattribute $P1, self, 'initializer'
isnull $I1, $P1
unless $I1 goto __label_2
.annotate 'line', 6083
getattribute $P2, self, 'condexpr'
isnull $I1, $P2
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6084
getattribute $P3, self, 'iteration'
isnull $I1, $P3
__label_1:
unless $I1 goto __label_0
# {
.annotate 'line', 6085
self.'emit_infinite'(__ARG_1)
.annotate 'line', 6086
.return()
# }
__label_0: # endif
.annotate 'line', 6088
__ARG_1.'comment'('for loop')
.annotate 'line', 6089
# string continuelabel: $S1
$P1 = self.'gencontinuelabel'()
null $S1
if_null $P1, __label_3
set $S1, $P1
__label_3:
.annotate 'line', 6090
# string breaklabel: $S2
$P2 = self.'genbreaklabel'()
null $S2
if_null $P2, __label_4
set $S2, $P2
__label_4:
.annotate 'line', 6091
# string condlabel: $S3
$P3 = self.'genlabel'()
null $S3
if_null $P3, __label_5
set $S3, $P3
__label_5:
.annotate 'line', 6092
getattribute $P4, self, 'initializer'
if_null $P4, __label_6
.annotate 'line', 6093
getattribute $P5, self, 'initializer'
$P5.'emit'(__ARG_1)
__label_6: # endif
.annotate 'line', 6095
__ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6096
getattribute $P4, self, 'condexpr'
if_null $P4, __label_7
.annotate 'line', 6097
self.'emit_else'(__ARG_1, $S2)
__label_7: # endif
.annotate 'line', 6099
getattribute $P5, self, 'body'
$P5.'emit'(__ARG_1)
.annotate 'line', 6100
__ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6101
getattribute $P6, self, 'iteration'
if_null $P6, __label_8
.annotate 'line', 6102
# string unused: $S4
getattribute $P8, self, 'iteration'
$P7 = $P8.'emit_get'(__ARG_1)
null $S4
if_null $P7, __label_9
set $S4, $P7
__label_9:
__label_8: # endif
.annotate 'line', 6103
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6105
__ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6106

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6042
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
get_class $P3, [ 'ConditionalStatement' ]
addparent $P0, $P3
.annotate 'line', 6044
addattribute $P0, 'initializer'
.annotate 'line', 6045
addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6118
# Body
# {
.annotate 'line', 6120
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6121
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6122
# string sname: $S1
set $P3, $P1
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6123
# string type: $S2
$P3 = 'typetoregcheck'($S1)
null $S2
if_null $P3, __label_1
set $S2, $P3
__label_1:
.annotate 'line', 6124
eq $S2, '', __label_2
# {
.annotate 'line', 6125
$P1 = __ARG_2.'get'()
set $S1, $P1
.annotate 'line', 6127
self.'createvar'($S1, $S2)
# }
__label_2: # endif
.annotate 'line', 6129
# var aux: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6130
setattribute self, 'varname', $P1
.annotate 'line', 6131
$P5 = 'parseExpr'(__ARG_2, self)
setattribute self, 'container', $P5
.annotate 'line', 6132
$P2 = __ARG_2.'get'()
.annotate 'line', 6133
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6134
'SyntaxError'("Expected ')'", $P2)
__label_3: # endif
.annotate 'line', 6135
self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6136

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6137
# Body
# {
.annotate 'line', 6139
getattribute $P3, self, 'container'
$P2 = $P3.'optimize'()
setattribute self, 'container', $P2
.annotate 'line', 6140
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 6141
.return(self)
# }
.annotate 'line', 6142

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6143
# Body
# {
.annotate 'line', 6145
self.'annotate'(__ARG_1)
.annotate 'line', 6146
# string regcont: $S1
null $S1
.annotate 'line', 6147
getattribute $P3, self, 'container'
$P2 = $P3.'checkresult'()
set $S6, $P2
ne $S6, 'S', __label_0
# {
.annotate 'line', 6148
# string value: $S2
getattribute $P5, self, 'container'
$P4 = $P5.'emit_get'(__ARG_1)
null $S2
if_null $P4, __label_2
set $S2, $P4
__label_2:
.annotate 'line', 6149
$P2 = self.'tempreg'('P')
set $S1, $P2
.annotate 'line', 6150
__ARG_1.'emitbox'($S1, $S2)
# }
goto __label_1
__label_0: # else
.annotate 'line', 6153
getattribute $P4, self, 'container'
$P3 = $P4.'emit_get'(__ARG_1)
set $S1, $P3
__label_1: # endif
.annotate 'line', 6154
# var itvar: $P1
getattribute $P5, self, 'varname'
$P1 = self.'getvar'($P5)
.annotate 'line', 6155
# string iterator: $S3
$P6 = self.'createreg'('P')
null $S3
if_null $P6, __label_3
set $S3, $P6
__label_3:
.annotate 'line', 6156
# string continuelabel: $S4
$P6 = self.'gencontinuelabel'()
null $S4
if_null $P6, __label_4
set $S4, $P6
__label_4:
.annotate 'line', 6157
# string breaklabel: $S5
$P7 = self.'genbreaklabel'()
null $S5
if_null $P7, __label_5
set $S5, $P7
__label_5:
.annotate 'line', 6158
__ARG_1.'say'('iter ', $S3, ', ', $S1)
.annotate 'line', 6159
__ARG_1.'emitset'($S3, '0')
.annotate 'line', 6160
__ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6161
__ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6162
$P7 = $P1.'getreg'()
__ARG_1.'say'('shift ', $P7, ', ', $S3)
.annotate 'line', 6163
getattribute $P8, self, 'body'
$P8.'emit'(__ARG_1)
.annotate 'line', 6164
__ARG_1.'emitgoto'($S4)
.annotate 'line', 6165
__ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6166

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6113
get_class $P1, [ 'LoopStatement' ]
addparent $P0, $P1
get_class $P2, [ 'BlockStatement' ]
addparent $P0, $P2
.annotate 'line', 6115
addattribute $P0, 'varname'
.annotate 'line', 6116
addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6171
# Body
# {
.annotate 'line', 6173
'ExpectOp'('(', __ARG_2)
.annotate 'line', 6174
# var aux: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6175
# var in1: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6176
# var in2: $P3
$P3 = __ARG_2.'get'()
.annotate 'line', 6177
__ARG_2.'unget'($P3)
.annotate 'line', 6178
__ARG_2.'unget'($P2)
.annotate 'line', 6179
__ARG_2.'unget'($P1)
.annotate 'line', 6180
$I1 = $P2.'iskeyword'('in')
if $I1 goto __label_2
$I1 = $P3.'iskeyword'('in')
__label_2:
unless $I1 goto __label_0
.annotate 'line', 6181
new $P5, [ 'ForeachStatement' ]
$P5.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P4, $P5
.return($P4)
goto __label_1
__label_0: # else
.annotate 'line', 6183
new $P7, [ 'ForStatement' ]
$P7.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P6, $P7
.return($P6)
__label_1: # endif
# }
.annotate 'line', 6184

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6194
# Body
# {
.annotate 'line', 6196
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6197
$P2 = 'parseExpr'(__ARG_2, self)
setattribute self, 'excep', $P2
# }
.annotate 'line', 6198

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6199
# Body
# {
.annotate 'line', 6201
getattribute $P3, self, 'excep'
$P2 = $P3.'optimize'()
setattribute self, 'excep', $P2
.annotate 'line', 6202
.return(self)
# }
.annotate 'line', 6203

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6204
# Body
# {
.annotate 'line', 6206
# string reg: $S1
getattribute $P2, self, 'excep'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6207
self.'annotate'(__ARG_1)
.annotate 'line', 6208
__ARG_1.'say'('throw ', $S1)
# }
.annotate 'line', 6209

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6190
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6192
addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6223
# Body
# {
.annotate 'line', 6225
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6226
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6227
$P2 = $P1.'isop'('[')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6228
new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
set $P4, $P5
setattribute self, 'modifiers', $P4
# }
goto __label_1
__label_0: # else
.annotate 'line', 6231
__ARG_2.'unget'($P1)
__label_1: # endif
.annotate 'line', 6233
$P3 = 'parseStatement'(__ARG_2, self)
setattribute self, 'stry', $P3
.annotate 'line', 6234
$P1 = __ARG_2.'get'()
.annotate 'line', 6235
$P4 = $P1.'iskeyword'('catch')
isfalse $I1, $P4
unless $I1 goto __label_2
.annotate 'line', 6236
'SyntaxError'("Expected 'catch'", $P1)
__label_2: # endif
.annotate 'line', 6237
$P1 = __ARG_2.'get'()
.annotate 'line', 6238
$P5 = $P1.'isop'('(')
isfalse $I1, $P5
unless $I1 goto __label_3
.annotate 'line', 6239
'SyntaxError'("Excpected '(' after 'catch'", $P1)
__label_3: # endif
.annotate 'line', 6240
$P1 = __ARG_2.'get'()
.annotate 'line', 6241
$P6 = $P1.'isop'(')')
isfalse $I2, $P6
unless $I2 goto __label_4
# {
.annotate 'line', 6242
# string exname: $S1
$P7 = $P1.'getidentifier'()
null $S1
if_null $P7, __label_5
set $S1, $P7
__label_5:
.annotate 'line', 6243
setattribute self, 'exname', $P1
.annotate 'line', 6244
self.'createvar'($S1, 'P')
.annotate 'line', 6245
$P1 = __ARG_2.'get'()
.annotate 'line', 6246
$P7 = $P1.'isop'(')')
isfalse $I2, $P7
unless $I2 goto __label_6
.annotate 'line', 6247
'SyntaxError'("Excpected ')' in 'catch'", $P1)
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 6249
$P9 = 'parseStatement'(__ARG_2, self)
setattribute self, 'scatch', $P9
# }
.annotate 'line', 6250

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6251
# Body
# {
.annotate 'line', 6253
getattribute $P1, self, 'modifiers'
if_null $P1, __label_0
.annotate 'line', 6254
getattribute $P2, self, 'modifiers'
$P2.'optimize'()
__label_0: # endif
.annotate 'line', 6255
getattribute $P3, self, 'stry'
$P2 = $P3.'optimize'()
setattribute self, 'stry', $P2
.annotate 'line', 6256
getattribute $P5, self, 'scatch'
$P4 = $P5.'optimize'()
setattribute self, 'scatch', $P4
.annotate 'line', 6257
.return(self)
# }
.annotate 'line', 6258

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6259
# Body
# {
.annotate 'line', 6261
# string reghandler: $S1
$P7 = self.'tempreg'('P')
null $S1
if_null $P7, __label_0
set $S1, $P7
__label_0:
.annotate 'line', 6262
# string labelhandler: $S2
$P7 = self.'genlabel'()
null $S2
if_null $P7, __label_1
set $S2, $P7
__label_1:
.annotate 'line', 6263
# string labelpasthandler: $S3
$P8 = self.'genlabel'()
null $S3
if_null $P8, __label_2
set $S3, $P8
__label_2:
.annotate 'line', 6264
# string exreg: $S4
null $S4
.annotate 'line', 6265
getattribute $P8, self, 'exname'
if_null $P8, __label_3
# {
.annotate 'line', 6266
# var exname: $P1
getattribute $P9, self, 'exname'
$P1 = self.'getvar'($P9)
.annotate 'line', 6267
$P9 = $P1.'getreg'()
set $S4, $P9
# }
goto __label_4
__label_3: # else
.annotate 'line', 6270
$P10 = self.'tempreg'('P')
set $S4, $P10
__label_4: # endif
.annotate 'line', 6272
self.'annotate'(__ARG_1)
.annotate 'line', 6273
__ARG_1.'comment'('try: create handler')
.annotate 'line', 6275
__ARG_1.'say'('new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6276
__ARG_1.'say'('set_label ', $S1, ', ', $S2)
.annotate 'line', 6278
getattribute $P10, self, 'modifiers'
if_null $P10, __label_5
# {
.annotate 'line', 6279
# var modiflist: $P2
getattribute $P11, self, 'modifiers'
$P2 = $P11.'getlist'()
.annotate 'line', 6280
iter $P12, $P2
set $P12, 0
__label_6: # for iteration
unless $P12 goto __label_7
shift $P3, $P12
# {
.annotate 'line', 6281
# string modifname: $S5
$P11 = $P3.'getname'()
null $S5
if_null $P11, __label_8
set $S5, $P11
__label_8:
.annotate 'line', 6282
# int nargs: $I1
$P13 = $P3.'numargs'()
set $I1, $P13
set $S9, $S5
set $S10, 'min_severity'
.annotate 'line', 6283
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
.annotate 'line', 6286
eq $I1, 1, __label_15
.annotate 'line', 6287
getattribute $P13, self, 'start'
'SyntaxError'('Wrong modifier args', $P13)
__label_15: # endif
.annotate 'line', 6288
# var arg: $P4
$P4 = $P3.'getarg'(0)
.annotate 'line', 6289
# string argreg: $S6
$P14 = $P4.'emit_get'(__ARG_1)
null $S6
if_null $P14, __label_16
set $S6, $P14
__label_16:
.annotate 'line', 6290
__ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
goto __label_9 # break
__label_13: # case
__label_14: # case
.annotate 'line', 6294
# string argregs: $P5
root_new $P5, ['parrot'; 'ResizableStringArray']
# for loop
.annotate 'line', 6295
# int i: $I2
null $I2
__label_19: # for condition
ge $I2, $I1, __label_18
# {
.annotate 'line', 6296
# var arg: $P6
$P6 = $P3.'getarg'($I2)
.annotate 'line', 6297
$P14 = $P6.'emit_get'(__ARG_1)
$P5.'push'($P14)
# }
__label_17: # for iteration
.annotate 'line', 6295
inc $I2
goto __label_19
__label_18: # for end
.annotate 'line', 6299
__ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 6300
# string sep: $S7
set $S7, ''
.annotate 'line', 6301
iter $P15, $P5
set $P15, 0
__label_20: # for iteration
unless $P15 goto __label_21
shift $S8, $P15
# {
.annotate 'line', 6302
__ARG_1.'print'($S7, $S8)
set $S7, ', '
.annotate 'line', 6303
# }
goto __label_20
__label_21: # endfor
.annotate 'line', 6305
__ARG_1.'say'(")")
goto __label_9 # break
__label_10: # default
.annotate 'line', 6308
getattribute $P16, self, 'start'
'SyntaxError'('Unexpected modifier in try', $P16)
__label_9: # switch end
# }
goto __label_6
__label_7: # endfor
# }
__label_5: # endif
.annotate 'line', 6313
__ARG_1.'say'('push_eh ', $S1)
.annotate 'line', 6314
__ARG_1.'comment'('try: begin')
.annotate 'line', 6315
getattribute $P16, self, 'stry'
$P16.'emit'(__ARG_1)
.annotate 'line', 6316
__ARG_1.'comment'('try: end')
.annotate 'line', 6317
__ARG_1.'say'('pop_eh')
.annotate 'line', 6319
self.'annotate'(__ARG_1)
.annotate 'line', 6320
__ARG_1.'emitgoto'($S3)
.annotate 'line', 6322
__ARG_1.'comment'('catch')
.annotate 'line', 6323
__ARG_1.'emitlabel'($S2)
.annotate 'line', 6324
__ARG_1.'say'('.get_results(', $S4, ')')
.annotate 'line', 6325
__ARG_1.'say'('finalize ', $S4)
.annotate 'line', 6326
__ARG_1.'say'('pop_eh')
.annotate 'line', 6327
getattribute $P17, self, 'scatch'
$P17.'emit'(__ARG_1)
.annotate 'line', 6329
__ARG_1.'comment'('catch end')
.annotate 'line', 6330
__ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 6331

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6216
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6218
addattribute $P0, 'stry'
.annotate 'line', 6219
addattribute $P0, 'modifiers'
.annotate 'line', 6220
addattribute $P0, 'exname'
.annotate 'line', 6221
addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6342
# Body
# {
.annotate 'line', 6344
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6345
setattribute self, 'name', __ARG_3
.annotate 'line', 6346
# var vdata: $P1
$P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 6347
$P3 = $P1.'getreg'()
setattribute self, 'reg', $P3
# }
.annotate 'line', 6348

.end # initvarbase

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 6338
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6340
addattribute $P0, 'name'
.annotate 'line', 6341
addattribute $P0, 'reg'
.end
.namespace [ 'DeclareStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6365
# Body
# {
.annotate 'line', 6367
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6368
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6369
$P4 = $P1.'isidentifier'()
isfalse $I1, $P4
unless $I1 goto __label_0
.annotate 'line', 6370
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6371
setattribute self, 'name', $P1
.annotate 'line', 6372
# var vdata: $P2
null $P2
.annotate 'line', 6373
# string reg: $S1
null $S1
.annotate 'line', 6375
$P1 = __ARG_2.'get'()
.annotate 'line', 6376
$P5 = $P1.'isop'('[')
if_null $P5, __label_1
unless $P5 goto __label_1
# {
box $P6, 1
.annotate 'line', 6378
setattribute self, 'typearray', $P6
.annotate 'line', 6379
getattribute $P5, self, 'name'
$P2 = self.'createvar'($P5, 'P')
.annotate 'line', 6380
$P6 = $P2.'getreg'()
set $S1, $P6
.annotate 'line', 6381
$P1 = __ARG_2.'get'()
.annotate 'line', 6382
$P7 = $P1.'isop'(']')
if_null $P7, __label_3
unless $P7 goto __label_3
# {
.annotate 'line', 6384
$P1 = __ARG_2.'get'()
# }
goto __label_4
__label_3: # else
# {
.annotate 'line', 6387
__ARG_2.'unget'($P1)
.annotate 'line', 6388
$P8 = 'parseExpr'(__ARG_2, self)
setattribute self, 'size', $P8
.annotate 'line', 6389
$P1 = __ARG_2.'get'()
.annotate 'line', 6390
$P8 = $P1.'isop'(']')
isfalse $I1, $P8
unless $I1 goto __label_5
.annotate 'line', 6391
'SyntaxError'("Expected ']'", $P1)
__label_5: # endif
.annotate 'line', 6392
$P1 = __ARG_2.'get'()
# }
__label_4: # endif
# }
goto __label_2
__label_1: # else
# {
box $P9, 0
.annotate 'line', 6397
setattribute self, 'typearray', $P9
.annotate 'line', 6398
getattribute $P9, self, 'name'
getattribute $P10, self, 't_reg'
$P2 = self.'createvar'($P9, $P10)
.annotate 'line', 6399
$P10 = $P2.'getreg'()
set $S1, $P10
.annotate 'line', 6400
$P11 = $P1.'isop'('=')
if_null $P11, __label_6
unless $P11 goto __label_6
# {
.annotate 'line', 6402
$P13 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P13
.annotate 'line', 6403
$P1 = __ARG_2.'get'()
# }
__label_6: # endif
# }
__label_2: # endif
box $P11, $S1
.annotate 'line', 6407
setattribute self, 'reg', $P11
.annotate 'line', 6408
$P12 = $P1.'isop'('=')
if_null $P12, __label_7
unless $P12 goto __label_7
# {
.annotate 'line', 6409
$P1 = __ARG_2.'get'()
.annotate 'line', 6410
$P13 = $P1.'isop'('[')
isfalse $I2, $P13
unless $I2 goto __label_8
.annotate 'line', 6411
'SyntaxError'("Array initializer expected", $P1)
__label_8: # endif
.annotate 'line', 6412
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'init', $P15
.annotate 'line', 6413
$P1 = __ARG_2.'get'()
.annotate 'line', 6414
$P14 = $P1.'isop'(']')
isfalse $I2, $P14
unless $I2 goto __label_9
# {
.annotate 'line', 6415
__ARG_2.'unget'($P1)
__label_10: # do
.annotate 'line', 6416
# {
.annotate 'line', 6417
# var item: $P3
$P3 = 'parseExpr'(__ARG_2, self)
.annotate 'line', 6418
getattribute $P15, self, 'init'
$P15.'push'($P3)
# }
.annotate 'line', 6419
$P1 = __ARG_2.'get'()
$P16 = $P1.'isop'(',')
if_null $P16, __label_11
if $P16 goto __label_10
__label_11: # enddo
.annotate 'line', 6420
$P17 = $P1.'isop'(']')
isfalse $I3, $P17
unless $I3 goto __label_13
.annotate 'line', 6421
'SyntaxError'("Expected ',' or ']'", $P1)
__label_13: # endif
# }
__label_9: # endif
.annotate 'line', 6423
$P1 = __ARG_2.'get'()
# }
__label_7: # endif
.annotate 'line', 6425
__ARG_2.'unget'($P1)
# }
.annotate 'line', 6426

.end # parse


.sub 'optimize' :method

.annotate 'line', 6427
# Body
# {
.annotate 'line', 6429
# var init: $P1
getattribute $P1, self, 'init'
.annotate 'line', 6430
getattribute $P2, self, 'size'
if_null $P2, __label_0
.annotate 'line', 6431
getattribute $P5, self, 'size'
$P4 = $P5.'optimize'()
setattribute self, 'size', $P4
__label_0: # endif
.annotate 'line', 6432
if_null $P1, __label_1
# {
.annotate 'line', 6433
getattribute $P2, self, 'typearray'
set $I1, $P2
ne $I1, 0, __label_2
.annotate 'line', 6434
$P4 = $P1.'optimize'()
setattribute self, 'init', $P4
goto __label_3
__label_2: # else
.annotate 'line', 6436
'optimize_array'($P1)
__label_3: # endif
# }
__label_1: # endif
.annotate 'line', 6438
.return(self)
# }
.annotate 'line', 6439

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6440
# Body
# {
.annotate 'line', 6442
self.'annotate'(__ARG_1)
.annotate 'line', 6443
# string tname: $S1
getattribute $P4, self, 't_name'
null $S1
if_null $P4, __label_0
set $S1, $P4
__label_0:
.annotate 'line', 6444
# string name: $S2
getattribute $P4, self, 'name'
null $S2
if_null $P4, __label_1
set $S2, $P4
__label_1:
.annotate 'line', 6445
# string reg: $S3
getattribute $P5, self, 'reg'
null $S3
if_null $P5, __label_2
set $S3, $P5
__label_2:
.annotate 'line', 6446
# string t_reg: $S4
getattribute $P5, self, 't_reg'
null $S4
if_null $P5, __label_3
set $S4, $P5
__label_3:
.annotate 'line', 6447
# var init: $P1
getattribute $P1, self, 'init'
concat $S10, $S1, ' '
concat $S10, $S10, $S2
concat $S10, $S10, ': '
concat $S10, $S10, $S3
.annotate 'line', 6448
__ARG_1.'comment'($S10)
.annotate 'line', 6450
getattribute $P6, self, 'typearray'
set $I3, $P6
ne $I3, 0, __label_4
# {
.annotate 'line', 6451
isnull $I4, $P1
if $I4 goto __label_8
$I4 = $P1.'isnull'()
__label_8:
unless $I4 goto __label_6
.annotate 'line', 6452
self.'defaultinit'(__ARG_1)
goto __label_7
__label_6: # else
# {
.annotate 'line', 6454
# string itype: $S5
$P7 = $P1.'checkresult'()
null $S5
if_null $P7, __label_9
set $S5, $P7
__label_9:
.annotate 'line', 6455
ne $S5, $S4, __label_10
# {
.annotate 'line', 6456
iseq $I3, $S5, 'S'
unless $I3 goto __label_14
isa $I3, $P1, 'ConcatString'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 6457
$P1.'emit_concat_set'(__ARG_1, $S3)
goto __label_13
__label_12: # else
.annotate 'line', 6459
$P1.'emit'(__ARG_1, $S3)
__label_13: # endif
# }
goto __label_11
__label_10: # else
# {
.annotate 'line', 6462
isa $I4, $P1, 'IndexExpr'
unless $I4 goto __label_15
# {
.annotate 'line', 6464
$P1.'emit'(__ARG_1, $S3)
# }
goto __label_16
__label_15: # else
# {
.annotate 'line', 6467
# string ireg: $S6
$P6 = self.'tempreg'($S5)
null $S6
if_null $P6, __label_17
set $S6, $P6
__label_17:
.annotate 'line', 6468
$P1.'emit'(__ARG_1, $S6)
.annotate 'line', 6469
iseq $I5, $S4, 'S'
unless $I5 goto __label_20
iseq $I5, $S5, 'P'
__label_20:
unless $I5 goto __label_18
# {
.annotate 'line', 6470
# string auxlabel: $S7
$P7 = self.'genlabel'()
null $S7
if_null $P7, __label_21
set $S7, $P7
__label_21:
.annotate 'line', 6471
__ARG_1.'emitnull'($S3)
.annotate 'line', 6472
__ARG_1.'emitif_null'($S6, $S7)
.annotate 'line', 6473
__ARG_1.'emitset'($S3, $S6)
.annotate 'line', 6474
__ARG_1.'emitlabel'($S7)
# }
goto __label_19
__label_18: # else
.annotate 'line', 6477
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
.annotate 'line', 6483
# var size: $P2
getattribute $P2, self, 'size'
.annotate 'line', 6484
if_null $P2, __label_22
# {
.annotate 'line', 6486
# string regsize: $S8
$P8 = $P2.'emit_get'(__ARG_1)
null $S8
if_null $P8, __label_24
set $S8, $P8
__label_24:
.annotate 'line', 6487
getattribute $P8, self, 't_array'
__ARG_1.'say'('new ', $S3, ", ['Fixed", $P8, "Array'], ", $S8)
# }
goto __label_23
__label_22: # else
# {
.annotate 'line', 6491
getattribute $P9, self, 't_array'
__ARG_1.'say'('root_new ', $S3, ", ['parrot'; 'Resizable", $P9, "Array']")
# }
__label_23: # endif
.annotate 'line', 6493
if_null $P1, __label_25
# {
.annotate 'line', 6494
# string itemreg: $S9
$P9 = self.'tempreg'($S4)
null $S9
if_null $P9, __label_26
set $S9, $P9
__label_26:
.annotate 'line', 6495
# int n: $I1
# predefined elements
elements $I1, $P1
.annotate 'line', 6496
unless_null $P2, __label_27
# {
.annotate 'line', 6497
le $I1, 0, __label_28
# {
.annotate 'line', 6499
__ARG_1.'emitset'($S3, $I1)
# }
__label_28: # endif
# }
__label_27: # endif
.annotate 'line', 6502
# int i: $I2
null $I2
.annotate 'line', 6503
iter $P10, $P1
set $P10, 0
__label_29: # for iteration
unless $P10 goto __label_30
shift $P3, $P10
# {
.annotate 'line', 6504
$P3.'emit'(__ARG_1, $S9)
.annotate 'line', 6505
__ARG_1.'say'($S3, '[', $I2, '] = ', $S9)
.annotate 'line', 6506
inc $I2
# }
goto __label_29
__label_30: # endfor
# }
__label_25: # endif
# }
__label_5: # endif
# }
.annotate 'line', 6510

.end # emit


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6511
# Body
# {
.annotate 'line', 6513
'InternalError'('DeclareStatement.defaultinit must be overriden')
# }
.annotate 'line', 6514

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'DeclareStatement' ]
.annotate 'line', 6355
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6357
addattribute $P0, 'name'
.annotate 'line', 6358
addattribute $P0, 't_reg'
.annotate 'line', 6359
addattribute $P0, 't_name'
.annotate 'line', 6360
addattribute $P0, 't_array'
.annotate 'line', 6361
addattribute $P0, 'reg'
.annotate 'line', 6362
addattribute $P0, 'typearray'
.annotate 'line', 6363
addattribute $P0, 'size'
.annotate 'line', 6364
addattribute $P0, 'init'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6517
# Body
# {
.annotate 'line', 6519
# var next: $P1
null $P1
.annotate 'line', 6520
# var r: $P2
null $P2
__label_0: # do
.annotate 'line', 6521
# {
.annotate 'line', 6522
# var item: $P3
$P3 = __ARG_1(__ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 6523
$P2 = 'addtomulti'($P2, $P3)
.annotate 'line', 6524
$P1 = __ARG_3.'get'()
# }
.annotate 'line', 6525
$P4 = $P1.'isop'(',')
if_null $P4, __label_1
if $P4 goto __label_0
__label_1: # enddo
.annotate 'line', 6526
$P4 = $P1.'isop'(';')
isfalse $I1, $P4
unless $I1 goto __label_3
.annotate 'line', 6527
'SyntaxError'("Expected ';'", $P1)
__label_3: # endif
.annotate 'line', 6528
.return($P2)
# }
.annotate 'line', 6529

.end # parseDeclareHelper

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 6541
# Body
# {
.annotate 'line', 6544
self.'initstatement'(__ARG_1, __ARG_2)
box $P1, __ARG_3
.annotate 'line', 6545
setattribute self, 'type', $P1
.annotate 'line', 6546
setattribute self, 'name', __ARG_4
.annotate 'line', 6547
setattribute self, 'value', __ARG_5
# }
.annotate 'line', 6548

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 6549
# Body
# {
.annotate 'line', 6551
# var value: $P1
getattribute $P1, self, 'value'
.annotate 'line', 6552
# var name: $P2
getattribute $P2, self, 'name'
.annotate 'line', 6553
# string type: $S1
getattribute $P3, self, 'type'
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 6554
$P1 = $P1.'optimize'()
.annotate 'line', 6555
$P3 = $P1.'hascompilevalue'()
isfalse $I1, $P3
unless $I1 goto __label_1
# {
.annotate 'line', 6557
getattribute $P4, self, 'start'
.annotate 'line', 6556
'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
__label_1: # endif
.annotate 'line', 6559
self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 6560
setattribute self, 'value', $P1
.annotate 'line', 6561
.return(self)
# }
.annotate 'line', 6562

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 6563
# Body
# {
.annotate 'line', 6565
getattribute $P1, self, 'start'
'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 6566

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6567
# Body
# {
.annotate 'line', 6569
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
concat $S2, 'Constant ', $S1
concat $S2, $S2, ' evaluated at compile time'
.annotate 'line', 6570
__ARG_1.'comment'($S2)
# }
.annotate 'line', 6571

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 6535
get_class $P1, [ 'Statement' ]
addparent $P0, $P1
.annotate 'line', 6537
addattribute $P0, 'type'
.annotate 'line', 6538
addattribute $P0, 'name'
.annotate 'line', 6539
addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6574
# Body
# {
.annotate 'line', 6576
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6577
# string type: $S1
$P5 = 'typetoregcheck'($P1)
null $S1
if_null $P5, __label_0
set $S1, $P5
__label_0:
.annotate 'line', 6578
isne $I1, $S1, 'I'
unless $I1 goto __label_3
isne $I1, $S1, 'N'
__label_3:
unless $I1 goto __label_2
isne $I1, $S1, 'S'
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6579
'SyntaxError'('Invalid type for const', __ARG_1)
__label_1: # endif
.annotate 'line', 6581
# var multi: $P2
null $P2
__label_4: # do
.annotate 'line', 6582
# {
.annotate 'line', 6583
$P1 = __ARG_2.'get'()
.annotate 'line', 6584
# var name: $P3
set $P3, $P1
.annotate 'line', 6585
'ExpectOp'('=', __ARG_2)
.annotate 'line', 6586
# var value: $P4
$P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 6588
new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
set $P5, $P6
.annotate 'line', 6587
$P2 = 'addtomulti'($P2, $P5)
# }
.annotate 'line', 6589
$P1 = __ARG_2.'get'()
$P6 = $P1.'isop'(',')
if_null $P6, __label_5
if $P6 goto __label_4
__label_5: # enddo
.annotate 'line', 6590
.return($P2)
# }
.annotate 'line', 6591

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 6600
# Body
# {
.annotate 'line', 6602
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 6603
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6604
$P2 = $P1.'isop'('=')
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 6605
$P4 = 'parseExpr'(__ARG_2, self)
setattribute self, 'init', $P4
.annotate 'line', 6606
$P1 = __ARG_2.'get'()
# }
__label_0: # endif
.annotate 'line', 6608
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_1
.annotate 'line', 6609
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6610

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 6611
# Body
# {
.annotate 'line', 6613
getattribute $P1, self, 'init'
if_null $P1, __label_0
.annotate 'line', 6614
getattribute $P4, self, 'init'
$P3 = $P4.'optimize'()
setattribute self, 'init', $P3
__label_0: # endif
.annotate 'line', 6615
.return(self)
# }
.annotate 'line', 6616

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 6617
# Body
# {
.annotate 'line', 6619
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6620

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6621
# Body
# {
.annotate 'line', 6623
self.'annotate'(__ARG_1)
.annotate 'line', 6624
# string name: $S1
getattribute $P2, self, 'name'
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6625
# string reg: $S2
getattribute $P2, self, 'reg'
null $S2
if_null $P2, __label_1
set $S2, $P2
__label_1:
.annotate 'line', 6626
# var init: $P1
getattribute $P1, self, 'init'
concat $S5, 'var ', $S1
concat $S5, $S5, ': '
concat $S5, $S5, $S2
.annotate 'line', 6627
__ARG_1.'comment'($S5)
.annotate 'line', 6628
if_null $P1, __label_2
.annotate 'line', 6629
$P3 = $P1.'isnull'()
if_null $P3, __label_3
unless $P3 goto __label_3
null $P1
__label_3: # endif
__label_2: # endif
.annotate 'line', 6631
if_null $P1, __label_4
# {
.annotate 'line', 6632
# string type: $S3
$P3 = $P1.'checkresult'()
null $S3
if_null $P3, __label_6
set $S3, $P3
__label_6:
set $S5, $S3
set $S6, 'P'
.annotate 'line', 6633
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
.annotate 'line', 6635
isa $I1, $P1, 'MemberExpr'
if $I1 goto __label_17
isa $I1, $P1, 'ArrayExpr'
__label_17:
if $I1 goto __label_16
isa $I1, $P1, 'NewExpr'
__label_16:
unless $I1 goto __label_14
.annotate 'line', 6636
$P1.'emit_init'(__ARG_1, $S2)
goto __label_15
__label_14: # else
.annotate 'line', 6638
$P1.'emit'(__ARG_1, $S2)
__label_15: # endif
goto __label_7 # break
__label_10: # case
__label_11: # case
__label_12: # case
.annotate 'line', 6643
# string value: $S4
$P4 = $P1.'emit_get'(__ARG_1)
null $S4
if_null $P4, __label_18
set $S4, $P4
__label_18:
.annotate 'line', 6644
__ARG_1.'emitbox'($S2, $S4)
goto __label_7 # break
__label_13: # case
.annotate 'line', 6647
getattribute $P5, self, 'name'
'SyntaxError'("Can't use void function as initializer", $P5)
__label_8: # default
.annotate 'line', 6649
getattribute $P6, self, 'name'
'SyntaxError'("Invalid var initializer", $P6)
__label_7: # switch end
# }
goto __label_5
__label_4: # else
.annotate 'line', 6653
__ARG_1.'emitnull'($S2)
__label_5: # endif
# }
.annotate 'line', 6654

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'VarStatement' ]
.annotate 'line', 6597
get_class $P1, [ 'VarBaseStatement' ]
addparent $P0, $P1
.annotate 'line', 6599
addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6659
# Body
# {
.annotate 'line', 6661
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6662
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6663
$P2 = $P1.'isop'(';')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6664
'SyntaxError'("Expected ';'", $P1)
__label_0: # endif
# }
.annotate 'line', 6665

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6666
# Body
# {
.annotate 'line', 6668
self.'annotate'(__ARG_1)
.annotate 'line', 6669
# string name: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6670
# string reg: $S2
getattribute $P1, self, 'reg'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
concat $S3, 'var ', $S1
concat $S3, $S3, '[] : '
concat $S3, $S3, $S2
.annotate 'line', 6671
__ARG_1.'comment'($S3)
.annotate 'line', 6672
__ARG_1.'say'('new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 6673

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 6657
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 6680
# Body
# {
.annotate 'line', 6682
self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 6683
$P3 = 'parseExpr'(__ARG_2, self)
setattribute self, 'exprsize', $P3
.annotate 'line', 6684
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6685
$P2 = $P1.'isop'(']')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6686
'SyntaxError'("Expected ']'", $P1)
__label_0: # endif
.annotate 'line', 6687
$P1 = __ARG_2.'get'()
.annotate 'line', 6688
$P3 = $P1.'isop'(';')
isfalse $I1, $P3
unless $I1 goto __label_1
.annotate 'line', 6689
'SyntaxError'("Expected ';'", $P1)
__label_1: # endif
# }
.annotate 'line', 6690

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 6691
# Body
# {
.annotate 'line', 6693
getattribute $P3, self, 'exprsize'
$P2 = $P3.'optimize'()
setattribute self, 'exprsize', $P2
.annotate 'line', 6694
.tailcall self.'optimize_init'()
# }
.annotate 'line', 6695

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6696
# Body
# {
.annotate 'line', 6698
# string regsize: $S1
getattribute $P2, self, 'exprsize'
$P1 = $P2.'emit_get'(__ARG_1)
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 6699
self.'annotate'(__ARG_1)
.annotate 'line', 6700
# string name: $S2
getattribute $P1, self, 'name'
null $S2
if_null $P1, __label_1
set $S2, $P1
__label_1:
.annotate 'line', 6701
# string reg: $S3
getattribute $P2, self, 'reg'
null $S3
if_null $P2, __label_2
set $S3, $P2
__label_2:
concat $S4, 'var ', $S2
concat $S4, $S4, '[] : '
concat $S4, $S4, $S3
.annotate 'line', 6702
__ARG_1.'comment'($S4)
.annotate 'line', 6703
__ARG_1.'say'('new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 6704

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 6676
get_class $P1, [ 'VarStatement' ]
addparent $P0, $P1
.annotate 'line', 6678
addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 6707
# Body
# {
.annotate 'line', 6709
# var name: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6710
$P3 = $P1.'isidentifier'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 6711
'SyntaxError'('Identifier expected', $P1)
__label_0: # endif
.annotate 'line', 6712
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 6713
$P3 = $P2.'isop'('[')
if_null $P3, __label_1
unless $P3 goto __label_1
# {
.annotate 'line', 6714
$P2 = __ARG_2.'get'()
.annotate 'line', 6715
$P4 = $P2.'isop'(']')
if_null $P4, __label_3
unless $P4 goto __label_3
.annotate 'line', 6716
new $P6, [ 'ResizableVarStatement' ]
$P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
set $P5, $P6
.return($P5)
goto __label_4
__label_3: # else
# {
.annotate 'line', 6718
__ARG_2.'unget'($P2)
.annotate 'line', 6719
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
.annotate 'line', 6723
__ARG_2.'unget'($P2)
.annotate 'line', 6724
new $P7, [ 'VarStatement' ]
$P7.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
set $P6, $P7
.return($P6)
# }
__label_2: # endif
# }
.annotate 'line', 6726

.end # parseVar


.sub 'parseVolatile'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6728
# Body
# {
.annotate 'line', 6730
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 6731
$P2 = $P1.'iskeyword'('var')
isfalse $I1, $P2
unless $I1 goto __label_0
.annotate 'line', 6732
'SyntaxError'("invalid volatile type", $P1)
__label_0: # endif
.annotate 'line', 6733
.tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 6734

.end # parseVolatile

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6742
# Body
# {
box $P1, 'S'
.annotate 'line', 6744
setattribute self, 't_reg', $P1
box $P1, 'string'
.annotate 'line', 6745
setattribute self, 't_name', $P1
box $P2, 'String'
.annotate 'line', 6746
setattribute self, 't_array', $P2
.annotate 'line', 6747
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6748

.end # StringStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6749
# Body
# {
.annotate 'line', 6751
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6752

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'StringStatement' ]
.annotate 'line', 6740
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6755
# Body
# {
.annotate 'line', 6757
new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6758

.end # newStringSt


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6760
# Body
# {
.annotate 'line', 6762
.const 'Sub' $P1 = 'newStringSt'
.annotate 'line', 6763
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6764

.end # parseString

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6772
# Body
# {
box $P1, 'I'
.annotate 'line', 6774
setattribute self, 't_reg', $P1
box $P1, 'int'
.annotate 'line', 6775
setattribute self, 't_name', $P1
box $P2, 'Integer'
.annotate 'line', 6776
setattribute self, 't_array', $P2
.annotate 'line', 6777
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6778

.end # IntStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6779
# Body
# {
.annotate 'line', 6781
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6782

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'IntStatement' ]
.annotate 'line', 6770
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6785
# Body
# {
.annotate 'line', 6787
new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6788

.end # newIntSt


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6790
# Body
# {
.annotate 'line', 6792
.const 'Sub' $P1 = 'newIntSt'
.annotate 'line', 6793
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6794

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6802
# Body
# {
box $P1, 'N'
.annotate 'line', 6804
setattribute self, 't_reg', $P1
box $P1, 'float'
.annotate 'line', 6806
setattribute self, 't_name', $P1
box $P2, 'Float'
.annotate 'line', 6807
setattribute self, 't_array', $P2
.annotate 'line', 6808
self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6809

.end # FloatStatement


.sub 'defaultinit' :method
.param pmc __ARG_1

.annotate 'line', 6810
# Body
# {
.annotate 'line', 6812
getattribute $P1, self, 'reg'
__ARG_1.'emitnull'($P1)
# }
.annotate 'line', 6813

.end # defaultinit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 6800
get_class $P1, [ 'DeclareStatement' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6816
# Body
# {
.annotate 'line', 6818
new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3)
set $P1, $P2
.return($P1)
# }
.annotate 'line', 6819

.end # newFloatSt


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6821
# Body
# {
.annotate 'line', 6823
.const 'Sub' $P1 = 'newFloatSt'
.annotate 'line', 6824
.tailcall 'parseDeclareHelper'($P1, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6825

.end # parseFloat

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6837
# Body
# {
.annotate 'line', 6839
self.'initstatement'(__ARG_1, __ARG_3)
.annotate 'line', 6840
root_new $P4, ['parrot';'Hash']
setattribute self, 'labels', $P4
.annotate 'line', 6841
root_new $P4, ['parrot';'ResizablePMCArray']
setattribute self, 'statements', $P4
.annotate 'line', 6842
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 6843
$P1 = __ARG_2.'get'()
$P5 = $P1.'isop'('}')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 6844
__ARG_2.'unget'($P1)
.annotate 'line', 6845
# var c: $P2
$P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 6846
unless_null $P2, __label_2
.annotate 'line', 6847
'InternalError'('Unexpected null statement')
__label_2: # endif
.annotate 'line', 6848
getattribute $P6, self, 'statements'
$P6.'push'($P2)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 6850
setattribute self, 'end', $P1
# }
.annotate 'line', 6851

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 6852
# Body
# {
.annotate 'line', 6854
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6855
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6856
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6857
isnull $I1, $S2
if $I1 goto __label_2
iseq $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6858
getattribute $P3, self, 'owner'
$P2 = $P3.'getlabel'(__ARG_1)
set $S2, $P2
__label_1: # endif
.annotate 'line', 6859
.return($S2)
# }
.annotate 'line', 6860

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 6861
# Body
# {
.annotate 'line', 6863
# string s: $S1
set $P2, __ARG_1
null $S1
if_null $P2, __label_0
set $S1, $P2
__label_0:
.annotate 'line', 6864
# var labels: $P1
getattribute $P1, self, 'labels'
.annotate 'line', 6865
# string exist: $S2
$S2 = $P1[$S1]
.annotate 'line', 6866
isnull $I1, $S2
not $I1
unless $I1 goto __label_2
isne $I1, $S2, ''
__label_2:
unless $I1 goto __label_1
.annotate 'line', 6867
'SyntaxError'('Label already defined', __ARG_1)
__label_1: # endif
.annotate 'line', 6868
# string value: $S3
$P2 = self.'genlabel'()
null $S3
if_null $P2, __label_3
set $S3, $P2
__label_3:
.annotate 'line', 6869
$P1[$S1] = $S3
.annotate 'line', 6870
.return($S3)
# }
.annotate 'line', 6871

.end # createlabel


.sub 'getend' :method

.annotate 'line', 6872
# Body
# {
getattribute $P1, self, 'end'
.return($P1)
# }

.end # getend


.sub 'optimize' :method

.annotate 'line', 6873
# Body
# {
.annotate 'line', 6875
getattribute $P1, self, 'statements'
'optimize_array'($P1)
.annotate 'line', 6876
.return(self)
# }
.annotate 'line', 6877

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6878
# Body
# {
.annotate 'line', 6880
__ARG_1.'comment'('{')
.annotate 'line', 6881
getattribute $P2, self, 'statements'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P1, $P3
# {
.annotate 'line', 6882
$P1.'emit'(__ARG_1)
.annotate 'line', 6883
self.'freetemps'()
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 6885
__ARG_1.'comment'('}')
# }
.annotate 'line', 6886

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 6831
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6833
addattribute $P0, 'statements'
.annotate 'line', 6834
addattribute $P0, 'end'
.annotate 'line', 6835
addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 6899
# Body
# {
box $P3, 1
.annotate 'line', 6902
setattribute self, 'nreg', $P3
.annotate 'line', 6903
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6904
# string freereg: $P2
root_new $P2, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6905
setattribute self, 'tempreg', $P1
.annotate 'line', 6906
setattribute self, 'freereg', $P2
# }
.annotate 'line', 6907

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 6908
# Body
# {
box $P1, __ARG_1
.annotate 'line', 6910
setattribute self, 'type', $P1
.annotate 'line', 6911
.return(self)
# }
.annotate 'line', 6912

.end # settype


.sub 'createreg' :method

.annotate 'line', 6913
# Body
# {
.annotate 'line', 6915
# var n: $P1
getattribute $P1, self, 'nreg'
.annotate 'line', 6916
# int i: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 6917
# string reg: $S1
set $I2, $I1
inc $I1
set $S1, $I2
assign $P1, $I1
.annotate 'line', 6919
# string type: $S2
getattribute $P2, self, 'type'
null $S2
if_null $P2, __label_0
set $S2, $P2
__label_0:
concat $S0, '$', $S2
concat $S0, $S0, $S1
set $S1, $S0
.annotate 'line', 6921
.return($S1)
# }
.annotate 'line', 6922

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 6923
# Body
# {
.annotate 'line', 6925
# var freg: $P1
getattribute $P1, self, 'freereg'
.annotate 'line', 6926
# var treg: $P2
getattribute $P2, self, 'tempreg'
.annotate 'line', 6927
# int n: $I1
set $P3, $P1
set $I1, $P3
.annotate 'line', 6928
# string reg: $S1
null $S1
.annotate 'line', 6929
le $I1, 0, __label_0
.annotate 'line', 6930
$P3 = $P1.'pop'()
set $S1, $P3
goto __label_1
__label_0: # else
# {
.annotate 'line', 6932
$P4 = self.'createreg'()
set $S1, $P4
.annotate 'line', 6933
$P2.'push'($S1)
# }
__label_1: # endif
.annotate 'line', 6935
.return($S1)
# }
.annotate 'line', 6936

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 6937
# Body
# {
.annotate 'line', 6939
getattribute $P2, self, 'tempreg'
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
.annotate 'line', 6940
getattribute $P4, self, 'freereg'
$P4.'unshift'($S1)
goto __label_0
__label_1: # endfor
.annotate 'line', 6941
# string tempreg: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 6942
setattribute self, 'tempreg', $P1
# }
.annotate 'line', 6943

.end # freetemps

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 6895
addattribute $P0, 'type'
.annotate 'line', 6896
addattribute $P0, 'nreg'
.annotate 'line', 6897
addattribute $P0, 'tempreg'
.annotate 'line', 6898
addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6967
# Body
# {
.annotate 'line', 6969
self.'initstatement'(__ARG_1, __ARG_2)
.annotate 'line', 6970
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'params', $P2
box $P1, 0
.annotate 'line', 6971
setattribute self, 'nlabel', $P1
.annotate 'line', 6972
new $P4, [ 'RegisterStore' ]
$P3 = $P4.'settype'('I')
setattribute self, 'regstI', $P3
.annotate 'line', 6973
new $P6, [ 'RegisterStore' ]
$P5 = $P6.'settype'('N')
setattribute self, 'regstN', $P5
.annotate 'line', 6974
new $P7, [ 'RegisterStore' ]
$P6 = $P7.'settype'('S')
setattribute self, 'regstS', $P6
.annotate 'line', 6975
new $P9, [ 'RegisterStore' ]
$P8 = $P9.'settype'('P')
setattribute self, 'regstP', $P8
# }
.annotate 'line', 6976

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 6978
# Body
# {
.return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 6979
# Body
# {
.annotate 'line', 6982
# var subid: $P1
getattribute $P1, self, 'subid'
.annotate 'line', 6983
unless_null $P1, __label_0
# {
.annotate 'line', 6984
$P1 = self.'generatesubid'()
.annotate 'line', 6985
setattribute self, 'subid', $P1
# }
__label_0: # endif
.annotate 'line', 6987
.return($P1)
# }
.annotate 'line', 6988

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 6990
# Body
# {
.annotate 'line', 6992
# int r: $I1
issame $I1, self, __ARG_1
.annotate 'line', 6993
.return($I1)
# }
.annotate 'line', 6994

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 6995
# Body
# {
.annotate 'line', 6997
# var params: $P1
getattribute $P1, self, 'params'
.annotate 'line', 6998
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 6999
$P5 = $P2.'isop'(')')
isfalse $I1, $P5
unless $I1 goto __label_0
# {
.annotate 'line', 7000
__ARG_1.'unget'($P2)
__label_1: # do
.annotate 'line', 7001
# {
.annotate 'line', 7002
$P2 = __ARG_1.'get'()
.annotate 'line', 7003
# string type: $S1
$P6 = $P2.'checkkeyword'()
$P5 = 'typetoregcheck'($P6)
null $S1
if_null $P5, __label_4
set $S1, $P5
__label_4:
.annotate 'line', 7004
eq $S1, '', __label_5
.annotate 'line', 7005
$P2 = __ARG_1.'get'()
goto __label_6
__label_5: # else
set $S1, 'P'
__label_6: # endif
.annotate 'line', 7008
# string argname: $S2
# predefined string
$P6 = self.'getparamnum'()
set $S4, $P6
concat $S2, '__ARG_', $S4
.annotate 'line', 7009
self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7011
# string varname: $S3
set $P7, $P2
null $S3
if_null $P7, __label_7
set $S3, $P7
__label_7:
.annotate 'line', 7012
# var arg: $P3
root_new $P3, ['parrot';'Hash']
.annotate 'line', 7013
$P3['name'] = $S3
.annotate 'line', 7014
$P2 = __ARG_1.'get'()
.annotate 'line', 7015
$P7 = $P2.'isop'('[')
if_null $P7, __label_8
unless $P7 goto __label_8
# {
.annotate 'line', 7016
# var modifiers: $P4
new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7017
$P3['modifiers'] = $P4
.annotate 'line', 7018
$P2 = __ARG_1.'get'()
# }
__label_8: # endif
.annotate 'line', 7020
$P1.'push'($P3)
# }
.annotate 'line', 7021
$P8 = $P2.'isop'(',')
if_null $P8, __label_2
if $P8 goto __label_1
__label_2: # enddo
.annotate 'line', 7022
$P8 = $P2.'isop'(')')
isfalse $I1, $P8
unless $I1 goto __label_9
.annotate 'line', 7023
'SyntaxError'("Expected ')'", $P2)
__label_9: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7025

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7027
# Body
# {
.annotate 'line', 7029
# var localfun: $P1
getattribute $P1, self, 'localfun'
.annotate 'line', 7030
unless_null $P1, __label_0
.annotate 'line', 7031
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
setattribute self, 'localfun', $P3
goto __label_1
__label_0: # else
.annotate 'line', 7033
$P1.'push'(__ARG_1)
__label_1: # endif
# }
.annotate 'line', 7034

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7036
# Body
# {
.annotate 'line', 7038
getattribute $P3, self, 'body'
$P2 = $P3.'optimize'()
setattribute self, 'body', $P2
.annotate 'line', 7039
.return(self)
# }
.annotate 'line', 7040

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7042
# Body
# {
.annotate 'line', 7044
# var lexicals: $P1
getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7045
unless_null $P1, __label_0
# {
.annotate 'line', 7046
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7047
setattribute self, 'usedlexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7049
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7050

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7051
# Body
# {
.annotate 'line', 7053
# var lexicals: $P1
getattribute $P1, self, 'lexicals'
.annotate 'line', 7054
unless_null $P1, __label_0
# {
.annotate 'line', 7055
root_new $P1, ['parrot';'Hash']
.annotate 'line', 7056
setattribute self, 'lexicals', $P1
# }
__label_0: # endif
.annotate 'line', 7058
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7059

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7060
# Body
# {
.annotate 'line', 7064
# var lex: $P1
$P1 = __ARG_1.'getlex'()
.annotate 'line', 7065
# string lexname: $S1
null $S1
.annotate 'line', 7066
if_null $P1, __label_0
set $S1, $P1
goto __label_1
__label_0: # else
.annotate 'line', 7067
# {
.annotate 'line', 7069
# string reg: $S2
$P2 = __ARG_1.'getreg'()
null $S2
if_null $P2, __label_2
set $S2, $P2
__label_2:
.annotate 'line', 7070
# int lexnum: $I1
$P2 = self.'getlexnum'()
set $I1, $P2
.annotate 'line', 7071
# predefined string
set $S3, $I1
concat $S0, '__WLEX_', $S3
set $S1, $S0
.annotate 'line', 7072
self.'setlex'($S1, $S2)
.annotate 'line', 7073
__ARG_1.'setlex'($S1)
# }
__label_1: # endif
.annotate 'line', 7075
.return($S1)
# }
.annotate 'line', 7076

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7078
# Body
# {
.annotate 'line', 7080
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7081
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
.annotate 'line', 7083
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7085
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7087
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7089
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7091
'InternalError'('Invalid type in createreg')
__label_0: # switch end
.annotate 'line', 7093
# string reg: $S1
$P2 = $P1.'createreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7094
.return($S1)
# }
.annotate 'line', 7095

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7096
# Body
# {
.annotate 'line', 7098
# var store: $P1
null $P1
set $S2, __ARG_1
set $S3, 'I'
.annotate 'line', 7099
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
.annotate 'line', 7101
getattribute $P1, self, 'regstI'
goto __label_0 # break
__label_3: # case
.annotate 'line', 7103
getattribute $P1, self, 'regstN'
goto __label_0 # break
__label_4: # case
.annotate 'line', 7105
getattribute $P1, self, 'regstS'
goto __label_0 # break
__label_5: # case
.annotate 'line', 7107
getattribute $P1, self, 'regstP'
goto __label_0 # break
__label_1: # default
.annotate 'line', 7109
'InternalError'("Invalid type in tempreg")
__label_0: # switch end
.annotate 'line', 7111
# string reg: $S1
$P2 = $P1.'tempreg'()
null $S1
if_null $P2, __label_6
set $S1, $P2
__label_6:
.annotate 'line', 7112
.return($S1)
# }
.annotate 'line', 7113

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7114
# Body
# {
.annotate 'line', 7116
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
.annotate 'line', 7117
$P1.'freetemps'()
goto __label_0
__label_1: # endfor
# }
.annotate 'line', 7118

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7119
# Body
# {
.annotate 'line', 7121
# var nlabel: $P1
getattribute $P1, self, 'nlabel'
.annotate 'line', 7122
# int n: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 7123
# string s: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, '__label_', $S2
assign $P1, $I1
.annotate 'line', 7125
.return($S1)
# }
.annotate 'line', 7126

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7127
# Body
# {
.annotate 'line', 7129
'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7130

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7131
# Body
# {
.annotate 'line', 7133
'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7134

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7136
# Body
# {
.annotate 'line', 7138
# string name: $S1
getattribute $P19, self, 'name'
null $S1
if_null $P19, __label_0
set $S1, $P19
__label_0:
.annotate 'line', 7139
__ARG_1.'say'()
.annotate 'line', 7140
__ARG_1.'print'(".sub ")
.annotate 'line', 7141
$P19 = self.'isanonymous'()
if_null $P19, __label_1
unless $P19 goto __label_1
.annotate 'line', 7142
__ARG_1.'print'("'' :anon")
goto __label_2
__label_1: # else
.annotate 'line', 7144
__ARG_1.'print'("'", $S1, "'")
__label_2: # endif
.annotate 'line', 7145
getattribute $P20, self, 'subid'
if_null $P20, __label_3
.annotate 'line', 7146
getattribute $P21, self, 'subid'
__ARG_1.'print'(" :subid('", $P21, "')")
__label_3: # endif
.annotate 'line', 7147
getattribute $P20, self, 'outer'
if_null $P20, __label_4
# {
.annotate 'line', 7148
# var outer: $P1
getattribute $P1, self, 'outer'
.annotate 'line', 7149
# var outerid: $P2
getattribute $P2, $P1, 'subid'
.annotate 'line', 7150
if_null $P2, __label_5
.annotate 'line', 7151
__ARG_1.'print'(" :outer('", $P2, "')")
__label_5: # endif
# }
__label_4: # endif
.annotate 'line', 7155
$P21 = self.'ismethod'()
if_null $P21, __label_6
unless $P21 goto __label_6
.annotate 'line', 7156
__ARG_1.'print'(' :method')
__label_6: # endif
.annotate 'line', 7157
# var modifiers: $P3
getattribute $P3, self, 'modifiers'
.annotate 'line', 7158
if_null $P3, __label_7
# {
.annotate 'line', 7159
# var mlist: $P4
$P4 = $P3.'getlist'()
.annotate 'line', 7160
iter $P22, $P4
set $P22, 0
__label_9: # for iteration
unless $P22 goto __label_10
shift $P5, $P22
# {
.annotate 'line', 7161
# int nargmods: $I1
$P23 = $P5.'numargs'()
set $I1, $P23
.annotate 'line', 7162
$P23 = $P5.'getname'()
__ARG_1.'print'(' :', $P23)
.annotate 'line', 7163
le $I1, 0, __label_11
# {
.annotate 'line', 7164
__ARG_1.'print'('(')
# for loop
.annotate 'line', 7165
# int iargmod: $I2
null $I2
__label_14: # for condition
ge $I2, $I1, __label_13
# {
.annotate 'line', 7166
# var argmod: $P6
$P6 = $P5.'getarg'($I2)
.annotate 'line', 7167
$P24 = $P6.'isstringliteral'()
isfalse $I5, $P24
unless $I5 goto __label_15
.annotate 'line', 7168
getattribute $P25, $P6, 'start'
'SyntaxError'('Invalid modifier', $P25)
__label_15: # endif
.annotate 'line', 7169
$P24 = $P6.'getPirString'()
__ARG_1.'print'($P24)
# }
__label_12: # for iteration
.annotate 'line', 7165
inc $I2
goto __label_14
__label_13: # for end
.annotate 'line', 7171
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
.annotate 'line', 7176
ne $S1, 'main', __label_16
.annotate 'line', 7177
__ARG_1.'print'(' :main')
__label_16: # endif
# }
__label_8: # endif
.annotate 'line', 7179
__ARG_1.'say'()
.annotate 'line', 7181
# var params: $P7
getattribute $P7, self, 'params'
.annotate 'line', 7182
# var param: $P8
null $P8
.annotate 'line', 7183
# string paramname: $S2
null $S2
.annotate 'line', 7184
# var a: $P9
null $P9
.annotate 'line', 7186
iter $P26, $P7
set $P26, 0
__label_17: # for iteration
unless $P26 goto __label_18
shift $P8, $P26
# {
.annotate 'line', 7187
$S2 = $P8['name']
.annotate 'line', 7188
$P9 = self.'getvar'($S2)
.annotate 'line', 7189
# string ptype: $S3
$P27 = $P9.'gettype'()
$P25 = 'typetopirname'($P27)
null $S3
if_null $P25, __label_19
set $S3, $P25
__label_19:
.annotate 'line', 7190
$P27 = $P9.'getreg'()
__ARG_1.'print'('.param ', $S3, ' ', $P27)
.annotate 'line', 7191
# var modarg: $P10
$P10 = $P8['modifiers']
.annotate 'line', 7192
if_null $P10, __label_20
# {
.annotate 'line', 7193
# var named: $P11
null $P11
.annotate 'line', 7194
# var slurpy: $P12
null $P12
.annotate 'line', 7195
# var modarglist: $P13
$P13 = $P10.'getlist'()
.annotate 'line', 7196
iter $P28, $P13
set $P28, 0
__label_21: # for iteration
unless $P28 goto __label_22
shift $P14, $P28
# {
.annotate 'line', 7197
# string modname: $S4
$P29 = $P14.'getname'()
null $S4
if_null $P29, __label_23
set $S4, $P29
__label_23:
set $S8, $S4
set $S9, 'named'
.annotate 'line', 7198
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
.annotate 'line', 7206
__ARG_1.'print'(' :', $S4)
__label_24: # switch end
# }
goto __label_21
__label_22: # endfor
.annotate 'line', 7209
isnull $I5, $P11
not $I5
unless $I5 goto __label_30
isnull $I5, $P12
not $I5
__label_30:
unless $I5 goto __label_28
# {
.annotate 'line', 7214
__ARG_1.'print'(" :named :slurpy")
# }
goto __label_29
__label_28: # else
# {
.annotate 'line', 7217
if_null $P11, __label_31
# {
.annotate 'line', 7218
# string setname: $S5
null $S5
.annotate 'line', 7219
# int nargs: $I3
$P29 = $P11.'numargs'()
set $I3, $P29
set $I6, $I3
null $I7
.annotate 'line', 7220
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
.annotate 'line', 7225
# var argmod: $P15
$P15 = $P11.'getarg'(0)
.annotate 'line', 7226
$P30 = $P15.'isstringliteral'()
isfalse $I8, $P30
unless $I8 goto __label_37
.annotate 'line', 7227
getattribute $P31, self, 'start'
'SyntaxError'('Invalid modifier', $P31)
__label_37: # endif
.annotate 'line', 7228
$P32 = $P15.'getPirString'()
set $S5, $P32
goto __label_33 # break
__label_34: # default
.annotate 'line', 7231
getattribute $P33, self, 'start'
'SyntaxError'('Invalid modifier', $P33)
__label_33: # switch end
.annotate 'line', 7233
__ARG_1.'print'(" :named(", $S5, ")")
# }
goto __label_32
__label_31: # else
.annotate 'line', 7235
if_null $P12, __label_38
# {
.annotate 'line', 7236
__ARG_1.'print'(" :slurpy")
# }
__label_38: # endif
__label_32: # endif
# }
__label_29: # endif
# }
__label_20: # endif
.annotate 'line', 7240
__ARG_1.'say'('')
# }
goto __label_17
__label_18: # endfor
.annotate 'line', 7242
__ARG_1.'say'()
.annotate 'line', 7243
getattribute $P30, self, 'start'
__ARG_1.'annotate'($P30)
.annotate 'line', 7246
# var lexicals: $P16
getattribute $P16, self, 'lexicals'
.annotate 'line', 7247
if_null $P16, __label_39
# {
.annotate 'line', 7249
iter $P34, $P16
set $P34, 0
__label_40: # for iteration
unless $P34 goto __label_41
shift $S6, $P34
.annotate 'line', 7250
$P31 = $P16[$S6]
__ARG_1.'say'(".lex '", $P31, "', ", $S6)
goto __label_40
__label_41: # endfor
# }
__label_39: # endif
.annotate 'line', 7253
getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7254
if_null $P16, __label_42
# {
.annotate 'line', 7256
iter $P35, $P16
set $P35, 0
__label_43: # for iteration
unless $P35 goto __label_44
shift $S7, $P35
.annotate 'line', 7257
$P32 = $P16[$S7]
__ARG_1.'say'($S7, " = find_lex '", $P32, "'")
goto __label_43
__label_44: # endfor
# }
__label_42: # endif
.annotate 'line', 7260
__ARG_1.'comment'('Body')
.annotate 'line', 7261
getattribute $P33, self, 'body'
$P33.'emit'(__ARG_1)
.annotate 'line', 7263
getattribute $P37, self, 'body'
$P36 = $P37.'getend'()
__ARG_1.'annotate'($P36)
.annotate 'line', 7264
__ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 7267
# var localfun: $P17
getattribute $P17, self, 'localfun'
.annotate 'line', 7268
if_null $P17, __label_45
# {
# for loop
.annotate 'line', 7270
# int ifn: $I4
null $I4
__label_48: # for condition
# predefined elements
elements $I6, $P17
ge $I4, $I6, __label_47
# {
.annotate 'line', 7271
# var fn: $P18
$P18 = $P17[$I4]
.annotate 'line', 7272
$P18.'emit'(__ARG_1)
# }
__label_46: # for iteration
.annotate 'line', 7270
inc $I4
goto __label_48
__label_47: # for end
# }
__label_45: # endif
# }
.annotate 'line', 7275

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 6950
get_class $P1, [ 'BlockStatement' ]
addparent $P0, $P1
.annotate 'line', 6952
addattribute $P0, 'name'
.annotate 'line', 6953
addattribute $P0, 'subid'
.annotate 'line', 6954
addattribute $P0, 'modifiers'
.annotate 'line', 6955
addattribute $P0, 'params'
.annotate 'line', 6956
addattribute $P0, 'body'
.annotate 'line', 6957
addattribute $P0, 'regstI'
.annotate 'line', 6958
addattribute $P0, 'regstN'
.annotate 'line', 6959
addattribute $P0, 'regstS'
.annotate 'line', 6960
addattribute $P0, 'regstP'
.annotate 'line', 6961
addattribute $P0, 'nlabel'
.annotate 'line', 6962
addattribute $P0, 'localfun'
.annotate 'line', 6963
addattribute $P0, 'lexicals'
.annotate 'line', 6964
addattribute $P0, 'usedlexicals'
.annotate 'line', 6965
addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7287
# Body
# {
.annotate 'line', 7289
self.'FunctionBase'(__ARG_1, __ARG_3)
box $P1, 0
.annotate 'line', 7290
setattribute self, 'paramnum', $P1
box $P1, 0
.annotate 'line', 7291
setattribute self, 'lexnum', $P1
.annotate 'line', 7292
self.'parse'(__ARG_2)
# }
.annotate 'line', 7293

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7295
# Body
# {
.return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 7296
# Body
# {
.annotate 'line', 7299
# var paramnum: $P1
getattribute $P1, self, 'paramnum'
.annotate 'line', 7300
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7302
.return($I1)
# }
.annotate 'line', 7303

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7304
# Body
# {
.annotate 'line', 7307
# var lexnum: $P1
getattribute $P1, self, 'lexnum'
.annotate 'line', 7308
# int n: $I1
set $I2, $P1
add $I1, $I2, 1
assign $P1, $I1
.annotate 'line', 7310
.return($I1)
# }
.annotate 'line', 7311

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 7312
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7314
# Body
# {
.annotate 'line', 7316
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7317
setattribute self, 'name', $P1
.annotate 'line', 7318
$P1 = __ARG_1.'get'()
.annotate 'line', 7319
$P3 = $P1.'isop'('[')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7320
# var modifiers: $P2
new $P2, [ 'ModifierList' ]
$P2.'ModifierList'(__ARG_1, self)
.annotate 'line', 7321
setattribute self, 'modifiers', $P2
.annotate 'line', 7322
$P1 = __ARG_1.'get'()
# }
__label_0: # endif
.annotate 'line', 7324
$P4 = $P1.'isop'('(')
isfalse $I1, $P4
unless $I1 goto __label_1
.annotate 'line', 7325
'Expected'('(', $P1)
__label_1: # endif
.annotate 'line', 7326
self.'parse_parameters'(__ARG_1)
.annotate 'line', 7328
$P1 = __ARG_1.'get'()
.annotate 'line', 7329
$P5 = $P1.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_2
.annotate 'line', 7330
'Expected'('{', $P1)
__label_2: # endif
.annotate 'line', 7331
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P1, __ARG_1, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7332
.return(self)
# }
.annotate 'line', 7333

.end # parse

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 7282
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.annotate 'line', 7284
addattribute $P0, 'paramnum'
.annotate 'line', 7285
addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7342
# Body
# {
.annotate 'line', 7344
self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 7345
$P4 = __ARG_3.'getouter'()
setattribute self, 'outer', $P4
.annotate 'line', 7346
getattribute $P3, self, 'outer'
$P3.'makesubid'()
.annotate 'line', 7347
# var subid: $P1
$P1 = self.'makesubid'()
.annotate 'line', 7348
setattribute self, 'name', $P1
.annotate 'line', 7349
self.'parse_parameters'(__ARG_2)
.annotate 'line', 7350
# var t: $P2
$P2 = __ARG_2.'get'()
.annotate 'line', 7351
$P5 = $P2.'isop'('{')
isfalse $I1, $P5
unless $I1 goto __label_0
.annotate 'line', 7352
'Expected'('{', $P2)
__label_0: # endif
.annotate 'line', 7353
new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_2, self)
set $P6, $P7
setattribute self, 'body', $P6
.annotate 'line', 7354
__ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 7355

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 7356
# Body
# {
.return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 7357
# Body
# {
.return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 7358
# Body
# {
.annotate 'line', 7360
getattribute $P1, self, 'subid'
.return($P1)
# }
.annotate 'line', 7361

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 7362
# Body
# {
.annotate 'line', 7365
getattribute $P1, self, 'outer'
.tailcall $P1.'getparamnum'()
# }
.annotate 'line', 7366

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 7367
# Body
# {
.annotate 'line', 7370
getattribute $P1, self, 'outer'
.tailcall $P1.'getlexnum'()
# }
.annotate 'line', 7371

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 7372
# Body
# {
.annotate 'line', 7374
# var r: $P1
$P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 7375
unless_null $P1, __label_0
# {
.annotate 'line', 7378
getattribute $P6, self, 'owner'
$P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 7379
unless_null $P1, __label_1
# {
.annotate 'line', 7381
ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 7382
# var ownerscope: $P2
getattribute $P2, self, 'outer'
.annotate 'line', 7383
getattribute $P7, self, 'outer'
$P6 = $P7.'ismethod'()
if_null $P6, __label_4
unless $P6 goto __label_4
# {
.annotate 'line', 7384
# string lexself: $S1
$P8 = $P2.'makelexicalself'()
null $S1
if_null $P8, __label_5
set $S1, $P8
__label_5:
.annotate 'line', 7385
$P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 7386
# string reg: $S2
$P7 = $P1.'getreg'()
null $S2
if_null $P7, __label_6
set $S2, $P7
__label_6:
.annotate 'line', 7387
self.'setusedlex'($S1, $S2)
# }
__label_4: # endif
# }
__label_3: # endif
# }
goto __label_2
__label_1: # else
.annotate 'line', 7391
$P8 = $P1.'gettype'()
set $S5, $P8
iseq $I2, $S5, 'P'
unless $I2 goto __label_8
$P9 = $P1.'isconst'()
isfalse $I2, $P9
__label_8:
unless $I2 goto __label_7
# {
.annotate 'line', 7392
# var scope: $P3
$P3 = $P1.'getscope'()
.annotate 'line', 7393
# var ownerscope: $P4
$P4 = $P3.'getouter'()
.annotate 'line', 7394
# var outer: $P5
getattribute $P5, self, 'outer'
.annotate 'line', 7395
isa $I2, $P4, 'FunctionBase'
unless $I2 goto __label_9
# {
.annotate 'line', 7396
$P9 = $P4.'same_scope_as'($P5)
if_null $P9, __label_10
unless $P9 goto __label_10
# {
.annotate 'line', 7397
# string lexname: $S3
$P10 = $P3.'makelexical'($P1)
null $S3
if_null $P10, __label_11
set $S3, $P10
__label_11:
.annotate 'line', 7398
# int flags: $I1
$P10 = $P1.'isvolatile'()
if_null $P10, __label_13
unless $P10 goto __label_13
set $I1, 1
goto __label_12
__label_13:
null $I1
__label_12:
.annotate 'line', 7399
$P1 = self.'createvar'(__ARG_1, 'P', $I1)
box $P11, $S3
.annotate 'line', 7400
setattribute $P1, 'lexname', $P11
.annotate 'line', 7401
# string reg: $S4
$P11 = $P1.'getreg'()
null $S4
if_null $P11, __label_14
set $S4, $P11
__label_14:
.annotate 'line', 7402
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
.annotate 'line', 7407
isnull $I3, $P1
not $I3
unless $I3 goto __label_16
isa $I4, $P1, 'VarData'
not $I3, $I4
__label_16:
unless $I3 goto __label_15
.annotate 'line', 7408
'InternalError'('Incorrect data for variable in LocalFunction')
__label_15: # endif
.annotate 'line', 7409
.return($P1)
# }
.annotate 'line', 7410

.end # getvar

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 7340
get_class $P1, [ 'FunctionBase' ]
addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7419
# Body
# {
.annotate 'line', 7421
self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7422

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 7423
# Body
# {
.return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 7417
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

.annotate 'line', 7440
# Body
# {
.annotate 'line', 7442
setattribute self, 'owner', __ARG_1
.annotate 'line', 7443
setattribute self, 'start', __ARG_2
# }
.annotate 'line', 7444

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 7445
# Body
# {
.return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 7447
# Body
# {
.annotate 'line', 7449
getattribute $P1, self, 'start'
__ARG_1.'annotate'($P1)
# }
.annotate 'line', 7450

.end # annotate

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 7438
addattribute $P0, 'owner'
.annotate 'line', 7439
addattribute $P0, 'start'
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7456
# Body
# {
.annotate 'line', 7458
self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 7459
setattribute self, 'name', __ARG_2
# }
.annotate 'line', 7460

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 7461
# Body
# {
.return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7463
# Body
# {
.annotate 'line', 7465
# string basestr: $S1
getattribute $P1, self, 'name'
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 7466
__ARG_1.'print'($S1)
# }
.annotate 'line', 7467

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 7453
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7455
addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7474
# Body
# {
.annotate 'line', 7476
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7477
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 7478
# var t: $P2
$P2 = __ARG_1.'get'()
.annotate 'line', 7479
$P3 = $P2.'isstring'()
isfalse $I1, $P3
unless $I1 goto __label_0
.annotate 'line', 7480
'SyntaxError'('literal string expected', $P2)
__label_0: # endif
.annotate 'line', 7481
$P4 = $P2.'rawstring'()
$P1.'push'($P4)
.annotate 'line', 7482
$P2 = __ARG_1.'get'()
.annotate 'line', 7483
$P4 = $P2.'isop'(']')
isfalse $I1, $P4
unless $I1 goto __label_1
# {
.annotate 'line', 7484
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
.annotate 'line', 7486
setattribute self, 'hll', $P6
__label_5: # case
goto __label_2 # break
__label_3: # default
.annotate 'line', 7490
'SyntaxError'('Unexpected token in class key', $P2)
__label_2: # switch end
__label_6: # do
.annotate 'line', 7492
# {
.annotate 'line', 7493
$P2 = __ARG_1.'get'()
.annotate 'line', 7494
$P5 = $P2.'isstring'()
isfalse $I2, $P5
unless $I2 goto __label_9
.annotate 'line', 7495
'SyntaxError'('literal string expected', $P2)
__label_9: # endif
.annotate 'line', 7496
$P6 = $P2.'rawstring'()
$P1.'push'($P6)
# }
.annotate 'line', 7497
$P2 = __ARG_1.'get'()
$P7 = $P2.'isop'(',')
if_null $P7, __label_7
if $P7 goto __label_6
__label_7: # enddo
.annotate 'line', 7498
$P7 = $P2.'isop'(']')
isfalse $I2, $P7
unless $I2 goto __label_10
.annotate 'line', 7499
'SyntaxError'("Expected ']'", $P2)
__label_10: # endif
# }
__label_1: # endif
.annotate 'line', 7501
setattribute self, 'key', $P1
# }
.annotate 'line', 7502

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 7503
# Body
# {
.return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 7504
# Body
# {
# predefined int
.annotate 'line', 7506
getattribute $P1, self, 'hll'
isnull $I1, $P1
not $I1
.return($I1)
# }
.annotate 'line', 7507

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7509
# Body
# {
.annotate 'line', 7511
getattribute $P2, self, 'key'
$P1 = 'getparrotkey'($P2)
__ARG_1.'print'($P1)
# }
.annotate 'line', 7512

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 7470
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7472
addattribute $P0, 'key'
.annotate 'line', 7473
addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7518
# Body
# {
.annotate 'line', 7520
self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 7521
# var key: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, __ARG_3
box $P3, $S1
$P1.'push'($P3)
.annotate 'line', 7522
# var t: $P2
null $P2
__label_1: # while
.annotate 'line', 7523
$P2 = __ARG_1.'get'()
$P3 = $P2.'isop'('.')
if_null $P3, __label_0
unless $P3 goto __label_0
# {
.annotate 'line', 7524
$P2 = __ARG_1.'get'()
.annotate 'line', 7525
# predefined string
set $S1, $P2
$P1.'push'($S1)
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 7527
__ARG_1.'unget'($P2)
.annotate 'line', 7528
setattribute self, 'key', $P1
# }
.annotate 'line', 7529

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 7530
# Body
# {
.return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 7532
# Body
# {
.annotate 'line', 7534
# var key: $P1
getattribute $P1, self, 'key'
$P2 = $P1[-1]
.annotate 'line', 7535
.return($P2)
# }
.annotate 'line', 7536

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7538
# Body
# {
.annotate 'line', 7540
# var key: $P1
getattribute $P2, self, 'key'
$P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 7541
unless_null $P1, __label_0
# {
.annotate 'line', 7542
getattribute $P2, self, 'key'
# predefined join
join $S1, ".", $P2
concat $S2, "class ", $S1
concat $S2, $S2, " not found at compile time"
'Warn'($S2)
.annotate 'line', 7543
getattribute $P4, self, 'key'
$P3 = 'getparrotkey'($P4)
__ARG_1.'print'($P3)
# }
goto __label_1
__label_0: # else
.annotate 'line', 7545
$P3 = $P1.'getclasskey'()
__ARG_1.'print'($P3)
__label_1: # endif
# }
.annotate 'line', 7546

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 7515
get_class $P1, [ 'ClassSpecifier' ]
addparent $P0, $P1
.annotate 'line', 7517
addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7549
# Body
# {
.annotate 'line', 7551
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7552
$P2 = $P1.'isstring'()
if_null $P2, __label_0
unless $P2 goto __label_0
.annotate 'line', 7553
new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_0: # endif
.annotate 'line', 7554
$P2 = $P1.'isop'('[')
if_null $P2, __label_1
unless $P2 goto __label_1
.annotate 'line', 7555
new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
set $P3, $P4
.return($P3)
__label_1: # endif
.annotate 'line', 7556
$P5 = $P1.'isidentifier'()
if_null $P5, __label_2
unless $P5 goto __label_2
.annotate 'line', 7557
new $P7, [ 'ClassSpecifierId' ]
$P7.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
set $P6, $P7
.return($P6)
__label_2: # endif
.annotate 'line', 7558
'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 7559

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7576
# Body
# {
.annotate 'line', 7578
setattribute self, 'parent', __ARG_2
.annotate 'line', 7579
setattribute self, 'owner', __ARG_2
.annotate 'line', 7580
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P12
.annotate 'line', 7581
root_new $P12, ['parrot';'ResizablePMCArray']
setattribute self, 'members', $P12
.annotate 'line', 7582
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'bases', $P15
.annotate 'line', 7583
root_new $P15, ['parrot';'ResizablePMCArray']
setattribute self, 'constants', $P15
.annotate 'line', 7585
# var t: $P1
$P1 = __ARG_1.'get'()
.annotate 'line', 7586
setattribute self, 'name', $P1
.annotate 'line', 7587
$P1 = __ARG_1.'get'()
.annotate 'line', 7588
$P17 = $P1.'isop'(':')
if_null $P17, __label_0
unless $P17 goto __label_0
# {
.annotate 'line', 7589
# var bases: $P2
getattribute $P2, self, 'bases'
__label_2: # Infinite loop
.annotate 'line', 7590
# {
.annotate 'line', 7591
# var base: $P3
$P3 = 'parseClassSpecifier'(__ARG_1, self)
.annotate 'line', 7592
$P2.'push'($P3)
.annotate 'line', 7593
$P1 = __ARG_1.'get'()
.annotate 'line', 7594
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
.annotate 'line', 7597
$P18 = $P1.'isop'('{')
isfalse $I1, $P18
unless $I1 goto __label_4
.annotate 'line', 7598
'Expected'('{', $P1)
__label_4: # endif
.annotate 'line', 7599
$P1 = __ARG_1.'get'()
__label_6: # while
.annotate 'line', 7600
$P19 = $P1.'isop'('}')
isfalse $I2, $P19
unless $I2 goto __label_5
# {
.annotate 'line', 7601
$P20 = $P1.'iskeyword'('function')
if_null $P20, __label_7
unless $P20 goto __label_7
# {
.annotate 'line', 7602
# var f: $P4
new $P4, [ 'MethodStatement' ]
$P4.'MethodStatement'($P1, __ARG_1, self)
.annotate 'line', 7603
# var functions: $P5
getattribute $P5, self, 'functions'
.annotate 'line', 7604
$P5.'push'($P4)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7606
$P19 = $P1.'iskeyword'('var')
if_null $P19, __label_9
unless $P19 goto __label_9
# {
.annotate 'line', 7607
# var name: $P6
$P6 = __ARG_1.'get'()
.annotate 'line', 7608
$P20 = $P6.'isidentifier'()
isfalse $I2, $P20
unless $I2 goto __label_11
.annotate 'line', 7609
'SyntaxError'("Expected member identifier", $P6)
__label_11: # endif
.annotate 'line', 7610
getattribute $P21, self, 'members'
$P21.'push'($P6)
.annotate 'line', 7611
$P1 = __ARG_1.'get'()
.annotate 'line', 7612
$P21 = $P1.'isop'(';')
isfalse $I3, $P21
unless $I3 goto __label_12
.annotate 'line', 7613
'SyntaxError'("Expected ';' in member declaration", $P1)
__label_12: # endif
# }
goto __label_10
__label_9: # else
.annotate 'line', 7615
$P22 = $P1.'iskeyword'('const')
if_null $P22, __label_13
unless $P22 goto __label_13
# {
.annotate 'line', 7616
# var cst: $P7
$P7 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7617
# var constants: $P8
getattribute $P8, self, 'constants'
.annotate 'line', 7618
$P8.'push'($P7)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7621
'SyntaxError'("Unexpected item in class", $P1)
__label_14: # endif
__label_10: # endif
__label_8: # endif
.annotate 'line', 7622
$P1 = __ARG_1.'get'()
# }
goto __label_6
__label_5: # endwhile
.annotate 'line', 7624
# var classns: $P9
getattribute $P22, self, 'parent'
$P9 = $P22.'getpath'()
.annotate 'line', 7625
getattribute $P23, self, 'name'
$P9.'push'($P23)
.annotate 'line', 7626
setattribute self, 'classns', $P9
# }
.annotate 'line', 7627

.end # ClassStatement


.sub 'generatesubid' :method

.annotate 'line', 7628
# Body
# {
.annotate 'line', 7630
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7631

.end # generatesubid


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7632
# Body
# {
.annotate 'line', 7634
getattribute $P1, self, 'parent'
.tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 7635

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7636
# Body
# {
.annotate 'line', 7638
getattribute $P1, self, 'parent'
.tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 7639

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7640
# Body
# {
.annotate 'line', 7642
getattribute $P1, self, 'owner'
.tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7643

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 7644
# Body
# {
.annotate 'line', 7646
getattribute $P1, self, 'constants'
'optimize_array'($P1)
.annotate 'line', 7647
getattribute $P1, self, 'functions'
'optimize_array'($P1)
.annotate 'line', 7648
.return(self)
# }
.annotate 'line', 7649

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 7650
# Body
# {
.annotate 'line', 7652
getattribute $P1, self, 'classns'
.tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 7653

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7654
# Body
# {
.annotate 'line', 7656
# var classns: $P1
getattribute $P1, self, 'classns'
.annotate 'line', 7657
$P5 = 'getparrotnamespacekey'($P1)
__ARG_1.'say'($P5)
.annotate 'line', 7658
getattribute $P5, self, 'functions'
iter $P6, $P5
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
.annotate 'line', 7659
$P2.'emit'(__ARG_1)
goto __label_0
__label_1: # endfor
.annotate 'line', 7661
__ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 7663
$P7 = self.'getclasskey'()
__ARG_1.'say'('newclass $P0, ', $P7)
.annotate 'line', 7664
# int n: $I1
set $I1, 1
.annotate 'line', 7665
getattribute $P7, self, 'bases'
iter $P8, $P7
set $P8, 0
__label_2: # for iteration
unless $P8 goto __label_3
shift $P3, $P8
# {
.annotate 'line', 7666
$P3.'annotate'(__ARG_1)
.annotate 'line', 7667
# string reg: $S1
set $I2, $I1
inc $I1
set $S2, $I2
concat $S1, "$P", $S2
.annotate 'line', 7668
__ARG_1.'print'('get_class ', $S1, ', ')
.annotate 'line', 7669
getattribute $P9, self, 'parent'
$P3.'emit'(__ARG_1, $P9)
.annotate 'line', 7670
__ARG_1.'say'()
.annotate 'line', 7671
__ARG_1.'say'('addparent $P0, ', $S1)
# }
goto __label_2
__label_3: # endfor
.annotate 'line', 7673
getattribute $P9, self, 'members'
iter $P10, $P9
set $P10, 0
__label_4: # for iteration
unless $P10 goto __label_5
shift $P4, $P10
# {
.annotate 'line', 7674
__ARG_1.'annotate'($P4)
.annotate 'line', 7675
__ARG_1.'say'("addattribute $P0, '", $P4, "'")
# }
goto __label_4
__label_5: # endfor
.annotate 'line', 7678
__ARG_1.'say'('.end')
# }
.annotate 'line', 7679

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 7565
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7567
addattribute $P0, 'parent'
.annotate 'line', 7568
addattribute $P0, 'owner'
.annotate 'line', 7569
addattribute $P0, 'name'
.annotate 'line', 7570
addattribute $P0, 'bases'
.annotate 'line', 7571
addattribute $P0, 'constants'
.annotate 'line', 7572
addattribute $P0, 'functions'
.annotate 'line', 7573
addattribute $P0, 'members'
.annotate 'line', 7574
addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7686
# Body
# {
.annotate 'line', 7688
# var t: $P1
$P1 = __ARG_2.'get'()
.annotate 'line', 7689
$P9 = $P1.'isstring'()
isfalse $I2, $P9
unless $I2 goto __label_0
.annotate 'line', 7690
'SyntaxError'('Literal string expected', $P1)
__label_0: # endif
.annotate 'line', 7691
'ExpectOp'(';', __ARG_2)
.annotate 'line', 7692
# string filename: $S1
$P9 = $P1.'rawstring'()
null $S1
if_null $P9, __label_1
set $S1, $P9
__label_1:
.annotate 'line', 7693
# var interp: $P2
# predefined getinterp
getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 7698
# var libpaths: $P3
$P3 = $P2[9]
.annotate 'line', 7699
# var paths: $P4
$P4 = $P3[0]
.annotate 'line', 7700
# var file: $P5
new $P5, [ 'FileHandle' ]
.annotate 'line', 7701
iter $P10, $P4
set $P10, 0
__label_2: # for iteration
unless $P10 goto __label_3
shift $S2, $P10
# {
.annotate 'line', 7702
# string filepath: $S3
concat $S3, $S2, $S1
.annotate 'line', 7703
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_4
push_eh $P11
# try: begin
# {
.annotate 'line', 7704
$P5.'open'($S3, 'r')
goto __label_3 # break
.annotate 'line', 7705
# }
# try: end
pop_eh
goto __label_5
.annotate 'line', 7703
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
.annotate 'line', 7710
$P11 = $P5.'is_closed'()
if_null $P11, __label_6
unless $P11 goto __label_6
.annotate 'line', 7711
'SyntaxError'('File not found', $P1)
__label_6: # endif
.annotate 'line', 7716
load_bytecode 'PGE.pbc'
.annotate 'line', 7717
# var regexcomp: $P6
# predefined compreg
compreg $P6, 'PGE::P5Regex'
.annotate 'line', 7718
# var rule: $P7
$P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 7720
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
.annotate 'line', 7721
# string matches: $P8
root_new $P8, ['parrot'; 'ResizableStringArray']
.annotate 'line', 7722
$P8 = $P7($S4)
.annotate 'line', 7723
# predefined elements
elements $I3, $P8
le $I3, 0, __label_11
# {
.annotate 'line', 7724
# string name: $S5
$S5 = $P8[0]
.annotate 'line', 7725
# string value: $S6
$S6 = $P8[1]
.annotate 'line', 7726
# int ivalue: $I1
null $I1
.annotate 'line', 7727
# predefined substr
substr $S7, $S6, 0, 2
iseq $I3, $S7, '0x'
if $I3 goto __label_14
# predefined substr
substr $S8, $S6, 0, 2
iseq $I3, $S8, '0X'
__label_14:
unless $I3 goto __label_12
.annotate 'line', 7728
# predefined substr
substr $S9, $S6, 2
box $P14, $S9
$P13 = $P14.'to_int'(16)
set $I1, $P13
goto __label_13
__label_12: # else
set $I1, $S6
__label_13: # endif
.annotate 'line', 7733
new $P16, [ 'TokenInteger' ]
getattribute $P17, __ARG_1, 'file'
getattribute $P18, __ARG_1, 'line'
$P16.'TokenInteger'($P17, $P18, $S5)
set $P15, $P16
.annotate 'line', 7732
$P14 = 'integerValue'(__ARG_3, $P15, $I1)
.annotate 'line', 7731
__ARG_3.'createconst'($S5, 'I', $P14, '')
# }
__label_11: # endif
# }
__label_7: # for iteration
.annotate 'line', 7720
$P15 = $P5.'readline'()
set $S4, $P15
goto __label_9
__label_8: # for end
.annotate 'line', 7737
$P5.'close'()
# }
.annotate 'line', 7738

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 7750
# Body
# {
.annotate 'line', 7752
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'namespaces', $P2
.annotate 'line', 7753
root_new $P2, ['parrot';'ResizablePMCArray']
setattribute self, 'classes', $P2
.annotate 'line', 7754
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'functions', $P5
.annotate 'line', 7755
root_new $P5, ['parrot';'ResizablePMCArray']
setattribute self, 'items', $P5
# }
.annotate 'line', 7756

.end # init


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 7757
# Body
# {
.annotate 'line', 7759
# var classes: $P1
getattribute $P1, self, 'classes'
.annotate 'line', 7760
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 7761
getattribute $P4, $P2, 'name'
set $S1, $P4
ne $S1, __ARG_1, __label_2
.annotate 'line', 7762
.return($P2)
__label_2: # endif
goto __label_0
__label_1: # endfor
null $P4
.annotate 'line', 7763
.return($P4)
# }
.annotate 'line', 7764

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 7765
# Body
# {
.annotate 'line', 7769
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
.annotate 'line', 7771
.return($P5)
__label_3: # case
.annotate 'line', 7774
$P6 = __ARG_1[0]
.tailcall self.'checkclass_base'($P6)
__label_1: # default
.annotate 'line', 7779
# var namespaces: $P1
getattribute $P1, self, 'namespaces'
.annotate 'line', 7780
# var childkey: $P2
# predefined clone
clone $P2, __ARG_1
.annotate 'line', 7781
# string basename: $S1
$P7 = $P2.'shift'()
null $S1
if_null $P7, __label_4
set $S1, $P7
__label_4:
.annotate 'line', 7782
iter $P8, $P1
set $P8, 0
__label_5: # for iteration
unless $P8 goto __label_6
shift $P3, $P8
# {
.annotate 'line', 7783
getattribute $P9, $P3, 'name'
set $S2, $P9
ne $S2, $S1, __label_7
# {
.annotate 'line', 7784
# var found: $P4
$P4 = $P3.'findclasskey'($P2)
.annotate 'line', 7785
if_null $P4, __label_8
.annotate 'line', 7786
.return($P4)
__label_8: # endif
# }
__label_7: # endif
# }
goto __label_5
__label_6: # endfor
__label_0: # switch end
null $P5
.annotate 'line', 7790
.return($P5)
# }
.annotate 'line', 7791

.end # findclasskey_base


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 7792
# Body
# {
.annotate 'line', 7794
# int balance1: $I1
null $I1
# int balance2: $I2
null $I2
# int balance3: $I3
null $I3
.annotate 'line', 7795
# var t: $P1
null $P1
__label_1: # while
.annotate 'line', 7796
$P1 = __ARG_1.'get'()
if_null $P1, __label_0
unless $P1 goto __label_0
# {
.annotate 'line', 7798
$P10 = $P1.'iskeyword'('namespace')
if_null $P10, __label_2
unless $P10 goto __label_2
# {
.annotate 'line', 7800
# var start: $P2
set $P2, $P1
.annotate 'line', 7801
$P1 = __ARG_1.'get'()
.annotate 'line', 7802
# string name: $S1
set $P10, $P1
null $S1
if_null $P10, __label_4
set $S1, $P10
__label_4:
.annotate 'line', 7803
$P1 = __ARG_1.'get'()
.annotate 'line', 7805
# var modifier: $P3
null $P3
.annotate 'line', 7806
$P11 = $P1.'isop'('[')
if_null $P11, __label_5
unless $P11 goto __label_5
# {
.annotate 'line', 7807
new $P12, [ 'ModifierList' ]
$P12.'ModifierList'(__ARG_1, self)
set $P3, $P12
.annotate 'line', 7808
$P1 = __ARG_1.'get'()
# }
__label_5: # endif
.annotate 'line', 7811
$P11 = $P1.'isop'('{')
isfalse $I4, $P11
unless $I4 goto __label_6
.annotate 'line', 7812
'Expected'('{', $P1)
__label_6: # endif
.annotate 'line', 7813
# var child: $P4
new $P4, [ 'NamespaceStatement' ]
$P4.'NamespaceStatement'(self, $P2, $S1, $P3)
.annotate 'line', 7814
getattribute $P12, self, 'namespaces'
$P12.'push'($P4)
.annotate 'line', 7815
getattribute $P13, self, 'items'
$P13.'push'($P4)
.annotate 'line', 7816
$P4.'parse'(__ARG_1)
# }
goto __label_3
__label_2: # else
.annotate 'line', 7818
$P13 = $P1.'iskeyword'('const')
if_null $P13, __label_7
unless $P13 goto __label_7
# {
.annotate 'line', 7819
# var cst: $P5
$P5 = 'parseConst'($P1, __ARG_1, self)
.annotate 'line', 7820
getattribute $P14, self, 'items'
$P14.'push'($P5)
# }
goto __label_8
__label_7: # else
.annotate 'line', 7822
$P14 = $P1.'iskeyword'('function')
if_null $P14, __label_9
unless $P14 goto __label_9
# {
.annotate 'line', 7823
# var f: $P6
new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P1, __ARG_1, self)
.annotate 'line', 7824
# var functions: $P7
getattribute $P7, self, 'functions'
.annotate 'line', 7825
$P7.'push'($P6)
.annotate 'line', 7826
getattribute $P15, self, 'items'
$P15.'push'($P6)
# }
goto __label_10
__label_9: # else
.annotate 'line', 7828
$P15 = $P1.'iskeyword'('class')
if_null $P15, __label_11
unless $P15 goto __label_11
# {
.annotate 'line', 7829
# var c: $P8
new $P8, [ 'ClassStatement' ]
$P8.'ClassStatement'(__ARG_1, self)
.annotate 'line', 7830
# var classes: $P9
getattribute $P9, self, 'classes'
.annotate 'line', 7831
$P9.'push'($P8)
.annotate 'line', 7832
getattribute $P16, self, 'items'
$P16.'push'($P8)
# }
goto __label_12
__label_11: # else
.annotate 'line', 7834
$P16 = $P1.'iskeyword'('using')
if_null $P16, __label_13
unless $P16 goto __label_13
# {
.annotate 'line', 7835
$P1 = __ARG_1.'get'()
.annotate 'line', 7836
$P17 = $P1.'iskeyword'('extern')
isfalse $I4, $P17
unless $I4 goto __label_15
.annotate 'line', 7837
'SyntaxError'('Unsupported at nmaespace level', $P1)
__label_15: # endif
.annotate 'line', 7838
$P1 = __ARG_1.'get'()
.annotate 'line', 7839
$P17 = $P1.'isstring'()
isfalse $I5, $P17
unless $I5 goto __label_16
.annotate 'line', 7840
'Expected'('string literal', $P1)
__label_16: # endif
.annotate 'line', 7841
# string reqlib: $S2
set $P18, $P1
null $S2
if_null $P18, __label_17
set $S2, $P18
__label_17:
.annotate 'line', 7842
self.'addlib'($S2)
.annotate 'line', 7843
$P1 = __ARG_1.'get'()
.annotate 'line', 7844
'RequireOp'(';', $P1)
# }
goto __label_14
__label_13: # else
.annotate 'line', 7846
$P18 = $P1.'iskeyword'('$include_const')
if_null $P18, __label_18
unless $P18 goto __label_18
# {
.annotate 'line', 7847
'include_parrot'($P1, __ARG_1, self)
# }
goto __label_19
__label_18: # else
.annotate 'line', 7849
$P19 = $P1.'iskeyword'('$load')
if_null $P19, __label_20
unless $P19 goto __label_20
# {
.annotate 'line', 7850
$P1 = __ARG_1.'get'()
.annotate 'line', 7851
$P19 = $P1.'isstring'()
isfalse $I5, $P19
unless $I5 goto __label_22
.annotate 'line', 7852
'Expected'('string literal', $P1)
__label_22: # endif
.annotate 'line', 7853
# string reqload: $S3
set $P20, $P1
null $S3
if_null $P20, __label_23
set $S3, $P20
__label_23:
.annotate 'line', 7854
self.'addload'($S3)
.annotate 'line', 7855
$P1 = __ARG_1.'get'()
.annotate 'line', 7856
'RequireOp'(';', $P1)
# }
goto __label_21
__label_20: # else
.annotate 'line', 7858
$P20 = $P1.'isop'('}')
if_null $P20, __label_24
unless $P20 goto __label_24
# {
.annotate 'line', 7859
self.'close_ns'($P1)
.annotate 'line', 7860
.return()
# }
goto __label_25
__label_24: # else
.annotate 'line', 7863
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
.annotate 'line', 7865
self.'unclosed_ns'()
# }
.annotate 'line', 7866

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 7867
# Body
# {
.annotate 'line', 7869
getattribute $P1, self, 'items'
'optimize_array'($P1)
# }
.annotate 'line', 7870

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 7871
# Body
# {
.annotate 'line', 7873
# var path: $P1
$P1 = self.'getpath'()
.annotate 'line', 7874
# string s: $S1
$P3 = 'getparrotnamespacekey'($P1)
null $S1
if_null $P3, __label_0
set $S1, $P3
__label_0:
.annotate 'line', 7876
# int activate: $I1
set $I1, 1
.annotate 'line', 7877
getattribute $P3, self, 'items'
iter $P4, $P3
set $P4, 0
__label_1: # for iteration
unless $P4 goto __label_2
shift $P2, $P4
# {
.annotate 'line', 7878
isa $I2, $P2, 'NamespaceStatement'
if $I2 goto __label_5
.annotate 'line', 7879
isa $I2, $P2, 'ClassStatement'
__label_5:
unless $I2 goto __label_3
set $I1, 1
goto __label_4
__label_3: # else
unless $I1 goto __label_6
.annotate 'line', 7882
# {
.annotate 'line', 7883
__ARG_1.'say'($S1)
null $I1
.annotate 'line', 7884
# }
__label_6: # endif
__label_4: # endif
.annotate 'line', 7886
$P2.'emit'(__ARG_1)
# }
goto __label_1
__label_2: # endfor
# }
.annotate 'line', 7888

.end # emit_base

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 7742
get_class $P1, [ 'VarContainer' ]
addparent $P0, $P1
.annotate 'line', 7744
addattribute $P0, 'namespaces'
.annotate 'line', 7745
addattribute $P0, 'classes'
.annotate 'line', 7746
addattribute $P0, 'functions'
.annotate 'line', 7747
addattribute $P0, 'items'
.annotate 'line', 7748
addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 7903
# Body
# {
.annotate 'line', 7906
setattribute self, 'parent', __ARG_1
.annotate 'line', 7907
setattribute self, 'start', __ARG_2
.annotate 'line', 7908
setattribute self, 'owner', __ARG_1
box $P2, __ARG_3
.annotate 'line', 7909
setattribute self, 'name', $P2
.annotate 'line', 7910
setattribute self, 'modifier', __ARG_4
.annotate 'line', 7911
if_null __ARG_4, __label_0
# {
.annotate 'line', 7912
$P3 = __ARG_4.'pick'('HLL')
if_null $P3, __label_1
.annotate 'line', 7913
getattribute $P5, self, 'name'
setattribute self, 'hll', $P5
__label_1: # endif
# }
__label_0: # endif
# }
.annotate 'line', 7915

.end # NamespaceStatement


.sub 'generatesubid' :method

.annotate 'line', 7916
# Body
# {
.annotate 'line', 7918
getattribute $P1, self, 'owner'
.tailcall $P1.'generatesubid'()
# }
.annotate 'line', 7919

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 7920
# Body
# {
.annotate 'line', 7922
getattribute $P1, self, 'owner'
$P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 7923

.end # use_predef


.sub 'getpath' :method

.annotate 'line', 7924
# Body
# {
.annotate 'line', 7926
# var path: $P1
getattribute $P2, self, 'parent'
$P1 = $P2.'getpath'()
.annotate 'line', 7927
getattribute $P2, self, 'hll'
unless_null $P2, __label_0
.annotate 'line', 7928
getattribute $P3, self, 'name'
$P1.'push'($P3)
__label_0: # endif
.annotate 'line', 7929
.return($P1)
# }
.annotate 'line', 7930

.end # getpath


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7931
# Body
# {
.annotate 'line', 7933
getattribute $P1, self, 'parent'
$P1.'addlib'(__ARG_1)
# }
.annotate 'line', 7934

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 7935
# Body
# {
.annotate 'line', 7937
getattribute $P1, self, 'parent'
$P1.'addload'(__ARG_1)
# }
.annotate 'line', 7938

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 7939
# Body
# {
.annotate 'line', 7941
# var cl: $P1
$P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 7942
unless_null $P1, __label_0
.annotate 'line', 7943
getattribute $P2, self, 'parent'
.tailcall $P2.'checkclass'(__ARG_1)
goto __label_1
__label_0: # else
.annotate 'line', 7945
.return($P1)
__label_1: # endif
# }
.annotate 'line', 7946

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 7947
# Body
# {
.annotate 'line', 7951
# var cl: $P1
$P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 7952
unless_null $P1, __label_0
.annotate 'line', 7953
getattribute $P2, self, 'parent'
$P1 = $P2.'findclasskey'(__ARG_1)
__label_0: # endif
.annotate 'line', 7954
.return($P1)
# }
.annotate 'line', 7955

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 7956
# Body
# {
.annotate 'line', 7958
getattribute $P1, self, 'start'
'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 7959

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 7960
# Body
# {
# }
.annotate 'line', 7963

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 7964
# Body
# {
.annotate 'line', 7966
# var modifier: $P1
getattribute $P1, self, 'modifier'
.annotate 'line', 7967
if_null $P1, __label_0
# {
.annotate 'line', 7968
$P1 = $P1.'optimize'()
.annotate 'line', 7969
setattribute self, 'modifier', $P1
# }
__label_0: # endif
.annotate 'line', 7971
self.'optimize_base'()
.annotate 'line', 7972
.return(self)
# }
.annotate 'line', 7973

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7974
# Body
# {
.annotate 'line', 7976
# var hll: $P1
getattribute $P1, self, 'hll'
.annotate 'line', 7977
if_null $P1, __label_0
.annotate 'line', 7978
__ARG_1.'say'(".HLL '", $P1, "'")
__label_0: # endif
.annotate 'line', 7980
self.'emit_base'(__ARG_1)
.annotate 'line', 7982
if_null $P1, __label_1
.annotate 'line', 7983
__ARG_1.'say'(".HLL 'parrot'")
__label_1: # endif
# }
.annotate 'line', 7984

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 7895
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7897
addattribute $P0, 'parent'
.annotate 'line', 7898
addattribute $P0, 'start'
.annotate 'line', 7899
addattribute $P0, 'name'
.annotate 'line', 7900
addattribute $P0, 'modifier'
.annotate 'line', 7901
addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'init' :method :vtable

.annotate 'line', 7998
# Body
# {
.annotate 'line', 8000
root_new $P2, ['parrot';'Hash']
setattribute self, 'predefs_used', $P2
box $P1, 0
.annotate 'line', 8001
setattribute self, 'subidgen', $P1
# }
.annotate 'line', 8002

.end # init


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8003
# Body
# {
.annotate 'line', 8005
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8006
$P1[__ARG_1] = 1
# }
.annotate 'line', 8007

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8008
# Body
# {
.annotate 'line', 8010
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8011
$P2 = $P1[__ARG_1]
unless_null $P2, __label_1
null $I1
goto __label_0
__label_1:
set $I1, 1
__label_0:
.return($I1)
# }
.annotate 'line', 8012

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8014
# Body
# {
.annotate 'line', 8016
# var subidgen: $P1
getattribute $P1, self, 'subidgen'
.annotate 'line', 8017
# int idgen: $I1
set $P2, $P1
set $I1, $P2
.annotate 'line', 8018
inc $I1
assign $P1, $I1
.annotate 'line', 8020
# string id: $S1
# predefined string
set $S2, $I1
concat $S1, 'WSubId_', $S2
.annotate 'line', 8021
.return($S1)
# }
.annotate 'line', 8022

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8024
# Body
# {
.annotate 'line', 8026
# var libs: $P1
getattribute $P1, self, 'libs'
.annotate 'line', 8027
unless_null $P1, __label_0
# {
.annotate 'line', 8028
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8029
setattribute self, 'libs', $P1
# }
__label_0: # endif
.annotate 'line', 8031
$P1[__ARG_1] = 1
# }
.annotate 'line', 8032

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8033
# Body
# {
.annotate 'line', 8035
# var loads: $P1
getattribute $P1, self, 'loads'
.annotate 'line', 8036
unless_null $P1, __label_0
# {
.annotate 'line', 8037
root_new $P1, ['parrot';'Hash']
.annotate 'line', 8038
setattribute self, 'loads', $P1
# }
__label_0: # endif
.annotate 'line', 8040
$P1[__ARG_1] = 1
# }
.annotate 'line', 8041

.end # addload


.sub 'getpath' :method

.annotate 'line', 8042
# Body
# {
.annotate 'line', 8044
# string path: $P1
root_new $P1, ['parrot'; 'ResizableStringArray']
.annotate 'line', 8045
.return($P1)
# }
.annotate 'line', 8046

.end # getpath


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8047
# Body
# {
.annotate 'line', 8049
.tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8050

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8051
# Body
# {
.annotate 'line', 8054
.tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8055

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8056
# Body
# {
# }
.annotate 'line', 8059

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8060
# Body
# {
.annotate 'line', 8062
'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8063

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8064
# Body
# {
.annotate 'line', 8066
self.'optimize_base'()
.annotate 'line', 8067
.return(self)
# }
.annotate 'line', 8068

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8069
# Body
# {
.annotate 'line', 8071
# var predefs_used: $P1
getattribute $P1, self, 'predefs_used'
.annotate 'line', 8074
$P5 = $P1['chomp']
if_null $P5, __label_0
.annotate 'line', 8075
self.'addload'('"String/Utils.pbc"')
__label_0: # endif
.annotate 'line', 8078
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
.annotate 'line', 8081
iter $P6, $P2
set $P6, 0
__label_1: # for iteration
unless $P6 goto __label_2
shift $S1, $P6
.annotate 'line', 8082
$P5 = $P1[$S1]
if_null $P5, __label_3
# {
.annotate 'line', 8083
self.'addlib'("'trans_ops'")
goto __label_2 # break
.annotate 'line', 8084
# }
__label_3: # endif
goto __label_1
__label_2: # endfor
.annotate 'line', 8087
# int somelib: $I1
null $I1
.annotate 'line', 8088
# var libs: $P3
getattribute $P3, self, 'libs'
.annotate 'line', 8089
if_null $P3, __label_4
# {
set $I1, 1
.annotate 'line', 8091
iter $P7, $P3
set $P7, 0
__label_5: # for iteration
unless $P7 goto __label_6
shift $S2, $P7
.annotate 'line', 8092
__ARG_1.'say'('.loadlib ', $S2)
goto __label_5
__label_6: # endfor
# }
__label_4: # endif
.annotate 'line', 8095
# int someload: $I2
null $I2
.annotate 'line', 8096
# var loads: $P4
getattribute $P4, self, 'loads'
.annotate 'line', 8097
if_null $P4, __label_7
# {
set $I2, 1
.annotate 'line', 8099
__ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8100
iter $P8, $P4
set $P8, 0
__label_8: # for iteration
unless $P8 goto __label_9
shift $S3, $P8
.annotate 'line', 8101
__ARG_1.'say'('    load_bytecode ', $S3)
goto __label_8
__label_9: # endfor
.annotate 'line', 8102
__ARG_1.'print'(".end\n\n")
# }
__label_7: # endif
set $I4, $I1
set $I5, $I2
.annotate 'line', 8104
or $I3, $I4, $I5
unless $I3 goto __label_10
.annotate 'line', 8105
__ARG_1.'comment'('end libs')
__label_10: # endif
.annotate 'line', 8107
self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8108

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 7991
get_class $P1, [ 'NamespaceBase' ]
addparent $P0, $P1
.annotate 'line', 7993
addattribute $P0, 'predefs_used'
.annotate 'line', 7994
addattribute $P0, 'libs'
.annotate 'line', 7995
addattribute $P0, 'loads'
.annotate 'line', 7996
addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompiler' ]

.sub 'init' :method :vtable

.annotate 'line', 8120
# Body
# {
.annotate 'line', 8122
# var rootns: $P1
new $P1, [ 'RootNamespace' ]
.annotate 'line', 8125
# var taux: $P2
new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8129
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8128
$P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8127
$P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8133
new $P5, [ 'TokenInteger' ]
getattribute $P6, $P2, 'file'
getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
set $P4, $P5
.annotate 'line', 8132
$P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8131
$P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8139
new $P9, [ 'StringLiteral' ]
.annotate 'line', 8140
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
.annotate 'line', 8138
$P1.'createconst'('__STAGE__', 'S', $P8, '')
.annotate 'line', 8143
setattribute self, 'rootns', $P1
# }
.annotate 'line', 8144

.end # init


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8145
# Body
# {
.annotate 'line', 8147
getattribute $P1, self, 'rootns'
$P1.'parse'(__ARG_1)
# }
.annotate 'line', 8148

.end # parse


.sub 'optimize' :method

.annotate 'line', 8149
# Body
# {
.annotate 'line', 8151
getattribute $P3, self, 'rootns'
$P2 = $P3.'optimize'()
setattribute self, 'rootns', $P2
# }
.annotate 'line', 8152

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8153
# Body
# {
.annotate 'line', 8155
__ARG_1.'comment'('Begin generated code')
.annotate 'line', 8156
__ARG_1.'say'('')
.annotate 'line', 8158
getattribute $P1, self, 'rootns'
$P1.'emit'(__ARG_1)
.annotate 'line', 8160
__ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8161

.end # emit

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedCompiler' ]
.annotate 'line', 8119
addattribute $P0, 'rootns'
.end
.namespace [ 'WinxedHLL' ]

.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')

.annotate 'line', 8168
# Body
# {
.annotate 'line', 8170
unless_null __ARG_2, __label_0
set __ARG_2, ''
__label_0: # endif
.annotate 'line', 8172
# var handlein: $P1
new $P1, [ 'StringHandle' ]
.annotate 'line', 8173
$P1.'open'('__eval__', 'w')
.annotate 'line', 8174
$P1.'puts'(__ARG_1)
.annotate 'line', 8175
$P1.'close'()
.annotate 'line', 8176
$P1.'open'('__eval__', 'r')
.annotate 'line', 8177
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 8178
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8179
$P3.'parse'($P2)
.annotate 'line', 8180
$P1.'close'()
.annotate 'line', 8181
$P3.'optimize'()
.annotate 'line', 8182
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8183
$P4.'open'('__eval__', 'w')
.annotate 'line', 8184
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8185
$P5.'initialize'($P4)
.annotate 'line', 8186
$P3.'emit'($P5)
.annotate 'line', 8187
$P5.'close'()
.annotate 'line', 8188
$P4.'close'()
.annotate 'line', 8189
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_1
set $S1, $P8
__label_1:
.annotate 'line', 8190
# var object: $P6
null $P6
set $S2, __ARG_2
set $S3, 'pir'
.annotate 'line', 8191
if $S2 == $S3 goto __label_4
set $S3, 'pbc'
if $S2 == $S3 goto __label_5
set $S3, ''
if $S2 == $S3 goto __label_6
goto __label_3
# switch
__label_4: # case
.annotate 'line', 8193
new $P6, [ 'String' ]
assign $P6, $S1
goto __label_2 # break
__label_5: # case
__label_6: # case
.annotate 'line', 8198
# var pircomp: $P7
# predefined compreg
compreg $P7, 'PIR'
.annotate 'line', 8199
$P6 = $P7($S1)
goto __label_2 # break
__label_3: # default
.annotate 'line', 8200
# predefined die
.annotate 'line', 8202
die 'Invalid target'
__label_2: # switch end
.annotate 'line', 8204
.return($P6)
# }
.annotate 'line', 8205

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 8206
# Body
# {
.annotate 'line', 8208
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8209
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8210
$P1.'encoding'('utf8')
.annotate 'line', 8211
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8212
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8213
$P3.'parse'($P2)
.annotate 'line', 8214
$P1.'close'()
.annotate 'line', 8215
$P3.'optimize'()
.annotate 'line', 8216
# var emit: $P4
new $P4, [ 'Emit' ]
.annotate 'line', 8217
$P4.'initialize'(__ARG_2)
.annotate 'line', 8218
$P3.'emit'($P4)
.annotate 'line', 8219
$P4.'close'()
# }
.annotate 'line', 8220

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1

.annotate 'line', 8221
# Body
# {
.annotate 'line', 8223
# var handlein: $P1
new $P1, [ 'FileHandle' ]
.annotate 'line', 8224
$P1.'open'(__ARG_1, 'r')
.annotate 'line', 8225
$P1.'encoding'('utf8')
.annotate 'line', 8226
# var tk: $P2
new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 8227
# var winxed: $P3
new $P3, [ 'WinxedCompiler' ]
.annotate 'line', 8228
$P3.'parse'($P2)
.annotate 'line', 8229
$P1.'close'()
.annotate 'line', 8230
$P3.'optimize'()
.annotate 'line', 8231
# var handleout: $P4
new $P4, [ 'StringHandle' ]
.annotate 'line', 8232
$P4.'open'('__eval__', 'w')
.annotate 'line', 8233
# var emit: $P5
new $P5, [ 'Emit' ]
.annotate 'line', 8234
$P5.'initialize'($P4)
.annotate 'line', 8235
$P3.'emit'($P5)
.annotate 'line', 8236
$P5.'close'()
.annotate 'line', 8237
$P4.'close'()
.annotate 'line', 8238
# string pircode: $S1
$P8 = $P4.'read'(0)
null $S1
if_null $P8, __label_0
set $S1, $P8
__label_0:
.annotate 'line', 8239
# var pircomp: $P6
# predefined compreg
compreg $P6, 'PIR'
.annotate 'line', 8240
# var object: $P7
$P7 = $P6($S1)
.annotate 'line', 8241
.return($P7)
# }
.annotate 'line', 8242

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 8247
# Body
# {
.annotate 'line', 8249
# var winxed: $P1
new $P1, [ 'WinxedCompiler' ]
.annotate 'line', 8250
$P1.'parse'(__ARG_1)
.annotate 'line', 8252
$P1.'optimize'()
.annotate 'line', 8254
# var handle: $P2
null $P2
.annotate 'line', 8255
ne __ARG_2, '-', __label_0
.annotate 'line', 8256
# pirop getstdout
getstdout $P2
goto __label_1
__label_0: # else
.annotate 'line', 8258
# predefined open
root_new $P2, ['parrot';'FileHandle']
$P2.'open'(__ARG_2,'w')
__label_1: # endif
.annotate 'line', 8259
# var emit: $P3
new $P3, [ 'Emit' ]
.annotate 'line', 8260
$P3.'initialize'($P2)
.annotate 'line', 8261
$P1.'emit'($P3)
.annotate 'line', 8262
$P3.'close'()
.annotate 'line', 8263
$P2.'close'()
# }
.annotate 'line', 8264

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 8270
# Body
# {
.annotate 'line', 8272
# var comp: $P1
new $P1, [ 'WinxedHLL' ]
.annotate 'line', 8273
# predefined compreg
compreg 'winxed', $P1
# }
.annotate 'line', 8274

.end # initializer


.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 8276
# Body
# {
.annotate 'line', 8278
load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 8279
# var getopts: $P1
new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 8280
$P1.'notOptStop'(1)
.annotate 'line', 8281
$P1.'push_string'('o=s')
.annotate 'line', 8282
$P1.'push_string'('e=s')
.annotate 'line', 8283
$P1.'push_string'('c')
.annotate 'line', 8284
$P1.'push_string'('noan')
.annotate 'line', 8286
__ARG_1.'shift'()
.annotate 'line', 8287
# var opts: $P2
$P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 8288
# var opt_o: $P3
$P3 = $P2['o']
.annotate 'line', 8289
# var opt_e: $P4
$P4 = $P2['e']
.annotate 'line', 8290
# var opt_c: $P5
$P5 = $P2['c']
.annotate 'line', 8291
# var noan: $P6
$P6 = $P2['noan']
.annotate 'line', 8293
# int argc: $I1
set $P9, __ARG_1
set $I1, $P9
.annotate 'line', 8294
# string filename: $S1
null $S1
.annotate 'line', 8295
# string expr: $S2
null $S2
.annotate 'line', 8296
# var file: $P7
null $P7
.annotate 'line', 8297
unless_null $P4, __label_0
# {
.annotate 'line', 8298
ne $I1, 0, __label_2
# predefined Error
.annotate 'line', 8299
root_new $P9, ['parrot';'Exception']
$P9['message'] = 'No file'
throw $P9
__label_2: # endif
.annotate 'line', 8301
$S1 = __ARG_1[0]
.annotate 'line', 8302
# predefined open
root_new $P7, ['parrot';'FileHandle']
$P7.'open'($S1)
.annotate 'line', 8303
$P7.'encoding'('utf8')
# }
goto __label_1
__label_0: # else
# {
set $S2, $P4
concat $S0, 'function main[main](argv){', $S2
concat $S0, $S0, ';}'
set $S2, $S0
.annotate 'line', 8308
new $P7, [ 'StringHandle' ]
.annotate 'line', 8309
$P7.'open'('__eval__', 'w')
.annotate 'line', 8310
$P7.'puts'($S2)
.annotate 'line', 8311
$P7.'close'()
.annotate 'line', 8312
$P7.'open'('__eval__')
# }
__label_1: # endif
.annotate 'line', 8315
# var t: $P8
new $P8, [ 'Tokenizer' ]
$P8.'Tokenizer'($P7, $S1)
.annotate 'line', 8317
# string outputfile: $S3
set $S3, ''
.annotate 'line', 8318
if_null $P3, __label_3
set $S3, $P3
__label_3: # endif
.annotate 'line', 8320
'winxed_parser'($P8, $S3)
.annotate 'line', 8322
$P7.'close'()
# }
.annotate 'line', 8323

.end # stage1


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 8325
# Body
# {
.annotate 'line', 8327
# int retval: $I1
null $I1
.annotate 'line', 8328
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_0
$P6.'min_severity'(2)
$P6.'max_severity'(2)
$P6.'handle_types'(555, 556, 557)
push_eh $P6
# try: begin
.annotate 'line', 8334
'stage1'(__ARG_1)
# try: end
pop_eh
goto __label_1
.annotate 'line', 8328
# catch
__label_0:
.get_results($P1)
finalize $P1
pop_eh
# {
.annotate 'line', 8337
# string msg: $S1
$S1 = $P1['message']
.annotate 'line', 8338
# predefined say
print 'Error: '
say $S1
.annotate 'line', 8339
# var bt: $P2
$P2 = $P1.'backtrace'()
.annotate 'line', 8340
# int i: $I2
set $I2, 1
.annotate 'line', 8341
iter $P7, $P2
set $P7, 0
__label_2: # for iteration
unless $P7 goto __label_3
shift $P3, $P7
# {
.annotate 'line', 8342
# var sub: $P4
$P4 = $P3['sub']
.annotate 'line', 8343
# string subname: $S2
null $S2
.annotate 'line', 8344
if_null $P4, __label_4
# {
set $S2, $P4
.annotate 'line', 8346
# string ns: $S3
$P6 = $P4.'get_namespace'()
null $S3
if_null $P6, __label_5
set $S3, $P6
__label_5:
.annotate 'line', 8347
isne $I4, $S3, ''
unless $I4 goto __label_7
isne $I4, $S3, 'parrot'
__label_7:
unless $I4 goto __label_6
concat $S0, $S3, '.'
concat $S0, $S0, $S2
set $S2, $S0
__label_6: # endif
# }
__label_4: # endif
.annotate 'line', 8349
# var ann: $P5
$P5 = $P3['annotations']
.annotate 'line', 8350
# string file: $S4
$S4 = $P5['file']
.annotate 'line', 8351
eq $S4, '', __label_8
# {
.annotate 'line', 8352
# int line: $I3
$I3 = $P5['line']
set $I5, $I2
.annotate 'line', 8353
inc $I2
mul $I4, 2, $I5
repeat $S5, ' ', $I4
# predefined say
print $S5
print "at "
print $S2
print " in '"
print $S4
print "' line "
say $I3
# }
__label_8: # endif
# }
goto __label_2
__label_3: # endfor
set $I1, 1
.annotate 'line', 8356
# }
# catch end
__label_1:
.annotate 'line', 8358
# predefined exit
exit $I1
# }
.annotate 'line', 8359

.end # main

# End generated code
