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
# i: $I1
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
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
 __label_0: # endif
.annotate 'line', 73
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = __ARG_1
    $P1['severity'] = 2
    $P1['type'] = 555
    throw $P1
# }
.annotate 'line', 74

.end # InternalError


.sub 'TokenError'
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 76
# Body
# {
.annotate 'line', 78
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 556
    throw $P1
# }
.annotate 'line', 80

.end # TokenError


.sub 'SyntaxError'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 82
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 87
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' near '
    concat $S4, $S4, $S3
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 557
    throw $P1
# }
.annotate 'line', 89

.end # SyntaxError


.sub 'Expected'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 91
# Body
# {
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'ExpectedIdentifier'
.param pmc __ARG_1

.annotate 'line', 96
# Body
# {
.annotate 'line', 98
    'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 99

.end # ExpectedIdentifier


.sub 'ExpectedOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 101
# Body
# {
.annotate 'line', 103
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 104

.end # ExpectedOp


.sub 'RequireOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 106
# Body
# {
.annotate 'line', 108
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 109
    'ExpectedOp'(__ARG_1, __ARG_2)
 __label_0: # endif
# }
.annotate 'line', 110

.end # RequireOp


.sub 'RequireKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 112
# Body
# {
.annotate 'line', 114
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 115
    'ExpectedOp'(__ARG_1, __ARG_2)
 __label_0: # endif
# }
.annotate 'line', 116

.end # RequireKeyword


.sub 'RequireIdentifier'
.param pmc __ARG_1

.annotate 'line', 118
# Body
# {
.annotate 'line', 120
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 121
    'ExpectedIdentifier'(__ARG_1)
 __label_0: # endif
# }
.annotate 'line', 122

.end # RequireIdentifier


.sub 'ExpectOp'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 124
# Body
# {
.annotate 'line', 126
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 127
    'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 128

.end # ExpectOp


.sub 'ExpectKeyword'
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 130
# Body
# {
.annotate 'line', 132
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 133
    'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 134

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 144
# Body
# {
.annotate 'line', 146
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 147
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 148

.end # Token


.sub 'get_bool' :method :vtable

.annotate 'line', 149
# Body
# {
.annotate 'line', 151
    .return(1)
# }
.annotate 'line', 152

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 153
# Body
# {
.annotate 'line', 155
    .return(1)
# }
.annotate 'line', 156

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 158
# Body
# {
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method

.annotate 'line', 159
# Body
# {
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method

.annotate 'line', 160
# Body
# {
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method

.annotate 'line', 161
# Body
# {
    .return(0)
# }

.end # isint


.sub 'isfloat' :method

.annotate 'line', 162
# Body
# {
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method

.annotate 'line', 163
# Body
# {
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 165
# Body
# {
.annotate 'line', 167
    'InternalError'('Not a literal string', self)
# }
.annotate 'line', 168

.end # rawstring


.sub 'getidentifier' :method

.annotate 'line', 169
# Body
# {
.annotate 'line', 171
    'ExpectedIdentifier'(self)
# }
.annotate 'line', 172

.end # getidentifier


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 173
# Body
# {
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method

.annotate 'line', 174
# Body
# {
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 175
# Body
# {
    .return(0)
# }

.end # isop


.sub 'checkop' :method

.annotate 'line', 176
# Body
# {
    .return('')
# }

.end # checkop


.sub 'viewable' :method

.annotate 'line', 177
# Body
# {
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method

.annotate 'line', 178
# Body
# {
.annotate 'line', 180
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 181
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
.annotate 'line', 182

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 142
    addattribute $P0, 'file'
.annotate 'line', 143
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
.param string __ARG_1

.annotate 'line', 187
# Body
# {
.annotate 'line', 189
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 190

.end # TokenEof


.sub 'get_bool' :method :vtable

.annotate 'line', 191
# Body
# {
.annotate 'line', 193
    .return(0)
# }
.annotate 'line', 194

.end # get_bool


.sub 'get_integer' :method :vtable

.annotate 'line', 195
# Body
# {
.annotate 'line', 197
    .return(0)
# }
.annotate 'line', 198

.end # get_integer


.sub 'iseof' :method

.annotate 'line', 199
# Body
# {
    .return(1)
# }

.end # iseof


.sub 'viewable' :method

.annotate 'line', 200
# Body
# {
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 185
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 206
# Body
# {
.annotate 'line', 208
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 209
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 210

.end # TokenWithVal


.sub 'get_string' :method :vtable

.annotate 'line', 211
# Body
# {
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method

.annotate 'line', 212
# Body
# {
.annotate 'line', 214
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 215

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 203
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 205
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 220
# Body
# {
.annotate 'line', 222
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 223

.end # TokenComment


.sub 'iscomment' :method

.annotate 'line', 224
# Body
# {
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 218
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 229
# Body
# {
.annotate 'line', 231
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 232

.end # TokenOp


.sub 'isop' :method
.param string __ARG_1

.annotate 'line', 233
# Body
# {
.annotate 'line', 235
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 236

.end # isop


.sub 'checkop' :method

.annotate 'line', 237
# Body
# {
# predefined string
.annotate 'line', 239
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 240

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 227
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 245
# Body
# {
.annotate 'line', 247
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenIdentifier


.sub 'isidentifier' :method

.annotate 'line', 249
# Body
# {
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method

.annotate 'line', 250
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 253

.end # getidentifier


.sub 'checkkeyword' :method

.annotate 'line', 254
# Body
# {
# predefined string
.annotate 'line', 256
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 257

.end # checkkeyword


.sub 'iskeyword' :method
.param string __ARG_1

.annotate 'line', 258
# Body
# {
.annotate 'line', 260
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 261

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 243
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method

.annotate 'line', 266
# Body
# {
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method

.annotate 'line', 267
# Body
# {
.annotate 'line', 269
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 270

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 264
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 275
# Body
# {
.annotate 'line', 277
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 278

.end # TokenQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 279
# Body
# {
# predefined string
.annotate 'line', 281
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 282

.end # get_string


.sub 'viewable' :method

.annotate 'line', 283
# Body
# {
# predefined string
.annotate 'line', 285
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 286

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 273
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 291
# Body
# {
.annotate 'line', 293
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 294

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable

.annotate 'line', 295
# Body
# {
# predefined string
.annotate 'line', 297
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 298

.end # get_string


.sub 'viewable' :method

.annotate 'line', 299
# Body
# {
# predefined string
.annotate 'line', 301
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 302

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 289
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 307
# Body
# {
.annotate 'line', 309
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 310

.end # TokenInteger


.sub 'isint' :method

.annotate 'line', 311
# Body
# {
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 305
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
.param string __ARG_1
.param int __ARG_2
.param string __ARG_3

.annotate 'line', 316
# Body
# {
.annotate 'line', 318
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 319

.end # TokenFloat


.sub 'isfloat' :method

.annotate 'line', 320
# Body
# {
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 314
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 328
# Body
# {
.annotate 'line', 330
# s: $S1
    set $S1, ''
.annotate 'line', 331
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 332
    eq $S2, '"', __label_1
# {
.annotate 'line', 333
    iseq $I1, $S2, ''
    if $I1 goto __label_4
    iseq $I1, $S2, "\n"
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 334
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_3: # endif
.annotate 'line', 336
    ne $S2, '\', __label_5
# {
.annotate 'line', 337
# c2: $S3
    $P1 = __ARG_1.'getchar'()
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 338
    iseq $I1, $S3, ''
    if $I1 goto __label_9
    iseq $I1, $S3, "\n"
 __label_9:
    unless $I1 goto __label_8
.annotate 'line', 339
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_8: # endif
.annotate 'line', 340
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 343
    concat $S1, $S1, $S2
 __label_6: # endif
.annotate 'line', 344
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 346
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 347

.end # getquoted


.sub 'getsinglequoted'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 349
# Body
# {
.annotate 'line', 351
# s: $S1
    set $S1, ''
.annotate 'line', 352
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 353
    eq $S2, "'", __label_1
# {
.annotate 'line', 354
    iseq $I1, $S2, ''
    if $I1 goto __label_4
    iseq $I1, $S2, "\n"
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 355
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_3: # endif
.annotate 'line', 356
    concat $S1, $S1, $S2
.annotate 'line', 357
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 359
    new $P2, [ 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 360

.end # getsinglequoted


.sub 'getheredoc'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 362
# Body
# {
.annotate 'line', 364
# mark: $S1
    set $S1, ''
.annotate 'line', 365
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 366
    isne $I1, $S2, "\n"
    unless $I1 goto __label_3
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 369
    iseq $I2, $S2, '"'
    if $I2 goto __label_5
    iseq $I2, $S2, '\'
 __label_5:
    unless $I2 goto __label_4
.annotate 'line', 370
    concat $S0, '\', $S2
    set $S2, $S0
 __label_4: # endif
.annotate 'line', 371
    concat $S0, $S1, $S2
    set $S1, $S0
.annotate 'line', 372
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 374
    ne $S2, '', __label_6
.annotate 'line', 375
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_6: # endif
.annotate 'line', 376
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 378
# content: $S3
    set $S3, ''
.annotate 'line', 379
# line: $S4
    null $S4
 __label_7: # do
.annotate 'line', 380
# {
.annotate 'line', 381
    set $S4, ''
.annotate 'line', 382
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_11: # while
.annotate 'line', 383
    isne $I1, $S2, "\n"
    unless $I1 goto __label_12
    isne $I1, $S2, ''
 __label_12:
    unless $I1 goto __label_10
# {
.annotate 'line', 384
    iseq $I2, $S2, '"'
    if $I2 goto __label_14
    iseq $I2, $S2, '\'
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 385
    concat $S0, '\', $S2
    set $S2, $S0
 __label_13: # endif
.annotate 'line', 386
    concat $S4, $S4, $S2
.annotate 'line', 387
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_11
 __label_10: # endwhile
.annotate 'line', 389
    ne $S2, '', __label_15
.annotate 'line', 390
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_15: # endif
.annotate 'line', 391
    eq $S4, $S1, __label_16
.annotate 'line', 392
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
 __label_16: # endif
# }
 __label_9: # continue
.annotate 'line', 393
    ne $S4, $S1, __label_7
 __label_8: # enddo
.annotate 'line', 394
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 395

.end # getheredoc


.sub 'getident'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 397
# Body
# {
.annotate 'line', 399
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 400
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 401
    $P1 = 'isident'($S2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 402
    concat $S1, $S1, $S2
.annotate 'line', 403
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 405
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 406
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 407

.end # getident


.sub 'getnumber'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 409
# Body
# {
.annotate 'line', 411
# s: $S1
    null $S1
.annotate 'line', 412
# c: $S2
    set $S2, __ARG_2
 __label_0: # do
.annotate 'line', 413
# {
.annotate 'line', 414
    concat $S1, $S1, $S2
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_2: # continue
.annotate 'line', 416
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_1
    if $P1 goto __label_0
 __label_1: # enddo
.annotate 'line', 417
    iseq $I3, $S1, '0'
    unless $I3 goto __label_4
    iseq $I3, $S2, 'x'
    if $I3 goto __label_5
    iseq $I3, $S2, 'X'
 __label_5:
 __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 418
# hexval: $I1
    null $I1
# h: $I2
    null $I2
.annotate 'line', 419
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_7: # while
.annotate 'line', 420
    $P1 = 'hexdigit'($S2)
    set $I2, $P1
    lt $I2, 0, __label_6
# {
.annotate 'line', 421
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 422
    concat $S1, $S1, $S2
.annotate 'line', 423
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_7
 __label_6: # endwhile
.annotate 'line', 425
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 426
    set $S1, $I1
.annotate 'line', 427
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
 __label_3: # endif
.annotate 'line', 429
    ne $S2, '.', __label_8
# {
 __label_10: # do
.annotate 'line', 430
# {
.annotate 'line', 431
    concat $S1, $S1, $S2
.annotate 'line', 432
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_12: # continue
.annotate 'line', 433
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_11
    if $P1 goto __label_10
 __label_11: # enddo
.annotate 'line', 434
    iseq $I3, $S2, 'e'
    if $I3 goto __label_14
    iseq $I3, $S2, 'E'
 __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 435
    concat $S1, $S1, 'E'
.annotate 'line', 436
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_16
    iseq $I3, $S2, '-'
 __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 437
    concat $S1, $S1, $S2
.annotate 'line', 438
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_15: # endif
 __label_18: # while
.annotate 'line', 440
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_17
    unless $P1 goto __label_17
# {
.annotate 'line', 441
    concat $S1, $S1, $S2
.annotate 'line', 442
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_18
 __label_17: # endwhile
# }
 __label_13: # endif
.annotate 'line', 445
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 446
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 449
    iseq $I3, $S2, 'e'
    if $I3 goto __label_21
    iseq $I3, $S2, 'E'
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 450
    concat $S1, $S1, 'E'
.annotate 'line', 451
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_23
    iseq $I3, $S2, '-'
 __label_23:
    unless $I3 goto __label_22
# {
.annotate 'line', 452
    concat $S1, $S1, $S2
.annotate 'line', 453
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_22: # endif
 __label_25: # while
.annotate 'line', 455
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_24
    unless $P1 goto __label_24
# {
.annotate 'line', 456
    concat $S1, $S1, $S2
.annotate 'line', 457
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_25
 __label_24: # endwhile
.annotate 'line', 459
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 460
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 463
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 464
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
.annotate 'line', 467

.end # getnumber


.sub 'getlinecomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 469
# Body
# {
.annotate 'line', 471
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 472
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 473
    isne $I1, $S2, ''
    unless $I1 goto __label_3
    isne $I1, $S2, "\n"
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 474
    concat $S1, $S1, $S2
.annotate 'line', 475
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 477
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 478

.end # getlinecomment


.sub 'getcomment'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 480
# Body
# {
.annotate 'line', 482
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 483
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_1: # do
.annotate 'line', 484
# {
 __label_5: # while
.annotate 'line', 485
    isne $I1, $S2, ''
    unless $I1 goto __label_6
    isne $I1, $S2, '*'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 486
    concat $S1, $S1, $S2
.annotate 'line', 487
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_5
 __label_4: # endwhile
.annotate 'line', 489
    ne $S2, '', __label_7
.annotate 'line', 490
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_7: # endif
.annotate 'line', 491
    concat $S1, $S1, $S2
.annotate 'line', 492
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 493
    ne $S2, '', __label_8
.annotate 'line', 494
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_8: # endif
# }
 __label_3: # continue
.annotate 'line', 495
    ne $S2, '/', __label_1
 __label_2: # enddo
.annotate 'line', 496
    concat $S1, $S1, '/'
.annotate 'line', 497
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 498

.end # getcomment


.sub 'getop'
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3

.annotate 'line', 500
# Body
# {
.annotate 'line', 502
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 503
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
$P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 504

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 518
# Body
# {
.annotate 'line', 520
.const 'Sub' $P2 = 'getop'
.annotate 'line', 522
    setattribute self, 'h', __ARG_1
.annotate 'line', 523
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 524
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 525
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 526
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 527
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 528
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
$P3[''] = $P4
$P3['{'] = $P2
$P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
$P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
$P1["'"] = $P6
.annotate 'line', 531
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 532
    root_new $P8, ['parrot';'Hash']
$P8[''] = $P2
$P8['='] = $P2
$P7['='] = $P8
$P7[':'] = $P2
$P1['='] = $P7
.annotate 'line', 535
    root_new $P9, ['parrot';'Hash']
$P9['+'] = $P2
$P9['='] = $P2
$P1['+'] = $P9
.annotate 'line', 536
    root_new $P10, ['parrot';'Hash']
$P10['-'] = $P2
$P10['='] = $P2
$P1['-'] = $P10
.annotate 'line', 537
    root_new $P11, ['parrot';'Hash']
$P11['='] = $P2
$P1['*'] = $P11
.annotate 'line', 538
    root_new $P12, ['parrot';'Hash']
$P12['|'] = $P2
$P1['|'] = $P12
.annotate 'line', 539
    root_new $P13, ['parrot';'Hash']
$P13['&'] = $P2
$P1['&'] = $P13
.annotate 'line', 540
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 541
    root_new $P15, ['parrot';'Hash']
$P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
$P15[':'] = $P16
$P14['<'] = $P15
$P14['='] = $P2
$P1['<'] = $P14
.annotate 'line', 544
    root_new $P17, ['parrot';'Hash']
$P17['>'] = $P2
$P17['='] = $P2
$P1['>'] = $P17
.annotate 'line', 545
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 546
    root_new $P19, ['parrot';'Hash']
$P19[''] = $P2
$P19['='] = $P2
$P18['='] = $P19
$P1['!'] = $P18
.annotate 'line', 548
    root_new $P20, ['parrot';'Hash']
$P20['%'] = $P2
$P20['='] = $P2
$P1['%'] = $P20
.annotate 'line', 549
    root_new $P21, ['parrot';'Hash']
$P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
$P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
$P21['*'] = $P23
$P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
$P1['#'] = $P24
.annotate 'line', 552
    setattribute self, 'select', $P1
# }
.annotate 'line', 553

.end # Tokenizer


.sub 'getchar' :method

.annotate 'line', 554
# Body
# {
.annotate 'line', 556
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 557
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 558
    eq $S1, '', __label_1
.annotate 'line', 559
    assign $P1, ''
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 561
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 562
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 563
    ne $S1, "\n", __label_3
# {
.annotate 'line', 564
# l: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 565
    inc $I1
.annotate 'line', 566
    box $P3, $I1
    setattribute self, 'line', $P3
# }
 __label_3: # endif
# }
 __label_2: # endif
.annotate 'line', 569
    .return($S1)
# }
.annotate 'line', 570

.end # getchar


.sub 'ungetchar' :method
.param string __ARG_1

.annotate 'line', 571
# Body
# {
.annotate 'line', 573
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 574

.end # ungetchar


.sub 'get_token' :method

.annotate 'line', 575
# Body
# {
.annotate 'line', 577
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 578
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 579
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 580
.const 'Sub' $P7 = 'getop'
.annotate 'line', 581
.const 'Sub' $P8 = 'getident'
.annotate 'line', 582
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 584
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 585
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 586
    .return($P1)
# }
 __label_0: # endif
.annotate 'line', 588
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
 __label_1:
 __label_3: # while
.annotate 'line', 589
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 590
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
 __label_2: # endwhile
.annotate 'line', 591
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 592
    ne $S1, '', __label_4
.annotate 'line', 593
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
$P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
 __label_4: # endif
.annotate 'line', 594
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 595
    .tailcall $P8(self, $S1, $I1)
 __label_5: # endif
.annotate 'line', 596
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 597
    .tailcall $P9(self, $S1, $I1)
 __label_6: # endif
.annotate 'line', 599
# op: $S2
    set $S2, $S1
.annotate 'line', 600
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 601
# var current: $P3
    $P3 = $P2[$S1]
 __label_8: # while
.annotate 'line', 603
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 604
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 605
    set $P2, $P3
.annotate 'line', 606
    $P3 = $P2[$S1]
.annotate 'line', 607
    unless_null $P3, __label_10
# {
.annotate 'line', 608
    self.'ungetchar'($S1)
.annotate 'line', 609
    $P3 = $P2['']
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 612
    concat $S2, $S2, $S1
 __label_11: # endif
# }
    goto __label_8
 __label_7: # endwhile
.annotate 'line', 614
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 615
    .tailcall $P3(self, $S2, $I1)
 __label_12: # endif
.annotate 'line', 616
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 617

.end # get_token


.sub 'get' :method
.param int __ARG_1 :optional

.annotate 'line', 618
# Body
# {
.annotate 'line', 620
# var t: $P1
    $P1 = self.'get_token'()
 __label_1: # while
.annotate 'line', 621
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
 __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 622
    $P1 = self.'get_token'()
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 623
    .return($P1)
# }
.annotate 'line', 624

.end # get


.sub 'unget' :method
.param pmc __ARG_1

.annotate 'line', 625
# Body
# {
.annotate 'line', 627
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 628

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 512
    addattribute $P0, 'h'
.annotate 'line', 513
    addattribute $P0, 'pending'
.annotate 'line', 514
    addattribute $P0, 'select'
.annotate 'line', 515
    addattribute $P0, 'stacked'
.annotate 'line', 516
    addattribute $P0, 'filename'
.annotate 'line', 517
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

.annotate 'line', 647
# Body
# {
.annotate 'line', 649
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
.annotate 'line', 650
    .return('I')
 __label_3: # case
.annotate 'line', 651
    .return('N')
 __label_4: # case
.annotate 'line', 652
    .return('S')
 __label_5: # case
.annotate 'line', 653
    .return('P')
 __label_1: # default
.annotate 'line', 654
    .return('')
 __label_0: # switch end
# }
.annotate 'line', 656

.end # typetoregcheck


.sub 'typetopirname'
.param string __ARG_1

.annotate 'line', 658
# Body
# {
.annotate 'line', 660
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
.annotate 'line', 661
    .return('int')
 __label_3: # case
.annotate 'line', 662
    .return('num')
 __label_4: # case
.annotate 'line', 663
    .return('string')
 __label_5: # case
.annotate 'line', 664
    .return('pmc')
 __label_1: # default
.annotate 'line', 665
    'InternalError'('Invalid reg type')
 __label_0: # switch end
# }
.annotate 'line', 667

.end # typetopirname

# Constant indent evaluated at compile time
.namespace [ 'Emit' ]

.sub 'initialize' :method
.param pmc __ARG_1

.annotate 'line', 684
# Body
# {
.annotate 'line', 686
    setattribute self, 'handle', __ARG_1
.annotate 'line', 687
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 688
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 689
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 690
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 691

.end # initialize


.sub 'disable_annotations' :method

.annotate 'line', 692
# Body
# {
.annotate 'line', 694
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 695

.end # disable_annotations


.sub 'close' :method

.annotate 'line', 696
# Body
# {
.annotate 'line', 698
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 699

.end # close


.sub 'updateannot' :method

.annotate 'line', 700
# Body
# {
.annotate 'line', 702
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 703
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 705
    getattribute $P5, self, 'file'
.annotate 'line', 703
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 708
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
 __label_0: # endif
.annotate 'line', 710
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 711
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 713
    getattribute $P5, self, 'line'
.annotate 'line', 711
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 716
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
 __label_1: # endif
# }
.annotate 'line', 718

.end # updateannot


.sub 'vprint' :method
.param pmc __ARG_1

.annotate 'line', 719
# Body
# {
.annotate 'line', 721
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 722
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 723

.end # vprint


.sub 'print' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 724
# Body
# {
.annotate 'line', 726
    self.'updateannot'()
.annotate 'line', 727
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 728

.end # print


.sub 'say' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 729
# Body
# {
.annotate 'line', 731
    self.'updateannot'()
.annotate 'line', 732
    self.'vprint'(__ARG_1)
.annotate 'line', 733
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 734

.end # say


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 735
# Body
# {
.annotate 'line', 737
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 739
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 740
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 741
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
 __label_1:
.annotate 'line', 742
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 743
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 744
    assign $P1, $S1
.annotate 'line', 745
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 746
    assign $P2, 0
# }
 __label_2: # endif
.annotate 'line', 748
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 749
    assign $P2, $I1
.annotate 'line', 750
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
 __label_3: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 753

.end # annotate


.sub 'comment' :method
.param string __ARG_1

.annotate 'line', 754
# Body
# {
.annotate 'line', 756
    self.'updateannot'()
.annotate 'line', 757
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 758

.end # comment


.sub 'emitlabel' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 759
# Body
# {
.annotate 'line', 761
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 762
    $P1.'print'(' ')
.annotate 'line', 763
    $P1.'print'(__ARG_1)
.annotate 'line', 764
    $P1.'print'(':')
.annotate 'line', 765
    if_null __ARG_2, __label_0
# {
.annotate 'line', 766
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
 __label_0: # endif
.annotate 'line', 768
    $P1.'print'("\n")
# }
.annotate 'line', 769

.end # emitlabel


.sub 'emitgoto' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 770
# Body
# {
.annotate 'line', 772
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 773
    $P1.'print'("    goto ")
.annotate 'line', 774
    $P1.'print'(__ARG_1)
.annotate 'line', 775
    if_null __ARG_2, __label_0
# {
.annotate 'line', 776
    $P1.'print'(' # ')
.annotate 'line', 777
    $P1.'print'(__ARG_2)
# }
 __label_0: # endif
.annotate 'line', 779
    $P1.'print'("\n")
# }
.annotate 'line', 780

.end # emitgoto


.sub 'emitif' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 782
# Body
# {
.annotate 'line', 784
    self.'say'("    if ", __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 785

.end # emitif


.sub 'emitunless' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 786
# Body
# {
.annotate 'line', 788
    self.'say'("    unless ", __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 789

.end # emitunless


.sub 'emitif_null' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 791
# Body
# {
.annotate 'line', 793
    self.'say'("    if_null ", __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 794

.end # emitif_null


.sub 'emitnull' :method
.param string __ARG_1

.annotate 'line', 795
# Body
# {
.annotate 'line', 797
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 798

.end # emitnull


.sub 'emitinc' :method
.param string __ARG_1

.annotate 'line', 799
# Body
# {
.annotate 'line', 801
    self.'say'("    inc ", __ARG_1)
# }
.annotate 'line', 802

.end # emitinc


.sub 'emitdec' :method
.param string __ARG_1

.annotate 'line', 804
# Body
# {
.annotate 'line', 806
    self.'say'("    dec ", __ARG_1)
# }
.annotate 'line', 807

.end # emitdec


.sub 'emitset' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 808
# Body
# {
.annotate 'line', 810
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 811

.end # emitset


.sub 'emitassign' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 812
# Body
# {
.annotate 'line', 814
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 815

.end # emitassign


.sub 'emitbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 816
# Body
# {
.annotate 'line', 818
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 819

.end # emitbox


.sub 'emitunbox' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 820
# Body
# {
.annotate 'line', 822
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 823

.end # emitunbox


.sub 'emitbinop' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 824
# Body
# {
.annotate 'line', 826
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 827

.end # emitbinop


.sub 'emitaddto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 828
# Body
# {
.annotate 'line', 830
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 831

.end # emitaddto


.sub 'emitsubto' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 832
# Body
# {
.annotate 'line', 834
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 835

.end # emitsubto


.sub 'emitadd' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 836
# Body
# {
.annotate 'line', 838
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 839

.end # emitadd


.sub 'emitmul' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 840
# Body
# {
.annotate 'line', 842
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 843

.end # emitmul


.sub 'emitconcat1' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 844
# Body
# {
.annotate 'line', 846
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 847

.end # emitconcat1


.sub 'emitconcat' :method
.param string __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 848
# Body
# {
.annotate 'line', 850
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 851

.end # emitconcat


.sub 'emitprint' :method
.param string __ARG_1

.annotate 'line', 852
# Body
# {
.annotate 'line', 854
    self.'say'("    print ", __ARG_1)
# }
.annotate 'line', 855

.end # emitprint


.sub 'emitsay' :method
.param string __ARG_1

.annotate 'line', 856
# Body
# {
.annotate 'line', 858
    self.'say'("    say ", __ARG_1)
# }
.annotate 'line', 859

.end # emitsay

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 677
    addattribute $P0, 'handle'
.annotate 'line', 678
    addattribute $P0, 'file'
.annotate 'line', 679
    addattribute $P0, 'line'
.annotate 'line', 680
    addattribute $P0, 'pendingf'
.annotate 'line', 681
    addattribute $P0, 'pendingl'
.annotate 'line', 682
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 866
# Body
# {
.annotate 'line', 868
    new $P2, [ 'IntegerLiteral' ]
$P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 869

.end # integerValue


.sub 'floatValue'
.param pmc __ARG_1
.param pmc __ARG_2
.param num __ARG_3

.annotate 'line', 871
# Body
# {
.annotate 'line', 873
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
$P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 874
    new $P3, [ 'FloatLiteral' ]
$P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 875

.end # floatValue


.sub 'floatresult'
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 877
# Body
# {
.annotate 'line', 883
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 884
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 885
    .return($I1)
# }
.annotate 'line', 886

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 907
# Body
# {
.annotate 'line', 909
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '{res}'
.annotate 'line', 910
    iseq $I2, __ARG_1, 'v'
    unless $I2 goto __label_1
    isne $I2, $I1, -1
 __label_1:
    unless $I2 goto __label_0
.annotate 'line', 911
    'InternalError'('void predef with {res}')
 __label_0: # endif
.annotate 'line', 912
    isne $I2, __ARG_1, 'v'
    unless $I2 goto __label_3
    iseq $I2, $I1, -1
 __label_3:
    unless $I2 goto __label_2
.annotate 'line', 913
    'InternalError'('non void predef without {res}')
 __label_2: # endif
.annotate 'line', 914
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 915
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 916

.end # Predef_frombody


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 917
# Body
# {
.annotate 'line', 919
# body: $S1
    getattribute $P1, self, 'body'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 920
# typeresult: $S2
    getattribute $P1, self, 'typeresult'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 922
# pos: $I1
    null $I1
.annotate 'line', 923
    ne $S2, 'v', __label_2
# {
.annotate 'line', 924
    isnull $I5, __ARG_3
    not $I5
    unless $I5 goto __label_5
    isne $I5, __ARG_3, ''
 __label_5:
    unless $I5 goto __label_4
.annotate 'line', 925
    'SyntaxError'('using return value from void predef')
 __label_4: # endif
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 928
    isnull $I5, __ARG_3
    if $I5 goto __label_7
    iseq $I5, __ARG_3, ''
 __label_7:
    unless $I5 goto __label_6
.annotate 'line', 929
    'InternalError'('Bad result in non void predef')
 __label_6: # endif
 __label_9: # while
.annotate 'line', 930
# predefined indexof
    index $I1, $S1, '{res}'
    eq $I1, -1, __label_8
.annotate 'line', 931
# predefined replace
    replace $S1, $S1, $I1, 5, __ARG_3
    goto __label_9
 __label_8: # endwhile
# }
 __label_3: # endif
.annotate 'line', 934
# n: $I2
    set $P1, __ARG_4
    set $I2, $P1
# for loop
.annotate 'line', 935
# i: $I3
    null $I3
 __label_12: # for condition
    ge $I3, $I2, __label_11
# {
.annotate 'line', 936
# argmark: $S3
    set $S6, $I3
    concat $S5, '{arg', $S6
    concat $S3, $S5, '}'
.annotate 'line', 937
# l: $I4
# predefined length
    length $I4, $S3
.annotate 'line', 938
# arg: $S4
    $S4 = __ARG_4[$I3]
 __label_14: # while
.annotate 'line', 939
# predefined indexof
    index $I1, $S1, $S3
    eq $I1, -1, __label_13
.annotate 'line', 940
# predefined replace
    replace $S1, $S1, $I1, $I4, $S4
    goto __label_14
 __label_13: # endwhile
# }
 __label_10: # for iteration
.annotate 'line', 935
    inc $I3
    goto __label_12
 __label_11: # for end
.annotate 'line', 942
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 943
# predefined split
    split $P1, "\n", $S1
# predefined join
    join $S5, "\n    ", $P1
    concat $S6, '    ', $S5
    __ARG_1.'say'($S6)
# }
.annotate 'line', 944

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 905
    addattribute $P0, 'body'
.annotate 'line', 906
    addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefBase' ]

.sub 'PredefBase' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4
.param string __ARG_5
.param string __ARG_6
.param string __ARG_7

.annotate 'line', 958
# Body
# {
.annotate 'line', 965
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 966
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 967
    new $P3, [ 'Predef_frombody' ]
$P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 969
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 970
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 971
# n: $I1
    null $I1
.annotate 'line', 972
    if_null __ARG_4, __label_2
# {
.annotate 'line', 973
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 974
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 976
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 979
    set $I1, -2
.annotate 'line', 980
    if_null __ARG_5, __label_7
.annotate 'line', 981
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 984
    set $I1, 1
.annotate 'line', 985
    if_null __ARG_5, __label_8
# {
.annotate 'line', 986
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 987
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 989
    if_null __ARG_6, __label_9
# {
.annotate 'line', 990
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 991
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 993
    if_null __ARG_7, __label_10
# {
.annotate 'line', 994
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 995
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 999
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1000

.end # PredefBase


.sub 'name' :method

.annotate 'line', 1001
# Body
# {
.annotate 'line', 1003
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1004
    .return($S1)
# }
.annotate 'line', 1005

.end # name


.sub 'result' :method

.annotate 'line', 1006
# Body
# {
.annotate 'line', 1008
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1009

.end # result


.sub 'params' :method

.annotate 'line', 1010
# Body
# {
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
.param int __ARG_1

.annotate 'line', 1011
# Body
# {
.annotate 'line', 1013
# type: $S1
    null $S1
.annotate 'line', 1014
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
.annotate 'line', 1015
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1016
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1017
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1018
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1020
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1022
    .return($S1)
# }
.annotate 'line', 1023

.end # paramtype


.sub 'expand' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 1024
# Body
# {
.annotate 'line', 1026
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1027
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1028
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1029
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1030
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1031
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1032

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 949
    addattribute $P0, 'name'
.annotate 'line', 950
    addattribute $P0, 'body'
.annotate 'line', 951
    addattribute $P0, 'typeresult'
.annotate 'line', 952
    addattribute $P0, 'type0'
.annotate 'line', 953
    addattribute $P0, 'type1'
.annotate 'line', 954
    addattribute $P0, 'type2'
.annotate 'line', 955
    addattribute $P0, 'type3'
.annotate 'line', 956
    addattribute $P0, 'nparams'
.end
.namespace [ 'PredefFunction' ]

.sub 'PredefFunction' :method
.param string __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param string __ARG_4 :optional
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional

.annotate 'line', 1037
# Body
# {
.annotate 'line', 1044
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1045

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1035
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
.param string __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param string __ARG_5 :optional
.param string __ARG_6 :optional
.param string __ARG_7 :optional
.param string __ARG_8 :optional

.annotate 'line', 1051
# Body
# {
.annotate 'line', 1058
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1059
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1060

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1048
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1050
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
.param string __ARG_1

.annotate 'line', 1066
# Body
# {
.annotate 'line', 1068
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1069

.end # Predef_typecast


.sub 'invoke' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 1070
# Body
# {
.annotate 'line', 1072
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1073
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1074
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1075
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1076
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1077
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, 'IndexExpr'
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1078
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1080
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1081
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1083
    ne $S3, 'null', __label_7
.annotate 'line', 1084
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1086
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1088

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1065
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1091
# Body
# {
.annotate 'line', 1093
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1094
# n: $I1
# predefined elements
    elements $I3, __ARG_4
sub $I1, $I3, 1
.annotate 'line', 1095
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1096
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1097
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1096
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1098
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1101
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1102

.end # Predef_say


.sub 'Predef_cry'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1104
# Body
# {
.annotate 'line', 1106
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1107
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1108
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1109
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1110
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1109
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1111
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1112

.end # Predef_cry


.sub 'Predef_print'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1114
# Body
# {
.annotate 'line', 1116
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1117
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1118
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1119
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1118
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1120

.end # Predef_print


.sub 'Predef_invoke'
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 1124
# Body
# {
.annotate 'line', 1126
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1127
    isa $I2, $P1, 'CallExpr'
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1128
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1129
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1130

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1132
# Body
# {
.annotate 'line', 1134
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1135
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1136
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1137

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1139
# Body
# {
.annotate 'line', 1141
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1142
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1143
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1144

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1146
# Body
# {
.annotate 'line', 1148
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1149
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1150
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1151

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1153
# Body
# {
.annotate 'line', 1155
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1156
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1157
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1158
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1159
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1160

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1162
# Body
# {
.annotate 'line', 1164
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1166
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1167
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1169
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
$P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1170
    new $P4, [ 'StringLiteral' ]
$P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1171

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1173
# Body
# {
.annotate 'line', 1175
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1176
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1177
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1178
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1180
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
$P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1181
    new $P5, [ 'StringLiteral' ]
$P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1182

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1184
# Body
# {
.annotate 'line', 1186
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1187
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1188
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1189
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1190
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1191
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1193
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
$P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1194
    new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1195

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1197
# Body
# {
.annotate 'line', 1199
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1200
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1201
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1202
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1203
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1204

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1206
# Body
# {
.annotate 'line', 1208
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1209
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1210
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1211
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1212
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1213
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1214
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1215

.end # predefeval_indexof_pos


.sub 'getpredefs'

.annotate 'line', 1217
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
.annotate 'line', 1228
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1229
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1230
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1231
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1233
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1234
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1235
    new $P19, [ 'Predef_typecast' ]
$P19.'Predef_typecast'('I')
    set $P18, $P19
$P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1233
    push $P1, $P16
.annotate 'line', 1238
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1239
    new $P23, [ 'Predef_typecast' ]
$P23.'Predef_typecast'('N')
    set $P22, $P23
$P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1233
    push $P1, $P20
.annotate 'line', 1242
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1243
    new $P27, [ 'Predef_typecast' ]
$P27.'Predef_typecast'('S')
    set $P26, $P27
$P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1233
    push $P1, $P24
.annotate 'line', 1246
    new $P29, [ 'PredefFunction' ]
$P29.'PredefFunction'('die', 'die {arg0}', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1233
    push $P1, $P28
.annotate 'line', 1250
    new $P31, [ 'PredefFunction' ]
$P31.'PredefFunction'('exit', 'exit {arg0}', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1233
    push $P1, $P30
.annotate 'line', 1254
    new $P33, [ 'PredefFunction' ]
$P33.'PredefFunction'('time', 'time {res}', 'I')
    set $P32, $P33
.annotate 'line', 1233
    push $P1, $P32
.annotate 'line', 1258
    new $P35, [ 'PredefFunction' ]
$P35.'PredefFunction'('floattime', 'time {res}', 'N')
    set $P34, $P35
.annotate 'line', 1233
    push $P1, $P34
.annotate 'line', 1262
    new $P37, [ 'PredefFunction' ]
$P37.'PredefFunction'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1233
    push $P1, $P36
.annotate 'line', 1266
    new $P39, [ 'PredefFunction' ]
$P39.'PredefFunction'('getstdin', 'getstdin {res}', 'P')
    set $P38, $P39
.annotate 'line', 1233
    push $P1, $P38
.annotate 'line', 1270
    new $P41, [ 'PredefFunction' ]
$P41.'PredefFunction'('getstdout', 'getstdout {res}', 'P')
    set $P40, $P41
.annotate 'line', 1233
    push $P1, $P40
.annotate 'line', 1274
    new $P43, [ 'PredefFunction' ]
$P43.'PredefFunction'('getstderr', 'getstderr {res}', 'P')
    set $P42, $P43
.annotate 'line', 1233
    push $P1, $P42
.annotate 'line', 1278
    new $P45, [ 'PredefFunction' ]
$P45.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1233
    push $P1, $P44
.annotate 'line', 1283
    new $P47, [ 'PredefFunction' ]
$P47.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1233
    push $P1, $P46
.annotate 'line', 1288
    new $P49, [ 'PredefFunction' ]
$P49.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1233
    push $P1, $P48
.annotate 'line', 1293
    new $P51, [ 'PredefFunction' ]
$P51.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1233
    push $P1, $P50
.annotate 'line', 1299
    new $P53, [ 'PredefFunction' ]
$P53.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1233
    push $P1, $P52
.annotate 'line', 1306
    new $P55, [ 'PredefFunction' ]
$P55.'PredefFunction'('elements', 'elements {res}, {arg0}', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1233
    push $P1, $P54
.annotate 'line', 1310
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1311
$P57.'PredefFunctionEval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1233
    push $P1, $P56
.annotate 'line', 1315
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1316
$P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1233
    push $P1, $P58
.annotate 'line', 1320
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1321
$P61.'PredefFunctionEval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1233
    push $P1, $P60
.annotate 'line', 1327
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1328
$P63.'PredefFunctionEval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1233
    push $P1, $P62
.annotate 'line', 1332
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1333
$P65.'PredefFunctionEval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1233
    push $P1, $P64
.annotate 'line', 1337
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1338
$P67.'PredefFunctionEval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1233
    push $P1, $P66
.annotate 'line', 1342
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1343
$P69.'PredefFunctionEval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1233
    push $P1, $P68
.annotate 'line', 1347
    new $P71, [ 'PredefFunction' ]
$P71.'PredefFunction'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1233
    push $P1, $P70
.annotate 'line', 1351
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1352
$P73.'PredefFunctionEval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1233
    push $P1, $P72
.annotate 'line', 1356
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1357
$P75.'PredefFunctionEval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1233
    push $P1, $P74
.annotate 'line', 1361
    new $P77, [ 'PredefFunction' ]
$P77.'PredefFunction'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1233
    push $P1, $P76
.annotate 'line', 1365
    new $P79, [ 'PredefFunction' ]
$P79.'PredefFunction'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1233
    push $P1, $P78
.annotate 'line', 1369
    new $P81, [ 'PredefFunction' ]
$P81.'PredefFunction'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1233
    push $P1, $P80
.annotate 'line', 1373
    new $P83, [ 'PredefFunction' ]
$P83.'PredefFunction'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1233
    push $P1, $P82
.annotate 'line', 1377
    new $P85, [ 'PredefFunction' ]
$P85.'PredefFunction'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1233
    push $P1, $P84
.annotate 'line', 1381
    new $P87, [ 'PredefFunction' ]
$P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1233
    push $P1, $P86
.annotate 'line', 1386
    new $P89, [ 'PredefFunction' ]
$P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1233
    push $P1, $P88
.annotate 'line', 1391
    new $P91, [ 'PredefFunction' ]
$P91.'PredefFunction'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1233
    push $P1, $P90
.annotate 'line', 1395
    new $P93, [ 'PredefFunction' ]
$P93.'PredefFunction'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1233
    push $P1, $P92
.annotate 'line', 1399
    new $P95, [ 'PredefFunction' ]
$P95.'PredefFunction'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1233
    push $P1, $P94
.annotate 'line', 1403
    new $P97, [ 'PredefFunction' ]
$P97.'PredefFunction'('exp', 'exp {res}, {arg0}', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1233
    push $P1, $P96
.annotate 'line', 1407
    new $P99, [ 'PredefFunction' ]
$P99.'PredefFunction'('ln', 'ln {res}, {arg0}', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1233
    push $P1, $P98
.annotate 'line', 1411
    new $P101, [ 'PredefFunction' ]
$P101.'PredefFunction'('sin', 'sin {res}, {arg0}', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1233
    push $P1, $P100
.annotate 'line', 1415
    new $P103, [ 'PredefFunction' ]
$P103.'PredefFunction'('cos', 'cos {res}, {arg0}', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1233
    push $P1, $P102
.annotate 'line', 1419
    new $P105, [ 'PredefFunction' ]
$P105.'PredefFunction'('tan', 'tan {res}, {arg0}', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1233
    push $P1, $P104
.annotate 'line', 1423
    new $P107, [ 'PredefFunction' ]
$P107.'PredefFunction'('asin', 'asin {res}, {arg0}', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1233
    push $P1, $P106
.annotate 'line', 1427
    new $P109, [ 'PredefFunction' ]
$P109.'PredefFunction'('acos', 'acos {res}, {arg0}', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1233
    push $P1, $P108
.annotate 'line', 1431
    new $P111, [ 'PredefFunction' ]
$P111.'PredefFunction'('atan', 'atan {res}, {arg0}', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1233
    push $P1, $P110
.annotate 'line', 1435
    new $P113, [ 'PredefFunction' ]
$P113.'PredefFunction'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1233
    push $P1, $P112
.annotate 'line', 1439
    new $P115, [ 'PredefFunction' ]
$P115.'PredefFunction'('getinterp', 'getinterp {res}', 'P')
    set $P114, $P115
.annotate 'line', 1233
    push $P1, $P114
.annotate 'line', 1443
    new $P117, [ 'PredefFunction' ]
$P117.'PredefFunction'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1233
    push $P1, $P116
.annotate 'line', 1447
    new $P119, [ 'PredefFunction' ]
$P119.'PredefFunction'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1233
    push $P1, $P118
.annotate 'line', 1451
    new $P121, [ 'PredefFunction' ]
$P121.'PredefFunction'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1233
    push $P1, $P120
.annotate 'line', 1455
    new $P123, [ 'PredefFunction' ]
$P123.'PredefFunction'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1233
    push $P1, $P122
.annotate 'line', 1459
    new $P125, [ 'PredefFunction' ]
$P125.'PredefFunction'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1233
    push $P1, $P124
.annotate 'line', 1463
    new $P127, [ 'PredefFunction' ]
$P127.'PredefFunction'('clone', 'clone {res}, {arg0}', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1233
    push $P1, $P126
.annotate 'line', 1467
    new $P129, [ 'PredefFunction' ]
$P129.'PredefFunction'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1233
    push $P1, $P128
.annotate 'line', 1471
    new $P131, [ 'PredefFunction' ]
$P131.'PredefFunction'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1233
    push $P1, $P130
.annotate 'line', 1475
    new $P133, [ 'PredefFunction' ]
$P133.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1233
    push $P1, $P132
.annotate 'line', 1480
    new $P135, [ 'PredefFunction' ]
$P135.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1233
    push $P1, $P134
.annotate 'line', 1485
    new $P137, [ 'PredefFunction' ]
$P137.'PredefFunction'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1233
    push $P1, $P136
.annotate 'line', 1489
    new $P139, [ 'PredefFunction' ]
$P139.'PredefFunction'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1233
    push $P1, $P138
.annotate 'line', 1493
    new $P141, [ 'PredefFunction' ]
$P141.'PredefFunction'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1233
    push $P1, $P140
.annotate 'line', 1497
    new $P143, [ 'PredefFunction' ]
$P143.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1233
    push $P1, $P142
.annotate 'line', 1501
    new $P145, [ 'PredefFunction' ]
$P145.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1233
    push $P1, $P144
.annotate 'line', 1505
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1506
$P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1233
    push $P1, $P146
.annotate 'line', 1509
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1510
$P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1233
    push $P1, $P148
.annotate 'line', 1513
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1514
$P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1233
    push $P1, $P150
.annotate 'line', 1517
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1518
$P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1233
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1523
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1524

.end # getpredefs


.sub 'findpredef'
.param string __ARG_1
.param int __ARG_2

.annotate 'line', 1526
# Body
# {
.annotate 'line', 1528
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1529
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1530
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1531
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1532
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1533
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1534
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1536
    .return($P2)
# }
.annotate 'line', 1537

.end # findpredef


.sub 'optimize_array'
.param pmc __ARG_1

.annotate 'line', 1543
# Body
# {
.annotate 'line', 1545
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1546
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1547
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
__ARG_1[$I2] = $P1
 __label_0: # for iteration
.annotate 'line', 1546
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1548

.end # optimize_array


.sub 'parseDotted'
.param pmc __ARG_1

.annotate 'line', 1550
# Body
# {
.annotate 'line', 1552
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1553
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1554
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1555
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1556
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1557
    $P2 = __ARG_1.'get'()
.annotate 'line', 1558
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1561
    __ARG_1.'unget'($P2)
.annotate 'line', 1562
    .return($P1)
# }
.annotate 'line', 1563

.end # parseDotted


.sub 'toIdentifierList'
.param pmc __ARG_1

.annotate 'line', 1565
# Body
# {
.annotate 'line', 1567
    new $P1, ['ResizableStringArray']
.annotate 'line', 1568
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1569
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1570
    .return($P1)
# }
.annotate 'line', 1571

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1582
# Body
# {
.annotate 'line', 1584
    setattribute self, 'start', __ARG_1
.annotate 'line', 1585
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1586

.end # initbase


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1587
# Body
# {
.annotate 'line', 1589
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1590

.end # annotate


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 1591
# Body
# {
.annotate 'line', 1593
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1594

.end # use_predef


.sub 'generatesubid' :method

.annotate 'line', 1595
# Body
# {
.annotate 'line', 1597
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1598

.end # generatesubid


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 1599
# Body
# {
.annotate 'line', 1601
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1602

.end # addlocalfunction


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 1603
# Body
# {
.annotate 'line', 1605
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1606

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 1607
# Body
# {
.annotate 'line', 1609
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1610

.end # findclasskey


.sub 'dowarnings' :method

.annotate 'line', 1611
# Body
# {
.annotate 'line', 1613
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1614

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1579
    addattribute $P0, 'start'
.annotate 'line', 1580
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable

.annotate 'line', 1627
# Body
# {
.annotate 'line', 1629
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1630

.end # init


.sub 'numargs' :method

.annotate 'line', 1632
# Body
# {
.annotate 'line', 1634
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1635

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1636
# Body
# {
.annotate 'line', 1638
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1639
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1640

.end # getarg


.sub 'parseargs' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3

.annotate 'line', 1642
# Body
# {
.annotate 'line', 1644
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1645
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1646
# {
.annotate 'line', 1647
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1648
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1649
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1650
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1651

.end # parseargs


.sub 'optimizeargs' :method

.annotate 'line', 1653
# Body
# {
.annotate 'line', 1655
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1656
    if_null $P1, __label_0
.annotate 'line', 1657
    'optimize_array'($P1)
 __label_0: # endif
# }
.annotate 'line', 1658

.end # optimizeargs


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 1659
# Body
# {
.annotate 'line', 1661
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1662
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1663
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1664
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1665
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1666
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1667
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1664
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1669
    .return($P2)
# }
.annotate 'line', 1670

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 1671
# Body
# {
.annotate 'line', 1673
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1674
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1675

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1625
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method

.annotate 'line', 1687
# Body
# {
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method

.annotate 'line', 1688
# Body
# {
.annotate 'line', 1690
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1691
    .return($I1)
# }
.annotate 'line', 1692

.end # numargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 1693
# Body
# {
.annotate 'line', 1695
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1696
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1697
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1699
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1700

.end # getarg


.sub 'Modifier' :method
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 1701
# Body
# {
.annotate 'line', 1703
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1704
    if_null __ARG_2, __label_0
.annotate 'line', 1705
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1706

.end # Modifier


.sub 'optimize' :method

.annotate 'line', 1707
# Body
# {
.annotate 'line', 1709
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1710

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1684
    addattribute $P0, 'name'
.annotate 'line', 1685
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1717
# Body
# {
.annotate 'line', 1719
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1720
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1721
# {
.annotate 'line', 1722
    $P2 = __ARG_1.'get'()
.annotate 'line', 1723
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1724
    $P2 = __ARG_1.'get'()
.annotate 'line', 1725
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1726
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1727
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1728
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1730
    new $P5, [ 'Modifier' ]
$P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1731
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1732
    'RequireOp'(']', $P2)
.annotate 'line', 1733
    setattribute self, 'list', $P1
# }
.annotate 'line', 1734

.end # ModifierList


.sub 'optimize' :method

.annotate 'line', 1735
# Body
# {
.annotate 'line', 1737
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1738
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1739

.end # optimize


.sub 'getlist' :method

.annotate 'line', 1740
# Body
# {
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
.param string __ARG_1

.annotate 'line', 1741
# Body
# {
.annotate 'line', 1743
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1744
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1745
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1746
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1747
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1748
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1745
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1751
    .return($P3)
# }
.annotate 'line', 1752

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1715
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
.param pmc __ARG_1

.annotate 'line', 1759
# Body
# {
.annotate 'line', 1761
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1762
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1763

.end # getparrotkey


.sub 'getparrotnamespacekey'
.param pmc __ARG_1

.annotate 'line', 1765
# Body
# {
.annotate 'line', 1767
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1768
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1770
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1771
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1773

.end # getparrotnamespacekey


.sub 'parseUsing'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 1775
# Body
# {
.annotate 'line', 1777
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1778
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1779
    new $P4, [ 'ExternStatement' ]
$P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1780
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1781
    new $P7, [ 'StaticStatement' ]
$P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1783
    __ARG_2.'unget'($P1)
.annotate 'line', 1784
    new $P3, [ 'UsingStatement' ]
$P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1786

.end # parseUsing


.sub 'parseStatement'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1788
# Body
# {
.annotate 'line', 1790
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1791
    $P3 = $P1.'isop'(';')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 1792
    new $P4, [ 'EmptyStatement' ]
    .return($P4)
 __label_0: # endif
.annotate 'line', 1793
    $P3 = $P1.'isop'('{')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1794
    new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_1: # endif
.annotate 'line', 1795
    $P3 = $P1.'isop'('${')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1796
    new $P5, [ 'PiropStatement' ]
$P5.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_2: # endif
.annotate 'line', 1798
    $P3 = $P1.'checkkeyword'()
    set $S1, $P3
    set $S2, 'using'
    if $S1 == $S2 goto __label_5
    set $S2, 'const'
    if $S1 == $S2 goto __label_6
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'string'
    if $S1 == $S2 goto __label_9
    set $S2, 'int'
    if $S1 == $S2 goto __label_10
    set $S2, 'float'
    if $S1 == $S2 goto __label_11
    set $S2, 'return'
    if $S1 == $S2 goto __label_12
    set $S2, 'yield'
    if $S1 == $S2 goto __label_13
    set $S2, 'goto'
    if $S1 == $S2 goto __label_14
    set $S2, 'if'
    if $S1 == $S2 goto __label_15
    set $S2, 'while'
    if $S1 == $S2 goto __label_16
    set $S2, 'do'
    if $S1 == $S2 goto __label_17
    set $S2, 'continue'
    if $S1 == $S2 goto __label_18
    set $S2, 'break'
    if $S1 == $S2 goto __label_19
    set $S2, 'switch'
    if $S1 == $S2 goto __label_20
    set $S2, 'for'
    if $S1 == $S2 goto __label_21
    set $S2, 'throw'
    if $S1 == $S2 goto __label_22
    set $S2, 'try'
    if $S1 == $S2 goto __label_23
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1800
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_6: # case
.annotate 'line', 1802
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_7: # case
.annotate 'line', 1805
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_8: # case
.annotate 'line', 1808
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_9: # case
.annotate 'line', 1810
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_10: # case
.annotate 'line', 1812
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1814
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1816
    new $P5, [ 'ReturnStatement' ]
$P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_13: # case
.annotate 'line', 1818
    new $P7, [ 'YieldStatement' ]
$P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
 __label_14: # case
.annotate 'line', 1820
    new $P9, [ 'GotoStatement' ]
$P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P8, $P9
    .return($P8)
 __label_15: # case
.annotate 'line', 1822
    new $P11, [ 'IfStatement' ]
$P11.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
 __label_16: # case
.annotate 'line', 1824
    new $P13, [ 'WhileStatement' ]
$P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
 __label_17: # case
.annotate 'line', 1826
    new $P15, [ 'DoStatement' ]
$P15.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
 __label_18: # case
.annotate 'line', 1828
    new $P17, [ 'ContinueStatement' ]
$P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
 __label_19: # case
.annotate 'line', 1830
    new $P19, [ 'BreakStatement' ]
$P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
 __label_20: # case
.annotate 'line', 1832
    new $P21, [ 'SwitchStatement' ]
$P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
 __label_21: # case
.annotate 'line', 1834
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_22: # case
.annotate 'line', 1836
    new $P23, [ 'ThrowStatement' ]
$P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
 __label_23: # case
.annotate 'line', 1838
    new $P25, [ 'TryStatement' ]
$P25.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
 __label_4: # default
.annotate 'line', 1840
    $P26 = $P1.'isidentifier'()
    if_null $P26, __label_24
    unless $P26 goto __label_24
# {
.annotate 'line', 1841
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1842
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_25
    unless $P3 goto __label_25
.annotate 'line', 1843
    new $P5, [ 'LabelStatement' ]
$P5.'LabelStatement'($P1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_25: # endif
.annotate 'line', 1844
    __ARG_1.'unget'($P2)
# }
 __label_24: # endif
.annotate 'line', 1846
    __ARG_1.'unget'($P1)
.annotate 'line', 1847
    new $P4, [ 'ExprStatement' ]
$P4.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P3, $P4
    .return($P3)
 __label_3: # switch end
.annotate 'line', 1849
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1850

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1858
# Body
# {
.annotate 'line', 1860
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1861

.end # Statement


.sub 'isempty' :method

.annotate 'line', 1862
# Body
# {
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 1863
# Body
# {
.annotate 'line', 1865
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1866

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 1867
# Body
# {
.annotate 'line', 1869
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1870

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 1871
# Body
# {
.annotate 'line', 1873
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1874

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 1875
# Body
# {
.annotate 'line', 1877
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1878

.end # genlabel


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 1879
# Body
# {
.annotate 'line', 1881
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1882

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 1883
# Body
# {
.annotate 'line', 1885
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1886

.end # createlabel


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 1887
# Body
# {
.annotate 'line', 1889
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1890

.end # createconst


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 1891
# Body
# {
.annotate 'line', 1893
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1894

.end # createvar


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 1895
# Body
# {
.annotate 'line', 1897
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1898

.end # getvar


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 1899
# Body
# {
.annotate 'line', 1901
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1902

.end # checkclass


.sub 'getouter' :method

.annotate 'line', 1904
# Body
# {
.annotate 'line', 1909
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1910

.end # getouter


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 1911
# Body
# {
.annotate 'line', 1913
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1914

.end # getcontinuelabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 1915
# Body
# {
.annotate 'line', 1917
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1918

.end # getbreaklabel


.sub 'optimize' :method

.annotate 'line', 1919
# Body
# {
.annotate 'line', 1921
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 1923
    .return(self)
# }
.annotate 'line', 1924

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1856
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method

.annotate 'line', 1929
# Body
# {
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 1930
# Body
# {
.annotate 'line', 1932
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1933

.end # annotate


.sub 'optimize' :method

.annotate 'line', 1934
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1935
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1927
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method

.annotate 'line', 1945
# Body
# {
.annotate 'line', 1947
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 1948
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 1949
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 1950
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 1951
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 1952
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 1953
    null $I2
 __label_3: # endif
.annotate 'line', 1954
$P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 1950
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 1956
    unless $I2 goto __label_5
.annotate 'line', 1957
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 1959
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 1960

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1943
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1965
# Body
# {
.annotate 'line', 1967
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 1968
    setattribute self, 'statements', $P1
# }
.annotate 'line', 1969

.end # MultiStatement


.sub 'isempty' :method

.annotate 'line', 1970
# Body
# {
    .return(0)
# }

.end # isempty


.sub 'push' :method
.param pmc __ARG_1

.annotate 'line', 1971
# Body
# {
.annotate 'line', 1973
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 1974
    .return(self)
# }
.annotate 'line', 1975

.end # push


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 1976
# Body
# {
.annotate 'line', 1978
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1979
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1980

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1963
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 1983
# Body
# {
.annotate 'line', 1985
    unless_null __ARG_1, __label_0
.annotate 'line', 1986
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 1987
    isa $I1, __ARG_1, 'MultiStatement'
    unless $I1 goto __label_2
.annotate 'line', 1988
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 1990
    new $P2, [ 'MultiStatement' ]
$P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1991

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2002
# Body
# {
.annotate 'line', 2004
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2005
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2006
# dotted: $I1
    null $I1
.annotate 'line', 2007
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2008
    set $I1, 1
.annotate 'line', 2009
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2011
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2012
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2013
    $P1 = __ARG_2.'get'()
.annotate 'line', 2014
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2015
    __ARG_2.'unget'($P1)
.annotate 'line', 2016
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2017
# {
.annotate 'line', 2018
# var arg: $P3
    null $P3
.annotate 'line', 2019
    $P1 = __ARG_2.'get'()
.annotate 'line', 2020
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2021
    $P1 = __ARG_2.'get'()
.annotate 'line', 2022
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2023
    new $P4, [ 'Reflabel' ]
$P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2026
    __ARG_2.'unget'($P1)
.annotate 'line', 2027
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2029
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2030
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2031
    'RequireOp'('}', $P1)
.annotate 'line', 2032
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2034
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2035

.end # PiropStatement


.sub 'optimize' :method

.annotate 'line', 2036
# Body
# {
.annotate 'line', 2038
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2039
    if_null $P1, __label_0
.annotate 'line', 2040
    'optimize_array'($P1)
 __label_0: # endif
.annotate 'line', 2041
    .return(self)
# }
.annotate 'line', 2042

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2043
# Body
# {
.annotate 'line', 2045
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2046
    self.'annotate'(__ARG_1)
.annotate 'line', 2047
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2048
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2049
    __ARG_1.'print'('    ')
.annotate 'line', 2050
    unless_null $P1, __label_1
.annotate 'line', 2051
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2053
    __ARG_1.'print'($S1, ' ')
.annotate 'line', 2054
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2055
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2056
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2057
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2058
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2059
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2056
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2061
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2063

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 1997
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 1999
    addattribute $P0, 'opname'
.annotate 'line', 2000
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2073
# Body
# {
.annotate 'line', 2075
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2076
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2077
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2078
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2079
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2080
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2081
    .return(self)
# }
.annotate 'line', 2082

.end # ExternStatement


.sub 'optimize' :method

.annotate 'line', 2083
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2084
# Body
# {
.annotate 'line', 2086
    self.'annotate'(__ARG_1)
.annotate 'line', 2087
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2088

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2070
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2072
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2098
# Body
# {
.annotate 'line', 2100
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2101
# sym: $S1
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2102
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2103
    box $P1, $S1
    setattribute self, 'symbol', $P1
# }
.annotate 'line', 2104

.end # StaticStatement


.sub 'optimize' :method

.annotate 'line', 2105
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2106
# Body
# {
.annotate 'line', 2108
    self.'annotate'(__ARG_1)
.annotate 'line', 2109
# var v: $P1
    getattribute $P2, self, 'symbol'
    $P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2110
    $P2 = $P1.'getreg'()
    getattribute $P3, self, 'symbol'
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2111

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2095
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2097
    addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2123
# Body
# {
.annotate 'line', 2125
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2126
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2127
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2128
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2129
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2130
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2131

.end # UsingStatement


.sub 'optimize' :method

.annotate 'line', 2132
# Body
# {
.annotate 'line', 2134
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2135
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2136
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2138
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2139
    if_null $P3, __label_0
# {
.annotate 'line', 2140
    isa $I1, $P3, 'FunctionStatement'
    unless $I1 goto __label_1
# {
.annotate 'line', 2141
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2142
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2145
    .return(self)
# }
.annotate 'line', 2146

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2147
# Body
# {
.annotate 'line', 2149
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2150
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2151
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2152
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2153
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2154
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2157
    self.'annotate'(__ARG_1)
.annotate 'line', 2158
    $P3 = $P2.'getreg'()
    __ARG_1.'print'("    get_hll_global ", $P3, ', ')
.annotate 'line', 2159
    $P1.'pop'()
.annotate 'line', 2160
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2162
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2165
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2168

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2118
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2120
    addattribute $P0, 'path'
.annotate 'line', 2121
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2178
# Body
# {
.annotate 'line', 2180
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2181
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2182
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2183

.end # ExprStatement


.sub 'optimize' :method

.annotate 'line', 2184
# Body
# {
.annotate 'line', 2186
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2187
    .return(self)
# }
.annotate 'line', 2188

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 2189
# Body
# {
.annotate 'line', 2191
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2192

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2175
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2177
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4
.param pmc __ARG_5 :optional

.annotate 'line', 2209
# Body
# {
.annotate 'line', 2211
    setattribute self, 'type', __ARG_1
.annotate 'line', 2212
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2213
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2214
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2215
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2216

.end # VarData


.sub 'setid' :method
.param string __ARG_1

.annotate 'line', 2217
# Body
# {
.annotate 'line', 2219
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2220

.end # setid


.sub 'setlex' :method
.param string __ARG_1

.annotate 'line', 2221
# Body
# {
.annotate 'line', 2223
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2224

.end # setlex


.sub 'gettype' :method

.annotate 'line', 2225
# Body
# {
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method

.annotate 'line', 2226
# Body
# {
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method

.annotate 'line', 2227
# Body
# {
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method

.annotate 'line', 2228
# Body
# {
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method

.annotate 'line', 2229
# Body
# {
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method

.annotate 'line', 2230
# Body
# {
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method

.annotate 'line', 2231
# Body
# {
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method

.annotate 'line', 2232
# Body
# {
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2201
    addattribute $P0, 'type'
.annotate 'line', 2202
    addattribute $P0, 'reg'
.annotate 'line', 2203
    addattribute $P0, 'scope'
.annotate 'line', 2204
    addattribute $P0, 'flags'
.annotate 'line', 2205
    addattribute $P0, 'value'
.annotate 'line', 2206
    addattribute $P0, 'id'
.annotate 'line', 2207
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
.param pmc __ARG_1

.annotate 'line', 2238
# Body
# {
.annotate 'line', 2240
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2241

.end # ConstantInternalFail


.sub 'get_string' :method :vtable

.annotate 'line', 2242
# Body
# {
.annotate 'line', 2244
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2245

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2237
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable

.annotate 'line', 2252
# Body
# {
.annotate 'line', 2254
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2255

.end # init


.sub 'createvar' :method
.param pmc __ARG_1
.param string __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 2256
# Body
# {
.annotate 'line', 2258
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2259
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2260
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2261
    if_null $P2, __label_1
.annotate 'line', 2262
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2263
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2264
# var data: $P3
    new $P3, [ 'VarData' ]
$P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2265
$P1[$S1] = $P3
.annotate 'line', 2266
    .return($P3)
# }
.annotate 'line', 2267

.end # createvar


.sub 'createvarnamed' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2268
# Body
# {
.annotate 'line', 2270
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2271
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2272
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2273
    if_null $P2, __label_1
.annotate 'line', 2274
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2275
    new $P4, [ 'VarData' ]
$P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
$P1[$S1] = $P3
# }
.annotate 'line', 2276

.end # createvarnamed


.sub 'createconst' :method
.param pmc __ARG_1
.param string __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 2277
# Body
# {
.annotate 'line', 2279
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2280
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2281
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2282
    if_null $P2, __label_1
.annotate 'line', 2283
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2284
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
$P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
$P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2285
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2286
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2287
$P1[$S1] = $P3
# }
.annotate 'line', 2288

.end # createconst


.sub 'getvar' :method
.param pmc __ARG_1

.annotate 'line', 2289
# Body
# {
.annotate 'line', 2291
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2292
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2293
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2294
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2295
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2296
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, 'VarData'
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2297
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2298
    .return($P2)
# }
.annotate 'line', 2299

.end # getvar


.sub 'getlocalvar' :method
.param pmc __ARG_1

.annotate 'line', 2300
# Body
# {
.annotate 'line', 2302
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2303
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2304
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2305
    .return($P2)
# }
.annotate 'line', 2306

.end # getlocalvar


.sub 'makelexical' :method
.param pmc __ARG_1

.annotate 'line', 2307
# Body
# {
.annotate 'line', 2309
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2310
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2311
    .return($S1)
# }
.annotate 'line', 2312

.end # makelexical


.sub 'makelexicalself' :method

.annotate 'line', 2313
# Body
# {
.annotate 'line', 2315
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2317
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2318
    .return('__WLEX_self')
# }
.annotate 'line', 2319

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2251
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2328
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2338
# Body
# {
.annotate 'line', 2340
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2341

.end # Expr


.sub 'issimple' :method

.annotate 'line', 2342
# Body
# {
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method

.annotate 'line', 2343
# Body
# {
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method

.annotate 'line', 2344
# Body
# {
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method

.annotate 'line', 2345
# Body
# {
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method

.annotate 'line', 2346
# Body
# {
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method

.annotate 'line', 2347
# Body
# {
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method

.annotate 'line', 2348
# Body
# {
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method

.annotate 'line', 2349
# Body
# {
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method

.annotate 'line', 2350
# Body
# {
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
.param pmc __ARG_1

.annotate 'line', 2351
# Body
# {
.annotate 'line', 2353
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2354

.end # tempreg


.sub 'optimize' :method

.annotate 'line', 2355
# Body
# {
.annotate 'line', 2358
    .return(self)
# }
.annotate 'line', 2359

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 2360
# Body
# {
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2361
# Body
# {
.annotate 'line', 2363
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2364
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2365
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2366
    .return($S2)
# }
.annotate 'line', 2367

.end # emit_get


.sub 'emit_getint' :method
.param pmc __ARG_1

.annotate 'line', 2368
# Body
# {
.annotate 'line', 2370
# reg: $S1
    null $S1
.annotate 'line', 2371
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2372
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2374
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2375
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2377
    .return($S1)
# }
.annotate 'line', 2378

.end # emit_getint


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2379
# Body
# {
.annotate 'line', 2381
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2382

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2336
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method

.annotate 'line', 2387
# Body
# {
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2385
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2395
# Body
# {
.annotate 'line', 2397
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2398
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2399
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2400
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2401
    new $P4, [ 'LocalFunctionStatement' ]
$P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2402

.end # FunctionExpr


.sub 'checkresult' :method

.annotate 'line', 2403
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2404
# Body
# {
.annotate 'line', 2406
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2407
    .return(self)
# }
.annotate 'line', 2408

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2409
# Body
# {
.annotate 'line', 2411
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2412
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2413
    self.'annotate'(__ARG_1)
.annotate 'line', 2414
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2415
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2416
    __ARG_1.'say'('    ', 'newclosure ', __ARG_2, ', ', $S1)
 __label_1: # endif
# }
.annotate 'line', 2417

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2392
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2394
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
.param pmc __ARG_1

.annotate 'line', 2430
# Body
# {
.annotate 'line', 2432
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2433
    .return(self)
# }
.annotate 'line', 2434

.end # set


.sub 'optimize_condition' :method

.annotate 'line', 2435
# Body
# {
.annotate 'line', 2437
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2438

.end # optimize_condition


.sub 'optimize' :method

.annotate 'line', 2439
# Body
# {
.annotate 'line', 2441
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2442
    .return(self)
# }
.annotate 'line', 2443

.end # optimize


.sub 'getvalue' :method

.annotate 'line', 2444
# Body
# {
.annotate 'line', 2446
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2447
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2448
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2450
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2451
    ne $I1, 0, __label_4
.annotate 'line', 2452
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2454
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2457
    .return(0)
# }
.annotate 'line', 2458

.end # getvalue


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 2459
# Body
# {
.annotate 'line', 2461
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2463
    isa $I1, $P1, 'ComparatorBaseExpr'
    if $I1 goto __label_2
.annotate 'line', 2464
    isa $I1, $P1, 'NullCheckerExpr'
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2465
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2467
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2468
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2469
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
.annotate 'line', 2472
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2475
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2478
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2481

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 2482
# Body
# {
.annotate 'line', 2484
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2486
    isa $I1, $P1, 'ComparatorBaseExpr'
    if $I1 goto __label_2
.annotate 'line', 2487
    isa $I1, $P1, 'NullCheckerExpr'
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2488
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2490
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2491
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2492
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
.annotate 'line', 2495
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2498
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2501
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2504

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2429
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method

.annotate 'line', 2511
# Body
# {
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method

.annotate 'line', 2512
# Body
# {
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2509
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2520
# Body
# {
.annotate 'line', 2522
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2523
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2524

.end # StringLiteral


.sub 'isstringliteral' :method

.annotate 'line', 2525
# Body
# {
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method

.annotate 'line', 2526
# Body
# {
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method

.annotate 'line', 2527
# Body
# {
.annotate 'line', 2529
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2530
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2531
# typesinglequoted: $I1
    isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2532
# need_unicode: $I2
    null $I2
.annotate 'line', 2533
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2534
    le $I3, 127, __label_3
# {
.annotate 'line', 2535
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2536
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2539
    unless $I2 goto __label_4
# {
.annotate 'line', 2540
    unless $I1 goto __label_5
# {
.annotate 'line', 2541
    null $I1
.annotate 'line', 2542
# saux: $S2
    set $S2, $S1
.annotate 'line', 2543
    set $S1, ''
.annotate 'line', 2544
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2545
    ne $S3, '\', __label_8
.annotate 'line', 2546
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2547
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2550
# result: $S4
    set $S4, ''
.annotate 'line', 2551
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2552
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2553
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2554
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2555
    le $I6, 127, __label_12
# {
.annotate 'line', 2556
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2557
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2560
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2552
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2562
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2564
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2565
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2566
    unless $I2 goto __label_17
.annotate 'line', 2567
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2568
    .return($S1)
# }
.annotate 'line', 2569

.end # getPirString


.sub 'get_value' :method

.annotate 'line', 2570
# Body
# {
.annotate 'line', 2572
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2573
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2574
    isa $I1, $P1, 'TokenQuoted'
    unless $I1 goto __label_1
# {
.annotate 'line', 2575
# var s: $P2
    box $P2, $S1
.annotate 'line', 2576
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2578
    .return($S1)
# }
.annotate 'line', 2579

.end # get_value


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2580
# Body
# {
.annotate 'line', 2582
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2583
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2584

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2585
# Body
# {
.annotate 'line', 2587
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2588

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2517
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2519
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param int __ARG_4 :opt_flag

.annotate 'line', 2597
# Body
# {
.annotate 'line', 2600
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2601
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2602
# n: $I1
    null $I1
.annotate 'line', 2603
    unless __ARG_4 goto __label_0
.annotate 'line', 2604
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2606
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2607
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2609
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2610

.end # IntegerLiteral


.sub 'isintegerliteral' :method

.annotate 'line', 2611
# Body
# {
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method

.annotate 'line', 2612
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method

.annotate 'line', 2613
# Body
# {
.annotate 'line', 2615
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2616
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2617
    .return($I1)
# }
.annotate 'line', 2618

.end # getIntegerValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2619
# Body
# {
.annotate 'line', 2621
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2622
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2623
    ne $I1, 0, __label_1
.annotate 'line', 2624
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2626
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2628

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2629
# Body
# {
.annotate 'line', 2631
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2632

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2593
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2595
    addattribute $P0, 'pos'
.annotate 'line', 2596
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2640
# Body
# {
.annotate 'line', 2642
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2643
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2644

.end # FloatLiteral


.sub 'isfloatliteral' :method

.annotate 'line', 2645
# Body
# {
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method

.annotate 'line', 2646
# Body
# {
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method

.annotate 'line', 2647
# Body
# {
.annotate 'line', 2649
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2650
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2651
    assign $P1, $S1
.annotate 'line', 2652
    .return($P1)
# }
.annotate 'line', 2653

.end # getFloatValue


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2654
# Body
# {
.annotate 'line', 2656
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2657
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2658
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2660

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2661
# Body
# {
.annotate 'line', 2665
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2666
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2667
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2668
    .return($S1)
# }
.annotate 'line', 2669

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2637
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2639
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method

.annotate 'line', 2677
# Body
# {
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2678
# Body
# {
.annotate 'line', 2680
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2681
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2682

.end # IdentifierExpr


.sub 'isnull' :method

.annotate 'line', 2683
# Body
# {
.annotate 'line', 2685
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2686

.end # isnull


.sub 'checkresult' :method

.annotate 'line', 2687
# Body
# {
.annotate 'line', 2689
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2690
    if_null $P1, __label_0
.annotate 'line', 2691
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2693
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
.annotate 'line', 2696
    .return('P')
 __label_3: # default
.annotate 'line', 2698
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2701

.end # checkresult


.sub 'getName' :method

.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2705
    .return($S1)
# }
.annotate 'line', 2706

.end # getName


.sub 'checkIdentifier' :method

.annotate 'line', 2707
# Body
# {
.annotate 'line', 2709
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2710
    unless_null $P1, __label_0
.annotate 'line', 2711
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2712
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2713
# s: $S1
    null $S1
.annotate 'line', 2714
    unless_null $P2, __label_1
# {
.annotate 'line', 2715
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2716
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2718
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2720
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2722
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2726
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2727
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2729
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2731
    .return($S1)
# }
.annotate 'line', 2732

.end # checkIdentifier


.sub 'getIdentifier' :method

.annotate 'line', 2733
# Body
# {
.annotate 'line', 2735
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2736
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2737
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2738
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2740
    .return($P1)
# }
.annotate 'line', 2741

.end # getIdentifier


.sub 'optimize' :method

.annotate 'line', 2742
# Body
# {
.annotate 'line', 2744
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2745
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2746
    if_null $P2, __label_0
# {
.annotate 'line', 2747
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2748
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2749
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2750
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2751
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2752
    new $P4, [ 'LexicalVolatileExpr' ]
$P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2755
    .return(self)
# }
.annotate 'line', 2756

.end # optimize


.sub 'emit_getid' :method
.param pmc __ARG_1

.annotate 'line', 2757
# Body
# {
.annotate 'line', 2759
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2760
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2761
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2762
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2763
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2764
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2765
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2766
    __ARG_1.'say'("find_lex ", $S1, ", '", $S2, "'")
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2769
    .return($S1)
# }
.annotate 'line', 2770

.end # emit_getid


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2771
# Body
# {
.annotate 'line', 2773
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2774
    self.'annotate'(__ARG_1)
.annotate 'line', 2775
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2776
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2778

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2779
# Body
# {
.annotate 'line', 2781
    self.'annotate'(__ARG_1)
.annotate 'line', 2782
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2783
    .return($S1)
# }
.annotate 'line', 2784

.end # emit_get


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2785
# Body
# {
.annotate 'line', 2787
    self.'annotate'(__ARG_1)
.annotate 'line', 2788
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2789
    die "NO"
 __label_0: # endif
.annotate 'line', 2790
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2791
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2792
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2793
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2796
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2799
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2802
    isa $I1, __ARG_2, 'IndexExpr'
    unless $I1 goto __label_9
.annotate 'line', 2803
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2805
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2806
    ne $S3, 'v', __label_12
.annotate 'line', 2807
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2808
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2809
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2812
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2813
    self.'annotate'(__ARG_1)
.annotate 'line', 2814
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2815
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2817
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2820
    .return($S2)
# }
.annotate 'line', 2821

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2674
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2676
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2829
# Body
# {
.annotate 'line', 2831
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2832
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2833

.end # LexicalVolatileExpr


.sub 'checkresult' :method

.annotate 'line', 2834
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 2835
# Body
# {
.annotate 'line', 2837
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2838
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2839
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2840
    __ARG_1.'say'("find_lex ", $S2, ", '", $S1, "'")
.annotate 'line', 2841
    .return($S2)
# }
.annotate 'line', 2842

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2843
# Body
# {
.annotate 'line', 2845
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2846
    self.'annotate'(__ARG_1)
.annotate 'line', 2847
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2848
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2850

.end # emit


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2851
# Body
# {
.annotate 'line', 2853
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2854
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2855
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2856
    isa $I1, __ARG_2, 'IndexExpr'
    unless $I1 goto __label_3
.annotate 'line', 2857
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2859
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2860
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2861
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2864
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2865
    self.'annotate'(__ARG_1)
.annotate 'line', 2866
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2870
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2871
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2872
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2873

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2826
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2828
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2880
# Body
# {
.annotate 'line', 2882
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2883

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2878
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2892
# Body
# {
.annotate 'line', 2894
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2895
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2896

.end # OpClassExpr


.sub 'checkresult' :method

.annotate 'line', 2897
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 2898
# Body
# {
.annotate 'line', 2900
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2903
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2904
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2905
    __ARG_1.'print'("    get_class ", __ARG_2, ', ')
.annotate 'line', 2906
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2907
    __ARG_1.'say'()
# }
.annotate 'line', 2908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2888
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2890
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 2916
# Body
# {
.annotate 'line', 2918
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2919
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2920

.end # OpUnaryExpr


.sub 'optimizearg' :method

.annotate 'line', 2921
# Body
# {
.annotate 'line', 2923
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2924

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2925
# Body
# {
.annotate 'line', 2927
    self.'optimizearg'()
.annotate 'line', 2928
    .return(self)
# }
.annotate 'line', 2929

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2913
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2915
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2938
# Body
# {
.annotate 'line', 2940
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2941
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2942
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2943

.end # initbinary


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 2944
# Body
# {
.annotate 'line', 2946
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2947
    .return(self)
# }
.annotate 'line', 2948

.end # set


.sub 'setfrom' :method
.param pmc __ARG_1

.annotate 'line', 2949
# Body
# {
.annotate 'line', 2951
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2952

.end # setfrom


.sub 'optimizearg' :method

.annotate 'line', 2953
# Body
# {
.annotate 'line', 2955
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 2956
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2957

.end # optimizearg


.sub 'optimize' :method

.annotate 'line', 2958
# Body
# {
.annotate 'line', 2960
    self.'optimizearg'()
.annotate 'line', 2961
    .return(self)
# }
.annotate 'line', 2962

.end # optimize


.sub 'emit_intleft' :method
.param pmc __ARG_1

.annotate 'line', 2963
# Body
# {
.annotate 'line', 2965
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2966
    .return($S1)
# }
.annotate 'line', 2967

.end # emit_intleft


.sub 'emit_intright' :method
.param pmc __ARG_1

.annotate 'line', 2968
# Body
# {
.annotate 'line', 2970
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2971
    .return($S1)
# }
.annotate 'line', 2972

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2934
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2936
    addattribute $P0, 'lexpr'
.annotate 'line', 2937
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method

.annotate 'line', 2979
# Body
# {
.annotate 'line', 2981
    .return('I')
# }
.annotate 'line', 2982

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 2983
# Body
# {
.annotate 'line', 2985
    self.'optimizearg'()
.annotate 'line', 2986
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 2987
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 2988
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 2989
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 2990
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 2991
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 2993
    .return(self)
# }
.annotate 'line', 2994

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 2977
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method

.annotate 'line', 3001
# Body
# {
.annotate 'line', 3003
    .return('I')
# }
.annotate 'line', 3004

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3005
# Body
# {
.annotate 'line', 3007
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3008
    .return(self)
# }
.annotate 'line', 3009

.end # set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 2999
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3015
# Body
# {
.annotate 'line', 3017
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3018
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3019
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3020
    self.'annotate'(__ARG_1)
.annotate 'line', 3021
    __ARG_1.'print'("    delete ")
.annotate 'line', 3022
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3023
    __ARG_1.'say'()
.annotate 'line', 3024
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3025
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3028
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3029

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3013
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3034
# Body
# {
.annotate 'line', 3036
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3037
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_1
    set $P2, __ARG_2
    goto __label_0
 __label_1:
    $P2 = self.'tempreg'('I')
 __label_0:
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
 __label_2:
.annotate 'line', 3038
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3039
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3040
    self.'annotate'(__ARG_1)
.annotate 'line', 3041
    __ARG_1.'print'("    exists ", $S1, ', ')
.annotate 'line', 3042
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3043
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3046
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3047

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3048
# Body
# {
.annotate 'line', 3050
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3051
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3052
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3053
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3054
    self.'annotate'(__ARG_1)
.annotate 'line', 3055
    __ARG_1.'print'("    exists ", $S1, ', ')
.annotate 'line', 3056
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3057
    __ARG_1.'say'()
.annotate 'line', 3058
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3061
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3062

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3032
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3069
# Body
# {
.annotate 'line', 3071
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3072

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3073
# Body
# {
.annotate 'line', 3075
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3076
    .return(self)
# }
.annotate 'line', 3077

.end # set


.sub 'optimize' :method

.annotate 'line', 3078
# Body
# {
.annotate 'line', 3080
    self.'optimizearg'()
.annotate 'line', 3081
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3082
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3083
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3084
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3087
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3088
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3089
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3090
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3093
    .return(self)
# }
.annotate 'line', 3094

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3095
# Body
# {
.annotate 'line', 3097
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3098
    self.'annotate'(__ARG_1)
.annotate 'line', 3099
    __ARG_1.'say'('    ', 'neg ', __ARG_2, ', ', $S1)
# }
.annotate 'line', 3100

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3067
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3107
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method

.annotate 'line', 3108
# Body
# {
.annotate 'line', 3110
    .return('I')
# }
.annotate 'line', 3111

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3112
# Body
# {
.annotate 'line', 3114
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3115
    .return(self)
# }
.annotate 'line', 3116

.end # set


.sub 'optimize' :method

.annotate 'line', 3117
# Body
# {
.annotate 'line', 3119
    self.'optimizearg'()
.annotate 'line', 3120
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3121
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3122
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3123
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3124
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3126
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3127
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3128
    .return(self)
# }
.annotate 'line', 3129

.end # optimize


.sub 'negated' :method

.annotate 'line', 3130
# Body
# {
.annotate 'line', 3132
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3133

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3134
# Body
# {
.annotate 'line', 3136
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3137
    self.'annotate'(__ARG_1)
.annotate 'line', 3138
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3139
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3141
    __ARG_1.'say'('    ', 'not ', __ARG_2, ', ', $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3144
    __ARG_1.'say'('    ', 'isfalse ', __ARG_2, ', ', $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3147
    __ARG_1.'say'('    ', 'isfalse ', __ARG_2, ', ', $S1)
 __label_2: # switch end
# }
.annotate 'line', 3149

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3105
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3156
# Body
# {
.annotate 'line', 3158
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3159

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3160
# Body
# {
.annotate 'line', 3162
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3163
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3164
    .return(self)
# }
.annotate 'line', 3165

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3166
# Body
# {
.annotate 'line', 3168
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3169
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3170
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3171

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3172
# Body
# {
.annotate 'line', 3174
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3175
    self.'annotate'(__ARG_1)
.annotate 'line', 3176
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3177
    .return($S1)
# }
.annotate 'line', 3178

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3154
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3185
# Body
# {
.annotate 'line', 3187
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3188
    .return(self)
# }
.annotate 'line', 3189

.end # set


.sub 'checkresult' :method

.annotate 'line', 3190
# Body
# {
.annotate 'line', 3192
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3193

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3194
# Body
# {
.annotate 'line', 3196
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3197
    self.'annotate'(__ARG_1)
.annotate 'line', 3198
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3199
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3200
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3201
    .return($S1)
# }
.annotate 'line', 3202

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3183
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3212

.end # checkresult


.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3213
# Body
# {
.annotate 'line', 3215
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3216
    .return(self)
# }
.annotate 'line', 3217

.end # set


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3218
# Body
# {
.annotate 'line', 3220
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3221
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3222
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3223

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3224
# Body
# {
.annotate 'line', 3226
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3227
    self.'annotate'(__ARG_1)
.annotate 'line', 3228
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3229
    .return($S1)
# }
.annotate 'line', 3230

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3207
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 3237
# Body
# {
.annotate 'line', 3239
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3240
    .return(self)
# }
.annotate 'line', 3241

.end # set


.sub 'checkresult' :method

.annotate 'line', 3242
# Body
# {
.annotate 'line', 3244
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3245

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3246
# Body
# {
.annotate 'line', 3248
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3249
    self.'annotate'(__ARG_1)
.annotate 'line', 3250
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3251
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3252
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3253
    .return($S1)
# }
.annotate 'line', 3254

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3235
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3263
# Body
# {
.annotate 'line', 3265
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3266
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3267
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3268
    .return(self)
# }
.annotate 'line', 3269

.end # set


.sub 'checkresult' :method

.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3273

.end # checkresult


.sub 'optimize_base' :method

.annotate 'line', 3274
# Body
# {
.annotate 'line', 3276
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3277
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3278
    .return(self)
# }
.annotate 'line', 3279

.end # optimize_base


.sub 'optimize' :method

.annotate 'line', 3280
# Body
# {
.annotate 'line', 3282
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3283

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3284
# Body
# {
.annotate 'line', 3286
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3287
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3288
    self.'annotate'(__ARG_1)
.annotate 'line', 3289
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3291

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3259
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3261
    addattribute $P0, 'lexpr'
.annotate 'line', 3262
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3298
# Body
# {
.annotate 'line', 3300
    self.'annotate'(__ARG_1)
.annotate 'line', 3301
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3302
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3303

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3296
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3310
# Body
# {
.annotate 'line', 3312
    self.'annotate'(__ARG_1)
.annotate 'line', 3313
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3314
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3315
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3316

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3317
# Body
# {
.annotate 'line', 3319
    self.'annotate'(__ARG_1)
.annotate 'line', 3320
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3321
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3322
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3323
    .return($S1)
# }
.annotate 'line', 3324

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3308
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3331
# Body
# {
.annotate 'line', 3333
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3334
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3335
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3336
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3337
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3338
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, 'ConcatString'
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3339
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3341
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3342
# aux: $S5
    null $S5
.annotate 'line', 3343
    self.'annotate'(__ARG_1)
.annotate 'line', 3344
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
.annotate 'line', 3346
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3347
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3348
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3349
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3351
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3355
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3356
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3357
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3358
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3360
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3363
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3366
    .return($S3)
# }
.annotate 'line', 3367

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3329
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3374
# Body
# {
.annotate 'line', 3376
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3377
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3378
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3379
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3380
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3381
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3382
# aux: $S5
    null $S5
.annotate 'line', 3383
    self.'annotate'(__ARG_1)
.annotate 'line', 3384
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
.annotate 'line', 3386
    getattribute $P3, self, 'start'
    'InternalError'('-= to string must not happen', $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3389
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3390
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3391
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3392
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3394
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3397
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3399
    .return($S3)
# }
.annotate 'line', 3400

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3372
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3407
# Body
# {
.annotate 'line', 3409
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3410
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3411
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3412
# rreg: $S4
    null $S4
.annotate 'line', 3413
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3415
    ne $S2, 'I', __label_6
.annotate 'line', 3416
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3418
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3419
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3421
    self.'annotate'(__ARG_1)
.annotate 'line', 3422
    __ARG_1.'say'('    ', 'repeat ', $S3, ', ', $S3, ', ', $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3425
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3426
    self.'annotate'(__ARG_1)
.annotate 'line', 3427
    __ARG_1.'say'('mul ', $S3, ', ', $S4)
 __label_3: # switch end
.annotate 'line', 3429
    .return($S3)
# }
.annotate 'line', 3430

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3405
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3437
# Body
# {
.annotate 'line', 3439
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3440
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3441
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3442
    self.'annotate'(__ARG_1)
.annotate 'line', 3443
    __ARG_1.'say'('div ', $S2, ', ', $S3)
.annotate 'line', 3444
    .return($S2)
# }
.annotate 'line', 3445

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3435
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 3452
# Body
# {
.annotate 'line', 3454
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3455
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3456
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3457
    self.'annotate'(__ARG_1)
.annotate 'line', 3458
    __ARG_1.'say'('mod ', $S2, ', ', $S3)
.annotate 'line', 3459
    .return($S2)
# }
.annotate 'line', 3460

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3450
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3467
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 3468
# Body
# {
.annotate 'line', 3470
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3471
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3472
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3473
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3474
    self.'annotate'(__ARG_1)
.annotate 'line', 3475
# aux: $S5
    null $S5
.annotate 'line', 3476
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3478
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3479
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3480
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3481
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3483
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3484
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3485
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3486
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3489
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3490
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3491
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3492
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3494
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3495
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3496
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3497
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3499
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3500
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3501
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3502
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3504
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3505
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3506
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3507
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3510
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
.annotate 'line', 3512
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3515
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3518
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3519
# }
.annotate 'line', 3521

.end # emit_comparator


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3522
# Body
# {
.annotate 'line', 3524
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3525

.end # emit


.sub 'emit_if' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3526
# Body
# {
.annotate 'line', 3528
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3529

.end # emit_if


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3530
# Body
# {
.annotate 'line', 3532
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3533

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3465
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3

.annotate 'line', 3546
# Body
# {
.annotate 'line', 3548
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3549
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3550
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3551

.end # NullCheckerExpr


.sub 'checkresult' :method

.annotate 'line', 3552
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method

.annotate 'line', 3553
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3554
# Body
# {
.annotate 'line', 3556
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3557
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3558
    .return(self)
# }
.annotate 'line', 3559

.end # negated


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3560
# Body
# {
.annotate 'line', 3562
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3563
    self.'annotate'(__ARG_1)
.annotate 'line', 3564
    __ARG_1.'say'('    ', 'isnull ', __ARG_2, ', ', $S1)
.annotate 'line', 3565
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3566
    __ARG_1.'say'('    ', 'not ', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3567

.end # emit


.sub 'emit_else' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 3568
# Body
# {
.annotate 'line', 3570
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3571
    self.'annotate'(__ARG_1)
.annotate 'line', 3572
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S2, 'unless'
    goto __label_1
 __label_2:
    set $S2, 'if'
 __label_1:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3573

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3541
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3543
    addattribute $P0, 'expr'
.annotate 'line', 3544
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3580
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3581
# Body
# {
.annotate 'line', 3583
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3584

.end # negated


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
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3591
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3592
    unless $I1 goto __label_0
# {
.annotate 'line', 3593
    unless $I2 goto __label_1
.annotate 'line', 3594
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3596
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3598
    unless $I2 goto __label_3
.annotate 'line', 3599
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3600
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_5
    $I3 = $P2.'isliteral'()
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 3601
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3602
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3603
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_9
    iseq $I3, $S2, 'S'
 __label_9:
    unless $I3 goto __label_8
# {
.annotate 'line', 3604
# ls: $S3
    getattribute $P4, $P1, 'strval'
    getattribute $P3, $P4, 'str'
    null $S3
    if_null $P3, __label_10
    set $S3, $P3
 __label_10:
.annotate 'line', 3605
# rs: $S4
    getattribute $P4, $P2, 'strval'
    getattribute $P3, $P4, 'str'
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
 __label_11:
.annotate 'line', 3606
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    iseq $I3, $S3, $S4
    .tailcall 'integerValue'($P3, $P4, $I3)
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3609
    .return(self)
# }
.annotate 'line', 3610

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3611
# Body
# {
.annotate 'line', 3613
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3614

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3615
# Body
# {
.annotate 'line', 3617
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3618

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3619
# Body
# {
.annotate 'line', 3621
    __ARG_1.'say'('    ', 'eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3622

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3623
# Body
# {
.annotate 'line', 3625
    __ARG_1.'say'('    ', 'ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3626

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3578
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3633
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3634
# Body
# {
.annotate 'line', 3636
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3637

.end # negated


.sub 'optimize' :method

.annotate 'line', 3638
# Body
# {
.annotate 'line', 3640
    self.'optimizearg'()
.annotate 'line', 3641
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3642
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3643
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3644
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3645
    unless $I1 goto __label_0
# {
.annotate 'line', 3646
    unless $I2 goto __label_1
.annotate 'line', 3647
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3649
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
$P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3651
    unless $I2 goto __label_3
.annotate 'line', 3652
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
$P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3653
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_5
    $I3 = $P2.'isliteral'()
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 3654
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3655
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3656
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_9
    iseq $I3, $S2, 'S'
 __label_9:
    unless $I3 goto __label_8
# {
.annotate 'line', 3657
# ls: $S3
    getattribute $P4, $P1, 'strval'
    getattribute $P3, $P4, 'str'
    null $S3
    if_null $P3, __label_10
    set $S3, $P3
 __label_10:
.annotate 'line', 3658
# rs: $S4
    getattribute $P4, $P2, 'strval'
    getattribute $P3, $P4, 'str'
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
 __label_11:
.annotate 'line', 3659
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    isne $I3, $S3, $S4
    .tailcall 'integerValue'($P3, $P4, $I3)
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3662
    .return(self)
# }
.annotate 'line', 3663

.end # optimize


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3664
# Body
# {
.annotate 'line', 3666
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3667

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3668
# Body
# {
.annotate 'line', 3670
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3671

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3672
# Body
# {
.annotate 'line', 3674
    __ARG_1.'say'('    ', 'ne ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
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
    __ARG_1.'say'('    ', 'eq ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3679

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3631
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

.annotate 'line', 3687
# Body
# {
.annotate 'line', 3689
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3690
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3691

.end # OpSameExpr


.sub 'isnegable' :method

.annotate 'line', 3692
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3693
# Body
# {
.annotate 'line', 3695
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3696
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
.annotate 'line', 3697

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3698
# Body
# {
.annotate 'line', 3700
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3701
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3702
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3703

.end # emitop


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3704
# Body
# {
.annotate 'line', 3706
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3707

.end # emit


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3708
# Body
# {
.annotate 'line', 3710
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3711
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3712
    __ARG_1.'say'('    ', $S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3713

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3714
# Body
# {
.annotate 'line', 3716
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3717
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3718
    __ARG_1.'say'('    ', $S1, ' ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3719

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3684
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3686
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3726
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3727
# Body
# {
.annotate 'line', 3729
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3730

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3731
# Body
# {
.annotate 'line', 3733
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3734

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3735
# Body
# {
.annotate 'line', 3737
    __ARG_1.'say'('    ', 'lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3738

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3739
# Body
# {
.annotate 'line', 3741
    __ARG_1.'say'('    ', 'ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3742

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3724
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3749
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3750
# Body
# {
.annotate 'line', 3752
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3753

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3754
# Body
# {
.annotate 'line', 3756
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3757

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3758
# Body
# {
.annotate 'line', 3760
    __ARG_1.'say'('    ', 'gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3761

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3762
# Body
# {
.annotate 'line', 3764
    __ARG_1.'say'('    ', 'le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3765

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3747
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3772
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3773
# Body
# {
.annotate 'line', 3775
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3776

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3777
# Body
# {
.annotate 'line', 3779
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3780

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3781
# Body
# {
.annotate 'line', 3783
    __ARG_1.'say'('    ', 'le ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3784

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3785
# Body
# {
.annotate 'line', 3787
    __ARG_1.'say'('    ', 'gt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3788

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3770
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method

.annotate 'line', 3795
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method

.annotate 'line', 3796
# Body
# {
.annotate 'line', 3798
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3799

.end # negated


.sub 'emitop' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3800
# Body
# {
.annotate 'line', 3802
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3803

.end # emitop


.sub 'emitop_if' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3804
# Body
# {
.annotate 'line', 3806
    __ARG_1.'say'('    ', 'ge ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3807

.end # emitop_if


.sub 'emitop_else' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3
.param string __ARG_4

.annotate 'line', 3808
# Body
# {
.annotate 'line', 3810
    __ARG_1.'say'('    ', 'lt ', __ARG_3, ', ', __ARG_4, ', ', __ARG_2)
# }
.annotate 'line', 3811

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3793
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method

.annotate 'line', 3818
# Body
# {
.annotate 'line', 3820
    .return('I')
# }
.annotate 'line', 3821

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3816
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method

.annotate 'line', 3828
# Body
# {
.annotate 'line', 3830
    self.'optimizearg'()
.annotate 'line', 3831
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3832
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3833
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3834
    eq $I1, 0, __label_1
.annotate 'line', 3835
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3837
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3839
    .return(self)
# }
.annotate 'line', 3840

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3841
# Body
# {
.annotate 'line', 3843
# res: $S1
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
.annotate 'line', 3844
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3845
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 3846
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 3847
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3850
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 3851
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3852
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3853
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3854
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 3856

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3826
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method

.annotate 'line', 3863
# Body
# {
.annotate 'line', 3865
    self.'optimizearg'()
.annotate 'line', 3866
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3867
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3868
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3869
    ne $I1, 0, __label_1
.annotate 'line', 3870
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3872
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3874
    .return(self)
# }
.annotate 'line', 3875

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3876
# Body
# {
.annotate 'line', 3878
# res: $S1
    null $S1
.annotate 'line', 3879
    if_null __ARG_2, __label_0
.annotate 'line', 3880
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 3882
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 3883
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 3884
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 3885
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 3886
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 3889
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 3890
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3891
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3892
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3893
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 3895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3861
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3900
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3908
# Body
# {
.annotate 'line', 3910
# res: $S1
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
.annotate 'line', 3911
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3912
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3913
    self.'annotate'(__ARG_1)
.annotate 'line', 3914
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3915

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3916
# Body
# {
.annotate 'line', 3918
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3919

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3906
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3926
# Body
# {
.annotate 'line', 3928
# res: $S1
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
.annotate 'line', 3929
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3930
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3931
    self.'annotate'(__ARG_1)
.annotate 'line', 3932
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3933

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3934
# Body
# {
.annotate 'line', 3936
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3937

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3924
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3944
# Body
# {
.annotate 'line', 3946
# res: $S1
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
.annotate 'line', 3947
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3948
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3949
    self.'annotate'(__ARG_1)
.annotate 'line', 3950
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3951

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 3952
# Body
# {
.annotate 'line', 3954
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3955

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3942
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 3963
# Body
# {
.annotate 'line', 3965
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3966
    isa $I1, __ARG_3, 'ConcatString'
    unless $I1 goto __label_0
# {
.annotate 'line', 3967
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 3968
    isa $I1, __ARG_4, 'ConcatString'
    unless $I1 goto __label_2
.annotate 'line', 3969
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 3971
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3973
    isa $I1, __ARG_4, 'ConcatString'
    unless $I1 goto __label_4
# {
.annotate 'line', 3974
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 3975
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3978
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 3979

.end # ConcatString


.sub 'checkresult' :method

.annotate 'line', 3980
# Body
# {
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
.param pmc __ARG_1

.annotate 'line', 3981
# Body
# {
.annotate 'line', 3983
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 3984
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 3985
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 3986
# i: $I2
    null $I2
# for loop
.annotate 'line', 3987
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 3988
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
$P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 3987
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 3989
    .return($P2)
# }
.annotate 'line', 3990

.end # getregs


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 3991
# Body
# {
.annotate 'line', 3993
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 3994
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 3995
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 3996
    self.'annotate'(__ARG_1)
.annotate 'line', 3997
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 3998
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 3999
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 3998
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4000
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4001

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4002
# Body
# {
.annotate 'line', 4004
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4005
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4006
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4007
    self.'annotate'(__ARG_1)
.annotate 'line', 4008
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4009
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4010
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4009
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4011
    .return($S1)
# }
.annotate 'line', 4012

.end # emit_get


.sub 'emit_concat_to' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4013
# Body
# {
.annotate 'line', 4015
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4016
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4017
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4018
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4019
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4018
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4020

.end # emit_concat_to


.sub 'emit_concat_set' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4021
# Body
# {
.annotate 'line', 4023
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4024
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4025
    self.'annotate'(__ARG_1)
.annotate 'line', 4026
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4027
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4028
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4027
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4029

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3960
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3962
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method

.annotate 'line', 4036
# Body
# {
.annotate 'line', 4038
    self.'optimizearg'()
.annotate 'line', 4039
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4040
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4041
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4042
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4043
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4044
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4045
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4046
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4047
# var t: $P5
    null $P5
.annotate 'line', 4048
# es: $S3
    getattribute $P10, $P3, 'str'
    null $S3
    if_null $P10, __label_6
    set $S3, $P10
 __label_6:
.annotate 'line', 4049
# rs: $S4
    getattribute $P10, $P4, 'str'
    null $S4
    if_null $P10, __label_7
    set $S4, $P10
 __label_7:
.annotate 'line', 4050
    isa $I3, $P3, 'TypeSingleQuoted'
    unless $I3 goto __label_10
    isa $I3, $P4, 'TypeSingleQuoted'
 __label_10:
    unless $I3 goto __label_8
.annotate 'line', 4051
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
    concat $S5, $S3, $S4
$P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_9
 __label_8: # else
.annotate 'line', 4053
    new $P13, [ 'TokenQuoted' ]
    getattribute $P14, $P3, 'file'
    getattribute $P15, $P3, 'line'
    concat $S6, $S3, $S4
$P13.'TokenQuoted'($P14, $P15, $S6)
    set $P5, $P13
 __label_9: # endif
.annotate 'line', 4054
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
$P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4056
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_12
    iseq $I3, $S2, 'I'
 __label_12:
    unless $I3 goto __label_11
# {
.annotate 'line', 4057
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4058
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4059
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4060
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4061
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_11: # endif
# {
.annotate 'line', 4064
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_13
    unless $P10 goto __label_13
# {
.annotate 'line', 4065
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4066
# lf: $N1
# predefined string
    set $S5, $P8
    set $N1, $S5
.annotate 'line', 4067
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4068
# rf: $N2
# predefined string
    set $S5, $P9
    set $N2, $S5
.annotate 'line', 4069
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_13: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4073
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_15
    iseq $I3, $S2, 'S'
 __label_15:
    unless $I3 goto __label_14
# {
.annotate 'line', 4074
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
$P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_14: # endif
.annotate 'line', 4076
    .return(self)
# }
.annotate 'line', 4077

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4078
# Body
# {
.annotate 'line', 4080
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4081
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4082
    ne $S1, $S2, __label_2
.annotate 'line', 4083
    .return($S1)
 __label_2: # endif
.annotate 'line', 4084
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4085
    .return('S')
 __label_3: # endif
.annotate 'line', 4086
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4087
    .return('S')
 __label_5: # endif
.annotate 'line', 4088
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4089
    .return('N')
 __label_7: # endif
.annotate 'line', 4090
    .return('I')
# }
.annotate 'line', 4091

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4092
# Body
# {
.annotate 'line', 4094
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4095
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4096
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4097
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4098
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4100
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4101
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4102
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4103
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4104
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4105
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4106
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4107
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4110
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4111
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4114
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4117
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4118
# l: $S7
    null $S7
.annotate 'line', 4119
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4121
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4122
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4124
# r: $S8
    null $S8
.annotate 'line', 4125
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4127
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4128
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4130
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4133
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4135

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4034
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method

.annotate 'line', 4142
# Body
# {
.annotate 'line', 4144
    self.'optimizearg'()
.annotate 'line', 4145
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4146
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4147
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4148
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4149
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4150
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4151
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4152
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4153
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4154
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4155
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4158
    .return(self)
# }
.annotate 'line', 4159

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4160
# Body
# {
.annotate 'line', 4162
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4163
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4164
    ne $S1, $S2, __label_2
.annotate 'line', 4165
    .return($S1)
 __label_2: # endif
.annotate 'line', 4166
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4167
    .return('N')
 __label_3: # endif
.annotate 'line', 4168
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4169
    .return('N')
 __label_5: # endif
.annotate 'line', 4170
    .return('I')
# }
.annotate 'line', 4171

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4172
# Body
# {
.annotate 'line', 4174
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4175
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4176
    __ARG_1.'say'('sub ', __ARG_2, ', ', $S1, ', ', $S2)
# }
.annotate 'line', 4177

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4140
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method

.annotate 'line', 4184
# Body
# {
.annotate 'line', 4186
    self.'optimizearg'()
.annotate 'line', 4187
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4188
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4189
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4190
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4191
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4192
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4193
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4194
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4195
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4196
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4197
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4200
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4201
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4202
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4203
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4204
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4205
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4209
    .return(self)
# }
.annotate 'line', 4210

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4211
# Body
# {
.annotate 'line', 4213
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4214
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4215
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4216
    ne $S1, $S2, __label_2
.annotate 'line', 4217
    .return($S1)
 __label_2: # endif
.annotate 'line', 4218
    ne $S1, 'S', __label_3
.annotate 'line', 4219
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4221
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4222

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4223
# Body
# {
.annotate 'line', 4225
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4226
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4227
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4228
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4229
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4230
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4231
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4232
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4233
# rval: $S5
    null $S5
.annotate 'line', 4234
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4236
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4239
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4240
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4242
    self.'annotate'(__ARG_1)
.annotate 'line', 4243
    __ARG_1.'say'('    ', 'repeat ', __ARG_2, ', ', $S3, ', ', $S5)
.annotate 'line', 4244
    .return()
# }
 __label_2: # endif
.annotate 'line', 4246
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
.annotate 'line', 4247
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4248
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4249
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4250
    .return()
# }
 __label_6: # endif
.annotate 'line', 4255
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4256
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4257
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4258
# rval: $S6
    null $S6
.annotate 'line', 4259
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4261
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4262
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4263
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4266
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4269
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4270
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4272
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4273
    self.'annotate'(__ARG_1)
.annotate 'line', 4274
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4276
    .return()
# }
 __label_10: # endif
.annotate 'line', 4279
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4280
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4281
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4282
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4285
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4286
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4288
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4289
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4290
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4293
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
.annotate 'line', 4295
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4296
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4299
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4303
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4304
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4305
# }
 __label_20: # endif
.annotate 'line', 4308
    self.'annotate'(__ARG_1)
.annotate 'line', 4309
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4310
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4311
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4312

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4182
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method

.annotate 'line', 4319
# Body
# {
.annotate 'line', 4321
    self.'optimizearg'()
.annotate 'line', 4322
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4323
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4324
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4325
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4326
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4327
# var lval: $P3
    null $P3
.annotate 'line', 4328
# var rval: $P4
    null $P4
.annotate 'line', 4329
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4330
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4331
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4332
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4333
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4334
    eq $I2, 0, __label_6
.annotate 'line', 4335
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
.annotate 'line', 4338
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4339
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4340
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4341
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4342
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4343
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4344
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
.annotate 'line', 4348
    .return(self)
# }
.annotate 'line', 4349

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 4350
# Body
# {
.annotate 'line', 4352
    .return('N')
# }
.annotate 'line', 4353

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4354
# Body
# {
.annotate 'line', 4356
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4357
# var aux: $P2
    null $P2
.annotate 'line', 4358
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4359
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4360
    $P2 = self.'tempreg'('N')
.annotate 'line', 4361
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4362
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4364
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4365
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4366
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4367
    $P2 = self.'tempreg'('N')
.annotate 'line', 4368
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4369
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4371
    self.'annotate'(__ARG_1)
.annotate 'line', 4372
    __ARG_1.'say'('div ', __ARG_2, ', ', $P3, ', ', $P5)
# }
.annotate 'line', 4373

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4317
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4380
# Body
# {
.annotate 'line', 4382
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4383
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4384
    self.'annotate'(__ARG_1)
.annotate 'line', 4385
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4386

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4387
# Body
# {
.annotate 'line', 4389
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4390

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4378
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method

.annotate 'line', 4397
# Body
# {
.annotate 'line', 4399
    .return('I')
# }
.annotate 'line', 4400

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4401
# Body
# {
.annotate 'line', 4403
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4404
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4405
    self.'annotate'(__ARG_1)
.annotate 'line', 4410
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4411

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4395
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4418
# Body
# {
.annotate 'line', 4420
# res: $S1
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
.annotate 'line', 4421
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4422
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4423
    self.'annotate'(__ARG_1)
.annotate 'line', 4424
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4425

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4426
# Body
# {
.annotate 'line', 4428
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4429

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4416
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4436
# Body
# {
.annotate 'line', 4438
# res: $S1
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
.annotate 'line', 4439
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4440
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4441
    self.'annotate'(__ARG_1)
.annotate 'line', 4442
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4443

.end # emit


.sub 'do_op' :method
.param int __ARG_1
.param int __ARG_2

.annotate 'line', 4444
# Body
# {
.annotate 'line', 4446
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4447

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4434
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4456
# Body
# {
.annotate 'line', 4458
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4459
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4460

.end # Argument


.sub 'optimize' :method

.annotate 'line', 4461
# Body
# {
.annotate 'line', 4463
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4464
    .return(self)
# }
.annotate 'line', 4465

.end # optimize


.sub 'hascompilevalue' :method

.annotate 'line', 4466
# Body
# {
.annotate 'line', 4468
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4469

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4454
    addattribute $P0, 'arg'
.annotate 'line', 4455
    addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 4479
# Body
# {
.annotate 'line', 4481
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4482
    setattribute self, 'start', __ARG_2
.annotate 'line', 4483
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4484
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4485
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4486
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4487
# {
.annotate 'line', 4488
# var modifier: $P3
    null $P3
.annotate 'line', 4489
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4490
    $P2 = __ARG_3.'get'()
.annotate 'line', 4491
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4492
    $P2 = __ARG_3.'get'()
.annotate 'line', 4493
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4494
    new $P6, [ 'ModifierList' ]
$P6.'ModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4495
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4498
    'InternalError'('Checking implementation')
# }
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4501
    new $P6, [ 'Argument' ]
$P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4502
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4503
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4504
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4505
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4506
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4508

.end # ArgumentList


.sub 'numargs' :method

.annotate 'line', 4509
# Body
# {
.annotate 'line', 4511
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4512
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4513

.end # numargs


.sub 'getrawargs' :method

.annotate 'line', 4514
# Body
# {
.annotate 'line', 4516
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4517

.end # getrawargs


.sub 'getarg' :method
.param int __ARG_1

.annotate 'line', 4518
# Body
# {
.annotate 'line', 4520
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4521
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4522

.end # getarg


.sub 'getfreearg' :method
.param int __ARG_1

.annotate 'line', 4523
# Body
# {
.annotate 'line', 4525
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4526
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4527

.end # getfreearg


.sub 'optimize' :method

.annotate 'line', 4528
# Body
# {
.annotate 'line', 4530
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4531
    if_null $P1, __label_0
.annotate 'line', 4532
    'optimize_array'($P1)
 __label_0: # endif
.annotate 'line', 4533
    .return(self)
# }
.annotate 'line', 4534

.end # optimize


.sub 'getargvalues' :method
.param pmc __ARG_1

.annotate 'line', 4535
# Body
# {
.annotate 'line', 4537
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4538
    unless_null $P1, __label_0
# {
.annotate 'line', 4539
    new $P2, ['ResizableStringArray']
.annotate 'line', 4540
# pnull: $S1
    set $S1, ''
.annotate 'line', 4541
    set $P1, $P2
.annotate 'line', 4542
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4543
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4544
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4545
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4546
# reg: $S2
    null $S2
.annotate 'line', 4547
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4549
    ne $S1, '', __label_6
# {
.annotate 'line', 4550
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4551
    __ARG_1.'emitnull'($S1)
.annotate 'line', 4552
    set $S2, $S1
# }
 __label_6: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4556
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4557
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4544
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4559
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4561
    .return($P1)
# }
.annotate 'line', 4562

.end # getargvalues


.sub 'emitargs' :method
.param pmc __ARG_1

.annotate 'line', 4563
# Body
# {
.annotate 'line', 4565
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4566
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4568
# sep: $S1
    set $S1, ''
.annotate 'line', 4569
# n: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# for loop
.annotate 'line', 4570
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4571
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4572
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4573
# isflat: $I3
    null $I3
# isnamed: $I4
    null $I4
.annotate 'line', 4574
# setname: $S3
    set $S3, ''
.annotate 'line', 4575
# var modifiers: $P3
    $P6 = $P1[$I2]
    getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4576
    if_null $P3, __label_3
# {
.annotate 'line', 4577
    $P6 = $P3.'getlist'()
    iter $P7, $P6
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4578
# name: $S4
    $P8 = $P4.'getname'()
    null $S4
    if_null $P8, __label_6
    set $S4, $P8
 __label_6:
.annotate 'line', 4579
    ne $S4, 'flat', __label_7
.annotate 'line', 4580
    set $I3, 1
 __label_7: # endif
.annotate 'line', 4581
    ne $S4, 'named', __label_8
# {
.annotate 'line', 4582
    set $I4, 1
.annotate 'line', 4583
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
.annotate 'line', 4587
# var argmod: $P5
    $P5 = $P4.'getarg'(0)
.annotate 'line', 4588
    $P8 = $P5.'isstringliteral'()
    isfalse $I7, $P8
    unless $I7 goto __label_13
.annotate 'line', 4589
    getattribute $P9, self, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_13: # endif
.annotate 'line', 4590
    $P10 = $P5.'getPirString'()
    set $S3, $P10
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 4593
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
.annotate 'line', 4598
    and $I5, $I3, $I4
    unless $I5 goto __label_14
.annotate 'line', 4599
    __ARG_1.'print'(' :flat :named')
    goto __label_15
 __label_14: # else
.annotate 'line', 4600
    unless $I3 goto __label_16
.annotate 'line', 4601
    __ARG_1.'print'(' :flat')
    goto __label_17
 __label_16: # else
.annotate 'line', 4602
    unless $I4 goto __label_18
# {
.annotate 'line', 4603
    __ARG_1.'print'(' :named')
.annotate 'line', 4604
    eq $S3, '', __label_19
.annotate 'line', 4605
    __ARG_1.'print'("(", $S3, ")")
 __label_19: # endif
# }
 __label_18: # endif
 __label_17: # endif
 __label_15: # endif
.annotate 'line', 4607
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4570
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4609

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4474
    addattribute $P0, 'owner'
.annotate 'line', 4475
    addattribute $P0, 'start'
.annotate 'line', 4476
    addattribute $P0, 'args'
.annotate 'line', 4477
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
.param pmc __ARG_1

.annotate 'line', 4612
# Body
# {
.annotate 'line', 4614
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4615
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4616
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4617
    .return(1)
# }
.annotate 'line', 4618

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4627
# Body
# {
.annotate 'line', 4629
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4630
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4631
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4632

.end # CallPredefExpr


.sub 'checkresult' :method

.annotate 'line', 4633
# Body
# {
.annotate 'line', 4635
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4636

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4637
# Body
# {
.annotate 'line', 4639
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4640
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4641
    new $P3, ['ResizableStringArray']
.annotate 'line', 4642
# var arg: $P4
    null $P4
.annotate 'line', 4643
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4644
# pnull: $S1
    set $S1, ''
.annotate 'line', 4645
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4647
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4648
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4650
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4651
    ne $S1, '', __label_8
# {
.annotate 'line', 4652
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4653
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4655
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4657
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4661
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4662
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4663
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4664
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4665
    .return()
 __label_1: # default
.annotate 'line', 4667
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4668
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4669
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4670
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4671
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4672
# argr: $S5
    null $S5
.annotate 'line', 4673
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4674
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
.annotate 'line', 4678
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4679
    __ARG_1.'emitnull'($S5)
 __label_19: # default
.annotate 'line', 4681
    ne $S1, '', __label_23
# {
.annotate 'line', 4682
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4683
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4685
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4689
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4690
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4692
# aux: $S6
    null $S6
.annotate 'line', 4693
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4694
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
.annotate 'line', 4696
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
.annotate 'line', 4700
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4701
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4704
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4710
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4711
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4714
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4718
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4668
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4721
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4722

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4622
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4624
    addattribute $P0, 'predef'
.annotate 'line', 4625
    addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4732
# Body
# {
.annotate 'line', 4734
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4735
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4736
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4737
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4738
    __ARG_1.'unget'($P1)
.annotate 'line', 4739
    new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4741

.end # CallExpr


.sub 'checkresult' :method

.annotate 'line', 4742
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4743
# Body
# {
.annotate 'line', 4745
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4746
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4747
# nargs: $I1
    null $I1
.annotate 'line', 4748
    if_null $P2, __label_0
# {
.annotate 'line', 4749
    $P2 = $P2.'optimize'()
.annotate 'line', 4750
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4753
    isa $I2, $P1, 'MemberExpr'
    unless $I2 goto __label_1
.annotate 'line', 4754
    new $P7, [ 'CallMemberExpr' ]
$P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4755
    isa $I2, $P1, 'MemberRefExpr'
    unless $I2 goto __label_2
.annotate 'line', 4756
    new $P7, [ 'CallMemberRefExpr' ]
$P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4759
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4760
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4761
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4762
    if_null $P3, __label_5
# {
.annotate 'line', 4763
    self.'use_predef'($S1)
.annotate 'line', 4764
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4767
    isa $I2, $P3, 'PredefFunctionEval'
    unless $I2 goto __label_8
# {
.annotate 'line', 4768
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4769
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4770
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4774
    new $P7, [ 'CallPredefExpr' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
$P7.'CallPredefExpr'($P8, $P9, $P3, $P4)
    set $P6, $P7
    .return($P6)
# }
 __label_5: # endif
# }
 __label_3: # endif
.annotate 'line', 4778
    setattribute self, 'funref', $P1
.annotate 'line', 4779
    setattribute self, 'args', $P2
.annotate 'line', 4780
    .return(self)
# }
.annotate 'line', 4781

.end # optimize


.sub 'cantailcall' :method

.annotate 'line', 4782
# Body
# {
.annotate 'line', 4784
    .return(1)
# }
.annotate 'line', 4785

.end # cantailcall


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4786
# Body
# {
.annotate 'line', 4788
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4789
# call: $S1
    null $S1
.annotate 'line', 4790
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4791
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 4792
    ne $S1, '', __label_2
.annotate 'line', 4793
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
 __label_2: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4796
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 4797
    .return($S1)
# }
.annotate 'line', 4798

.end # emitcall


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4799
# Body
# {
.annotate 'line', 4801
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4802
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4803
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4804
    if_null $P2, __label_1
.annotate 'line', 4805
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 4807
    self.'annotate'(__ARG_1)
.annotate 'line', 4809
    __ARG_1.'print'('    ')
.annotate 'line', 4810
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 4811
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 4812
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 4814
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 4817
    __ARG_1.'print'($S1)
.annotate 'line', 4818
    __ARG_1.'print'('(')
.annotate 'line', 4819
    if_null $P2, __label_6
.annotate 'line', 4820
    $P2.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 4821
    __ARG_1.'say'(')')
# }
.annotate 'line', 4822

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4727
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4729
    addattribute $P0, 'funref'
.annotate 'line', 4730
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4832
# Body
# {
.annotate 'line', 4834
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4835
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4836
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4837

.end # CallMemberExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4838
# Body
# {
.annotate 'line', 4840
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4841
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 4842
    $P5 = $P1.'get_member'()
.annotate 'line', 4841
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 4843

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 4830
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4851
# Body
# {
.annotate 'line', 4853
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4854
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4855
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4856

.end # CallMemberRefExpr


.sub 'emitcall' :method
.param pmc __ARG_1

.annotate 'line', 4857
# Body
# {
.annotate 'line', 4859
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4860
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 4861
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 4862
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 4863
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 4866
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 4867
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 4868
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 4869

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 4849
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 4877
# Body
# {
.annotate 'line', 4879
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4880
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 4881

.end # MemberExprBase


.sub 'emit_left_get' :method
.param pmc __ARG_1

.annotate 'line', 4882
# Body
# {
.annotate 'line', 4884
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 4885
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4886
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4887
    eq $S1, 'P', __label_2
# {
.annotate 'line', 4888
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 4889
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 4890
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 4892
    .return($S2)
# }
.annotate 'line', 4893

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 4874
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4876
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4900
# Body
# {
.annotate 'line', 4902
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4903
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4904

.end # MemberExpr


.sub 'checkresult' :method

.annotate 'line', 4905
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4906
# Body
# {
.annotate 'line', 4908
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 4909
    .return(self)
# }
.annotate 'line', 4910

.end # optimize


.sub 'get_member' :method

.annotate 'line', 4911
# Body
# {
.annotate 'line', 4913
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 4914

.end # get_member


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 4915
# Body
# {
.annotate 'line', 4917
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4918
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4919
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 4920
    self.'annotate'(__ARG_1)
.annotate 'line', 4921
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4922
    .return($S3)
# }
.annotate 'line', 4923

.end # emit_get


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4924
# Body
# {
.annotate 'line', 4926
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4927
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4928
    self.'annotate'(__ARG_1)
.annotate 'line', 4929
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4930

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4931
# Body
# {
.annotate 'line', 4933
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4934

.end # emit_init


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 4935
# Body
# {
.annotate 'line', 4937
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4938
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4939
# value: $S3
    null $S3
.annotate 'line', 4940
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4942
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4943
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 4944
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 4946
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4949
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 4950
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 4952
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4953

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4954
# Body
# {
.annotate 'line', 4956
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4957
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4958
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 4959
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 4960
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 4962
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 4963
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 4964
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 4966
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 4968
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4969
    .return($S3)
# }
.annotate 'line', 4970

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4896
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 4898
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 4978
# Body
# {
.annotate 'line', 4980
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4981
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4982

.end # MemberRefExpr


.sub 'checkresult' :method

.annotate 'line', 4983
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 4984
# Body
# {
.annotate 'line', 4986
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 4987
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 4988
    .return(self)
# }
.annotate 'line', 4989

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 4990
# Body
# {
.annotate 'line', 4993
    getattribute $P1, self, 'start'
.annotate 'line', 4992
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 4994

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 4975
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 4977
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5005
# Body
# {
.annotate 'line', 5007
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5008
    setattribute self, 'left', __ARG_4
.annotate 'line', 5009
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5010

.end # IndexExpr


.sub 'checkresult' :method

.annotate 'line', 5011
# Body
# {
.annotate 'line', 5013
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5014
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5016
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5017

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5018
# Body
# {
.annotate 'line', 5020
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5021
    setattribute self, 'left', $P1
.annotate 'line', 5022
    self.'optimizeargs'()
.annotate 'line', 5026
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5027
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5028
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5029
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5030
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5031
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5032
# predefined substr
    substr $S2, $S1, $I1, 1
$P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5033
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
$P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5036
    .return(self)
# }
.annotate 'line', 5037

.end # optimize


.sub 'emit_prep' :method
.param pmc __ARG_1

.annotate 'line', 5038
# Body
# {
.annotate 'line', 5040
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5041
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5042
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5043
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5044
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5045
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5047
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5048
    setattribute self, 'regleft', $P1
.annotate 'line', 5049
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5050
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5051

.end # emit_prep


.sub 'emit_aux' :method
.param pmc __ARG_1

.annotate 'line', 5052
# Body
# {
.annotate 'line', 5054
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5055
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5056
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5057
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5058
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5059
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5060
    __ARG_1.'print'(']')
# }
.annotate 'line', 5061

.end # emit_aux


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5062
# Body
# {
.annotate 'line', 5064
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5065
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5066
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5067
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5068
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5069
    eq $I1, 1, __label_3
.annotate 'line', 5070
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5071
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5072
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5073
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5076
    self.'annotate'(__ARG_1)
.annotate 'line', 5077
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5078
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5079
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5081

.end # emit


.sub 'emit_assign' :method
.param pmc __ARG_1
.param string __ARG_2
.param string __ARG_3

.annotate 'line', 5082
# Body
# {
.annotate 'line', 5084
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5085
    self.'annotate'(__ARG_1)
.annotate 'line', 5086
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5087
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5088

.end # emit_assign


.sub 'emit_assign_get' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5089
# Body
# {
.annotate 'line', 5091
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5092
# rreg: $S1
    null $S1
.annotate 'line', 5093
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5094
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5095
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5098
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5099
    self.'annotate'(__ARG_1)
.annotate 'line', 5100
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5101
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5102
    .return($S1)
# }
.annotate 'line', 5103

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 4999
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5001
    addattribute $P0, 'left'
.annotate 'line', 5002
    addattribute $P0, 'regleft'
.annotate 'line', 5003
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5112
# Body
# {
.annotate 'line', 5114
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5115
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5116
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5117
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5118
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5119
# {
.annotate 'line', 5120
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5121
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5122
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5123
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5124
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5126

.end # ArrayExpr


.sub 'checkresult' :method

.annotate 'line', 5127
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5128
# Body
# {
.annotate 'line', 5130
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5131
    .return(self)
# }
.annotate 'line', 5132

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5133
# Body
# {
.annotate 'line', 5135
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5136
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5137
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5143
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5145

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5146
# Body
# {
.annotate 'line', 5148
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5149
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5150
    .return($S1)
# }
.annotate 'line', 5151

.end # emit_get


.sub 'emit_init' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 5152
# Body
# {
.annotate 'line', 5154
    self.'annotate'(__ARG_1)
.annotate 'line', 5155
# itemreg: $S1
    null $S1
.annotate 'line', 5156
# it_p: $S2
    null $S2
.annotate 'line', 5157
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5158
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5159
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5161
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5162
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5163
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
.annotate 'line', 5165
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5166
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5167
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5168
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5172
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5173
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5174
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5175
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5179
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5181
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5182
    self.'annotate'(__ARG_1)
.annotate 'line', 5183
    __ARG_1.'say'('    ', 'push ', __ARG_2, ", ", $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5186

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5108
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5110
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5196
# Body
# {
.annotate 'line', 5198
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5199
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5200
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5201
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5202
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5203
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5204
# {
.annotate 'line', 5205
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5206
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5207
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5208
# predefined push
    push $P2, $P4
.annotate 'line', 5209
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5211
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5212
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5213
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5215
    setattribute self, 'keys', $P2
.annotate 'line', 5216
    setattribute self, 'values', $P3
# }
.annotate 'line', 5217

.end # HashExpr


.sub 'checkresult' :method

.annotate 'line', 5218
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method

.annotate 'line', 5219
# Body
# {
.annotate 'line', 5221
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5222
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5223
    .return(self)
# }
.annotate 'line', 5224

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5225
# Body
# {
.annotate 'line', 5227
    self.'annotate'(__ARG_1)
.annotate 'line', 5232
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5233
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5235
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5236
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5237
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5238
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5239
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5240
# item: $S1
    null $S1
.annotate 'line', 5241
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5242
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5243
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5244
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5247
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5249
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5250
# itemreg: $S3
    null $S3
.annotate 'line', 5251
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5252
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5253
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5254
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5257
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5258
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5259
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5260
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5262
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5263
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5264
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5265
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5268
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5272
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5273
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5274
    __ARG_1.'say'(__ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5238
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5276

.end # emit


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 5277
# Body
# {
.annotate 'line', 5279
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5280
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5281
    .return($S1)
# }
.annotate 'line', 5282

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5191
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5193
    addattribute $P0, 'keys'
.annotate 'line', 5194
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method

.annotate 'line', 5291
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
.param pmc __ARG_1

.annotate 'line', 5292
# Body
# {
.annotate 'line', 5296
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5297
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5298
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5299
    __ARG_1.'unget'($P2)
.annotate 'line', 5300
# var initializer: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
 __label_1: # do
.annotate 'line', 5301
# {
.annotate 'line', 5302
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5303
# predefined push
    push $P3, $P4
# }
 __label_3: # continue
.annotate 'line', 5304
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5305
    setattribute self, 'initializer', $P3
.annotate 'line', 5306
    'RequireOp'(')', $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 5308

.end # parseinitializer


.sub 'optimize' :method

.annotate 'line', 5309
# Body
# {
.annotate 'line', 5311
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5312
    if_null $P1, __label_0
.annotate 'line', 5313
    'optimize_array'($P1)
 __label_0: # endif
.annotate 'line', 5314
    .return(self)
# }
.annotate 'line', 5315

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5287
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5289
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5324
# Body
# {
.annotate 'line', 5326
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5328
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5329
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5330
    setattribute self, 'value', __ARG_4
.annotate 'line', 5331
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5333
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5334
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5336
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5337

.end # NewExpr


.sub 'optimize' :method

.annotate 'line', 5338
# Body
# {
.annotate 'line', 5340
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5341
    isa $I1, $P1, 'Token'
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5344
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5345
# var desc: $P3
    getattribute $P5, self, 'owner'
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 5346
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5347
    $P5 = $P3.'getid'()
    unless_null $P5, __label_4
# {
.annotate 'line', 5348
    $P1 = $P3.'getvalue'()
.annotate 'line', 5349
    isa $I2, $P1, 'StringLiteral'
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5350
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5351
    getattribute $P6, $P1, 'strval'
    setattribute self, 'value', $P6
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5354
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5358
# var initializer: $P4
    getattribute $P4, self, 'initializer'
.annotate 'line', 5359
    if_null $P4, __label_7
.annotate 'line', 5360
    getattribute $P5, self, 'initializer'
    'optimize_array'($P5)
 __label_7: # endif
.annotate 'line', 5361
    .return(self)
# }
.annotate 'line', 5362

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional

.annotate 'line', 5363
# Body
# {
.annotate 'line', 5365
    self.'annotate'(__ARG_1)
.annotate 'line', 5367
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5368
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5371
# type: $I2
    getattribute $P9, self, 'value'
    $P8 = $P9.'isstring'()
    if_null $P8, __label_3
    unless $P8 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5372
    getattribute $P11, self, 'value'
    $P10 = $P11.'isidentifier'()
    if_null $P10, __label_5
    unless $P10 goto __label_5
    set $I2, 1
    goto __label_4
 __label_5:
    set $I2, -1
 __label_4:
 __label_2:
.annotate 'line', 5374
# reginit: $S1
    set $S1, ''
.annotate 'line', 5375
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_6
    set $S2, $P8
 __label_6:
.annotate 'line', 5376
# constructor: $S3
    null $S3
.annotate 'line', 5377
    set $I3, $I1
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_8
# switch
 __label_9: # case
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 5381
    ne $I2, 1, __label_11
# {
.annotate 'line', 5382
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 5383
    $P8 = self.'tempreg'('P')
    set $S2, $P8
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
# {
.annotate 'line', 5386
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5387
    $P8 = $P2.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 5388
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_12: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5392
    eq $I2, 1, __label_14
.annotate 'line', 5393
    getattribute $P8, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P8)
 __label_14: # endif
.annotate 'line', 5394
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 5395
    $P9 = self.'tempreg'('P')
    set $S2, $P9
 __label_15: # endif
 __label_7: # switch end
.annotate 'line', 5398
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_18
    set $I4, 1
    if $I3 == $I4 goto __label_19
    goto __label_17
# switch
 __label_18: # case
.annotate 'line', 5401
# name: $S4
    getattribute $P9, self, 'value'
    $P8 = $P9.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
 __label_20:
.annotate 'line', 5402
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5403
    isnull $I5, $P3
    unless $I5 goto __label_22
    $I5 = self.'dowarnings'()
 __label_22:
    unless $I5 goto __label_21
.annotate 'line', 5404
    concat $S6, "Can't locate class ", $S4
    concat $S6, $S6, " at compile time"
    getattribute $P10, self, 'value'
    'Warn'($S6, $P10)
 __label_21: # endif
.annotate 'line', 5408
    getattribute $P11, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5409
    le $I1, 1, __label_23
# {
.annotate 'line', 5410
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
 __label_23: # endif
    goto __label_16 # break
 __label_19: # case
.annotate 'line', 5414
# var id: $P4
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P4 = $P8.'getvar'($P9)
.annotate 'line', 5415
    unless_null $P4, __label_24
# {
.annotate 'line', 5417
# var cl: $P5
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'value'
    $P5 = $P10.'checkclass'($P11)
.annotate 'line', 5418
    if_null $P5, __label_26
# {
.annotate 'line', 5419
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
# }
    goto __label_27
 __label_26: # else
# {
.annotate 'line', 5422
    $P8 = self.'dowarnings'()
    if_null $P8, __label_28
    unless $P8 goto __label_28
.annotate 'line', 5423
    'Warn'('Checking: new unknown type')
 __label_28: # endif
.annotate 'line', 5424
    getattribute $P8, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P8, "']", $S1)
# }
 __label_27: # endif
.annotate 'line', 5426
    getattribute $P8, self, 'value'
    set $S3, $P8
# }
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 5430
    $P8 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
 __label_25: # endif
    goto __label_16 # break
 __label_17: # default
.annotate 'line', 5434
    'InternalError'('Unexpected type in new')
 __label_16: # switch end
.annotate 'line', 5436
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isgt $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
 __label_31:
 __label_30:
    unless $I3 goto __label_29
# {
.annotate 'line', 5437
    new $P6, ['ResizableStringArray']
.annotate 'line', 5438
    iter $P13, $P1
    set $P13, 0
 __label_32: # for iteration
    unless $P13 goto __label_33
    shift $P7, $P13
# {
.annotate 'line', 5439
# reg: $S5
    $P8 = $P7.'emit_get'(__ARG_1)
    null $S5
    if_null $P8, __label_34
    set $S5, $P8
 __label_34:
.annotate 'line', 5440
# predefined push
    push $P6, $S5
# }
    goto __label_32
 __label_33: # endfor
.annotate 'line', 5442
    __ARG_1.'print'($S2, ".'", $S3, "'(")
.annotate 'line', 5443
# predefined join
    join $S6, ", ", $P6
    __ARG_1.'print'($S6)
.annotate 'line', 5444
    __ARG_1.'say'(")")
.annotate 'line', 5445
    not $I3, __ARG_3
    unless $I3 goto __label_35
.annotate 'line', 5446
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_35: # endif
# }
 __label_29: # endif
# }
.annotate 'line', 5448

.end # emit


.sub 'emit_init' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5449
# Body
# {
.annotate 'line', 5451
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5452

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5320
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5322
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5461
# Body
# {
.annotate 'line', 5463
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5464
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5465
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
$P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5466
    setattribute self, 'nskey', $P1
.annotate 'line', 5467
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5468
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5469
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5471
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5472

.end # NewIndexedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5473
# Body
# {
.annotate 'line', 5475
# reginit: $S1
    null $S1
.annotate 'line', 5476
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5477
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5478
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
.annotate 'line', 5482
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5483
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5486
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5488
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5489
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5490
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5491
    __ARG_1.'print'('    ', 'new ', __ARG_2, ", ")
.annotate 'line', 5492
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5493
    if_null $S1, __label_7
.annotate 'line', 5494
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5495
    __ARG_1.'say'()
# }
.annotate 'line', 5496

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5457
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5459
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5505
# Body
# {
.annotate 'line', 5507
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5508
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5509
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
$P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5510
    setattribute self, 'nskey', $P1
.annotate 'line', 5511
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5512
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5513
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5515
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5516

.end # NewQualifiedExpr


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5517
# Body
# {
.annotate 'line', 5519
# reginit: $S1
    null $S1
.annotate 'line', 5520
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5522
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5523
# regnew: $S2
    set $P5, __ARG_2
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 5524
    le $I1, 0, __label_3
.annotate 'line', 5525
    $P5 = self.'tempreg'('P')
    set $S2, $P5
 __label_3: # endif
.annotate 'line', 5526
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5527
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5528
    getattribute $P5, self, 'owner'
    $P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5529
    __ARG_1.'say'()
.annotate 'line', 5531
    le $I1, 0, __label_4
# {
.annotate 'line', 5532
    new $P3, ['ResizableStringArray']
.annotate 'line', 5533
    iter $P6, $P1
    set $P6, 0
 __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P4, $P6
# {
.annotate 'line', 5534
# reg: $S3
    $P5 = $P4.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 5535
# predefined push
    push $P3, $S3
# }
    goto __label_5
 __label_6: # endfor
.annotate 'line', 5537
# constructor: $S4
    $P5 = $P2.'last'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
 __label_8:
.annotate 'line', 5538
    __ARG_1.'print'($S2, ".'", $S4, "'(")
.annotate 'line', 5539
# predefined join
    join $S5, ", ", $P3
    __ARG_1.'print'($S5)
.annotate 'line', 5540
    __ARG_1.'say'(")")
.annotate 'line', 5541
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5543

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5501
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5503
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 5548
# Body
# {
.annotate 'line', 5550
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5552
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5554
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5555
    new $P7, [ 'StringLiteral' ]
$P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
$P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5554
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5557
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5559
    new $P5, [ 'NewIndexedExpr' ]
$P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5561
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5564
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5565
    __ARG_1.'unget'($P2)
.annotate 'line', 5566
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5568
    new $P5, [ 'NewQualifiedExpr' ]
$P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5572
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
.annotate 'line', 5577
    new $P4, [ 'NewExpr' ]
$P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5579

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 5588
# Body
# {
.annotate 'line', 5590
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5591
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5592
    $P2 = __ARG_4.'get'()
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5593

.end # OpInstanceOfExpr


.sub 'checkresult' :method

.annotate 'line', 5594
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5595
# Body
# {
.annotate 'line', 5597
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5598
# checkedval: $S1
    null $S1
.annotate 'line', 5599
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 5600
    $P3 = $P1.'getidentifier'()
    set $S1, $P3
.annotate 'line', 5601
    concat $S0, "'", $S1
    concat $S0, $S0, "'"
    set $S1, $S0
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5604
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5605
# r: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5606
    self.'annotate'(__ARG_1)
.annotate 'line', 5607
    __ARG_1.'say'('    ', 'isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5608

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5583
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5585
    addattribute $P0, 'lexpr'
.annotate 'line', 5586
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 5623
# Body
# {
.annotate 'line', 5625
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5626
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5627
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5628
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5629
    .return(self)
# }
.annotate 'line', 5630

.end # set


.sub 'optimize' :method

.annotate 'line', 5631
# Body
# {
.annotate 'line', 5633
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5634
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
.annotate 'line', 5636
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5638
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5640
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5641
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5642
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5644

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 5645
# Body
# {
.annotate 'line', 5647
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5648

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5649
# Body
# {
.annotate 'line', 5651
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5652
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5653
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5654
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5655
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5656
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5657
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5658
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5659

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5613
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5619
    addattribute $P0, 'condition'
.annotate 'line', 5620
    addattribute $P0, 'etrue'
.annotate 'line', 5621
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
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2'
.param pmc __ARG_1

.annotate 'line', 5701
# Body
# {
.annotate 'line', 5703
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
.annotate 'line', 5704
    .return(1)
 __label_3: # case
.annotate 'line', 5705
    .return(2)
 __label_4: # case
.annotate 'line', 5706
    .return(3)
 __label_1: # default
.annotate 'line', 5707
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5709

.end # getOpCode_2


.sub 'getOpCode_4'
.param pmc __ARG_1

.annotate 'line', 5711
# Body
# {
.annotate 'line', 5713
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
.annotate 'line', 5714
    .return(8)
 __label_3: # case
.annotate 'line', 5715
    .return(11)
 __label_4: # case
.annotate 'line', 5716
    .return(9)
 __label_5: # case
.annotate 'line', 5717
    .return(10)
 __label_1: # default
.annotate 'line', 5719
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5720
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5721
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5723

.end # getOpCode_4


.sub 'getOpCode_5'
.param pmc __ARG_1

.annotate 'line', 5725
# Body
# {
.annotate 'line', 5727
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
.annotate 'line', 5728
    .return(19)
 __label_3: # case
.annotate 'line', 5729
    .return(20)
 __label_4: # case
.annotate 'line', 5730
    .return(21)
 __label_5: # case
.annotate 'line', 5731
    .return(22)
 __label_1: # default
.annotate 'line', 5732
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5734

.end # getOpCode_5


.sub 'getOpCode_7'
.param pmc __ARG_1

.annotate 'line', 5736
# Body
# {
.annotate 'line', 5738
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5739
    .return(28)
 __label_3: # case
.annotate 'line', 5740
    .return(29)
 __label_1: # default
.annotate 'line', 5741
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5743

.end # getOpCode_7


.sub 'getOpCode_8'
.param pmc __ARG_1

.annotate 'line', 5745
# Body
# {
.annotate 'line', 5747
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
.annotate 'line', 5748
    .return(14)
 __label_3: # case
.annotate 'line', 5749
    .return(16)
 __label_4: # case
.annotate 'line', 5750
    .return(15)
 __label_5: # case
.annotate 'line', 5751
    .return(17)
 __label_1: # default
.annotate 'line', 5753
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5754
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5756

.end # getOpCode_8


.sub 'getOpCode_9'
.param pmc __ARG_1

.annotate 'line', 5758
# Body
# {
.annotate 'line', 5760
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
.annotate 'line', 5761
    .return(12)
 __label_3: # case
.annotate 'line', 5762
    .return(13)
 __label_4: # case
.annotate 'line', 5763
    .return(25)
 __label_5: # case
.annotate 'line', 5764
    .return(26)
 __label_1: # default
.annotate 'line', 5765
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5767

.end # getOpCode_9


.sub 'getOpCode_16'
.param pmc __ARG_1

.annotate 'line', 5769
# Body
# {
.annotate 'line', 5771
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
.annotate 'line', 5772
    .return(4)
 __label_3: # case
.annotate 'line', 5773
    .return(5)
 __label_4: # case
.annotate 'line', 5774
    .return(6)
 __label_5: # case
.annotate 'line', 5775
    .return(18)
 __label_6: # case
.annotate 'line', 5776
    .return(23)
 __label_7: # case
.annotate 'line', 5777
    .return(24)
 __label_8: # case
.annotate 'line', 5778
    .return(30)
 __label_1: # default
.annotate 'line', 5779
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5781

.end # getOpCode_16


.sub 'parseExpr_0'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5783
# Body
# {
.annotate 'line', 5785
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5787
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5788
# var expr: $P2
    null $P2
.annotate 'line', 5789
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 5790
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5791
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 5792
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 5794
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5795
    new $P6, [ 'ArrayExpr' ]
$P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 5796
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5797
    new $P6, [ 'HashExpr' ]
$P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 5798
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5799
    new $P6, [ 'StringLiteral' ]
$P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 5800
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5801
    new $P6, [ 'IntegerLiteral' ]
$P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 5802
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 5803
    new $P6, [ 'FloatLiteral' ]
$P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 5804
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'new'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 5806
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 5808
    new $P6, [ 'FunctionExpr' ]
$P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 5810
    new $P8, [ 'OpClassExpr' ]
$P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 5812
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 5813
    new $P6, [ 'IdentifierExpr' ]
$P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 5814
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5815

.end # parseExpr_0


.sub 'parseExpr_2'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5817
# Body
# {
.annotate 'line', 5819
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5820
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 5822
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5823
# var t: $P2
    null $P2
.annotate 'line', 5824
# var start: $P3
    null $P3
.annotate 'line', 5825
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5826
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5827
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
.annotate 'line', 5829
    new $P8, [ 'CallExpr' ]
$P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5832
    new $P9, [ 'IndexExpr' ]
$P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5835
    set $P3, $P2
.annotate 'line', 5836
    $P2 = __ARG_1.'get'()
.annotate 'line', 5837
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 5838
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5839
    new $P7, [ 'MemberRefExpr' ]
$P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5842
    new $P7, [ 'MemberExpr' ]
$P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5845
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5848
    __ARG_1.'unget'($P2)
.annotate 'line', 5849
    .return($P1)
# }
.annotate 'line', 5850

.end # parseExpr_2


.sub 'parseExpr_3'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5852
# Body
# {
.annotate 'line', 5854
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5856
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5857
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5858
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 5859
    new $P5, [ 'OpPostIncExpr' ]
    .tailcall $P5.'set'(__ARG_2, $P2, $P1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5860
    $P6 = $P2.'isop'('--')
    if_null $P6, __label_2
    unless $P6 goto __label_2
.annotate 'line', 5861
    new $P7, [ 'OpPostDecExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5864
    __ARG_1.'unget'($P2)
.annotate 'line', 5865
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5867

.end # parseExpr_3


.sub 'parseExpr_4'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5869
# Body
# {
.annotate 'line', 5871
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5872
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5873
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5875
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5876
# code: $I1
    $P7 = $P6($P1)
    set $I1, $P7
.annotate 'line', 5877
# var subexpr: $P2
    null $P2
.annotate 'line', 5878
    eq $I1, 0, __label_0
# {
.annotate 'line', 5879
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5880
# var oper: $P3
    null $P3
.annotate 'line', 5881
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
    set $I3, 32
    if $I2 == $I3 goto __label_9
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 5883
    new $P3, [ 'OpUnaryMinusExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5886
    new $P3, [ 'OpNotExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5889
    new $P3, [ 'OpPreIncExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 5892
    new $P3, [ 'OpPreDecExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 5895
    new $P3, [ 'OpDeleteExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 5898
    new $P3, [ 'OpExistsExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5901
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
.annotate 'line', 5903
    $P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5906
    __ARG_1.'unget'($P1)
.annotate 'line', 5907
    $P2 = $P5(__ARG_1, __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 5909
    .return($P2)
# }
.annotate 'line', 5910

.end # parseExpr_4


.sub 'parseExpr_5'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5912
# Body
# {
.annotate 'line', 5914
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5915
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5917
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5918
# var t: $P2
    null $P2
.annotate 'line', 5919
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5920
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5921
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5922
# var aux: $P4
    null $P4
.annotate 'line', 5923
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
.annotate 'line', 5925
    new $P4, [ 'OpMulExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5928
    new $P4, [ 'OpDivExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5931
    new $P4, [ 'OpModExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 5934
    new $P4, [ 'OpCModExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5937
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
.annotate 'line', 5939
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5940
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5942
    __ARG_1.'unget'($P2)
.annotate 'line', 5943
    .return($P1)
# }
.annotate 'line', 5944

.end # parseExpr_5


.sub 'parseExpr_6'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5946
# Body
# {
.annotate 'line', 5948
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5950
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5951
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 5952
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 5953
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5954
# var expr: $P4
    null $P4
.annotate 'line', 5955
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 5956
    new $P7, [ 'OpAddExpr' ]
    $P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
    goto __label_4
 __label_3: # else
.annotate 'line', 5958
    new $P8, [ 'OpSubExpr' ]
    $P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
 __label_4: # endif
.annotate 'line', 5959
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5961
    __ARG_1.'unget'($P2)
.annotate 'line', 5962
    .return($P1)
# }
.annotate 'line', 5963

.end # parseExpr_6


.sub 'parseExpr_7'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5965
# Body
# {
.annotate 'line', 5967
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5969
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5970
# var rexpr: $P2
    null $P2
.annotate 'line', 5971
# var t: $P3
    null $P3
.annotate 'line', 5972
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5973
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 5974
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 5976
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5977
    new $P6, [ 'OpShiftleftExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5980
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5981
    new $P7, [ 'OpShiftrightExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5984
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5987
    __ARG_1.'unget'($P3)
.annotate 'line', 5988
    .return($P1)
# }
.annotate 'line', 5989

.end # parseExpr_7


.sub 'parseExpr_8'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 5991
# Body
# {
.annotate 'line', 5993
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 5994
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 5996
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5997
# var rexpr: $P2
    null $P2
.annotate 'line', 5998
# var t: $P3
    null $P3
.annotate 'line', 5999
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6000
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6001
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
.annotate 'line', 6003
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6004
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6007
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6008
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6011
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6012
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6015
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6016
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6019
    new $P11, [ 'OpInstanceOfExpr' ]
$P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6022
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6025
    __ARG_1.'unget'($P3)
.annotate 'line', 6026
    .return($P1)
# }
.annotate 'line', 6027

.end # parseExpr_8


.sub 'parseExpr_9'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6029
# Body
# {
.annotate 'line', 6031
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6032
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6034
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6035
# var rexpr: $P2
    null $P2
.annotate 'line', 6036
# var t: $P3
    null $P3
.annotate 'line', 6037
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6038
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6039
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
.annotate 'line', 6041
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6042
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6045
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6046
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6049
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6050
    new $P9, [ 'OpSameExpr' ]
$P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6053
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6054
    new $P10, [ 'OpSameExpr' ]
$P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6057
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6060
    __ARG_1.'unget'($P3)
.annotate 'line', 6061
    .return($P1)
# }
.annotate 'line', 6062

.end # parseExpr_9


.sub 'parseExpr_10'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6064
# Body
# {
.annotate 'line', 6066
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6068
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6069
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6070
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6071
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6072
    new $P5, [ 'OpBinAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6074
    __ARG_1.'unget'($P2)
.annotate 'line', 6075
    .return($P1)
# }
.annotate 'line', 6076

.end # parseExpr_10


.sub 'parseExpr_11'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6078
# Body
# {
.annotate 'line', 6080
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6082
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6083
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6084
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6085
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6086
    new $P5, [ 'OpBinXorExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6088
    __ARG_1.'unget'($P2)
.annotate 'line', 6089
    .return($P1)
# }
.annotate 'line', 6090

.end # parseExpr_11


.sub 'parseExpr_12'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6092
# Body
# {
.annotate 'line', 6094
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6096
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6097
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6098
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6099
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6100
    new $P5, [ 'OpBinOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6102
    __ARG_1.'unget'($P2)
.annotate 'line', 6103
    .return($P1)
# }
.annotate 'line', 6104

.end # parseExpr_12


.sub 'parseExpr_13'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6106
# Body
# {
.annotate 'line', 6108
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6110
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6111
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6112
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6113
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6114
    new $P5, [ 'OpBoolAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6116
    __ARG_1.'unget'($P2)
.annotate 'line', 6117
    .return($P1)
# }
.annotate 'line', 6118

.end # parseExpr_13


.sub 'parseExpr_14'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6120
# Body
# {
.annotate 'line', 6122
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6124
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6125
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6126
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6127
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6128
    new $P5, [ 'OpBoolOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6130
    __ARG_1.'unget'($P2)
.annotate 'line', 6131
    .return($P1)
# }
.annotate 'line', 6132

.end # parseExpr_14


.sub 'parseExpr_15'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6134
# Body
# {
.annotate 'line', 6136
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6137
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6139
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6140
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6141
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6142
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6143
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6144
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6145
    new $P7, [ 'OpConditionalExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6148
    __ARG_1.'unget'($P2)
.annotate 'line', 6149
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6151

.end # parseExpr_15


.sub 'parseExpr_16'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6153
# Body
# {
.annotate 'line', 6155
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6156
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6157
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6159
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6160
# var t: $P2
    null $P2
.annotate 'line', 6161
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6162
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6163
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6164
# var expr: $P4
    null $P4
.annotate 'line', 6165
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
.annotate 'line', 6167
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6170
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6173
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6176
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6179
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6182
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6185
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6188
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6190
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6191
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6193
    __ARG_1.'unget'($P2)
.annotate 'line', 6194
    .return($P1)
# }
.annotate 'line', 6195

.end # parseExpr_16


.sub 'parseExpr'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6197
# Body
# {
.annotate 'line', 6199
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6201
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6202

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method

.annotate 'line', 6215
# Body
# {
.annotate 'line', 6217
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6218
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6219
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6220
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6221
    .return($S1)
# }
.annotate 'line', 6222

.end # genbreaklabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 6223
# Body
# {
.annotate 'line', 6225
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6226
    unless_null $P1, __label_0
.annotate 'line', 6227
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6228
    .return($P1)
# }
.annotate 'line', 6229

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6213
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method

.annotate 'line', 6236
# Body
# {
.annotate 'line', 6238
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6239
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6240
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6241
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6242
    .return($S1)
# }
.annotate 'line', 6243

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 6244
# Body
# {
.annotate 'line', 6246
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6247
    unless_null $P1, __label_0
.annotate 'line', 6248
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6249
    .return($P1)
# }
.annotate 'line', 6250

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6232
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6234
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6264
# Body
# {
.annotate 'line', 6266
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6267
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6268
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6269
    __ARG_2.'unget'($P1)
.annotate 'line', 6270
    new $P4, [ 'ArgumentList' ]
$P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6272

.end # parse


.sub 'optimize' :method

.annotate 'line', 6273
# Body
# {
.annotate 'line', 6275
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6276
    if_null $P1, __label_0
.annotate 'line', 6277
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6278
    .return(self)
# }
.annotate 'line', 6279

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6280
# Body
# {
.annotate 'line', 6283
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6284
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6287
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, 'ReturnStatement'
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6288
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6289
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6290
    self.'annotate'(__ARG_1)
.annotate 'line', 6291
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6295
    le $I1, 0, __label_5
.annotate 'line', 6296
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6298
    self.'annotate'(__ARG_1)
.annotate 'line', 6299
    self.'emitret'(__ARG_1)
.annotate 'line', 6300
    le $I1, 0, __label_6
.annotate 'line', 6301
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6302
    __ARG_1.'say'(')')
# }
.annotate 'line', 6303

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6260
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6262
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6308
# Body
# {
.annotate 'line', 6310
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6311

.end # ReturnStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6312
# Body
# {
.annotate 'line', 6314
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6315

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6306
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6320
# Body
# {
.annotate 'line', 6322
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6323

.end # YieldStatement


.sub 'emitret' :method
.param pmc __ARG_1

.annotate 'line', 6324
# Body
# {
.annotate 'line', 6326
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6327

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6318
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 6338
# Body
# {
.annotate 'line', 6340
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6341
    setattribute self, 'name', __ARG_1
.annotate 'line', 6342
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6343
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6344

.end # LabelStatement


.sub 'optimize' :method

.annotate 'line', 6345
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6346
# Body
# {
.annotate 'line', 6348
    self.'annotate'(__ARG_1)
.annotate 'line', 6349
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6350
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6351
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6352

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6334
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6336
    addattribute $P0, 'name'
.annotate 'line', 6337
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 6364
# Body
# {
.annotate 'line', 6366
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6367
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6368

.end # Reflabel


.sub 'optimize' :method

.annotate 'line', 6369
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
.param pmc __ARG_1

.annotate 'line', 6370
# Body
# {
.annotate 'line', 6372
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6373
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6374
    .return($S2)
# }
.annotate 'line', 6375

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6361
    addattribute $P0, 'owner'
.annotate 'line', 6362
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6386
# Body
# {
.annotate 'line', 6388
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6389
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6390
    'RequireIdentifier'($P1)
.annotate 'line', 6391
    setattribute self, 'label', $P1
.annotate 'line', 6392
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6393

.end # GotoStatement


.sub 'optimize' :method

.annotate 'line', 6394
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6395
# Body
# {
.annotate 'line', 6397
    self.'annotate'(__ARG_1)
.annotate 'line', 6398
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6399
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6400
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6401

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6382
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6384
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
.param pmc __ARG_1

.annotate 'line', 6410
# Body
# {
.annotate 'line', 6412
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6413

.end # parseconditionshort


.sub 'parsecondition' :method
.param pmc __ARG_1

.annotate 'line', 6414
# Body
# {
.annotate 'line', 6416
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6417
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6418
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6419

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6408
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

.annotate 'line', 6430
# Body
# {
.annotate 'line', 6432
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6433
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6434
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6435
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6436
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6437
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6439
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6440
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6442

.end # IfStatement


.sub 'optimize' :method

.annotate 'line', 6443
# Body
# {
.annotate 'line', 6445
    self.'optimize_condition'()
.annotate 'line', 6446
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6447
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6448
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6449
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6451
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6453
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6455
    .return(self)
# }
.annotate 'line', 6456

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6457
# Body
# {
.annotate 'line', 6459
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6460
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6461
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6462
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6463
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6464
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6465
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6466
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6467
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6468
    self.'annotate'(__ARG_1)
.annotate 'line', 6469
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6470
    $P1.'emit'(__ARG_1)
.annotate 'line', 6472
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6473
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6474
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6475
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6477
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6478

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6426
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6428
    addattribute $P0, 'truebranch'
.annotate 'line', 6429
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
.param pmc __ARG_1

.annotate 'line', 6488
# Body
# {
.annotate 'line', 6490
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6491

.end # parsebody


.sub 'emit_infinite' :method
.param pmc __ARG_1

.annotate 'line', 6492
# Body
# {
.annotate 'line', 6494
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6495
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6497
    self.'annotate'(__ARG_1)
.annotate 'line', 6498
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6499
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6500
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6501
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6502

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6485
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6487
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6511
# Body
# {
.annotate 'line', 6513
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6514
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6515
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6516

.end # WhileStatement


.sub 'optimize' :method

.annotate 'line', 6517
# Body
# {
.annotate 'line', 6519
    self.'optimize_condition'()
.annotate 'line', 6520
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6521
    .return(self)
# }
.annotate 'line', 6522

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6523
# Body
# {
.annotate 'line', 6525
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6527
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6530
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6533
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6534
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6536
    self.'annotate'(__ARG_1)
.annotate 'line', 6537
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6538
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6539
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6540
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6541
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6543

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6509
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

.annotate 'line', 6552
# Body
# {
.annotate 'line', 6554
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6555
    self.'parsebody'(__ARG_2)
.annotate 'line', 6556
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6557
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6558

.end # DoStatement


.sub 'optimize' :method

.annotate 'line', 6559
# Body
# {
.annotate 'line', 6561
    self.'optimize_condition'()
.annotate 'line', 6562
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6563
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6564
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6565
    setattribute self, 'body', $P1
.annotate 'line', 6566
    .return(self)
# }
.annotate 'line', 6567

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6568
# Body
# {
.annotate 'line', 6570
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6571
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6572
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6574
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6577
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6578
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6579
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6581
    self.'annotate'(__ARG_1)
.annotate 'line', 6582
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6584
    $P1.'emit'(__ARG_1)
.annotate 'line', 6585
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6586
    eq $I1, 2, __label_6
.annotate 'line', 6587
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6588
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6590

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6550
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

.annotate 'line', 6599
# Body
# {
.annotate 'line', 6601
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6602
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6603

.end # ContinueStatement


.sub 'optimize' :method

.annotate 'line', 6604
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6605
# Body
# {
.annotate 'line', 6607
    self.'annotate'(__ARG_1)
.annotate 'line', 6608
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6609
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6610

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6597
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6619
# Body
# {
.annotate 'line', 6621
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6622
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6623

.end # BreakStatement


.sub 'optimize' :method

.annotate 'line', 6624
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6625
# Body
# {
.annotate 'line', 6627
    self.'annotate'(__ARG_1)
.annotate 'line', 6628
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6629
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6630

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6617
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6644
# Body
# {
.annotate 'line', 6646
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6647
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6648
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6649
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6650
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6651
    $P1 = __ARG_2.'get'()
.annotate 'line', 6652
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6653
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6654
    $P1 = __ARG_2.'get'()
.annotate 'line', 6655
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6656
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6657
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6658
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6659
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6660
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6661
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6662
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6663
    $P1 = __ARG_2.'get'()
.annotate 'line', 6664
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6665
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6666
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6667
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
.annotate 'line', 6668
    __ARG_2.'unget'($P1)
.annotate 'line', 6669
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6671
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6672
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6675
    $P1 = __ARG_2.'get'()
.annotate 'line', 6676
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6677
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6678
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
.annotate 'line', 6679
    __ARG_2.'unget'($P1)
.annotate 'line', 6680
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6682
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6685

.end # SwitchStatement


.sub 'optimize' :method

.annotate 'line', 6686
# Body
# {
.annotate 'line', 6688
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6689
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6690
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6691
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6692
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6693
    .return(self)
# }
.annotate 'line', 6694

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6695
# Body
# {
.annotate 'line', 6698
# type: $S1
    set $S1, ''
.annotate 'line', 6699
    getattribute $P8, self, 'case_value'
    iter $P9, $P8
    set $P9, 0
 __label_0: # for iteration
    unless $P9 goto __label_1
    shift $P1, $P9
# {
.annotate 'line', 6700
# t: $S2
    $P10 = $P1.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
 __label_2:
.annotate 'line', 6701
    ne $S2, 'N', __label_3
.annotate 'line', 6702
    getattribute $P8, self, 'start'
    'SyntaxError'("Invalid type in case", $P8)
 __label_3: # endif
.annotate 'line', 6703
    ne $S1, '', __label_4
.annotate 'line', 6704
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6705
    eq $S1, $S2, __label_6
.annotate 'line', 6706
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6709
# reg: $S3
    $P8 = self.'tempreg'($S1)
    null $S3
    if_null $P8, __label_7
    set $S3, $P8
 __label_7:
.annotate 'line', 6710
    getattribute $P10, self, 'condition'
    $P8 = $P10.'checkresult'()
    set $S9, $P8
    ne $S9, $S1, __label_8
.annotate 'line', 6711
    getattribute $P11, self, 'condition'
    $P11.'emit'(__ARG_1, $S3)
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 6713
# regcond: $S4
    getattribute $P13, self, 'condition'
    $P12 = $P13.'emit_get'(__ARG_1)
    null $S4
    if_null $P12, __label_10
    set $S4, $P12
 __label_10:
.annotate 'line', 6714
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_9: # endif
.annotate 'line', 6718
    self.'genbreaklabel'()
.annotate 'line', 6719
# defaultlabel: $S5
    $P8 = self.'genlabel'()
    null $S5
    if_null $P8, __label_11
    set $S5, $P8
 __label_11:
.annotate 'line', 6720
    new $P2, ['ResizableStringArray']
.annotate 'line', 6721
# regval: $S6
    $P8 = self.'tempreg'($S1)
    null $S6
    if_null $P8, __label_12
    set $S6, $P8
 __label_12:
.annotate 'line', 6722
    getattribute $P8, self, 'case_value'
    iter $P14, $P8
    set $P14, 0
 __label_13: # for iteration
    unless $P14 goto __label_14
    shift $P3, $P14
# {
.annotate 'line', 6723
# label: $S7
    $P10 = self.'genlabel'()
    null $S7
    if_null $P10, __label_15
    set $S7, $P10
 __label_15:
.annotate 'line', 6724
# predefined push
    push $P2, $S7
.annotate 'line', 6725
    $P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6726
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_13
 __label_14: # endfor
.annotate 'line', 6728
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6731
    __ARG_1.'comment'('switch')
.annotate 'line', 6732
    self.'annotate'(__ARG_1)
.annotate 'line', 6733
# var case_st: $P4
    getattribute $P4, self, 'case_st'
.annotate 'line', 6734
# n: $I1
    set $P8, $P4
    set $I1, $P8
# for loop
.annotate 'line', 6735
# i: $I2
    null $I2
 __label_18: # for condition
    ge $I2, $I1, __label_17
# {
.annotate 'line', 6736
# l: $S8
    $S8 = $P2[$I2]
.annotate 'line', 6737
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6738
# var casest: $P5
    $P5 = $P4[$I2]
.annotate 'line', 6739
    iter $P15, $P5
    set $P15, 0
 __label_19: # for iteration
    unless $P15 goto __label_20
    shift $P6, $P15
.annotate 'line', 6740
    $P6.'emit'(__ARG_1)
    goto __label_19
 __label_20: # endfor
# }
 __label_16: # for iteration
.annotate 'line', 6735
    inc $I2
    goto __label_18
 __label_17: # for end
.annotate 'line', 6743
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6744
    getattribute $P8, self, 'default_st'
    iter $P16, $P8
    set $P16, 0
 __label_21: # for iteration
    unless $P16 goto __label_22
    shift $P7, $P16
.annotate 'line', 6745
    $P7.'emit'(__ARG_1)
    goto __label_21
 __label_22: # endfor
.annotate 'line', 6747
    getattribute $P10, self, 'start'
    $P8 = self.'getbreaklabel'($P10)
    __ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6748

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6637
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6639
    addattribute $P0, 'condition'
.annotate 'line', 6640
    addattribute $P0, 'case_value'
.annotate 'line', 6641
    addattribute $P0, 'case_st'
.annotate 'line', 6642
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6760
# Body
# {
.annotate 'line', 6762
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6763
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6764
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6765
    __ARG_2.'unget'($P1)
.annotate 'line', 6766
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6768
    $P1 = __ARG_2.'get'()
.annotate 'line', 6769
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6770
    __ARG_2.'unget'($P1)
.annotate 'line', 6771
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6772
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6774
    $P1 = __ARG_2.'get'()
.annotate 'line', 6775
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6776
    __ARG_2.'unget'($P1)
.annotate 'line', 6777
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6778
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6780
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6781

.end # ForStatement


.sub 'optimize' :method

.annotate 'line', 6782
# Body
# {
.annotate 'line', 6784
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 6785
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 6786
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 6787
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 6788
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 6789
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 6790
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6791
    .return(self)
# }
.annotate 'line', 6792

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6793
# Body
# {
.annotate 'line', 6795
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 6796
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6797
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 6798
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 6799
    .return()
# }
 __label_0: # endif
.annotate 'line', 6801
    __ARG_1.'comment'('for loop')
.annotate 'line', 6802
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 6803
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 6804
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 6805
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 6806
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6808
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6809
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 6810
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 6812
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6813
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6814
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 6815
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 6816
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 6818
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6819

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6755
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6757
    addattribute $P0, 'initializer'
.annotate 'line', 6758
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param string __ARG_5

.annotate 'line', 6832
# Body
# {
.annotate 'line', 6834
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6835
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6836
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 6837
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 6838
    self.'createvar'($S1, $S2)
.annotate 'line', 6839
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 6841
    setattribute self, 'varname', __ARG_4
.annotate 'line', 6842
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 6843
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 6844
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6845

.end # ForeachStatement


.sub 'optimize' :method

.annotate 'line', 6846
# Body
# {
.annotate 'line', 6848
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 6849
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6850
    .return(self)
# }
.annotate 'line', 6851

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6852
# Body
# {
.annotate 'line', 6854
    self.'annotate'(__ARG_1)
.annotate 'line', 6855
# regcont: $S1
    null $S1
.annotate 'line', 6856
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 6857
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 6858
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6859
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 6862
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 6863
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 6864
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 6865
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 6866
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 6867
    __ARG_1.'say'('    ', 'iter ', $S3, ', ', $S1)
.annotate 'line', 6868
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 6869
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6870
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6871
    $P2 = $P1.'getreg'()
    __ARG_1.'say'('    ', 'shift ', $P2, ', ', $S3)
.annotate 'line', 6872
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 6873
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 6874
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6875

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6826
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 6828
    addattribute $P0, 'deftype'
.annotate 'line', 6829
    addattribute $P0, 'varname'
.annotate 'line', 6830
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6880
# Body
# {
.annotate 'line', 6882
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 6883
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6884
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 6885
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6886
    new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6888
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 6889
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 6890
    new $P6, [ 'ForeachStatement' ]
$P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 6891
    __ARG_2.'unget'($P3)
.annotate 'line', 6892
    __ARG_2.'unget'($P2)
.annotate 'line', 6893
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 6895
    new $P5, [ 'ForStatement' ]
$P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 6896

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6906
# Body
# {
.annotate 'line', 6908
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6909
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 6910

.end # ThrowStatement


.sub 'optimize' :method

.annotate 'line', 6911
# Body
# {
.annotate 'line', 6913
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 6914
    .return(self)
# }
.annotate 'line', 6915

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6916
# Body
# {
.annotate 'line', 6918
# reg: $S1
    getattribute $P2, self, 'excep'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6919
    self.'annotate'(__ARG_1)
.annotate 'line', 6920
    __ARG_1.'say'('    ', 'throw ', $S1)
# }
.annotate 'line', 6921

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6902
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6904
    addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 6935
# Body
# {
.annotate 'line', 6937
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6938
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6939
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 6940
    new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 6943
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 6945
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 6946
    $P1 = __ARG_2.'get'()
.annotate 'line', 6947
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 6948
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 6949
    $P1 = __ARG_2.'get'()
.annotate 'line', 6950
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 6951
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 6952
    $P1 = __ARG_2.'get'()
.annotate 'line', 6953
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 6954
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 6955
    setattribute self, 'exname', $P1
.annotate 'line', 6956
    self.'createvar'($S1, 'P')
.annotate 'line', 6957
    $P1 = __ARG_2.'get'()
.annotate 'line', 6958
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 6959
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 6961
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 6962

.end # TryStatement


.sub 'optimize' :method

.annotate 'line', 6963
# Body
# {
.annotate 'line', 6965
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 6966
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 6967
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 6968
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 6969
    .return(self)
# }
.annotate 'line', 6970

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 6971
# Body
# {
.annotate 'line', 6973
# reghandler: $S1
    $P7 = self.'tempreg'('P')
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
 __label_0:
.annotate 'line', 6974
# labelhandler: $S2
    $P7 = self.'genlabel'()
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
 __label_1:
.annotate 'line', 6975
# labelpasthandler: $S3
    $P7 = self.'genlabel'()
    null $S3
    if_null $P7, __label_2
    set $S3, $P7
 __label_2:
.annotate 'line', 6976
# exreg: $S4
    null $S4
.annotate 'line', 6977
    getattribute $P7, self, 'exname'
    if_null $P7, __label_3
# {
.annotate 'line', 6978
# var exname: $P1
    getattribute $P8, self, 'exname'
    $P1 = self.'getvar'($P8)
.annotate 'line', 6979
    $P7 = $P1.'getreg'()
    set $S4, $P7
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 6982
    $P7 = self.'tempreg'('P')
    set $S4, $P7
 __label_4: # endif
.annotate 'line', 6984
    self.'annotate'(__ARG_1)
.annotate 'line', 6985
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 6987
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 6988
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 6990
    getattribute $P7, self, 'modifiers'
    if_null $P7, __label_5
# {
.annotate 'line', 6991
# var modiflist: $P2
    getattribute $P8, self, 'modifiers'
    $P2 = $P8.'getlist'()
.annotate 'line', 6992
    iter $P9, $P2
    set $P9, 0
 __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P3, $P9
# {
.annotate 'line', 6993
# modifname: $S5
    $P7 = $P3.'getname'()
    null $S5
    if_null $P7, __label_8
    set $S5, $P7
 __label_8:
.annotate 'line', 6994
# nargs: $I1
    $P7 = $P3.'numargs'()
    set $I1, $P7
.annotate 'line', 6995
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
.annotate 'line', 6998
    eq $I1, 1, __label_15
.annotate 'line', 6999
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_15: # endif
.annotate 'line', 7000
# var arg: $P4
    $P4 = $P3.'getarg'(0)
.annotate 'line', 7001
# argreg: $S6
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S6
    if_null $P8, __label_16
    set $S6, $P8
 __label_16:
.annotate 'line', 7002
    __ARG_1.'say'($S1, ".'", $S5, "'(", $S6, ")")
    goto __label_9 # break
 __label_13: # case
 __label_14: # case
.annotate 'line', 7006
    new $P5, ['ResizableStringArray']
# for loop
.annotate 'line', 7007
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 7008
# var arg: $P6
    $P6 = $P3.'getarg'($I2)
.annotate 'line', 7009
    $P7 = $P6.'emit_get'(__ARG_1)
# predefined push
    push $P5, $P7
# }
 __label_17: # for iteration
.annotate 'line', 7007
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 7011
    __ARG_1.'print'($S1, ".'", $S5, "'(")
.annotate 'line', 7012
# sep: $S7
    set $S7, ''
.annotate 'line', 7013
    iter $P10, $P5
    set $P10, 0
 __label_20: # for iteration
    unless $P10 goto __label_21
    shift $S8, $P10
# {
.annotate 'line', 7014
    __ARG_1.'print'($S7, $S8)
.annotate 'line', 7015
    set $S7, ', '
# }
    goto __label_20
 __label_21: # endfor
.annotate 'line', 7017
    __ARG_1.'say'(")")
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 7020
    getattribute $P7, self, 'start'
    'SyntaxError'('Unexpected modifier in try', $P7)
 __label_9: # switch end
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 7025
    __ARG_1.'say'('    ', 'push_eh ', $S1)
.annotate 'line', 7026
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7027
    getattribute $P7, self, 'stry'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7028
    __ARG_1.'comment'('try: end')
.annotate 'line', 7029
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7031
    self.'annotate'(__ARG_1)
.annotate 'line', 7032
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7034
    __ARG_1.'comment'('catch')
.annotate 'line', 7035
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7036
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7037
    __ARG_1.'say'('    ', 'finalize ', $S4)
.annotate 'line', 7038
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7039
    getattribute $P7, self, 'scatch'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7041
    __ARG_1.'comment'('catch end')
.annotate 'line', 7042
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7043

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6928
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 6930
    addattribute $P0, 'stry'
.annotate 'line', 6931
    addattribute $P0, 'modifiers'
.annotate 'line', 6932
    addattribute $P0, 'exname'
.annotate 'line', 6933
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7054
# Body
# {
.annotate 'line', 7056
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7057
    setattribute self, 'name', __ARG_3
.annotate 'line', 7058
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7059
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7060

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7050
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7052
    addattribute $P0, 'name'
.annotate 'line', 7053
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4

.annotate 'line', 7073
# Body
# {
.annotate 'line', 7075
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7076
    setattribute self, 'name', __ARG_3
.annotate 'line', 7077
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7078

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7067
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7069
    addattribute $P0, 'name'
.annotate 'line', 7070
    addattribute $P0, 'basetype'
.annotate 'line', 7071
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param pmc __ARG_5

.annotate 'line', 7087
# Body
# {
.annotate 'line', 7089
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7090
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7091
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7092
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7093
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7095
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7098
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7099

.end # DeclareSingleStatement


.sub 'optimize' :method

.annotate 'line', 7100
# Body
# {
.annotate 'line', 7102
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7103
    if_null $P1, __label_0
.annotate 'line', 7104
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7105
    .return(self)
# }
.annotate 'line', 7106

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7107
# Body
# {
.annotate 'line', 7109
    self.'annotate'(__ARG_1)
.annotate 'line', 7110
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7111
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7112
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7113
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7114
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7116
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7117
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7119
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7120
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7121
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, 'ConcatString'
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7122
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7124
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7127
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_12
# {
.annotate 'line', 7129
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7132
# ireg: $S5
    null $S5
.annotate 'line', 7133
    ne $S4, '', __label_14
.annotate 'line', 7134
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7136
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7137
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7139
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7140
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7141
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7142
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7143
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7144
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7147
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7151

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7083
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7085
    addattribute $P0, 'init'
.end
.namespace [ 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param string __ARG_4
.param string __ARG_5
.param pmc __ARG_6

.annotate 'line', 7162
# Body
# {
.annotate 'line', 7166
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7167
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7168
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7169
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7170
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7171
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7173
    __ARG_6.'unget'($P2)
.annotate 'line', 7174
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7175
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7177
    $P2 = __ARG_6.'get'()
.annotate 'line', 7178
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7179
    $P2 = __ARG_6.'get'()
.annotate 'line', 7180
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7181
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7182
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7183
    $P2 = __ARG_6.'get'()
.annotate 'line', 7184
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7185
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7186
# {
.annotate 'line', 7187
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7188
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7189
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7190
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7191
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7195
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7196

.end # DeclareArrayStatement


.sub 'optimize' :method

.annotate 'line', 7197
# Body
# {
.annotate 'line', 7199
# var init: $P1
    getattribute $P1, self, 'initarray'
.annotate 'line', 7200
    getattribute $P2, self, 'size'
    if_null $P2, __label_0
.annotate 'line', 7201
    getattribute $P5, self, 'size'
    $P4 = $P5.'optimize'()
    setattribute self, 'size', $P4
 __label_0: # endif
.annotate 'line', 7202
    if_null $P1, __label_1
.annotate 'line', 7203
    'optimize_array'($P1)
 __label_1: # endif
.annotate 'line', 7204
    .return(self)
# }
.annotate 'line', 7205

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7206
# Body
# {
.annotate 'line', 7208
    self.'annotate'(__ARG_1)
.annotate 'line', 7210
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7211
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7212
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7213
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7214
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7215
    if_null $P2, __label_0
# {
.annotate 'line', 7217
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7218
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7222
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7224
    if_null $P3, __label_3
# {
.annotate 'line', 7225
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7226
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7227
    unless_null $P2, __label_5
# {
.annotate 'line', 7228
    le $I1, 0, __label_6
# {
.annotate 'line', 7230
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7233
# i: $I2
    null $I2
.annotate 'line', 7234
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7235
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7236
    __ARG_1.'say'($P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7237
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7240

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7156
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7158
    addattribute $P0, 'size'
.annotate 'line', 7159
    addattribute $P0, 'initarray'
.annotate 'line', 7160
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7245
# Body
# {
.annotate 'line', 7247
# var next: $P1
    null $P1
.annotate 'line', 7248
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7249
# {
.annotate 'line', 7250
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7251
    'RequireIdentifier'($P3)
.annotate 'line', 7252
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7253
# var item: $P5
    null $P5
.annotate 'line', 7254
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7255
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7257
    __ARG_4.'unget'($P4)
.annotate 'line', 7258
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7260
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7261
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7262
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7263
    'RequireOp'(';', $P1)
.annotate 'line', 7264
    .return($P2)
# }
.annotate 'line', 7265

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7271
# Body
# {
.annotate 'line', 7273
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7274

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7269
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7279
# Body
# {
.annotate 'line', 7281
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7282

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7277
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7286
# Body
# {
.annotate 'line', 7288
    new $P2, [ 'IntStatement' ]
$P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7289

.end # newIntSingle


.sub 'newIntArray'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7291
# Body
# {
.annotate 'line', 7293
    new $P2, [ 'IntArrayStatement' ]
$P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7294

.end # newIntArray


.sub 'parseInt'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7296
# Body
# {
.annotate 'line', 7298
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7299
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7300
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7301

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7307
# Body
# {
.annotate 'line', 7309
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7310

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7305
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7315
# Body
# {
.annotate 'line', 7317
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7318

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7313
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7322
# Body
# {
.annotate 'line', 7324
    new $P2, [ 'FloatStatement' ]
$P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7325

.end # newFloatSingle


.sub 'newFloatArray'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7327
# Body
# {
.annotate 'line', 7329
    new $P2, [ 'FloatArrayStatement' ]
$P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7330

.end # newFloatArray


.sub 'parseFloat'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7332
# Body
# {
.annotate 'line', 7334
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7335
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7336
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7337

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7343
# Body
# {
.annotate 'line', 7345
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7346

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7341
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7351
# Body
# {
.annotate 'line', 7353
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7354

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7349
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7358
# Body
# {
.annotate 'line', 7360
    new $P2, [ 'StringStatement' ]
$P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7361

.end # newStringSingle


.sub 'newStringArray'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7363
# Body
# {
.annotate 'line', 7365
    new $P2, [ 'StringArrayStatement' ]
$P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7366

.end # newStringArray


.sub 'parseString'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7368
# Body
# {
.annotate 'line', 7370
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7371
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7372
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7373

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4
.param pmc __ARG_5

.annotate 'line', 7385
# Body
# {
.annotate 'line', 7388
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7389
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7390
    setattribute self, 'name', __ARG_4
.annotate 'line', 7391
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7392

.end # ConstStatement


.sub 'optimize' :method

.annotate 'line', 7393
# Body
# {
.annotate 'line', 7395
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7396
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7397
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7398
    $P1 = $P1.'optimize'()
.annotate 'line', 7399
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7401
    getattribute $P4, self, 'start'
.annotate 'line', 7400
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7403
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7404
    setattribute self, 'value', $P1
.annotate 'line', 7405
    .return(self)
# }
.annotate 'line', 7406

.end # optimize


.sub 'checkresult' :method

.annotate 'line', 7407
# Body
# {
.annotate 'line', 7409
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7410

.end # checkresult


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7411
# Body
# {
.annotate 'line', 7413
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7414
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7415

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7379
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7381
    addattribute $P0, 'type'
.annotate 'line', 7382
    addattribute $P0, 'name'
.annotate 'line', 7383
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7418
# Body
# {
.annotate 'line', 7420
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7421
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7422
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7423
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7425
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7426
# {
.annotate 'line', 7427
    $P1 = __ARG_2.'get'()
.annotate 'line', 7428
# var name: $P3
    set $P3, $P1
.annotate 'line', 7429
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7430
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7432
    new $P6, [ 'ConstStatement' ]
$P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7431
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7433
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7434
    .return($P2)
# }
.annotate 'line', 7435

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4
.param int __ARG_5

.annotate 'line', 7444
# Body
# {
.annotate 'line', 7446
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7447
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7448
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7449
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7450
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7452
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7453

.end # VarStatement


.sub 'optimize_init' :method

.annotate 'line', 7454
# Body
# {
.annotate 'line', 7456
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7457
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7458
    .return(self)
# }
.annotate 'line', 7459

.end # optimize_init


.sub 'optimize' :method

.annotate 'line', 7460
# Body
# {
.annotate 'line', 7462
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7463

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7464
# Body
# {
.annotate 'line', 7466
    self.'annotate'(__ARG_1)
.annotate 'line', 7467
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7468
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7469
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7470
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7471
    if_null $P1, __label_2
.annotate 'line', 7472
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7473
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7474
    if_null $P1, __label_4
# {
.annotate 'line', 7475
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7476
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
.annotate 'line', 7478
    isa $I1, $P1, 'MemberExpr'
    if $I1 goto __label_17
    isa $I1, $P1, 'ArrayExpr'
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, 'NewExpr'
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7479
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7481
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7486
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7487
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7490
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7492
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7496
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7497

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7441
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7443
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7502
# Body
# {
.annotate 'line', 7504
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7505
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7506

.end # ResizableVarStatement


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7507
# Body
# {
.annotate 'line', 7509
    self.'annotate'(__ARG_1)
.annotate 'line', 7510
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7511
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7512
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7513
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7514

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7500
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 7521
# Body
# {
.annotate 'line', 7523
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7524
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7525
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7526
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7527

.end # FixedVarStatement


.sub 'optimize' :method

.annotate 'line', 7528
# Body
# {
.annotate 'line', 7530
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7531
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7532

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7533
# Body
# {
.annotate 'line', 7535
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7536
    self.'annotate'(__ARG_1)
.annotate 'line', 7537
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7538
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7539
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7540
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7541

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7517
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7519
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param int __ARG_4 :optional

.annotate 'line', 7544
# Body
# {
.annotate 'line', 7546
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7547
    'RequireIdentifier'($P1)
.annotate 'line', 7548
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7549
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7550
    $P2 = __ARG_2.'get'()
.annotate 'line', 7551
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7552
    new $P5, [ 'ResizableVarStatement' ]
$P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7554
    __ARG_2.'unget'($P2)
.annotate 'line', 7555
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
.annotate 'line', 7559
    __ARG_2.'unget'($P2)
.annotate 'line', 7560
    new $P4, [ 'VarStatement' ]
$P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7562

.end # parseVar


.sub 'parseVolatile'
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
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7568
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7569
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7570

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 7581
# Body
# {
.annotate 'line', 7583
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7584
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7585
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7586
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7587
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7588
    __ARG_2.'unget'($P1)
.annotate 'line', 7589
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7590
    unless_null $P2, __label_2
.annotate 'line', 7591
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7592
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7594
    setattribute self, 'end', $P1
# }
.annotate 'line', 7595

.end # CompoundStatement


.sub 'getlabel' :method
.param pmc __ARG_1

.annotate 'line', 7596
# Body
# {
.annotate 'line', 7598
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7599
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7600
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7601
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7602
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7603
    .return($S2)
# }
.annotate 'line', 7604

.end # getlabel


.sub 'createlabel' :method
.param pmc __ARG_1

.annotate 'line', 7605
# Body
# {
.annotate 'line', 7607
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7608
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7609
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7610
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7611
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7612
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7613
$P1[$S1] = $S3
.annotate 'line', 7614
    .return($S3)
# }
.annotate 'line', 7615

.end # createlabel


.sub 'getend' :method

.annotate 'line', 7616
# Body
# {
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7617
# Body
# {
.annotate 'line', 7619
    __ARG_1.'comment'('{')
.annotate 'line', 7620
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7621
    $P1.'emit'(__ARG_1)
.annotate 'line', 7622
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7624
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7625

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7576
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7578
    addattribute $P0, 'end'
.annotate 'line', 7579
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'init' :method :vtable

.annotate 'line', 7638
# Body
# {
.annotate 'line', 7641
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7642
    new $P1, ['ResizableStringArray']
.annotate 'line', 7643
    new $P2, ['ResizableStringArray']
.annotate 'line', 7644
    setattribute self, 'tempreg', $P1
.annotate 'line', 7645
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7646

.end # init


.sub 'settype' :method
.param string __ARG_1

.annotate 'line', 7647
# Body
# {
.annotate 'line', 7649
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 7650
    .return(self)
# }
.annotate 'line', 7651

.end # settype


.sub 'createreg' :method

.annotate 'line', 7652
# Body
# {
.annotate 'line', 7654
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7655
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7656
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7657
    assign $P1, $I1
.annotate 'line', 7658
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7659
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7660
    .return($S1)
# }
.annotate 'line', 7661

.end # createreg


.sub 'tempreg' :method

.annotate 'line', 7662
# Body
# {
.annotate 'line', 7664
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7665
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7666
# reg: $S1
    null $S1
.annotate 'line', 7667
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7668
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7670
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7671
# predefined push
    push $P2, $S1
.annotate 'line', 7672
    .return($S1)
# }
.annotate 'line', 7673

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7674
# Body
# {
.annotate 'line', 7676
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7677
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7678
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7679
# i: $I2
sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7680
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7681
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7679
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7683
    assign $P2, 0
# }
.annotate 'line', 7684

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7634
    addattribute $P0, 'type'
.annotate 'line', 7635
    addattribute $P0, 'nreg'
.annotate 'line', 7636
    addattribute $P0, 'tempreg'
.annotate 'line', 7637
    addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 7708
# Body
# {
.annotate 'line', 7710
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7711
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 7712
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 7713
    new $P3, [ 'RegisterStore' ]
    $P2 = $P3.'settype'('I')
    setattribute self, 'regstI', $P2
.annotate 'line', 7714
    new $P3, [ 'RegisterStore' ]
    $P2 = $P3.'settype'('N')
    setattribute self, 'regstN', $P2
.annotate 'line', 7715
    new $P3, [ 'RegisterStore' ]
    $P2 = $P3.'settype'('S')
    setattribute self, 'regstS', $P2
.annotate 'line', 7716
    new $P3, [ 'RegisterStore' ]
    $P2 = $P3.'settype'('P')
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 7717

.end # FunctionBase


.sub 'getouter' :method

.annotate 'line', 7719
# Body
# {
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method

.annotate 'line', 7720
# Body
# {
.annotate 'line', 7723
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 7724
    unless_null $P1, __label_0
# {
.annotate 'line', 7725
    $P1 = self.'generatesubid'()
.annotate 'line', 7726
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 7728
    .return($P1)
# }
.annotate 'line', 7729

.end # makesubid


.sub 'same_scope_as' :method
.param pmc __ARG_1

.annotate 'line', 7731
# Body
# {
.annotate 'line', 7733
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 7734
    .return($I1)
# }
.annotate 'line', 7735

.end # same_scope_as


.sub 'parse_parameters' :method
.param pmc __ARG_1

.annotate 'line', 7736
# Body
# {
.annotate 'line', 7738
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 7739
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7740
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 7741
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 7742
# {
.annotate 'line', 7743
    $P2 = __ARG_1.'get'()
.annotate 'line', 7744
# type: $S1
    $P6 = $P2.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
 __label_4:
.annotate 'line', 7745
    eq $S1, '', __label_5
.annotate 'line', 7746
    $P2 = __ARG_1.'get'()
    goto __label_6
 __label_5: # else
.annotate 'line', 7748
    set $S1, 'P'
 __label_6: # endif
.annotate 'line', 7749
# argname: $S2
# predefined string
    $P5 = self.'getparamnum'()
    set $S4, $P5
    concat $S2, '__ARG_', $S4
.annotate 'line', 7750
    self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7752
# varname: $S3
    set $P5, $P2
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 7753
# var arg: $P3
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 7754
$P3['name'] = $S3
.annotate 'line', 7755
    $P2 = __ARG_1.'get'()
.annotate 'line', 7756
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 7757
# var modifiers: $P4
    new $P4, [ 'ModifierList' ]
$P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7758
$P3['modifiers'] = $P4
.annotate 'line', 7759
    $P2 = __ARG_1.'get'()
# }
 __label_8: # endif
.annotate 'line', 7761
# predefined push
    push $P1, $P3
# }
 __label_3: # continue
.annotate 'line', 7762
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 7763
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_9
.annotate 'line', 7764
    'Expected'("')' or ','", $P2)
 __label_9: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 7766

.end # parse_parameters


.sub 'addlocalfunction' :method
.param pmc __ARG_1

.annotate 'line', 7768
# Body
# {
.annotate 'line', 7770
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 7771
    unless_null $P1, __label_0
.annotate 'line', 7772
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7774
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 7775

.end # addlocalfunction


.sub 'optimize' :method

.annotate 'line', 7777
# Body
# {
.annotate 'line', 7779
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7780
    .return(self)
# }
.annotate 'line', 7781

.end # optimize


.sub 'setusedlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7783
# Body
# {
.annotate 'line', 7785
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7786
    unless_null $P1, __label_0
# {
.annotate 'line', 7787
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7788
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7790
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7791

.end # setusedlex


.sub 'setlex' :method
.param string __ARG_1
.param string __ARG_2

.annotate 'line', 7792
# Body
# {
.annotate 'line', 7794
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 7795
    unless_null $P1, __label_0
# {
.annotate 'line', 7796
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7797
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7799
$P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7800

.end # setlex


.sub 'createlex' :method
.param pmc __ARG_1

.annotate 'line', 7801
# Body
# {
.annotate 'line', 7805
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 7806
# lexname: $S1
    null $S1
.annotate 'line', 7807
    if_null $P1, __label_0
.annotate 'line', 7808
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7810
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 7811
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 7812
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 7813
    self.'setlex'($S1, $S2)
.annotate 'line', 7814
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 7816
    .return($S1)
# }
.annotate 'line', 7817

.end # createlex


.sub 'createreg' :method
.param string __ARG_1

.annotate 'line', 7819
# Body
# {
.annotate 'line', 7821
# var store: $P1
    null $P1
.annotate 'line', 7822
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
.annotate 'line', 7824
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7826
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7828
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7830
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7832
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 7834
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 7835
    .return($S1)
# }
.annotate 'line', 7836

.end # createreg


.sub 'tempreg' :method
.param string __ARG_1

.annotate 'line', 7837
# Body
# {
.annotate 'line', 7839
# var store: $P1
    null $P1
.annotate 'line', 7840
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
.annotate 'line', 7842
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7844
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7846
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7848
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7850
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 7852
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 7853
    .return($S1)
# }
.annotate 'line', 7854

.end # tempreg


.sub 'freetemps' :method

.annotate 'line', 7855
# Body
# {
.annotate 'line', 7857
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
.annotate 'line', 7858
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 7859

.end # freetemps


.sub 'genlabel' :method

.annotate 'line', 7860
# Body
# {
.annotate 'line', 7862
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 7863
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7864
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 7865
    assign $P1, $I1
.annotate 'line', 7866
    .return($S1)
# }
.annotate 'line', 7867

.end # genlabel


.sub 'getbreaklabel' :method
.param pmc __ARG_1

.annotate 'line', 7868
# Body
# {
.annotate 'line', 7870
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7871

.end # getbreaklabel


.sub 'getcontinuelabel' :method
.param pmc __ARG_1

.annotate 'line', 7872
# Body
# {
.annotate 'line', 7874
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7875

.end # getcontinuelabel


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 7877
# Body
# {
.annotate 'line', 7879
# name: $S1
    getattribute $P20, self, 'name'
    null $S1
    if_null $P20, __label_0
    set $S1, $P20
 __label_0:
.annotate 'line', 7880
    __ARG_1.'say'()
.annotate 'line', 7881
    __ARG_1.'print'(".sub ")
.annotate 'line', 7882
    $P20 = self.'isanonymous'()
    if_null $P20, __label_1
    unless $P20 goto __label_1
.annotate 'line', 7883
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 7885
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 7886
    getattribute $P20, self, 'subid'
    if_null $P20, __label_3
.annotate 'line', 7887
    getattribute $P21, self, 'subid'
    __ARG_1.'print'(" :subid('", $P21, "')")
 __label_3: # endif
.annotate 'line', 7888
    getattribute $P20, self, 'outer'
    if_null $P20, __label_4
# {
.annotate 'line', 7889
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 7890
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 7891
    if_null $P2, __label_5
.annotate 'line', 7892
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 7896
    $P20 = self.'ismethod'()
    if_null $P20, __label_6
    unless $P20 goto __label_6
.annotate 'line', 7897
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 7898
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 7899
    if_null $P3, __label_7
# {
.annotate 'line', 7900
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 7901
    iter $P22, $P4
    set $P22, 0
 __label_9: # for iteration
    unless $P22 goto __label_10
    shift $P5, $P22
# {
.annotate 'line', 7902
# nargmods: $I1
    $P20 = $P5.'numargs'()
    set $I1, $P20
.annotate 'line', 7903
    $P20 = $P5.'getname'()
    __ARG_1.'print'(' :', $P20)
.annotate 'line', 7904
    le $I1, 0, __label_11
# {
.annotate 'line', 7905
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 7906
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7907
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 7908
    $P20 = $P6.'isstringliteral'()
    isfalse $I5, $P20
    unless $I5 goto __label_15
.annotate 'line', 7909
    getattribute $P21, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P21)
 __label_15: # endif
.annotate 'line', 7910
    $P20 = $P6.'getPirString'()
    __ARG_1.'print'($P20)
# }
 __label_12: # for iteration
.annotate 'line', 7906
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 7912
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
.annotate 'line', 7917
    ne $S1, 'main', __label_16
.annotate 'line', 7918
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 7920
    __ARG_1.'say'()
.annotate 'line', 7922
# var params: $P7
    getattribute $P7, self, 'params'
.annotate 'line', 7923
# var param: $P8
    null $P8
.annotate 'line', 7924
# paramname: $S2
    null $S2
.annotate 'line', 7925
# var a: $P9
    null $P9
.annotate 'line', 7927
    iter $P23, $P7
    set $P23, 0
 __label_17: # for iteration
    unless $P23 goto __label_18
    shift $P8, $P23
# {
.annotate 'line', 7928
    $S2 = $P8['name']
.annotate 'line', 7929
    $P9 = self.'getvar'($S2)
.annotate 'line', 7930
# ptype: $S3
    $P21 = $P9.'gettype'()
    $P20 = 'typetopirname'($P21)
    null $S3
    if_null $P20, __label_19
    set $S3, $P20
 __label_19:
.annotate 'line', 7931
    $P20 = $P9.'getreg'()
    __ARG_1.'print'('.param ', $S3, ' ', $P20)
.annotate 'line', 7932
# var modarg: $P10
    $P10 = $P8['modifiers']
.annotate 'line', 7933
    if_null $P10, __label_20
# {
.annotate 'line', 7934
# var named: $P11
    null $P11
.annotate 'line', 7935
# var slurpy: $P12
    null $P12
.annotate 'line', 7936
# var modarglist: $P13
    $P13 = $P10.'getlist'()
.annotate 'line', 7937
    iter $P24, $P13
    set $P24, 0
 __label_21: # for iteration
    unless $P24 goto __label_22
    shift $P14, $P24
# {
.annotate 'line', 7938
# modname: $S4
    $P20 = $P14.'getname'()
    null $S4
    if_null $P20, __label_23
    set $S4, $P20
 __label_23:
.annotate 'line', 7939
    set $S8, $S4
    set $S9, 'named'
    if $S8 == $S9 goto __label_26
    set $S9, 'slurpy'
    if $S8 == $S9 goto __label_27
    goto __label_25
# switch
 __label_26: # case
.annotate 'line', 7941
    set $P11, $P14
    goto __label_24 # break
 __label_27: # case
.annotate 'line', 7944
    set $P12, $P14
    goto __label_24 # break
 __label_25: # default
.annotate 'line', 7947
    __ARG_1.'print'(' :', $S4)
 __label_24: # switch end
# }
    goto __label_21
 __label_22: # endfor
.annotate 'line', 7950
    isnull $I5, $P11
    not $I5
    unless $I5 goto __label_30
    isnull $I5, $P12
    not $I5
 __label_30:
    unless $I5 goto __label_28
# {
.annotate 'line', 7955
    __ARG_1.'print'(" :named :slurpy")
# }
    goto __label_29
 __label_28: # else
# {
.annotate 'line', 7958
    if_null $P11, __label_31
# {
.annotate 'line', 7959
# setname: $S5
    null $S5
.annotate 'line', 7960
# nargs: $I3
    $P20 = $P11.'numargs'()
    set $I3, $P20
.annotate 'line', 7961
    set $I5, $I3
    null $I6
    if $I5 == $I6 goto __label_35
    set $I6, 1
    if $I5 == $I6 goto __label_36
    goto __label_34
# switch
 __label_35: # case
.annotate 'line', 7963
    concat $S0, "'", $S2
    concat $S0, $S0, "'"
    set $S5, $S0
    goto __label_33 # break
 __label_36: # case
.annotate 'line', 7966
# var argmod: $P15
    $P15 = $P11.'getarg'(0)
.annotate 'line', 7967
    $P20 = $P15.'isstringliteral'()
    isfalse $I7, $P20
    unless $I7 goto __label_37
.annotate 'line', 7968
    getattribute $P21, self, 'start'
    'SyntaxError'('Invalid modifier', $P21)
 __label_37: # endif
.annotate 'line', 7969
    $P25 = $P15.'getPirString'()
    set $S5, $P25
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 7972
    getattribute $P26, self, 'start'
    'SyntaxError'('Invalid modifier', $P26)
 __label_33: # switch end
.annotate 'line', 7974
    __ARG_1.'print'(" :named(", $S5, ")")
# }
    goto __label_32
 __label_31: # else
.annotate 'line', 7976
    if_null $P12, __label_38
# {
.annotate 'line', 7977
    __ARG_1.'print'(" :slurpy")
# }
 __label_38: # endif
 __label_32: # endif
# }
 __label_29: # endif
# }
 __label_20: # endif
.annotate 'line', 7981
    __ARG_1.'say'('')
# }
    goto __label_17
 __label_18: # endfor
.annotate 'line', 7983
    __ARG_1.'say'()
.annotate 'line', 7984
    getattribute $P20, self, 'start'
    __ARG_1.'annotate'($P20)
.annotate 'line', 7987
# var lexicals: $P16
    getattribute $P16, self, 'lexicals'
.annotate 'line', 7988
    if_null $P16, __label_39
# {
.annotate 'line', 7990
    iter $P27, $P16
    set $P27, 0
 __label_40: # for iteration
    unless $P27 goto __label_41
    shift $S6, $P27
.annotate 'line', 7991
    $P20 = $P16[$S6]
    __ARG_1.'say'(".lex '", $P20, "', ", $S6)
    goto __label_40
 __label_41: # endfor
# }
 __label_39: # endif
.annotate 'line', 7994
    getattribute $P16, self, 'usedlexicals'
.annotate 'line', 7995
    if_null $P16, __label_42
# {
.annotate 'line', 7997
    iter $P28, $P16
    set $P28, 0
 __label_43: # for iteration
    unless $P28 goto __label_44
    shift $S7, $P28
.annotate 'line', 7998
    $P20 = $P16[$S7]
    __ARG_1.'say'($S7, " = find_lex '", $P20, "'")
    goto __label_43
 __label_44: # endfor
# }
 __label_42: # endif
.annotate 'line', 8001
# var body: $P17
    getattribute $P17, self, 'body'
.annotate 'line', 8002
    $P20 = $P17.'isempty'()
    if_null $P20, __label_45
    unless $P20 goto __label_45
.annotate 'line', 8003
    __ARG_1.'comment'('Empty body')
    goto __label_46
 __label_45: # else
# {
.annotate 'line', 8005
    __ARG_1.'comment'('Body')
.annotate 'line', 8006
    $P17.'emit'(__ARG_1)
.annotate 'line', 8007
    $P20 = $P17.'getend'()
    __ARG_1.'annotate'($P20)
# }
 __label_46: # endif
.annotate 'line', 8009
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8012
# var localfun: $P18
    getattribute $P18, self, 'localfun'
.annotate 'line', 8013
    if_null $P18, __label_47
# {
# for loop
.annotate 'line', 8014
# ifn: $I4
    null $I4
 __label_50: # for condition
# predefined elements
    elements $I5, $P18
    ge $I4, $I5, __label_49
# {
.annotate 'line', 8015
# var fn: $P19
    $P19 = $P18[$I4]
.annotate 'line', 8016
    $P19.'emit'(__ARG_1)
# }
 __label_48: # for iteration
.annotate 'line', 8014
    inc $I4
    goto __label_50
 __label_49: # for end
# }
 __label_47: # endif
# }
.annotate 'line', 8019

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7691
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7693
    addattribute $P0, 'name'
.annotate 'line', 7694
    addattribute $P0, 'subid'
.annotate 'line', 7695
    addattribute $P0, 'modifiers'
.annotate 'line', 7696
    addattribute $P0, 'params'
.annotate 'line', 7697
    addattribute $P0, 'body'
.annotate 'line', 7698
    addattribute $P0, 'regstI'
.annotate 'line', 7699
    addattribute $P0, 'regstN'
.annotate 'line', 7700
    addattribute $P0, 'regstS'
.annotate 'line', 7701
    addattribute $P0, 'regstP'
.annotate 'line', 7702
    addattribute $P0, 'nlabel'
.annotate 'line', 7703
    addattribute $P0, 'localfun'
.annotate 'line', 7704
    addattribute $P0, 'lexicals'
.annotate 'line', 7705
    addattribute $P0, 'usedlexicals'
.annotate 'line', 7706
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8031
# Body
# {
.annotate 'line', 8033
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8034
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8035
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8036
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8037

.end # FunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 8039
# Body
# {
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method

.annotate 'line', 8040
# Body
# {
.annotate 'line', 8043
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8044
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8045
    assign $P1, $I1
.annotate 'line', 8046
    .return($I1)
# }
.annotate 'line', 8047

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 8048
# Body
# {
.annotate 'line', 8051
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8052
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8053
    assign $P1, $I1
.annotate 'line', 8054
    .return($I1)
# }
.annotate 'line', 8055

.end # getlexnum


.sub 'ismethod' :method

.annotate 'line', 8056
# Body
# {
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8058
# Body
# {
.annotate 'line', 8060
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8061
    setattribute self, 'name', $P1
.annotate 'line', 8062
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8063
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 8064
# var modifiers: $P3
    new $P3, [ 'ModifierList' ]
$P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 8065
    setattribute self, 'modifiers', $P3
.annotate 'line', 8066
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8068
    'RequireOp'('(', $P2)
.annotate 'line', 8069
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8071
# var fullname: $P4
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P4, $P5
.annotate 'line', 8072
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P4, $P5
.annotate 'line', 8074
    new $P6, [ 'StringLiteral' ]
.annotate 'line', 8075
    new $P8, [ 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
# predefined join
    join $S1, '.', $P4
$P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
$P6.'StringLiteral'(self, $P7)
    set $P5, $P6
.annotate 'line', 8073
    self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 8078
    $P2 = __ARG_1.'get'()
.annotate 'line', 8079
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 8080
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8081
    new $P7, [ 'CompoundStatement' ]
$P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8082
    .return(self)
# }
.annotate 'line', 8083

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8026
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8028
    addattribute $P0, 'paramnum'
.annotate 'line', 8029
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8092
# Body
# {
.annotate 'line', 8094
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8095
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8096
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8097
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8098
    setattribute self, 'name', $P1
.annotate 'line', 8099
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8100
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8101
    'RequireOp'('{', $P2)
.annotate 'line', 8102
    new $P5, [ 'CompoundStatement' ]
$P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8103
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8104

.end # LocalFunctionStatement


.sub 'isanonymous' :method

.annotate 'line', 8105
# Body
# {
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method

.annotate 'line', 8106
# Body
# {
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method

.annotate 'line', 8107
# Body
# {
.annotate 'line', 8109
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8110

.end # getsubid


.sub 'getparamnum' :method

.annotate 'line', 8111
# Body
# {
.annotate 'line', 8114
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8115

.end # getparamnum


.sub 'getlexnum' :method

.annotate 'line', 8116
# Body
# {
.annotate 'line', 8119
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8120

.end # getlexnum


.sub 'getvar' :method
.param string __ARG_1

.annotate 'line', 8121
# Body
# {
.annotate 'line', 8123
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8124
    unless_null $P1, __label_0
# {
.annotate 'line', 8127
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8128
    unless_null $P1, __label_1
# {
.annotate 'line', 8130
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8131
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8132
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8133
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8134
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8135
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8136
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8140
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8141
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8142
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8143
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8144
    isa $I2, $P4, 'FunctionBase'
    unless $I2 goto __label_9
# {
.annotate 'line', 8145
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8146
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8147
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8148
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8149
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8150
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8151
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
.annotate 'line', 8156
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, 'VarData'
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8157
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8158
    .return($P1)
# }
.annotate 'line', 8159

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8090
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8168
# Body
# {
.annotate 'line', 8170
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8171

.end # MethodStatement


.sub 'ismethod' :method

.annotate 'line', 8172
# Body
# {
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8166
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

.annotate 'line', 8187
# Body
# {
.annotate 'line', 8189
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8190

.end # ClassSpecifier


.sub 'reftype' :method

.annotate 'line', 8191
# Body
# {
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
.param pmc __ARG_1

.annotate 'line', 8193
# Body
# {
.annotate 'line', 8195
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8196

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8185
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8202
# Body
# {
.annotate 'line', 8204
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8205
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8206

.end # ClassSpecifierStr


.sub 'reftype' :method

.annotate 'line', 8207
# Body
# {
    .return(1)
# }

.end # reftype


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8209
# Body
# {
.annotate 'line', 8211
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8212
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8213

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8199
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8201
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8220
# Body
# {
.annotate 'line', 8222
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8223
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8224
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8225
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8226
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8227
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8228
    $P2 = __ARG_1.'get'()
.annotate 'line', 8229
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8230
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8232
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8236
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8238
# {
.annotate 'line', 8239
    $P2 = __ARG_1.'get'()
.annotate 'line', 8240
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8241
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8242
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8243
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8244
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8246
    setattribute self, 'key', $P1
# }
.annotate 'line', 8247

.end # ClassSpecifierParrotKey


.sub 'reftype' :method

.annotate 'line', 8248
# Body
# {
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method

.annotate 'line', 8249
# Body
# {
# predefined int
.annotate 'line', 8251
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8252

.end # hasHLL


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8254
# Body
# {
.annotate 'line', 8256
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8257

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8216
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8218
    addattribute $P0, 'key'
.annotate 'line', 8219
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8263
# Body
# {
.annotate 'line', 8265
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8266
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8267
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8268
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8269
    $P2 = __ARG_1.'get'()
.annotate 'line', 8270
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8272
    __ARG_1.'unget'($P2)
.annotate 'line', 8273
    setattribute self, 'key', $P1
# }
.annotate 'line', 8274

.end # ClassSpecifierId


.sub 'reftype' :method

.annotate 'line', 8275
# Body
# {
    .return(3)
# }

.end # reftype


.sub 'last' :method

.annotate 'line', 8277
# Body
# {
.annotate 'line', 8279
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8280
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8281

.end # last


.sub 'emit' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8283
# Body
# {
.annotate 'line', 8285
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8286
    unless_null $P1, __label_0
# {
.annotate 'line', 8287
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8288
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8289
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8291
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8292

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8260
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8262
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8295
# Body
# {
.annotate 'line', 8297
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8298
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8299
    new $P4, [ 'ClassSpecifierStr' ]
$P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8300
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8301
    new $P4, [ 'ClassSpecifierParrotKey' ]
$P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8302
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8303
    new $P4, [ 'ClassSpecifierId' ]
$P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8304
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8305

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8321
# Body
# {
.annotate 'line', 8323
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8324
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8325
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8326
    setattribute self, 'functions', $P1
.annotate 'line', 8327
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8328
    setattribute self, 'members', $P2
.annotate 'line', 8329
    root_new $P13, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P13
.annotate 'line', 8330
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8331
    setattribute self, 'constants', $P3
.annotate 'line', 8333
# var name: $P4
    $P4 = __ARG_2.'get'()
.annotate 'line', 8334
    setattribute self, 'name', $P4
.annotate 'line', 8335
# var classns: $P5
    $P12 = __ARG_3.'getpath'()
# predefined clone
    clone $P5, $P12
.annotate 'line', 8336
    getattribute $P12, self, 'name'
# predefined push
    push $P5, $P12
.annotate 'line', 8337
    setattribute self, 'classns', $P5
.annotate 'line', 8339
# var t: $P6
    $P6 = __ARG_2.'get'()
.annotate 'line', 8340
    $P12 = $P6.'isop'(':')
    if_null $P12, __label_0
    unless $P12 goto __label_0
# {
.annotate 'line', 8341
# var bases: $P7
    getattribute $P7, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8342
# {
.annotate 'line', 8343
# var base: $P8
    $P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8344
# predefined push
    push $P7, $P8
.annotate 'line', 8345
    $P6 = __ARG_2.'get'()
.annotate 'line', 8346
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
.annotate 'line', 8349
    'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8350
    $P6 = __ARG_2.'get'()
 __label_6: # for condition
    $P12 = $P6.'isop'('}')
    isfalse $I1, $P12
    unless $I1 goto __label_5
# {
.annotate 'line', 8351
    $P13 = $P6.'checkkeyword'()
    set $S1, $P13
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'const'
    if $S1 == $S2 goto __label_11
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 8353
# var f: $P9
    new $P9, [ 'MethodStatement' ]
$P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8354
# predefined push
    push $P1, $P9
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8357
# var name: $P10
    $P10 = __ARG_2.'get'()
.annotate 'line', 8358
    $P14 = $P10.'isidentifier'()
    isfalse $I2, $P14
    unless $I2 goto __label_12
.annotate 'line', 8359
    'Expected'("member identifier", $P10)
 __label_12: # endif
.annotate 'line', 8360
# predefined push
    push $P2, $P10
.annotate 'line', 8361
    $P6 = __ARG_2.'get'()
.annotate 'line', 8362
    $P15 = $P6.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_13
.annotate 'line', 8363
    'Expected'("';' in member declaration", $P6)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8366
# var cst: $P11
    $P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8367
# predefined push
    push $P3, $P11
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8370
    'SyntaxError'("Unexpected item in class", $P6)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8350
    $P6 = __ARG_2.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8373

.end # ClassStatement


.sub 'getpath' :method

.annotate 'line', 8374
# Body
# {
.annotate 'line', 8376
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8377

.end # getpath


.sub 'generatesubid' :method

.annotate 'line', 8378
# Body
# {
.annotate 'line', 8380
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8381

.end # generatesubid


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8382
# Body
# {
.annotate 'line', 8384
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8385

.end # findsymbol


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8386
# Body
# {
.annotate 'line', 8388
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8389

.end # findclasskey


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8390
# Body
# {
.annotate 'line', 8392
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8393

.end # checkclass


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8394
# Body
# {
.annotate 'line', 8396
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8397

.end # use_predef


.sub 'optimize' :method

.annotate 'line', 8398
# Body
# {
.annotate 'line', 8400
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8401
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8402
    .return(self)
# }
.annotate 'line', 8403

.end # optimize


.sub 'getclasskey' :method

.annotate 'line', 8404
# Body
# {
.annotate 'line', 8406
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8407

.end # getclasskey


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8408
# Body
# {
.annotate 'line', 8410
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8411
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8412
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8413
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8415
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8417
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8418
# n: $I1
    set $I1, 1
.annotate 'line', 8419
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8420
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8421
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8422
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8423
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8424
    __ARG_1.'say'()
.annotate 'line', 8425
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8427
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8428
    __ARG_1.'annotate'($P4)
.annotate 'line', 8429
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8432
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8433

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8311
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8313
    addattribute $P0, 'parent'
.annotate 'line', 8314
    addattribute $P0, 'name'
.annotate 'line', 8315
    addattribute $P0, 'bases'
.annotate 'line', 8316
    addattribute $P0, 'constants'
.annotate 'line', 8317
    addattribute $P0, 'functions'
.annotate 'line', 8318
    addattribute $P0, 'members'
.annotate 'line', 8319
    addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8440
# Body
# {
.annotate 'line', 8442
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8443
    $P9 = $P1.'isstring'()
    isfalse $I2, $P9
    unless $I2 goto __label_0
.annotate 'line', 8444
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8445
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8446
# filename: $S1
    $P9 = $P1.'rawstring'()
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
 __label_1:
.annotate 'line', 8447
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8452
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8453
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8454
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8455
    iter $P10, $P4
    set $P10, 0
 __label_2: # for iteration
    unless $P10 goto __label_3
    shift $S2, $P10
# {
.annotate 'line', 8456
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8457
# try: create handler
    new $P9, 'ExceptionHandler'
    set_label $P9, __label_4
    push_eh $P9
# try: begin
# {
.annotate 'line', 8458
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8459
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8457
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
.annotate 'line', 8464
    $P9 = $P5.'is_closed'()
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 8465
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
.annotate 'line', 8470
    load_bytecode 'PGE.pbc'
.annotate 'line', 8471
# var regexcomp: $P6
# predefined compreg
    compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8472
# var rule: $P7
    $P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8474
# line: $S4
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
.annotate 'line', 8475
    new $P8, ['ResizableStringArray']
.annotate 'line', 8476
    $P8 = $P7($S4)
.annotate 'line', 8477
# predefined elements
    elements $I2, $P8
    le $I2, 0, __label_11
# {
.annotate 'line', 8478
# name: $S5
    $S5 = $P8[0]
.annotate 'line', 8479
# value: $S6
    $S6 = $P8[1]
.annotate 'line', 8480
# ivalue: $I1
    null $I1
.annotate 'line', 8481
# predefined substr
    substr $S7, $S6, 0, 2
    iseq $I2, $S7, '0x'
    if $I2 goto __label_14
# predefined substr
    substr $S8, $S6, 0, 2
    iseq $I2, $S8, '0X'
 __label_14:
    unless $I2 goto __label_12
.annotate 'line', 8482
# predefined substr
    substr $S9, $S6, 2
    box $P11, $S9
    $P9 = $P11.'to_int'(16)
    set $I1, $P9
    goto __label_13
 __label_12: # else
.annotate 'line', 8484
    set $I1, $S6
 __label_13: # endif
.annotate 'line', 8487
    new $P12, [ 'TokenInteger' ]
    getattribute $P13, __ARG_1, 'file'
    getattribute $P14, __ARG_1, 'line'
$P12.'TokenInteger'($P13, $P14, $S5)
    set $P11, $P12
.annotate 'line', 8486
    $P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8485
    __ARG_3.'createconst'($S5, 'I', $P9, '')
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8474
    $P9 = $P5.'readline'()
    set $S4, $P9
    goto __label_9
 __label_8: # for end
.annotate 'line', 8491
    $P5.'close'()
# }
.annotate 'line', 8492

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'init' :method :vtable

.annotate 'line', 8505
# Body
# {
.annotate 'line', 8507
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8508
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8509
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8510
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8511

.end # init


.sub 'getpath' :method

.annotate 'line', 8512
# Body
# {
.annotate 'line', 8514
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8515

.end # getpath


.sub 'checkclass_base' :method
.param string __ARG_1

.annotate 'line', 8516
# Body
# {
.annotate 'line', 8518
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8519
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8520
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8521
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8522
    .return($P4)
# }
.annotate 'line', 8523

.end # checkclass_base


.sub 'findclasskey_base' :method
.param pmc __ARG_1

.annotate 'line', 8524
# Body
# {
.annotate 'line', 8528
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
.annotate 'line', 8530
    .return($P5)
 __label_3: # case
.annotate 'line', 8533
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8538
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8539
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8540
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8541
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8542
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8543
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8544
    if_null $P4, __label_8
.annotate 'line', 8545
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8549
    .return($P5)
# }
.annotate 'line', 8550

.end # findclasskey_base


.sub 'findsymbol' :method
.param pmc __ARG_1

.annotate 'line', 8551
# Body
# {
.annotate 'line', 8555
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
.annotate 'line', 8557
    .return($P7)
 __label_3: # case
.annotate 'line', 8559
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8561
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8562
    if_null $P1, __label_4
.annotate 'line', 8563
    .return($P1)
 __label_4: # endif
.annotate 'line', 8564
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8565
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8566
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8567
    .return($P11)
 __label_1: # default
.annotate 'line', 8572
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8573
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8574
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8575
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8576
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8577
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8578
    if_null $P6, __label_12
.annotate 'line', 8579
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8583
    .return($P7)
# }
.annotate 'line', 8584

.end # findsymbol


.sub 'parsenamespace' :method
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 8585
# Body
# {
.annotate 'line', 8587
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8588
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 8589
    $P1 = __ARG_2.'get'()
.annotate 'line', 8591
# var modifier: $P2
    null $P2
.annotate 'line', 8592
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8593
    new $P5, [ 'ModifierList' ]
$P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 8594
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 8597
    'RequireOp'('{', $P1)
.annotate 'line', 8598
# var child: $P3
    new $P3, [ 'NamespaceStatement' ]
$P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8599
    getattribute $P4, self, 'namespaces'
# predefined push
    push $P4, $P3
.annotate 'line', 8600
    getattribute $P4, self, 'items'
# predefined push
    push $P4, $P3
.annotate 'line', 8601
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 8602

.end # parsenamespace


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8603
# Body
# {
.annotate 'line', 8605
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 8606
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 8607
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 8608
# var t: $P4
    null $P4
# for loop
.annotate 'line', 8609
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 8611
    $P9 = $P4.'checkkeyword'()
    set $S2, $P9
    set $S3, 'namespace'
    if $S2 == $S3 goto __label_6
    set $S3, 'const'
    if $S2 == $S3 goto __label_7
    set $S3, 'function'
    if $S2 == $S3 goto __label_8
    set $S3, 'class'
    if $S2 == $S3 goto __label_9
    set $S3, 'using'
    if $S2 == $S3 goto __label_10
    set $S3, '$include_const'
    if $S2 == $S3 goto __label_11
    set $S3, '$load'
    if $S2 == $S3 goto __label_12
    set $S3, '$loadlib'
    if $S2 == $S3 goto __label_13
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 8613
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 8616
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8617
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 8620
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
$P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8621
# predefined push
    push $P2, $P6
.annotate 'line', 8622
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 8625
# var c: $P7
    new $P7, [ 'ClassStatement' ]
$P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8626
# predefined push
    push $P3, $P7
.annotate 'line', 8627
# predefined push
    push $P1, $P7
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 8630
    $P4 = __ARG_1.'get'()
.annotate 'line', 8631
    $P10 = $P4.'iskeyword'('extern')
    isfalse $I2, $P10
    unless $I2 goto __label_14
.annotate 'line', 8632
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 8633
    $P4 = __ARG_1.'get'()
.annotate 'line', 8634
    $P11 = $P4.'isstring'()
    isfalse $I3, $P11
    unless $I3 goto __label_15
.annotate 'line', 8635
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 8636
# reqlib: $S1
    set $P12, $P4
    null $S1
    if_null $P12, __label_16
    set $S1, $P12
 __label_16:
.annotate 'line', 8637
    self.'addlib'($S1)
.annotate 'line', 8638
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 8641
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 8644
    $P4 = __ARG_1.'get'()
.annotate 'line', 8645
    $P13 = $P4.'isstring'()
    isfalse $I4, $P13
    unless $I4 goto __label_17
.annotate 'line', 8646
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 8647
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8648
    new $P16, [ 'StringLiteral' ]
$P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 8651
    $P4 = __ARG_1.'get'()
.annotate 'line', 8652
    $P17 = $P4.'isstring'()
    isfalse $I5, $P17
    unless $I5 goto __label_18
.annotate 'line', 8653
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 8654
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8655
    new $P20, [ 'StringLiteral' ]
$P20.'StringLiteral'(self, $P4)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 8658
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 8609
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 8661
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 8662
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 8664
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 8665

.end # parse


.sub 'optimize_base' :method

.annotate 'line', 8666
# Body
# {
.annotate 'line', 8668
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 8669

.end # optimize_base


.sub 'emit_base' :method
.param pmc __ARG_1

.annotate 'line', 8670
# Body
# {
.annotate 'line', 8672
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 8673
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8675
# activate: $I1
    set $I1, 1
.annotate 'line', 8676
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8677
    isa $I2, $P2, 'NamespaceStatement'
    if $I2 goto __label_5
.annotate 'line', 8678
    isa $I2, $P2, 'ClassStatement'
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 8679
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 8681
    unless $I1 goto __label_6
# {
.annotate 'line', 8682
    __ARG_1.'say'($S1)
.annotate 'line', 8683
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 8685
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 8687

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8496
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8498
    addattribute $P0, 'nspath'
.annotate 'line', 8499
    addattribute $P0, 'namespaces'
.annotate 'line', 8500
    addattribute $P0, 'classes'
.annotate 'line', 8501
    addattribute $P0, 'functions'
.annotate 'line', 8502
    addattribute $P0, 'items'
.annotate 'line', 8503
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param string __ARG_3
.param pmc __ARG_4

.annotate 'line', 8702
# Body
# {
.annotate 'line', 8705
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8706
# predefined push
    push $P1, __ARG_3
.annotate 'line', 8707
    setattribute self, 'nspath', $P1
.annotate 'line', 8709
    setattribute self, 'parent', __ARG_1
.annotate 'line', 8710
    setattribute self, 'start', __ARG_2
.annotate 'line', 8711
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8712
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 8713
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 8714
    if_null __ARG_4, __label_0
# {
.annotate 'line', 8715
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 8716
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8718

.end # NamespaceStatement


.sub 'dowarnings' :method

.annotate 'line', 8719
# Body
# {
.annotate 'line', 8721
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8722

.end # dowarnings


.sub 'generatesubid' :method

.annotate 'line', 8723
# Body
# {
.annotate 'line', 8725
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8726

.end # generatesubid


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8727
# Body
# {
.annotate 'line', 8729
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8730

.end # use_predef


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8731
# Body
# {
.annotate 'line', 8733
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8734

.end # addlib


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8735
# Body
# {
.annotate 'line', 8737
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 8738

.end # addlib


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8739
# Body
# {
.annotate 'line', 8741
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8742
    unless_null $P1, __label_0
.annotate 'line', 8743
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 8745
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 8746

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8747
# Body
# {
.annotate 'line', 8751
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8752
    unless_null $P1, __label_0
.annotate 'line', 8753
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 8754
    .return($P1)
# }
.annotate 'line', 8755

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8756
# Body
# {
.annotate 'line', 8758
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8759

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8760
# Empty body

.end # close_ns


.sub 'optimize' :method

.annotate 'line', 8764
# Body
# {
.annotate 'line', 8766
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 8767
    if_null $P1, __label_0
# {
.annotate 'line', 8768
    $P1 = $P1.'optimize'()
.annotate 'line', 8769
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 8771
    self.'optimize_base'()
.annotate 'line', 8772
    .return(self)
# }
.annotate 'line', 8773

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8774
# Body
# {
.annotate 'line', 8776
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 8777
    if_null $P1, __label_0
.annotate 'line', 8778
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 8780
    self.'emit_base'(__ARG_1)
.annotate 'line', 8782
    if_null $P1, __label_1
.annotate 'line', 8783
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 8784

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8694
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8696
    addattribute $P0, 'parent'
.annotate 'line', 8697
    addattribute $P0, 'start'
.annotate 'line', 8698
    addattribute $P0, 'name'
.annotate 'line', 8699
    addattribute $P0, 'modifier'
.annotate 'line', 8700
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
.param pmc __ARG_1

.annotate 'line', 8799
# Body
# {
.annotate 'line', 8801
    new $P1, ['ResizableStringArray']
.annotate 'line', 8802
    setattribute self, 'nspath', $P1
.annotate 'line', 8803
    setattribute self, 'unit', __ARG_1
.annotate 'line', 8804
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 8805
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8806

.end # RootNamespace


.sub 'use_predef' :method
.param string __ARG_1

.annotate 'line', 8807
# Body
# {
.annotate 'line', 8809
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8810
$P1[__ARG_1] = 1
# }
.annotate 'line', 8811

.end # use_predef


.sub 'predef_is_used' :method
.param string __ARG_1

.annotate 'line', 8812
# Body
# {
.annotate 'line', 8814
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8815
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 8816

.end # predef_is_used


.sub 'generatesubid' :method

.annotate 'line', 8818
# Body
# {
.annotate 'line', 8820
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 8821
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8822
    inc $I1
.annotate 'line', 8823
    assign $P1, $I1
.annotate 'line', 8824
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 8825
    .return($S1)
# }
.annotate 'line', 8826

.end # generatesubid


.sub 'addlib' :method
.param string __ARG_1

.annotate 'line', 8828
# Body
# {
.annotate 'line', 8830
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 8831
    unless_null $P1, __label_0
# {
.annotate 'line', 8832
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8833
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 8835
$P1[__ARG_1] = 1
# }
.annotate 'line', 8836

.end # addlib


.sub 'addload' :method
.param string __ARG_1

.annotate 'line', 8837
# Body
# {
.annotate 'line', 8839
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 8840
    unless_null $P1, __label_0
# {
.annotate 'line', 8841
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8842
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 8844
$P1[__ARG_1] = 1
# }
.annotate 'line', 8845

.end # addload


.sub 'checkclass' :method
.param string __ARG_1

.annotate 'line', 8846
# Body
# {
.annotate 'line', 8848
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8849

.end # checkclass


.sub 'findclasskey' :method
.param pmc __ARG_1

.annotate 'line', 8850
# Body
# {
.annotate 'line', 8853
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8854

.end # findclasskey


.sub 'unclosed_ns' :method

.annotate 'line', 8855
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
.param pmc __ARG_1

.annotate 'line', 8859
# Body
# {
.annotate 'line', 8861
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8862

.end # close_ns


.sub 'dowarnings' :method

.annotate 'line', 8863
# Body
# {
.annotate 'line', 8865
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8866

.end # dowarnings


.sub 'optimize' :method

.annotate 'line', 8867
# Body
# {
.annotate 'line', 8869
    self.'optimize_base'()
.annotate 'line', 8870
    .return(self)
# }
.annotate 'line', 8871

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8872
# Body
# {
.annotate 'line', 8874
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8877
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 8878
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 8881
    new $P2, ['ResizableStringArray']
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
.annotate 'line', 8884
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 8885
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 8886
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 8887
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 8890
# somelib: $I1
    null $I1
.annotate 'line', 8891
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 8892
    if_null $P3, __label_4
# {
.annotate 'line', 8893
    set $I1, 1
.annotate 'line', 8894
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 8895
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 8898
# someload: $I2
    null $I2
.annotate 'line', 8899
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 8900
    if_null $P4, __label_7
# {
.annotate 'line', 8901
    set $I2, 1
.annotate 'line', 8902
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8903
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 8904
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 8905
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 8907
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 8908
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 8910
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8911

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8791
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8793
    addattribute $P0, 'unit'
.annotate 'line', 8794
    addattribute $P0, 'predefs_used'
.annotate 'line', 8795
    addattribute $P0, 'libs'
.annotate 'line', 8796
    addattribute $P0, 'loads'
.annotate 'line', 8797
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable

.annotate 'line', 8925
# Body
# {
.annotate 'line', 8927
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 8928
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
$P1.'RootNamespace'(self)
.annotate 'line', 8931
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
$P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8935
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 8934
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8933
    $P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8939
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
$P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 8938
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8937
    $P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8945
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 8946
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
.annotate 'line', 8944
    $P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8949
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 8950

.end # init


.sub 'setwarnmode' :method
.param int __ARG_1

.annotate 'line', 8951
# Body
# {
.annotate 'line', 8953
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 8954

.end # setwarnmode


.sub 'dowarnings' :method

.annotate 'line', 8955
# Body
# {
# predefined int
.annotate 'line', 8957
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8958

.end # dowarnings


.sub 'parse' :method
.param pmc __ARG_1

.annotate 'line', 8959
# Body
# {
.annotate 'line', 8961
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 8962

.end # parse


.sub 'optimize' :method

.annotate 'line', 8963
# Body
# {
.annotate 'line', 8965
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 8966

.end # optimize


.sub 'emit' :method
.param pmc __ARG_1

.annotate 'line', 8967
# Body
# {
.annotate 'line', 8969
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 8970
    __ARG_1.'say'('')
.annotate 'line', 8972
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8974
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8975

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8922
    addattribute $P0, 'rootns'
.annotate 'line', 8923
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3

.annotate 'line', 8982
# Body
# {
.annotate 'line', 8984
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 8985
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 8986
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 8987
    $P1.'open'('__eval__', 'w')
.annotate 'line', 8988
# var emit: $P2
    new $P2, [ 'Emit' ]
.annotate 'line', 8989
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 8990
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 8991
    $P2.'initialize'($P1)
.annotate 'line', 8992
    __ARG_1.'emit'($P2)
.annotate 'line', 8993
    $P2.'close'()
.annotate 'line', 8994
    $P1.'close'()
.annotate 'line', 8995
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 8996
# var object: $P3
    null $P3
.annotate 'line', 8997
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
.annotate 'line', 8999
    new $P3, [ 'String' ]
.annotate 'line', 9000
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9004
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9005
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9006
# predefined die
.annotate 'line', 9008
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9010
    .return($P3)
# }
.annotate 'line', 9011

.end # __private_compile_tail


.sub 'compile' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 9012
# Body
# {
.annotate 'line', 9017
    unless_null __ARG_2, __label_0
.annotate 'line', 9018
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9019
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9020
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9021
    $P1.'puts'(__ARG_1)
.annotate 'line', 9022
    $P1.'close'()
.annotate 'line', 9023
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9024
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9025
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9026
    unless __ARG_4 goto __label_1
.annotate 'line', 9027
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9028
    $P3.'parse'($P2)
.annotate 'line', 9029
    $P1.'close'()
.annotate 'line', 9030
    $P3.'optimize'()
.annotate 'line', 9031
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9032

.end # compile


.sub 'compile_from_file_to_pir' :method
.param string __ARG_1
.param pmc __ARG_2
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 9033
# Body
# {
.annotate 'line', 9037
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9038
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9039
    $P1.'encoding'('utf8')
.annotate 'line', 9040
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9041
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9042
    unless __ARG_4 goto __label_0
.annotate 'line', 9043
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9044
    $P3.'parse'($P2)
.annotate 'line', 9045
    $P1.'close'()
.annotate 'line', 9046
    $P3.'optimize'()
.annotate 'line', 9047
# var emit: $P4
    new $P4, [ 'Emit' ]
.annotate 'line', 9048
    unless __ARG_3 goto __label_1
.annotate 'line', 9049
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9050
    $P4.'initialize'(__ARG_2)
.annotate 'line', 9051
    $P3.'emit'($P4)
.annotate 'line', 9052
    $P4.'close'()
# }
.annotate 'line', 9053

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
.param string __ARG_1
.param string __ARG_2 :optional :named('target')
.param int __ARG_3 :optional :named('noan')
.param int __ARG_4 :optional :named('nowarn')

.annotate 'line', 9054
# Body
# {
.annotate 'line', 9059
    unless_null __ARG_2, __label_0
.annotate 'line', 9060
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9061
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9062
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9063
    $P1.'encoding'('utf8')
.annotate 'line', 9064
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
$P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9065
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9066
    unless __ARG_4 goto __label_1
.annotate 'line', 9067
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9068
    $P3.'parse'($P2)
.annotate 'line', 9069
    $P1.'close'()
.annotate 'line', 9070
    $P3.'optimize'()
.annotate 'line', 9071
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9072

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

.annotate 'line', 9077
# Body
# {
.annotate 'line', 9079
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9080
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9081
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9082
    $P1.'parse'(__ARG_1)
.annotate 'line', 9084
    $P1.'optimize'()
.annotate 'line', 9086
# var handle: $P2
    null $P2
.annotate 'line', 9087
    ne __ARG_2, '-', __label_1
.annotate 'line', 9088
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9090
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9091
# var emit: $P3
    new $P3, [ 'Emit' ]
.annotate 'line', 9092
    unless __ARG_4 goto __label_3
.annotate 'line', 9093
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9094
    $P3.'initialize'($P2)
.annotate 'line', 9095
    $P1.'emit'($P3)
.annotate 'line', 9096
    $P3.'close'()
.annotate 'line', 9097
    $P2.'close'()
# }
.annotate 'line', 9098

.end # winxed_parser


.sub 'initializer' :init :load

.annotate 'line', 9104
# Body
# {
.annotate 'line', 9106
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9107
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9108

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
.param pmc __ARG_1

.annotate 'line', 9115
# Body
# {
.annotate 'line', 9117
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9118
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9119
    $P1.'notOptStop'(1)
.annotate 'line', 9120
    $P1.'push_string'('o=s')
.annotate 'line', 9121
    $P1.'push_string'('e=s')
.annotate 'line', 9122
    $P1.'push_string'('noan')
.annotate 'line', 9123
    $P1.'push_string'('nowarn')
.annotate 'line', 9124
    $P1.'notOptStop'(1)
.annotate 'line', 9125
    __ARG_1.'shift'()
.annotate 'line', 9126
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9127
    setattribute self, 'getopts', $P1
.annotate 'line', 9128
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9129

.end # Options


.sub 'getbool' :method
.param string __ARG_1

.annotate 'line', 9130
# Body
# {
.annotate 'line', 9132
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9133
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9134
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9135

.end # getbool


.sub 'getstring' :method
.param string __ARG_1
.param string __ARG_2 :optional

.annotate 'line', 9136
# Body
# {
.annotate 'line', 9138
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9139
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9140
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9141

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9112
    addattribute $P0, 'getopts'
.annotate 'line', 9113
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
.param pmc __ARG_1

.annotate 'line', 9144
# Body
# {
.annotate 'line', 9146
# var options: $P1
    new $P1, [ 'Options' ]
$P1.'Options'(__ARG_1)
.annotate 'line', 9147
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9148
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9149
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9150
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9152
# argc: $I3
    set $P4, __ARG_1
    set $I3, $P4
.annotate 'line', 9153
# filename: $S3
    null $S3
.annotate 'line', 9154
# var file: $P2
    null $P2
.annotate 'line', 9155
    unless_null $S2, __label_2
# {
.annotate 'line', 9156
    ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 9157
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9159
    $S3 = __ARG_1[0]
.annotate 'line', 9160
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9161
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9164
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9165
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9166
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9167
    $P2.'puts'($S2)
.annotate 'line', 9168
    $P2.'close'()
.annotate 'line', 9169
    $P2.'open'('__eval__')
.annotate 'line', 9170
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9173
# var t: $P3
    new $P3, [ 'Tokenizer' ]
$P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9175
    'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 9177
    $P2.'close'()
# }
.annotate 'line', 9178

.end # stage1


.sub 'show_backtrace'
.param pmc __ARG_1

.annotate 'line', 9180
# Body
# {
.annotate 'line', 9182
# i: $I1
    set $I1, 1
.annotate 'line', 9183
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9184
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9185
# subname: $S1
    null $S1
.annotate 'line', 9186
    if_null $P2, __label_2
# {
.annotate 'line', 9187
    set $S1, $P2
.annotate 'line', 9188
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9189
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
.annotate 'line', 9191
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9192
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9193
    eq $S3, '', __label_6
# {
.annotate 'line', 9194
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9195
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
.annotate 'line', 9198

.end # show_backtrace


.sub 'main' :main
.param pmc __ARG_1

.annotate 'line', 9200
# Body
# {
.annotate 'line', 9202
# retval: $I1
    null $I1
.annotate 'line', 9203
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
$P2.'min_severity'(2)
$P2.'max_severity'(2)
$P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9209
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9203
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9212
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9213
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9214
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9217
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9218
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9221
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9222
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9223
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9226
# predefined exit
    exit $I1
# }
.annotate 'line', 9227

.end # main

# End generated code
